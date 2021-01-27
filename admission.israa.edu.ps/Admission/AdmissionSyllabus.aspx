<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="AdmissionSyllabus.aspx.cs" Inherits="Admission_AdmissionSyllabus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

     <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Syllabus').addClass("active open");
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
                <span> توصيف المساقات</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
     <asp:Label ID="lbPlaceID" runat="server" Text="" Visible="false"></asp:Label>
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>توصيف المساقات</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-2 control-label isra-text-aling-right">الفصل الدراسي</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlSemester" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="Select ID, ArName From Semester Where Code<>'111111111' and IsActive=1 and IsDelete=0 Order by ID desc"></asp:SqlDataSource>
                            </div>
                            <label class="col-md-2 control-label isra-text-aling-right">البرنامج</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlProgram" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Program] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1,N'الكل'"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label isra-text-aling-right">الكلية</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [College] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (ProgramID=@ProgramID or @ProgramID=-1)) union select -1,N'الكل'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <label class="col-md-2 control-label isra-text-aling-right">القسم</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="btnSearch_Click"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Department] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (CollegeID=@CollegeID or @CollegeID=-1)) union select -1,N'الكل'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label isra-text-aling-right">المساق</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Course] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (DepartmentID=@DepartmentID or @DepartmentID=-1)) union select -1,N'الكل'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                            <label class="col-md-2 control-label isra-text-aling-right">المحاضر</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlInstructor" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:IsraaHumanResource %>'
                                    SelectCommand="Select ID,(Select dbo.[GetEmployeeNo](ID) + ' - ' + dbo.[GetEmployeeName](ID,3,0)) as [Name] From [IsraPermissions].dbo.Employee Where ID>4 and EmployeeNo <> N'000' Union Select -1,N'الكل' Order by ID "></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn blue" OnClick="btnSearch_Click" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">

        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i> توصيف المساقات</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <% if (ListView1.Items.Count > 0)
                    { %>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="text-align: center; width: 5%">#</th>
                            <th style="text-align: center; width: 15%">كود المساق</th>
                            <th style="text-align: center; width: 20%">المساق</th>
                            <th style="text-align: center; width: 15%">عدد الساعات</th>
                            <th style="text-align: center; width: 20%">القسم</th>
                            <th style="text-align: center; width: 20%">المحاضر</th>
                            <th style="text-align: center; width: 5%"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource7">
                            <ItemTemplate>
                                <asp:Label ID="SyllabusID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="CourseName" runat="server" Text='<%# Eval("CourseName") %>' Visible="false"></asp:Label>
                                <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                <td style="text-align: center"><span><%# Eval("NumOfHours") %></span></td>
                                <td style="text-align: center"><span><%# Eval("DepartmentName") %></span></td>
                                <td style="text-align: center"><span><%# Eval("InstructorName") %></span></td>
                                <td style="text-align: center">
                                    <asp:LinkButton ID="lbPrint" runat="server" class="btn default btn-xs blue" OnClick="lbPrint_Click"></i> طباعة الوصف</asp:LinkButton></td>

                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetAdmissionSyllabus" SelectCommandType="StoredProcedure">


                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" DefaultValue="-1" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" DefaultValue="-1" Name="CourseID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" DefaultValue="-1" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlInstructor" PropertyName="SelectedValue" DefaultValue="-1" Name="InstructorID" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
                <div class="clearfix"></div>
                <div class="form-group">
                </div>
                <div class="clearfix"></div>
                <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                        <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                        <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                        <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                    </Fields>
                </asp:DataPager>
                <div class="clearfix"></div>
                <% }
                    else
                    {%>
                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                    <div class="col-xs-11" style="text-align: center;">
                        <strong>لا يوجد بيانات للعرض</strong>
                        <div style="clear: both"></div>
                    </div>
                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                    <div style="clear: both"></div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</asp:Content>

