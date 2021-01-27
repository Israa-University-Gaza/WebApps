<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="FromToSearchAtt.aspx.cs" Inherits="Attendance_FromToSearchAtt" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>تقرير الدوام للموظفين الغير خاضعين لجهاز البصمة  </div>
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
               
                </div></div>
              <div class="clearfix"></div>
        </div>
           <div class="portlet-body">
            <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
                <thead>
                    <tr>
                          <th>اسم الموظف</th>
                          <th>الرقم الوظيفي</th>
                        <th>التاريخ</th>
                        <th>وقت الحضور</th>
                        <th>وقت المغادرة</th>
                 
                       
                    </tr>
                </thead>
                <tbody>
             <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
                        <ItemTemplate>
                            <tr>
                              
                                 <td>
                                <%-- <asp:Label ID="Label2" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>--%>
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
                                    <asp:Label ID="from" runat="server" Text='<%# Eval("Attendance_From") %>' ></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="to" runat="server" Text='<%# Eval("Attendance_To") %>' ></asp:Label>
                                </td>
                                
                             
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                        SelectCommand="AttNotFingrPrint" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         
                            <asp:ControlParameter ControlID="DDMonth" Name="Month" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TextBox1" Name="Year" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

