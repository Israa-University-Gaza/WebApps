<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="HRVacationsEdit.aspx.cs" Inherits="APP_HRM_HRVacationsEdit" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">  طلبات اجازات الموظفين</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i> طلب اجازة الموظف </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-horizontal">
                        <div class="form-body">
                            <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
                              <asp:Label ID="lblEmpID" runat="server" Text="" Visible="false"></asp:Label>
                             <asp:Label ID="VacStatus" runat="server" Text="" Visible="false"></asp:Label>
                            <div class="form-group">
                            <label class="col-md-2 control-label">اسم الموظف </label>
                                <div class="col-md-4">
                                 <asp:TextBox ID="txtEmployee" runat="server"  CssClass="form-control" Enabled="false"></asp:TextBox>
                                   <asp:DropDownList ID="ddlEmployeeName" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="DisplayName" DataValueField="Emp_ID" Visible="false"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetAllEmployeesName" SelectCommandType="StoredProcedure">
                                 </asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">نوع الاجازة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="VacationTypeID" runat="server" CssClass="select2_category form-control" DataTextField="Vacation_Type" DataValueField="Vacation_Type_ID" DataSourceID="SqlDataSource3"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Vacation_Type_ID,Vacation_Type FROM [Vacation_Type_TB] where IsDelete=0 union select -1,N' ادخل نوع الاجازة ' "></asp:SqlDataSource>
 </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">تاريخ بدء الاجازة </label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="SDate" runat="server" placeholder="ادخل تاريخ بدء الاجازة" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                    </div>
                                </div>
                                <label class="col-md-2 control-label">تاريخ العودة للعمل </label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="FDate" runat="server" OnTextChanged="FDate_TextChanged" AutoPostBack="true" placeholder="ادخل العودة للعمل" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">عدد ايام الاجازة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="VacationCount" placeholder="ادخل عدد ايام الاجازة" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                                 <label class="col-md-2 control-label">مكان قضاء الاجازة  </label>
                                <div class="col-md-4">
                                    <asp:RadioButtonList ID="rblPlace" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">داخل البلاد</asp:ListItem>
                                        <asp:ListItem Value="2">خارج البلاد</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                </div>
                                <div class="form-group">
                                <label class="col-md-2 control-label">سبب  الاجازة</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="Reason" runat="server" placeholder="ادخل سبب  الاجازة" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click"  />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END FORM-->
            </div>
</asp:Content>

