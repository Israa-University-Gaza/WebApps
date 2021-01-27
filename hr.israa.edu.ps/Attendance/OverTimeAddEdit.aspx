<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="OverTimeAddEdit.aspx.cs" Inherits="Attendance_OverTimeAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ExitRegister.aspx" class="font-ha">تسجيل  ساعات الدوام الاضافية</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <% if (Permissions.Contains("WorkOverTimeAddEdit"))
           { %>
       <div class="col-md-12">
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>تسجيل ساعات الدوام الاضافية  </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>
            </div>
        </div>
        <div class="portlet-body">
      
        <div class="form-group row">
            <label class="col-md-2 control-label">الشهر </label>
            <div class="col-md-4">
                <asp:DropDownList ID="DDMonth" runat="server" AutoPostBack="true" class="form-control" placeholder="اختر الشهر" CssClass="select2_category form-control" >
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
              </div>
        <div class="clearfix"></div>
             <div class="form-actions fluid">
                   <div class="col-md-offset-3 col-md-9">
                            <asp:Button ID="AddNewExit" runat="server" Text="اضافة ساعات عمل اضافي" CssClass="btn green" OnClick="AddNewExit_Click" />
               
                   </div>
                 </div>
           </div>
             
          
      <div class="portlet box red">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i> ساعات الدوام الاضافية  </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>
            </div>
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
                        <th>من </th>
                        <th>إلى </th>
                      
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <div id="newdiv" visible="false" runat="server">
                   <tr>
                            <td>
                              
                                <asp:DropDownList ID="DropDownList2" CssClass="select2_category form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged1"  DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="Emp_ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Employee_TB_GetAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
                                    <asp:LinkButton ID="AddNew" runat="server" class="btn default btn-xs green" OnClick="AddNew_Click"><i class="fa fa-edit"></i> اضافة </asp:LinkButton></td>
                             
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
                                    <asp:Label ID="Date" runat="server" Text='<%# Eval("Date","{0:yyyy/MM/dd}") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="from" runat="server" Text='<%# Eval("Time_from") %>' class="form-control clockface_1" Width="150px" MaxLength="50"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="to" runat="server" Text='<%# Eval("Time_to") %>' class="form-control clockface_1" Width="150px" MaxLength="50"></asp:TextBox>
                                </td>
                             
                                <td>
                                    <asp:LinkButton ID="Edit" runat="server" class="btn default btn-xs green" OnClick="Edit_Click" ><i class="fa fa-edit"></i> تعديل </asp:LinkButton>
                                    <asp:LinkButton ID="Delete" runat="server" class="btn default btn-xs purple" OnClick="Delete_Click" ><i class="fa fa-edit" ></i> حذف </asp:LinkButton></td>

                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                        SelectCommand="Work_OverTime_TB_GetByMonth" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         
                            <asp:ControlParameter ControlID="DDMonth" Name="Month" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TextBox1" Name="Year" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtNameFilter" PropertyName="Text" Name="Name" Type="String" DefaultValue="%"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
               
                </tbody>
            </table>
        </div>
          </div>
    </div>
        
        <%} %>
</asp:Content>

