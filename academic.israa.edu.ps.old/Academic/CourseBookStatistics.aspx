<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="CourseBookStatistics.aspx.cs" Inherits="Academic_CourseBookStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#courseBook').addClass("active open");
            $('#courseBook_3 a').css("background-color", "#575757");
            $('#courseBook a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <a href="CourseBookStatistics.aspx" class="font-ha">إحصائية  كتب المساقات</a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12 ">
        <div id="Div1" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>إحصائية كتب المساقات
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group row"></div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">الفصل الدراسي</label>
                        <div class="col-md-4">

                            <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="Select ID,ArName From Semester Where Code<>'111111111' and IsDelete=0 and IsActive=1 ORDER BY ID DESC  "></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group row"></div>
                    <div class="form-group row">

                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" CssClass="col-md-12">
                            <ItemTemplate>
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th colspan="2" style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">إحصائية كتب المساقات المطروحة  </th>
                                        </tr>
                                        <tr style="border-top: 1px solid #ddd!important; background-color: #eee !important">
                                            <th style="width: 90%; border-top: none!important; font-size: 12px;">البيان</th>
                                            <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">العدد</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Label ID="SemesterID" runat="server" Text='<%# Eval("SemesterID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td>عدد المساقات المطروحة للفصل</td>
                                            <td style="text-align: center"><span><%# Eval("CourseCount") %></span></td>

                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookStatistics1.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطروحة و لها كتاب</a></td>
                                            <td style="text-align: center"><span><%# Eval("CourseBookCount") %></span></td>
                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookAccreditStatistics.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطروحة و لها كتب معتمدة</a></td>
                                            <td style="text-align: center"><span><%# Eval("AccreditCourseBookCount") %></span></td>
                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookUnAccreditStatistics.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطروحة و ليس لها أي كتاب معتمد من الكلية</a></td>
                                            <td style="text-align: center"><span><%# Eval("UnAccreditCourseBookCount") %></span></td>
                                        </tr>
                                        <tr>
                                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                                                <ItemTemplate>
                                                    <tr>
                                                        <asp:Label ID="CollegeName" runat="server" Text='<%# Eval("Name") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="CollegeID" runat="server" Text='<%# Eval("CollegeID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="SemesterID" runat="server" Text='<%# Eval("SemesterID") %>' Visible="false"></asp:Label>
                                                        <td>
                                                            <asp:LinkButton ID="lbGoPage" runat="server" OnClick="lbGoPage_Click"> <%# Eval("Name") %></asp:LinkButton></td>
                                                        <td style="text-align: center"><%# Eval("Num") %></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="UnAccreditCourseBookStatistics" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookStatistics2.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطروحة و ليس لها كتاب مدخل</a></td>
                                            <td style="text-align: center"><span><%# Eval("NOCourseBookCount") %></span></td>
                                        </tr>

                                    </tbody>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="CourseBookStatistics" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="form-group row">
                        <%--  المساقات التي لها طلبات كتب--%>

                        <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource4" CssClass="col-md-12">
                            <ItemTemplate>
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th colspan="2" style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">إحصائية المساقات التي لها طلبات كتب</th>
                                        </tr>
                                        <tr style="border-top: 1px solid #ddd!important; background-color: #eee !important">
                                            <th style="width: 90%; border-top: none!important; font-size: 12px;">البيان</th>
                                            <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">العدد</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Label ID="SemesterID" runat="server" Text='<%# Eval("SemesterID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><a href='CourseBookRequestStatistics1.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطلوب لها كتاب </a></td>
                                            <td style="width: 10%; text-align: center"><span><%# Eval("CourseCount") %></span></td>

                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookRequestStatistics2.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطلوب لها كتاب و لها كتاب مدخل</a></td>
                                            <td style="width: 10%; text-align: center"><span><%# Eval("CourseBookCount") %></span></td>
                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookRequestAccreditStatistics.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطلوب لها كتاب و لها كتب مدخلة معتمدة من الكلية</a></td>
                                            <td style="width: 10%; text-align: center"><span><%# Eval("AccreditCourseBookCount") %></span></td>
                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookRequestUnAccreditStatistics.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطلوب لها كتاب و ليس لها أي كتاب معتمد من الكلية</a></td>
                                            <td style="width: 10%; text-align: center"><span><%# Eval("UnAccreditCourseBookCount") %></span></td>
                                        </tr>
                                        <tr>
                                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                                                <ItemTemplate>
                                                    <tr>
                                                        <asp:Label ID="CollegeName" runat="server" Text='<%# Eval("Name") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="CollegeID" runat="server" Text='<%# Eval("CollegeID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="SemesterID" runat="server" Text='<%# Eval("SemesterID") %>' Visible="false"></asp:Label>
                                                        <td>
                                                            <asp:LinkButton ID="lbGoPage1" runat="server" OnClick="lbGoPage1_Click"> <%# Eval("Name") %></asp:LinkButton></td>
                                                        <td style="text-align: center"><%# Eval("Num") %></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="UnAccreditBookOfCourseBookRequestStatistics" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookRequestStatistics3.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطلوب لها كتاب و ليس لها كتاب مدخل</a></td>
                                            <td style="width: 10%; text-align: center"><span><%# Eval("NOCourseBookCount") %></span></td>
                                        </tr>

                                    </tbody>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="CourseBookRequestStatistics" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <%-- المساقات المطروحة التي لها طلبات كتب --%>
                    <div class="form-group row">
                        <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDataSource5" CssClass="col-md-12">
                            <ItemTemplate>
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th colspan="2" style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">إحصائية المساقات المطروحة و لها طلبات كتب  </th>
                                        </tr>
                                        <tr style="border-top: 1px solid #ddd!important; background-color: #eee !important">
                                            <th style="width: 90%; border-top: none!important; font-size: 12px;">البيان</th>
                                            <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">العدد</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Label ID="SemesterID" runat="server" Text='<%# Eval("SemesterID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><a href='CourseBookRequestStatistics4.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطروحة المطلوب لها كتاب </a></td>
                                            <td style="width: 10%; text-align: center"><span><%# Eval("CourseCount") %></span></td>

                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookRequestStatistics5.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطروحة المطلوب لها كتاب و لها كتاب مدخل</a></td>
                                            <td style="width: 10%; text-align: center"><span><%# Eval("CourseBookCount") %></span></td>
                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookRequestAccreditStatistics1.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطروحة المطلوب لها كتاب و لها كتب مدخلة معتمدة من الكلية</a></td>
                                            <td style="width: 10%; text-align: center"><span><%# Eval("AccreditCourseBookCount") %></span></td>
                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookRequestUnAccreditStatistics2.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطروحة المطلوب لها كتاب و ليس لها أي كتاب معتمد من الكلية</a></td>
                                            <td style="width: 10%; text-align: center"><span><%# Eval("UnAccreditCourseBookCount") %></span></td>
                                        </tr>
                                        <tr>
                                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                                                <ItemTemplate>
                                                    <tr>
                                                        <asp:Label ID="CollegeName" runat="server" Text='<%# Eval("Name") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="CollegeID" runat="server" Text='<%# Eval("CollegeID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="SemesterID" runat="server" Text='<%# Eval("SemesterID") %>' Visible="false"></asp:Label>
                                                        <td>
                                                            <asp:LinkButton ID="lbGoPage2" runat="server" OnClick="lbGoPage2_Click"> <%# Eval("Name") %></asp:LinkButton></td>
                                                        <td style="text-align: center"><%# Eval("Num") %></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="UnAccreditBookOfCourseBookRequestStatistics2" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tr>
                                        <tr>
                                            <td><a href='CourseBookRequestStatistics6.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطروحة المطلوب لها كتاب و ليس لها كتاب مدخل</a></td>
                                            <td style="width: 10%; text-align: center"><span><%# Eval("NOCourseBookCount") %></span></td>
                                        </tr>

                                    </tbody>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="CourseBookRequestStatistics4" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

