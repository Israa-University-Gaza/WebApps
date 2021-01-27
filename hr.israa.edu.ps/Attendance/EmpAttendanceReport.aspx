<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="EmpAttendanceReport.aspx.cs" Inherits="Attendance_EmpAttendanceReport" %>

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
            $('#menu4').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="EmpAttendanceReport.aspx" class="font-ha">كشف دوام الموظف </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>كشف دوام الموظف  </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>

            </div>
        </div>
        <div class="portlet-body">
            <div class="form-group row">
                <label class="control-label col-md-2">تصنيف الموظف  : </label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlEmployeeCat" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource12" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [Name] FROM TypeCategory where TypeID=1 union select-1,N'الكل' order by ID "></asp:SqlDataSource>
                </div>
                <label class="control-label col-md-2">نوع العقد: </label>
                <div class="col-md-2">
                    <asp:DropDownList ID="ddlContractTypeID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource6" DataTextField="Contract_Type" DataValueField="Contract_Type_ID"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Contract_Type_ID], [Contract_Type] FROM Contract_Type_TB union select-1,N'الكل' "></asp:SqlDataSource>
                </div>
                <div class="col-md-2">
                    <asp:DropDownList ID="ddlSubContractType" placeholder="ادخل نوع العقد مخصص" runat="server" DataSourceID="SqlDataSource13" DataTextField="ContractSubName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,ContractSubName FROM [ContractSubType] where Contract_Type_ID=@Type union select -1,N'الكل'">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="7" Name="Type"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="form-group row">
                <label class="control-label col-md-2">تصنيف دوام الموظف  : </label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlEmpCategoryID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpCategoryID_SelectedIndexChanged" DataSourceID="SqlDataSource3" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [CategoryName] FROM EmpCategory  where ID=4 union select-1,N'الكل' order by ID "></asp:SqlDataSource>

                </div>
                <label class="control-label col-md-2">حالة الموظف: </label>
                <div class="col-md-4">
                    <asp:DropDownList ID="Empstatus" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="Empstatus_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select -1,N' الكل'">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="7" Name="Constant_ID" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>


            </div>
            <div class="form-group row">
                <label class="col-md-2 control-label">من تاريخ </label>
                <div class="col-md-4">
                    <div class="input-icon">
                        <i class="fa fa-calendar"></i>
                        <asp:TextBox ID="FromDate" runat="server" data-date-format="yyyy/mm/dd" AutoPostBack="true" OnTextChanged="FromDate_TextChanged" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                <asp:Label ID="h" runat="server" Visible="false"></asp:Label>
                <label class="col-md-2 control-label">الى تاريخ </label>
                <div class="col-md-4">
                    <div class="input-icon">
                        <i class="fa fa-calendar"></i>
                        <asp:TextBox ID="ToDate" runat="server" data-date-format="yyyy/mm/dd" AutoPostBack="true" OnTextChanged="FromDate_TextChanged" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-2 control-label">اسم الموظف </label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlEmployee" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="Emp_ID"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetAllEmployeesName" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlEmpCategoryID" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpCategoryID" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="Empstatus" PropertyName="SelectedValue" DefaultValue="" Name="EmpStatusID" Type="Int32"></asp:ControlParameter>
                           <asp:ControlParameter ControlID="ddlEmployeeCat" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeCatID" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="-1" Name="ContractTypeID" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="ddlSubContractType" PropertyName="SelectedValue" DefaultValue="-1" Name="SubContractTypeID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="form-actions fluid">
            <div class="col-md-offset-2 col-md-9">
                <asp:Button ID="Button1" runat="server" Text="طباعة كشف دوام الموظف" OnClick="Button1_Click" class="btn blue" />
                <asp:Button ID="Button2" runat="server" Text=" كشف تأخير الموظف" OnClick="Button2_Click" class="btn red" />
                <asp:Button ID="Button3" runat="server" Text=" كشف تحركات الموظف الخاصة" OnClick="Button3_Click" class="btn yellow" />
                <asp:Button ID="Button4" runat="server" Text=" كشف مهمات عمل الموظف " OnClick="Button4_Click" class="btn purple" />
            </div>
        </div>

    </div>

    <div class="portlet box red">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>كشف دوام الموظف  </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>

            </div>
        </div>
        <div class="portlet-body">
            <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
                <thead>
                    <tr>
                        <th>رقم الموظف</th>
                        <th>اسم الموظف</th>
                        <th>التاريخ</th>
                        <th>وقت الحضور</th>
                        <th>وقت الانصراف</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>

                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("EmployeeNo") %>' Visible="True"></asp:Label>
                                    <asp:Label ID="Emp_ID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="AttID" runat="server" Text='<%# Eval("Attendance_ID") %>' Visible="false"></asp:Label>
                                </td>
                                <td><%# Eval("DisplayName") %></td>
                                <td><%# Eval("Date","{0:yyyy/MM/dd}") %> </td>
                                <td><%# Eval("Attendance_From") %></td>
                                <td><%# Eval("Attendance_To") %></td>


                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                        SelectCommand="GetEmployeeAttendanceBetweenTwoDates" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="FromDate" Name="FromDate" PropertyName="Text" Type="string" />
                            <asp:ControlParameter ControlID="ToDate" Name="ToDate" PropertyName="Text" Type="string" />
                            <asp:ControlParameter ControlID="ddlEmployee" Name="EmployeeID" PropertyName="SelectedValue" Type="Int16" />
                            <asp:ControlParameter ControlID="ddlEmpCategoryID" Name="EmpCategoryID" PropertyName="SelectedValue" Type="Int16" />
                            <asp:ControlParameter ControlID="Empstatus" Name="EmpstatusID" PropertyName="SelectedValue" Type="Int16" />
                           <asp:ControlParameter ControlID="ddlEmployeeCat" Name="EmployeeCatID" PropertyName="SelectedValue" Type="Int16" />
                            <asp:ControlParameter ControlID="ddlContractTypeID" Name="ContractTypeID" PropertyName="SelectedValue" Type="Int16" />
                            <asp:ControlParameter ControlID="ddlSubContractType" Name="SubContractTypeID" PropertyName="SelectedValue" Type="Int16" />

                        </SelectParameters>
                    </asp:SqlDataSource>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

