<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="DeanSectionStudents.aspx.cs" Inherits="Academic_DeanSectionStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#DeanSectionStudents').addClass("active open");
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
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>طلاب الشعب</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="DeanSectionStudents.aspx">طلاب الشعبة</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلاب الشعبة الواحدة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-1 control-label">البرنامج</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="sdsProgram" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsProgram" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeePrograms" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">المساق</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="sdsCourse" DataTextField="CourseArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsCourse" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetDeanOfferdCourses" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlProgram" PropertyName="Text" Name="ProgramID" Type="Int32" />
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">الشعبة</label>
                                <div class="col-md-1">
                                    <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" DataSourceID="sdsSection" DataTextField="SectionNum" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsSection" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetOfferdCourseSections" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="OfferdCourseID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-md-1">
                                    <asp:Button ID="btnView" runat="server" Text="عرض" CssClass="btn green" OnClick="btnView_Click" />
                                </div>
                            </div>
                            <hr />
                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <div class="col-md-12" style="padding: 12px; text-align: left; vertical-align: middle;">
                                    <asp:LinkButton ID="lbSectionStudentPDF" runat="server" OnClick="lbSectionStudentPDF_Click">كشف طلاب الشعبة</asp:LinkButton><br />
                                    <asp:LinkButton ID="lbSectionStudentsAttendancePDF" runat="server" OnClick="lbSectionStudentsAttendancePDF_Click">كشف حضور وغياب</asp:LinkButton><br />
                                    <asp:LinkButton ID="lbSectionStudentExcel" runat="server" OnClick="lbSectionStudentExcel_Click">كشف Excel</asp:LinkButton>
                                </div>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 4%; text-align: center">رقم</th>
                                            <th scope="col" style="width: 8%; text-align: center">رقم الطالب</th>
                                            <th scope="col" style="width: 16%; text-align: center">اسم الطالب</th>
                                            <th scope="col" style="width: 14%; text-align: center">نوع الطالب</th>
                                            <th scope="col" style="width: 14%; text-align: center">الكلية</th>
                                            <th scope="col" style="width: 14%; text-align: center">القسم</th>
                                            <th scope="col" style="width: 10%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <asp:Label ID="StudentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentType") %></span></td>
                                                    <td style="text-align: center;"><%# Eval("StudentCollege") %></td>
                                                    <td style="text-align: center;"><%# Eval("StudentDepartment") %></td>
                                                    <td style="text-align: center;">
                                                        <asp:LinkButton ID="lbOpenStudent" runat="server" class="btn default btn-xs black" OnClick="lbOpenStudent_Click">فتح الملف</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetSectionStudents" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <label class="col-md-3 control-label">
                                        عدد الطلاب في الشعبة : 
                                     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
                                         <ItemTemplate>
                                             <span style="font-weight: bold;"><%# Eval("CountOfSectionStudents") %></span>
                                         </ItemTemplate>
                                     </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetSectionStatistics" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </label>
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                            <asp:NumericPagerField ButtonType="Link" />
                                            <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                            <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center">
                                        <strong>لا يوجد طلاب مسجلين في الشعبة</strong>
                                        <div style="clear: both"></div>
                                    </div>
                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                    <div style="clear: both"></div>
                                </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

