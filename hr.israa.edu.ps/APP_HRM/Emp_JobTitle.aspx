<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_JobTitle.aspx.cs" Inherits="APP_HRM_Emp_JobTitle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />


    <script type="text/javascript" src="../assets/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/clockface.js"></script>
    <script type="text/javascript" src="../assets/datepicker/moment.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-datetimepicker.min.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script src="../assets/datepicker/quick-sidebar.js" type="text/javascript"></script>
    <script src="../assets/datepicker/demo.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js"></script>
    <script>
        jQuery(document).ready(function () {

            QuickSidebar.init(); // init quick sidebar
            Demo.init(); // init demo features
            ComponentsPickers.init();

        });
    </script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu3').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Emp_JobTitle.aspx" class="font-ha">تغيير مسميات الموظفين</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <% if (Permissions.Contains("JobTitleView"))
       { %>
    <div class="row">
        <% if (Permissions.Contains("JobTitleAdd") || Permissions.Contains("JobTitleEdit"))
           { %>
        <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>تغيير مسميات الموظفين  </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-5 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-7">
                                    <asp:DropDownList ID="DropDownList8" AutoPostBack="true" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,([dbo].[GetEmployeeNo](Emp_ID)+ ' ' +[dbo].[GetEmployeeName](Emp_ID,3)) as DisplayName FROM [Employee_TB] where IsDelete=0 and Emp_ID not in (1,2,3,5) union select -1,N' اختر الموظف '"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="control-label col-md-5" style="text-align: right">الدائرة</label>
                                <div class="col-md-7">
                                    <asp:DropDownList ID="ddlDepartment" AutoPostBack="true" class="form-control" placeholder="ادخل الدائرة التابع لها " runat="server" DataSourceID="SqlDataSource1" DataTextField="Ar_Name" DataValueField="Department_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                        SelectCommand="SELECT Department_ID,Ar_Name FROM [Department_TB] where isDelete=0    union select 0,N'  '"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-5 control-label">المسمى الوظيفي</label>
                                <div class="col-md-7">
                                    <asp:DropDownList ID="JobTitle" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Ar_Job_Name" DataValueField="Job_Title_ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Job_Title_ID],[Ar_Job_Name] FROM [JobTitle_TB] where IsDelete=0  and Department_ID=@Department_ID union select -1 , N'اختر المسمى'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDepartment" Name="Department_ID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-5 control-label">فعال     </label>
                                <div class="col-md-7">
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-7">
                                <asp:Button ID="Button3" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />

                                <asp:Button ID="Button4" runat="server" Text="تفريغ الحقول " class="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                    <!-- END FORM-->
                </div>
            </div>
        </div>
        <%} %>
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>مسميات الموظفين </div>
                    <div class="tools">

                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 40%">اسم الموظف</th>
                                    <th style="width: 30%; text-align: center">المسمى الوظيفي</th>
                                    <th style="width: 20%; text-align: center">الدائرة</th>
                                    <th style="width: 10%; text-align: center">فعال </th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <asp:Label ID="EmpJobTitleID" runat="server" Text='<%# Eval("Emp_JobTitle_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("DisplayName") %> </span></td>
                                            <td style="text-align: center"><span><%# Eval("Ar_Job_Name") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Department") %></span></td>
                                            <td style="text-align: center">
                                                <asp:CheckBox ID="CheckBox2" runat="server" checked='<%# Eval("IsActive") %>' Enabled="false" />
                                               
                                            </td>
                                            <td style="text-align: center">
                                                <% if (Permissions.Contains("JobTitleEdit"))
                                                   { %>
                                                <asp:LinkButton ID="lbEdit2" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <%} %>

                                                <%--                                                    <% if (Permissions.Contains("JobTitleDelete"))
                                                       { %>
                                                    <asp:LinkButton ID="lbDelete2" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                    <%} %>  </td>--%>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="EmpJobTitleGet" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList8" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <%} %>
</asp:Content>

