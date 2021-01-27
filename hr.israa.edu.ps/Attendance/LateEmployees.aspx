<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="LateEmployees.aspx.cs" Inherits="Attendance_LateEmployees" %>

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
        <li><a href="EmpDailyAttendance.aspx" class="font-ha">المتأخرون</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>المتأخرون </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>
            </div>
        </div>
        <div class="portlet-body">
            <div class="form-group">
                <div class="form-group row">
                    <label class="control-label col-md-2">تصنيف الموظف  : </label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlEmployeeCat" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource12" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [Name] FROM TypeCategory where TypeID=1 union select-1,N'الكل' order by ID "></asp:SqlDataSource>
                    </div>
                    <label class="control-label col-md-2">نوع العقد: </label>
                    <div class="col-md-2">
                        <asp:DropDownList ID="ddlContractTypeID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource6" DataTextField="Contract_Type" DataValueField="Contract_Type_ID" OnSelectedIndexChanged="date_TextChanged"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Contract_Type_ID], [Contract_Type] FROM Contract_Type_TB union select-1,N'الكل' "></asp:SqlDataSource>
                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList ID="ddlSubContractType" placeholder="ادخل نوع العقد مخصص" runat="server" DataSourceID="SqlDataSource13" DataTextField="ContractSubName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" OnSelectedIndexChanged="date_TextChanged"></asp:DropDownList>
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
                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [CategoryName] FROM EmpCategory where ID=4 union select-1,N'الكل' order by ID "></asp:SqlDataSource>

                    </div>

                    <label class="control-label col-md-2">حالة الموظف: </label>
                    <div class="col-md-2">
                        <asp:DropDownList ID="Empstatus" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="Empstatus_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select -1,N' الكل'">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="7" Name="Constant_ID" Type="Int32"></asp:Parameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList ID="ddlEmpSubStatus" Enabled="true" CssClass="select2_category form-control" runat="server" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource22" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1034 Union Select -1,N'الكل'"></asp:SqlDataSource>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource34" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1030 Union Select -1,N'الكل'"></asp:SqlDataSource>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1033 Union Select -1,N'الكل'"></asp:SqlDataSource>

                    </div>

                </div>

                <div class="form-group row">
                    <label class="col-md-2 control-label">من تاريخ </label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa fa-calendar"></i>
                            <asp:TextBox ID="FromDate" runat="server" AutoPostBack="true" OnTextChanged="date_TextChanged" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>

                    <label class="col-md-2 control-label">حتى تاريخ </label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa fa-calendar"></i>
                            <asp:TextBox ID="EndDate" runat="server" AutoPostBack="true" OnTextChanged="date_TextChanged" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-2 control-label">نوع التاخير  </label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlLateType" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlLateType_SelectedIndexChanged">
                            <asp:ListItem Value="-1">الكل</asp:ListItem>
                            <asp:ListItem Value="1">تاخير صباحي</asp:ListItem>
                            <asp:ListItem Value="2">انصراف مبكر</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group row">

                        <asp:Button ID="btnlateReport" runat="server" Text="طباعة تقرير المتاخرين" class="btn green" OnClick="btnlateReport_Click" />

                    </div>



                </div>
                <div class="clearfix"></div>
                <div class="portlet-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>رقم </th>
                                <th>رقم الموظف</th>
                                <th>اسم الموظف</th>
                                <th>التاريخ </th>
                                <th>وقت الحضور</th>
                                <th>وقت الانصراف</th>
                                <th>تأخير صباحي</th>
                                <th>انصراف مبكر</th>
                                <th>مجموع التأخير</th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>

                                    <tr>
                                        <td><%# Eval("RowNo") %></td>
                                        <td><%# Eval("EmployeeNo") %></td>
                                        <td><%# Eval("DisplayName") %> </td>
                                        <td><%# Eval("Date") %> </td>
                                        <td><%# Eval("Attendance_From") %></td>
                                        <td><%# Eval("Attendance_To") %></td>
                                        <td><%# Eval("LatePeriod") %></td>
                                        <td><%# Eval("LeaveEarlyPeriod") %></td>
                                        <td><%# Eval("LateTotal") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>


                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                SelectCommand="LateEmployeesGet" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="FromDate" Name="StartDate" PropertyName="Text" Type="string" />
                                    <asp:ControlParameter ControlID="EndDate" Name="EndDate" PropertyName="Text" Type="string" />
                                    <asp:ControlParameter ControlID="ddlEmpCategoryID" Name="EmpCategoryID" PropertyName="SelectedValue" Type="Int16" />
                                    <asp:ControlParameter ControlID="Empstatus" Name="EmpstatusID" PropertyName="SelectedValue" Type="Int16" />
                                    <asp:ControlParameter ControlID="ddlEmpSubStatus" Name="EmpSubStatusID " PropertyName="SelectedValue" Type="Int16" DefaultValue="-1" />
                                    <asp:ControlParameter ControlID="ddlEmployeeCat" Name="EmployeeCatID" PropertyName="SelectedValue" Type="Int16" />
                                    <asp:ControlParameter ControlID="ddlContractTypeID" Name="ContractTypeID" PropertyName="SelectedValue" Type="Int16" />
                                    <asp:ControlParameter ControlID="ddlSubContractType" Name="SubContractTypeID" PropertyName="SelectedValue" Type="Int16" />
                                    <asp:ControlParameter ControlID="ddlLateType" Name="LateType" PropertyName="SelectedValue" Type="Int16" />

                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                </div>


            </div>
        </div>
</asp:Content>

