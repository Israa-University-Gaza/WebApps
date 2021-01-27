<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="SyllabusStatistics.aspx.cs" Inherits="Academic_SyllabusStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Syllabus').addClass("active open");
            $('#Syllabus_5 a').css("background-color", "#575757");
            $('#Syllabus a span.arrow').addClass("open");
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
            <a href="SyllabusStatistics.aspx" class="font-ha">إحصائية طلبات توصيف المساق</a>
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
                    <i class="fa fa-reorder"></i>إحصائية توصيف المساقات
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">

                    <div class="form-group row">
                        <div class="form-group row"></div>
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
                                            <th colspan="2" style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">إحصائية توصيف المساقات </th>
                                        </tr>
                                        <tr style="border-top: 1px solid #ddd!important; background-color: #eee !important">
                                            <th style="width: 90%; border-top: none!important; font-size: 12px;">البيان</th>
                                            <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">العدد</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Label ID="SemesterID" runat="server" Text='<%# Eval("SemesterID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><a href='SyllabusStatistics1.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المطلوب توصيفها</a></td>
                                            <td style="text-align: center"><span><%# Eval("SyllabusCount") %></span></td>

                                        </tr>
                                        <tr>
                                            <td><a href='SyllabusInstructorStatistics.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات الغير موصفة من المحاضر</a></td>
                                            <td style="text-align: center"><span><%# Eval("x1") %></span></td>
                                        </tr>
                                        <tr>
                                            <td><a href='SyllabusInstructorStatistics1.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات الموصفة الغير معتمدة من المحاضر</a></td>
                                            <td style="text-align: center"><span><%# Eval("x2") %></span></td>
                                        </tr>
                                        <tr>
                                            <td><a href='SyllabusCollegeStatistics.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات الموصفة المعتمدة من المحاضر و غير معتمدة من الكلية</a></td>
                                            <td style="text-align: center"><span><%# Eval("x3") %></span></td>
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
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SyllabusCollegeStatistics" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tr>
                                        <tr>
                                            <td><a href='SyllabusCurriculumStatistics.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المعتمدة من الكلية و غير معتمدة من المناهج</a></td>
                                            <td style="text-align: center"><span><%# Eval("x4") %></span></td>
                                        </tr>

                                        <tr>
                                            <td><a href='SyllabusCurriculumStatistics1.aspx?SemesterID=<%# Eval("SemesterID") %>' target="_blank">عدد المساقات المعتمدة من المناهج و المنتهية </a></td>
                                            <td style="text-align: center"><span><%# Eval("x5") %></span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SyllabusStatistics" SelectCommandType="StoredProcedure">
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

