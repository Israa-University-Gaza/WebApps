<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="AdoptEmpAttendance.aspx.cs" Inherits="Attendance_AdoptEmpAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="AdoptEmpAttendance.aspx" class="font-ha">كشف الدوام الشهري للموظف</a></li>
    </ul>
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <% if (Permissions.Contains("MonthAttendanceManagerView"))
       { %>
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>اعتماد كشف الداوم الشهري للموظف </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>
                <%--      <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>--%>
            </div>
        </div>
        <div class="portlet-body">
            <% if (Permissions.Contains("MonthAttendanceManagerCheck"))
               { %>
            <div class="form-group row">
                <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="DropDownList8" AutoPostBack="true" OnSelectedIndexChanged="DropDownList8_SelectedIndexChanged" class="form-control" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>
                </div>
                <label class="col-md-1 control-label">الشهر </label>
                <div class="col-md-2">
                    <asp:DropDownList ID="DropDownList1" CssClass="select2_category form-control" placeholder="اختر الشهر" runat="server" AutoPostBack="true" class="form-control">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="1">يناير</asp:ListItem>
                        <asp:ListItem Value="2">فبراير</asp:ListItem>
                        <asp:ListItem Value="3">مارس</asp:ListItem>
                        <asp:ListItem Value="4">ابريل</asp:ListItem>
                        <asp:ListItem Value="5">مايو</asp:ListItem>
                        <asp:ListItem Value="6">يونيو</asp:ListItem>
                        <asp:ListItem Value="7">يوليو</asp:ListItem>
                        <asp:ListItem Value="8">أغسطس</asp:ListItem>
                        <asp:ListItem Value="9">سبتمبر</asp:ListItem>
                        <asp:ListItem Value="10">أكتوبر</asp:ListItem>
                        <asp:ListItem Value="11">نوفمبر</asp:ListItem>
                        <asp:ListItem Value="12">ديسمبر</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <label class="col-md-1 control-label">السنة </label>
                <div class="col-md-2"style="padding-left:0px;">
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" AutoPostBack="true"></asp:TextBox>
                </div>
            </div>
            <%} %>
            <div class="clearfix"></div>
            <div class="row">
                <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
                    <thead>
                        <tr>
                            <th>التاريخ</th>
                            <th>وقت الحضور</th>
                            <th>وقت الانصراف</th>
                            <th>ملاحظات</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <tr>
                                    <asp:Label ID="Attendance_ID" runat="server" Text='<%# Eval("Attendance_ID") %>' Visible="false"></asp:Label>
                                    <td>
                                        <div class="input-icon">
                                            <i class="fa fa-calendar"></i>
                                            <asp:Label ID="DayID" runat="server" Text='<%# Eval("Day_ID") %>' Visible="false"></asp:Label>
                                            <asp:TextBox ID="date" runat="server" Enabled="false" class="form-control form-control-inline input-meduim date-picker" Width="150px" MaxLength="50" Text='<%# Eval("Date","{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="from" runat="server" class="form-control clockface_1" Width="150px" MaxLength="50" Text='<%# Eval("Attendance_From") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="to" runat="server" class="form-control clockface_1" Width="150px" MaxLength="50" Text='<%# Eval("Attendance_To") %>'></asp:TextBox>
                                    </td>
                                    <% if (Permissions.Contains("MonthAttendanceManagerEdit"))
                                       { %>
                                    <td style="text-align: center">
                                        <asp:LinkButton ID="lbEdit" runat="server" OnClick="lbEdit_Click" class="btn default btn-xs black"><i class="fa fa-edit"></i> تحرير</asp:LinkButton></td>
                                    <%} %>
                                    <% if (Permissions.Contains("MonthAttendanceManagerAdopt"))
                                       { %>
                                    <td>
                                        <asp:LinkButton ID="lbAdopt" runat="server" class="btn default btn-xs green" OnClick="lbAdopt_Click" OnClientClick="return confirm('هل انت متاكد من اعتماد البيانات؟')"><i class="fa fa-trash-o"></i> اعتماد</a></asp:LinkButton>
                                    </td>
                                    <%} %>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                            SelectCommand="SELECT * FROM [Attendance_TB] WHERE ([Emp_ID] = @Emp_ID)  AND (DATEPART(yyyy, [Attendance_TB].[Date]) = @Year) 
		AND (DATEPART(MM, [Attendance_TB].[Date]) = @Month) And IsAccredited=0; ">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList8" Name="Emp_ID" Type="Int32" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="Year" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Month" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
            </div>
            <div class="form-group">
                <div class="col-md-4">
                    <asp:Button ID="Button1" runat="server" Text="اعتماد الكل" class="btn green" />
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <%} %>
</asp:Content>

