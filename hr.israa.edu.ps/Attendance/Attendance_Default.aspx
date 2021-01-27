<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="Attendance_Default.aspx.cs" Inherits="Attendance_Attendance_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />
    <style>
        .input-xsmall {
            width: 100%!important;
        }
    </style>

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
            <i class="fa fa-home"></i><a href="../APP_HRM/Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Attendance_Default.aspx" class="font-ha">الدوام الافتراضي</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="tabbable tabbable-custom boxless">
                <ul class="nav nav-tabs">
                    <li id="t1" runat="server" class="active"><a href="#tab_1" data-toggle="tab">الداوم الافتراضي الثابت</a></li>
                    <li id="t2" runat="server"><a href="#tab_2" data-toggle="tab">الداوم الأسبوعي</a></li>
                    <li id="t3" runat="server"><a href="#tab_3" data-toggle="tab">الدوام الشهري</a></li>
                </ul>

                <div class="tab-content">

                    <div class="tab-pane active" id="tab_1" runat="server" ClientIDMode="static">
                        <% if (Permissions.Contains("AttendanceDefaultAdd") || Permissions.Contains("AttendanceDefaultAdd"))
                           { %>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>الدوام الثابت</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-body">
                                    <div class="form-group row">
                                     <label class="col-md-3 control-label" runat="server" visible="false">اسم النسق  </label>
                                        <div class="col-md-3" runat="server" visible="false">
                                            <asp:TextBox ID="TextBox1"  runat="server" placeholder="  اسم النسق " class="form-control"></asp:TextBox>
                                        </div>
                                        <label class="col-md-3 control-label">وقت بدء الدوام الثابت  </label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="ConstantSTime"  runat="server" placeholder=" ادخل وقت بدء الدوام الثابت " data-format="HH:mm" MaxLength="5"  CssClass="form-control clockface_1"></asp:TextBox>
                                        </div>
                                          <label class="col-md-3 control-label">وقت انتهاء الدوام الثابت</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="ConstantFTime"  runat="server" placeholder="ادخل وقت انتهاء الدوام الثابت" data-format="HH:mm" MaxLength="5"  CssClass="form-control clockface_1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row ">
                                      
                                        <label class="col-md-3 control-label">يوم الاجازة الافتراضي</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control form-control-inline input-meduim" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID], [Ar_Name]  FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select 0,N'  ' ">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="17" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                         <label class="col-md-3 control-label">يوم الاجازة الاختياري</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList2" runat="server" class="form-control form-control-inline input-meduim" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID], [Ar_Name] FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select 0,N'  '">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="17" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                  
                                  
                                </div>
                                <div class="form-actions fluid">
                                    <div class="col-md-offset-3 col-md-9">
                                        <asp:Button ID="Button3" runat="server" Text="اضافة" class="btn blue" OnClick="Button3_Click" />
                                        <asp:Button ID="Button4" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button4_Click" />
                                    </div>
                                </div>
                            </div>
                            <!-- END FORM-->
                        </div>
                        <%} %>
                        <% if (Permissions.Contains("AttendanceDefaultView"))
                           { %>
                        <div class="portlet box red">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>الدوام الافتراضي</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 25%; text-align: center">اسم النسق</th>
                                                <th style="width: 25%; text-align: center">بداية الدوام الافتراضي</th>
                                                <th style="width: 25%; text-align: center">نهاية الدوام الافتراضي </th>
                                                <th style="width: 25%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <asp:Label ID="AttConstantID" runat="server" Text='<%# Eval("Constant_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td style="text-align: center"><span><%# Eval("AttendanceFormat") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Attendance_From") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Attendance_To") %></span></td>
                                                        <td style="text-align: center">
                                                            <% if (Permissions.Contains("AttendanceDefaultEdit"))
                                                               { %>
                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                            <%} %>
                                                            <% if (Permissions.Contains("AttendanceDefaultDelete"))
                                                               { %>
                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                            <%} %> </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="DefAttGetA" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <%} %>
                    </div>
                    <div class="tab-pane " id="tab_2" runat="server" ClientIDMode="static">
                        <% if (Permissions.Contains("AttendanceWeekAdd"))
                           { %>
                        <div class="portlet box yellow">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>نسق الدوام الاسبوعي </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-body">
                                    <div class="form-group row">
                                     <label class="col-md-3 control-label" runat="server">اسم النسق  </label>
                                        <div class="col-md-3" runat="server">
                                            <asp:TextBox ID="txtWeekFormatName"  runat="server" placeholder="  اسم النسق " class="form-control"></asp:TextBox>
                                        </div>
                                     </div>
                                <div class="form-actions fluid">
                                    <div class="col-md-offset-3 col-md-9">
                                        <asp:Button ID="btnWeekFormatName" runat="server" Text="اضافة" class="btn blue"  OnClick="btnWeekFormatName_Click"/>
                                      
                                    </div>
                                </div>
                            </div>
                            <!-- END FORM-->
                        </div>
                            </div>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>الدوام الاسبوعي </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-body">
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label" style="text-align: right">اختر النسق الاسبوعي </label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlDefaultAttendanceWeekFormatID" AutoPostBack="true"  OnTextChanged="DropDownList8_TextChanged" placeholder="ادخل اسم النسق" runat="server" DataSourceID="SqlDataSource20" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [DefaultAttendanceWeekFormat]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">ايام  الدوام   </label>
                                        <div class="col-md-7">
                                            <asp:DataList ID="DLCat" runat="server" DataKeyField="ID"
                                                DataSourceID="SqlDataSource4" Width="100%">
                                                <ItemTemplate>
                                                    <div class="col-md-2">
                                                        <asp:CheckBox ID="CheckBox1" runat="server" CssClass="checker" AutoPostBack="true" OnCheckedChanged="Day_Check" />
                                                        <asp:Label ID="Label1" runat="server" Width="22%"><%#Eval("Name") %></asp:Label>
                                                        <asp:Label ID="SubConstantID" runat="server" Visible="false" Text='<%#Eval("ID") %>'></asp:Label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="AttSTime" runat="server" Width="30%" placeholder="وقت البدء" Enabled="false" data-format="HH:mm " MaxLength="5"  CssClass="clockface_1 form-control input-xsmall"></asp:TextBox>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="AttFTime" runat="server" Width="30%" placeholder=" وقت الانتهاء" Enabled="false" data-format="HH:mm " MaxLength="5"  CssClass="clockface_1 form-control input-xsmall"></asp:TextBox>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="SELECT  [ID], [Name] FROM [Days]">
                                               
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-actions fluid">
                                    <div class="col-md-offset-3 col-md-9">
                                        <asp:Button ID="Button5" runat="server" Text="اعتماد " class="btn green" OnClick="Button5_Click" />
                                        <asp:Button ID="Button6" runat="server" Text="الغاء الامر" class="btn default" />
                                    </div>
                                </div>
                            </div>
                            <!-- END FORM-->
                        </div>
                        <%} %>
                        <% if (Permissions.Contains("AttendanceWeekView"))
                           { %>
                        <div class="portlet box red">
                            <asp:TextBox ID="LBAttWeekID" runat="server" Text="" Visible="false"></asp:TextBox>
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>جدول الداوم الاسبوعي   </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                   <div class="form-group row">
                                        <label class="col-md-3 control-label" style="text-align: right">اختر النسق الاسبوعي </label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlFilterDefaultAttendanceWeekFormatID" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterDefaultAttendanceWeekFormatID_SelectedIndexChanged" placeholder="ادخل اسم النسق" runat="server" DataSourceID="SqlDataSource20" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [DefaultAttendanceWeekFormat]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%">اليوم </th>
                                                <th style="width: 10%; text-align: center">بداية الداوم</th>
                                                <th style="width: 12%; text-align: center">نهاية الدوام</th>
                                                <th style="width: 15%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource5">
                                                <ItemTemplate>
                                                    <asp:Label ID="AttWeekID" runat="server" Text='<%# Eval("Att_Week_ID") %>' Visible="false"></asp:Label>
                                                   <%-- <asp:Label ID="DefaultAttendanceWeekFormatID" runat="server" Text='<%# Eval("DefaultAttendanceWeekFormatID") %>' Visible="false"></asp:Label>
                                                   --%> <tr>
                                                        <td><span><%# Eval("Ar_Name") %>
                                                            <asp:Label ID="Attendance_Day_ID" runat="server" Visible="false" Text='<%# Eval("Attendance_Day_ID") %>'></asp:Label></span></td>
                                                        <td style="text-align: center">
                                                            <asp:TextBox ID="TextBox1" runat="server" Enabled="false" data-format="HH:mm" MaxLength="5"  CssClass="clockface_1 form-control input-xsmall" Text='<%# Eval("Attendance_From") %>'></asp:TextBox></td>
                                                        <td style="text-align: center">
                                                            <asp:TextBox ID="TextBox2" Enabled="false" runat="server" data-format="HH:mm" MaxLength="5"  CssClass="clockface_1 form-control input-xsmall" Text='<%# Eval("Attendance_To") %>'></asp:TextBox></td>
                                                        <td style="text-align: center"></td>
                                                        <td style="text-align: center">
                                                            <% if (Permissions.Contains("AttendanceWeekEdit"))
                                                               { %>
                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                            <%} %>
                                                            <% if (Permissions.Contains("AttendanceWeekDelete"))
                                                               { %>
                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                            <%} %>  </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="AttWeekGetA" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlFilterDefaultAttendanceWeekFormatID" PropertyName="SelectedValue" Name="DefaultAttendanceWeekFormatID" Type="Int32"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <%} %>
                    </div>
                    <div class="tab-pane " id="tab_3" runat="server" ClientIDMode="static">
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>الدوام الشهري </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="form-group row">
                                    <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="DropDownList3" AutoPostBack="true" OnTextChanged="DropDownList3_TextChanged" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource6" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] where Attendance_Type_ID=2057 union select 0,N'  '"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="table-toolbar">
                                    <div class="btn-group">
                                        <%--<button id="sample_editable_1_new" class="btn green">
									Add New <i class="fa fa-plus"></i></button>--%>
                                        <% if (Permissions.Contains("AttendanceMonthAdd"))
                                           { %>
                                        <asp:Button ID="Button11" runat="server" Text="اضافة يوم جديد " class="btn green" OnClick="Button11_Click" />
                                        <%} %>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div>
                                    <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
                                        <thead>
                                            <tr>
                                                <th>تاريخ بدء الدوام</th>
                                                <th>وقت بدءالدوام</th>
                                                <th>تاريخ انتهاء الدوام</th>
                                                <th>وقت انتهاءالدوام</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <div id="show" runat="server" visible="false">
                                                <tr>
                                                    <td>
                                                        <div class="input-icon">
                                                            <i class="fa fa-calendar"></i>
                                                            <asp:TextBox ID="Date_FromTxt" runat="server" data-date-format="yyyy/mm/dd"  CssClass="form-control form-control-inline input-xsmall date-picker"  Width="150px"></asp:TextBox>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Time_FromTxt" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" Width="150px"  ></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <div class="input-icon">
                                                            <i class="fa fa-calendar"></i>
                                                            <asp:TextBox ID="Date_toTxt" runat="server" data-date-format="yyyy/mm/dd"  CssClass="form-control form-control-inline input-meduim date-picker" Width="150px" ></asp:TextBox>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Time_ToTxt" runat="server" CssClass="form-control clockface_1" Width="150px" data-format="HH:mm" MaxLength="5" ></asp:TextBox>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:LinkButton ID="lbSave" runat="server" class="btn default btn-xs green" OnClick="lbSave_Click"><i class="fa fa-edit"></i> اضافة</asp:LinkButton></td>
                                                    <td></td>
                                                </tr>
                                            </div>
                                            <% if (Permissions.Contains("AttendanceMonthView"))
                                               { %>
                                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource7">
                                                <ItemTemplate>
                                                    <tr>
                                                        <asp:Label ID="AttMonth_ID" runat="server" Text='<%# Eval("Att_Month_ID") %>' Visible="false"></asp:Label>
                                                        <td>
                                                            <div class="input-icon">
                                                                <i class="fa fa-calendar"></i>
                                                                <asp:TextBox ID="date1" runat="server" Enabled="false"  data-date-format="yyyy/mm/dd" class="form-control form-control-inline input-meduim date-picker" Width="150px" MaxLength="50" Text='<%# Eval("Date_From","{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="time1" runat="server" Enabled="false" class="form-control clockface_1" Width="150px" MaxLength="50" Text='<%# Eval("Time_From") %>'></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <div class="input-icon">
                                                                <i class="fa fa-calendar"></i>
                                                                <asp:TextBox ID="date2" runat="server" Enabled="false"  data-date-format="yyyy/mm/dd" class="form-control form-control-inline input-meduim date-picker" Width="150px" MaxLength="50" Text='<%# Eval("Date_to","{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="time2" runat="server" Enabled="false" class="form-control clockface_1" Width="150px" MaxLength="50" Text='<%# Eval("Time_To") %>'></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: center">
                                                            <% if (Permissions.Contains("AttendanceMonthEdit"))
                                                               { %>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" class="btn default btn-xs black" OnClick="LinkButton1_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton></td>
                                                        <%} %>
                                                        <% if (Permissions.Contains("AttendanceMonthDelete"))
                                                           { %>
                                                        <td>
                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click3" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                        </td>
                                                        <%} %>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmpAttMonthA" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DropDownList3" PropertyName="SelectedValue" Name="Emp_ID" Type="Int32" />
                                                  
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <%} %>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

