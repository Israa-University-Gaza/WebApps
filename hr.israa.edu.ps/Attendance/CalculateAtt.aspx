<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="CalculateAtt.aspx.cs" Inherits="Attendance_CalculateAtt" %>

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
        <li><a href="CalculateAtt.aspx" class="font-ha">احتساب دوام الموظفين</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <% if (Permissions.Contains("AttenadanceCalclation"))
       { %>
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>احتساب دوام الموظفين </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>
            </div>
        </div>
        <div class="portlet-body">
             <div class="form-group row">
                <label class="col-md-2 control-label">نوع الكشف </label>
                <div class="col-md-8">
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="select2_category form-control" AutoPostBack="true">
                        <asp:ListItem Value="1">كشف موظفين رقم 1</asp:ListItem>
                        <asp:ListItem Value="2">كشف موظفين رقم 2</asp:ListItem>
                        <asp:ListItem Value="3">كشف موظفين رقم 3</asp:ListItem>
                                <asp:ListItem Value="4">كشف موظفين الأمن</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                 </div>
            <div class="clearfix"></div>

            <div class="form-group row">
                <label class="col-md-2 control-label">الشهر </label>
                <div class="col-md-3">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" placeholder="اختر الشهر">
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
                           <label class="col-md-2 control-label">السنة </label>
                <div class="col-md-3">
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                </div>
              
            <div class="clearfix"></div>

                <asp:Button ID="Button1" runat="server" Text="احتساب دوام الموظفين" OnClick="Att_Eval" class="btn green col-md-2" />
                <div class="col-md-1"></div>
                <asp:Button ID="Button2" runat="server" Text="طباعة كشف الدوام" Visible="true" OnClick="Button2_Click" class="btn green col-md-2" />
               <div class="col-md-1"></div>
                  <asp:Button ID="Button3" runat="server" Text="كشوفات دوام الموظفين" Visible="false" OnClick="Button3_Click" class="btn green col-md-2" />

                 </div>
        </div>
        <div class="portlet-body">
            <div id="row" runat="server" visible="false">
                <table class="table table-striped table-hover table-bordered" >
                    <thead>
                        <tr>
                            <th>اسم الموظف</th>
                            <th>الرقم الوظيفي</th>
                            <th>عدد أيام الحضور </th>
                            <th>عدد أيام الغياب </th>
                             <th>العطلات الرسمية</th>
                            <th>عدد أيام الاجازة</th>
                            <th>عدد ساعات الحضور  </th>
                            <th>عدد ساعات مهمات العمل</th>
                            <th>عدد ساعات المهمات الخاصة</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <tr>
                                    <asp:Label ID="Emp_ID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("EmployeeNO") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("AttCountDay") %>'></asp:Label>

                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("AbsCountDay") %>'></asp:Label>

                                    </td>
                                     <td>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("HolidayCountDay") %>'></asp:Label>

                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("VacCountDay") %>'></asp:Label>

                                    </td>

                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("AttCountHour") %>'></asp:Label>

                                    </td>

                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("AttCountWExitHour") %>'></asp:Label>

                                    </td>

                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("AttCountExitHour") %>'></asp:Label>

                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                            SelectCommand="AttendanceReportGetAll" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="month" PropertyName="SelectedValue" Type="Int16" />
                                 <asp:ControlParameter ControlID="DropDownList2" Name="EmpCategoryID" PropertyName="SelectedValue" Type="Int16" />
                                <asp:ControlParameter ControlID="TextBox1" Name="Year" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
    <%} %>
</asp:Content>

