<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lock.aspx.cs" Inherits="Lock" %>

<html lang="en" dir="rtl">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>الخدمات الإلكترونية | تأمين الصفحة</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap/css/bootstrap-rtl.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch-rtl.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="assets/global/css/components-rtl.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="assets/global/css/plugins-rtl.min.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="assets/pages/css/lock-rtl.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <link href="assets/layouts/layout3/css/custom-rtl.css" rel="stylesheet" type="text/css" />
    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<body>
    <form id="form1" runat="server">
        <div class="page-lock">
            <div class="page-body">
                <div class="lock-head">وضع التأمين</div>
                <div class="lock-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                <button class="close" data-close="alert" style="margin-top: 5px;"></button>
                            </div>
                        </div>
                    </div>
                    <div class="pull-left lock-avatar-block">
                        <img id="image" runat="server" src="~/images/logo2.png" class="lock-avatar" alt="" />
                    </div>
                    <div class="lock-form pull-left">
                        <h4>
                            <asp:Label ID="lblEmployeeNo" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblDisplayName1" runat="server" CssClass="font-ha"></asp:Label></h4>
                        <div class="form-group">
                            <asp:TextBox ID="txtPassword" runat="server" autocomplete="off" placeholder="كلمة المرور" class="form-control placeholder-no-fix" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-actions">
                            <asp:Button ID="btnLogin" runat="server" class="btn red" Text="تسجيل الدخول" OnClick="btnLogin_Click" />
                        </div>
                    </div>
                </div>
                <div class="lock-bottom">
                    <asp:LinkButton ID="lbNotLocked" runat="server" OnClick="lbNotLocked_Click">
                        لست
                        <asp:Label ID="lblDisplayName2" runat="server"></asp:Label>
                    </asp:LinkButton>
                </div>
            </div>
            <div class="page-footer-custom"><%= DateTime.Now.Year.ToString() %> &copy; <a href="https://israa.edu.ps" target="_blank">جامعة الإسراء بغزة</a> - دائرة تكنولوجيا المعلومات</div>
        </div>
        <!--[if lt IE 9]>
        <script src="assets/global/plugins/respond.min.js"></script>
        <script src="assets/global/plugins/excanvas.min.js"></script> 
        <!--[endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/pages/scripts/lock.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
    </form>
</body>
</html>
