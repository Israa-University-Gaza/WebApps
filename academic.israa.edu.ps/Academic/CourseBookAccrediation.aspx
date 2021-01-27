<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="CourseBookAccrediation.aspx.cs" Inherits="Academic_CourseBookAccrediation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#courseBook').addClass("active open");
            $('#courseBook_2 a').css("background-color", "#575757");
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
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>اعتماد كتب المساقات</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <asp:Label ID="lblPlanID" runat="server" Text="" Visible="false"></asp:Label>
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>بحث حسب</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-2">الفصل الدراسي</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([Code] <> '111111111') AND ([IsDelete] = 0)) ORDER BY ID DESC"></asp:SqlDataSource>
                            </div>
                            <label class="col-md-2 control-label isra-text-aling-right">البرنامج</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" CssClass="select2_category form-control"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeePrograms" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label isra-text-aling-right">الكلية</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlCollege" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged" CssClass="select2_category form-control"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeCollages" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <label class="col-md-2 control-label isra-text-aling-right">القسم</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeDepartments" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>


                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn green" OnClick="btnSearch_Click" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>كتب المساقات</div>
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
                            <th style="width: 25%; text-align: center">المساق</th>
                            <th style="width: 25%; text-align: center">المحاضر</th>
                            <th style="width: 30%; text-align: center">اسم الكتاب</th>
                            <th style="width: 10%; text-align: center">الكتاب</th>
                            <th style="width: 10%; text-align: center">اعتماد</th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <tr>
                                    <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("EmployeeName") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("BookName") %></span></td>

                                    <td style="text-align: center"><a href="WebServices/DownloadCourseBookFile.ashx?fileName=<%# Eval("FileName") %>">تنزيل</a></td>
                                    <td style="text-align: center"><span><%# Eval("Accredit") %></span>
                                        <span><%# Convert.ToBoolean(Eval("IsAccreditation").ToString())? "  بتاريخ " + Eval("AccreditDate"):""  %></span></td>

                                    <td style="text-align: center">
                                        <% if (IsPermissionsContains("DeanSectionEmployee"))
                                        { %>
                                        <asp:Button ID="lbAccedit" runat="server" Visible='<%# !Convert.ToBoolean(Eval("IsAccreditation").ToString()) %>' class="btn default btn-xs green" Text="اعتماد" OnClick="lbAccedit_Click"></asp:Button>
                                        <asp:Button ID="lbCancel" runat="server" Visible='<%# Convert.ToBoolean(Eval("IsAccreditation").ToString()) %>' class="btn default btn-xs red" Text="الغاء اعتماد" OnClick="lbCancel_Click"></asp:Button>

                                        <% } %>
                                        <asp:Button ID="lbDelete" runat="server" Visible='<%# !Convert.ToBoolean(Eval("IsAccreditation").ToString()) %>' class="btn default btn-xs red" Text="حذف" OnClick="lbDelete_Click"></asp:Button>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                            ConnectionString="<%$ ConnectionStrings:isra %>"
                            SelectCommand="GetCourseBook" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>

                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
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
                    <div class="col-xs-11" style="text-align: center">
                        <strong>لم يتم إضافة كتب بعد</strong>
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

