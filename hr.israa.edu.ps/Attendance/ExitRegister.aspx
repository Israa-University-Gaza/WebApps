<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="ExitRegister.aspx.cs" Inherits="Attendance_ExitRegister" %>

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
        <li><a href="ExitRegister.aspx" class="font-ha">تسجيل أذونات الموظفين</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>تسجيل أذونات الموظفين  </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>
            </div>
        </div>
        <div class="portlet-body">
      
        <div class="form-group row">
            <label class="col-md-2 control-label">الشهر </label>
            <div class="col-md-4">
                <asp:DropDownList ID="DDMonth" runat="server" AutoPostBack="true" class="form-control" placeholder="اختر الشهر" CssClass="select2_category form-control">
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
            <div class="col-md-4">
                <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="true" class="form-control" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            </div>
        </div>
        <div class="clearfix"></div>
            <div class="form-group row">
    
                <div class="col-md-4">
                    <asp:Button ID="Button1" runat="server" Text="طباعة تقرير" CssClass="btn green" OnClick="Button1_Click" />
                    <asp:Button ID="AddNewExit" runat="server" Text="اضافة اذن خروج" CssClass="btn green" OnClick="AddNewExit_Click" />
                </div></div>
              <div class="clearfix"></div>
        </div>
        <div class="portlet-body">
             <div class="input-group input-medium">
                            <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btn1Filter_Click" class="btn btn-primary" />

                            </span>
                        </div>
            <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
                <thead>
                    <tr>
                          <th>اسم الموظف</th>
                          <th>الرقم الوظيفي</th>
                        <th>التاريخ</th>
                        <th>وقت الخروج</th>
                        <th>وقت العودة</th>
                        <th>نوع اذن الخروج</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <div id="newdiv" visible="false" runat="server">
                   <tr>
                            <td>
                              
                                <asp:DropDownList ID="DropDownList2" CssClass="select2_category form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged1"  DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="Emp_ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2"  ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetAllEmployeesName" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </td>
                                 <td>
                                     <asp:Label ID="EmployeeNo" runat="server" ></asp:Label>
                                </td>
                                  <td>
                                 <asp:TextBox ID="Date" runat="server" data-date-format="yyyy/mm/dd" class="form-control form-control-inline input-meduim date-picker" Width="150px" MaxLength="50"></asp:TextBox>

                                </td>
                                <td>
                                    <asp:TextBox ID="from" runat="server"  class="form-control clockface_1" Width="150px" MaxLength="50"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="to" runat="server"  class="form-control clockface_1" Width="150px" MaxLength="50"></asp:TextBox>
                                </td>
                                 <td>
                                     <asp:DropDownList ID="DropDownList1" runat="server"  >
                                         <asp:ListItem Value="Ex">خاص</asp:ListItem>
                                         <asp:ListItem Value="WEx">مهمة عمل</asp:ListItem>
                                     </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:LinkButton ID="AddNew" runat="server" class="btn default btn-xs green" OnClick="AddNew_Click"><i class="fa fa-edit"></i> اضافة الإذن</asp:LinkButton></td>
                             
                   </tr>
                        </div>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
                        <ItemTemplate>
                            <tr>
                              
                                 <td>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                         <asp:Label ID="Label4" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Label>
                                </td>
                                 <td>
                                     <asp:Label ID="Label3" runat="server" Text='<%# Eval("EmployeeNo") %>'></asp:Label>
                                </td>
                                  <td>
                                    <asp:Label ID="Exit_Date" runat="server" Text='<%# Eval("Date","{0:yyyy/MM/dd}") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="from" runat="server" Text='<%# Eval("AttExit_From") %>' class="form-control clockface_1" Width="150px" MaxLength="50"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="to" runat="server" Text='<%# Eval("AttExit_To") %>' class="form-control clockface_1" Width="150px" MaxLength="50"></asp:TextBox>
                                </td>
                                 <td>
                                     <asp:DropDownList ID="DropDownList1" runat="server"  SelectedValue='<%# Eval("Notes") %>'  >
                                         <asp:ListItem Value="Ex">خاص</asp:ListItem>
                                         <asp:ListItem Value="WEx">مهمة عمل</asp:ListItem>
                                     </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn default btn-xs green" OnClick="ExitLinkButton1_Click"><i class="fa fa-edit"></i> تعديل الإذن</asp:LinkButton>
                                    <asp:LinkButton ID="ExitDelete" runat="server" class="btn default btn-xs purple" OnClick="ExitDelete_Click"><i class="fa fa-edit" ></i> حذف الإذن</asp:LinkButton></td>

                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                        SelectCommand="AttExitRegister" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         
                            <asp:ControlParameter ControlID="DDMonth" Name="Month" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TextBox1" Name="Year" PropertyName="Text" Type="Int32" />
                               <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
               
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

