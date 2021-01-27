<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="AddTelephone.aspx.cs" Inherits="AddTelephone" %>

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
            $('#Telephone').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">دليل الهاتف</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>اضافة هاتف</span>
            </button>

        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="TelephoneID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>

            
            <asp:Label ID="emp_id" runat="server"  Visible= "false"></asp:Label>
         
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>اضافةهاتف
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>

                    <a href="" class="remove"></a>
                </div>
            </div>


            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group">
                        <asp:Label ID="EmployeeName" runat="server" Text="اختر اسم الموظف" CssClass="col-md-3 cotrol-label"></asp:Label>
                        <div class="col-md-9">
                            <asp:DropDownList ID="DropDownList1" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="DisplayName" DataValueField="Emp_ID" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Emp_ID], [DisplayName] FROM [Employee_TB]  where IsDelete=0 and Emp_ID not in (1,2,3,5) union select 0,N'الكل'"></asp:SqlDataSource>
                        </div>

                    </div>

                    <div class="clearfix"></div>
                    <div class="form-group">
                    </div>
                    <div class="clearfix"></div>

                    <div class="form-group">

                        <asp:Label ID="Label3" runat="server" Text="رقم الهاتف :" CssClass="col-md-3 control-label" ></asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox ID="TelephoneNumber" runat="server" placeholder="ادخل رقم الهاتف" CssClass="form-control"></asp:TextBox>
                        
                    </div>
                    </div>

                    <div class="clearfix"></div>
                    <div class="form-group">
                    </div>
                    <div class="clearfix"></div>

                     <div class="form-group">

                        <asp:Label ID="Active" runat="server" Text="فعال :" CssClass="col-md-3 control-label"></asp:Label>
                        <div class="col-md-9">
                            <asp:CheckBox ID="ActivateBox" runat="server" />
                        </div>
                    </div>
                </div>
                    <div class="clearfix"></div>
                    <div class="form-group">
                    </div>
                  <div class="clearfix"></div>

                        <div class="form-actions fluid">
                    
                         <div class="col-md-12" style="text-align: center;">

                            <asp:Button ID="btnAddTelefon" runat="server"  Text="اضافه" OnClick="btnAddTelefon_Click" CssClass="btn green" />
                        </div>
                    </div>
                        </div>
                </div>
            </div>
</asp:Content>

