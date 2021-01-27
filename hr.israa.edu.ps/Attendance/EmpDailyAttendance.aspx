<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="EmpDailyAttendance.aspx.cs" Inherits="Attendance_EmpDailyAttendance" %>

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
        <li><a href="EmpDailyAttendance.aspx" class="font-ha">تسجيل دوام الموظفين يوميا</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <% if (Permissions.Contains("RegistrationAttendance"))
        { %>
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>تسجيل دوام الموظفين يوميا </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>
            </div>
        </div>
        <div class="portlet-body">
            <div class="form-group">
                <div class="form-group row" id="Contract" runat="server" visible="true">
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
                    <label class="control-label col-md-2">تصنيف دوام الموظف :</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlEmpCategoryID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpCategoryID_SelectedIndexChanged" DataSourceID="SqlDataSource3" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [CategoryName] FROM EmpCategory Where ID in (1,4)  union select-1,N'الكل' order by ID "></asp:SqlDataSource>
                    </div>
                   
                    <label class="control-label col-md-2">حالة الموظف:</label>
                    <div class="col-md-2">
                        <asp:DropDownList ID="Empstatus" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="Empstatus_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select -1,N' الكل'">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="7" Name="Constant_ID" Type="Int32"></asp:Parameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                        <div class="col-md-2">
                                                <asp:DropDownList ID="ddlEmpSubStatus" Enabled="true" CssClass="select2_category form-control" runat="server" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpSubStatus_SelectedIndexChanged"></asp:DropDownList>
                                              
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource22" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1034 Union Select -1,N'الكل'"></asp:SqlDataSource>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource34" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1030 Union Select -1,N'الكل'"></asp:SqlDataSource>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1033 Union Select -1,N'الكل'"></asp:SqlDataSource>

                                            </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-2 control-label">التاريخ </label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa fa-calendar"></i>
                            <asp:TextBox ID="date" runat="server" AutoPostBack="true" OnTextChanged="date_TextChanged" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>
                    <asp:Label ID="h" runat="server" Visible="false"></asp:Label>
                    <label class="col-md-2 control-label">اليوم </label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="DropDownList1" Enabled="false" runat="server" class="form-control form-control-inline input-meduim" CssClass="select2_category form-control" placeholder="اختر اليوم" DataSourceID="SqlDataSource2" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID], [Ar_Name] FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select 0,N'  '">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="17" Name="Constant_ID" Type="Int32"></asp:Parameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

                <div class="form-group row" id="HR" runat="server" visible="false">

                    <asp:Button ID="Button1" runat="server" Text="طباعة تقرير الحضور" class="btn green" OnClick="Button1_Click" />
                    <asp:Button ID="lbAbsentPDF" runat="server" Text=" كشف المتغيبين" class="btn red" OnClick="lbAbsentPDF_Click" />
                     <asp:Button ID="btnNoAttendanceTo" runat="server" Text="الذين لم يوقعوا مغادرة " class="btn" OnClick="btnNoAttendanceTo_Click" />
                    <asp:Button ID="Button2" runat="server" Text="الغير خاضع للبصمة" class="btn blue" OnClick="Button2_Click" />
                    <asp:Button ID="Button4" runat="server" Text="  اجازات الموظفين لليوم" class="btn purple" OnClick="Button4_Click" />
                    <asp:Button ID="btnLatePage" runat="server" Text="الانتقال الى صفحة المتاخرين" class="btn yellow" OnClick="btnLatePage_Click" />
                    <asp:Button ID="btnAbsent" runat="server" Text="صفحة الغياب" class="btn default" OnClick="btnAbsent_Click" />

                </div>
            </div>
            <div class="clearfix"></div>
            <div class="portlet-body">
                <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
                    <thead>
                        <tr>
                            <th>الحالة</th>
                            <th>رقم الموظف</th>
                            <th>اسم الموظف</th>
                            <th>وقت الحضور</th>
                            <th>وقت الانصراف</th>
                            <th></th>
                            <% if (Permissions.Contains("RegistrationAbsence"))
                                { %><th></th>
                            <%} %>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
                            <ItemTemplate>

                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Visible="True" Text='<%# Eval("Notes")%>'></asp:Label>


                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("EmployeeNo") %>' Visible="True"></asp:Label>
                                        <asp:Label ID="Emp_ID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="AttID" runat="server" Text='<%# Eval("Attendance_ID") %>' Visible="false"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="from" runat="server" class="form-control clockface_1" Width="150px" MaxLength="50" Text='<%# Eval("Attendance_From") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="to" runat="server" class="form-control clockface_1" Width="150px" MaxLength="50" Text='<%# Eval("Attendance_To") %>'></asp:TextBox>
                                    </td>
                                    <td>

                                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn default btn-xs green"  OnClick="LinkButton1_Click"><i class="fa fa-edit"></i> تسجيل الحضور</asp:LinkButton></td>

                                    <% if (Permissions.Contains("RegistrationAbsence"))
                                        { %>
                                    <td>
                                        <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" Enabled='<%# (Eval("Attendance_From")==DBNull.Value && Eval("Attendance_To")==DBNull.Value )? true : false %>' OnClientClick="return confirm('هل انت متاكد من اعتماد الغياب ؟')"><i class="fa fa-trash-o"></i> تسجيل غياب</a></asp:LinkButton>
                                    </td>
                                    <%} %>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                            SelectCommand="SELECT [dbo].[GetEmployeeNO](Emp_ID) as EmployeeNo,* FROM [Employee_TB] where Emp_ID not in(1,2,3,5) and IsDelete=0   ">
                            <%-- <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="Department_ID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>--%>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                            SelectCommand="EmpDailyAttGet" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="date" Name="date" PropertyName="Text" Type="string" />
                                <asp:ControlParameter ControlID="ddlEmpCategoryID" Name="EmpCategoryID" PropertyName="SelectedValue" Type="Int16" />
                                <asp:ControlParameter ControlID="Empstatus" Name="EmpstatusID" PropertyName="SelectedValue" Type="Int16" />
                                <asp:ControlParameter ControlID="ddlEmpSubStatus" Name="EmpSubStatusID" PropertyName="SelectedValue" Type="Int16" DefaultValue="-1" />
                                <asp:ControlParameter ControlID="ddlEmployeeCat" Name="EmployeeCatID" PropertyName="SelectedValue" Type="Int16" DefaultValue="-1"  />
                                <asp:ControlParameter ControlID="ddlContractTypeID" Name="ContractTypeID" PropertyName="SelectedValue" Type="Int16" DefaultValue="-1"  />
                                <asp:ControlParameter ControlID="ddlSubContractType" Name="SubContractTypeID" PropertyName="SelectedValue" Type="Int16" DefaultValue="-1"  />

                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
            </div>

            <%} %>
        </div>
    </div>
</asp:Content>

