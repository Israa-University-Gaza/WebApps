<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html lang="ar" class="no-js">
<head>
    <meta charset="utf-8" />
    <title>الشؤون الأكاديمية | تسجيل الدخول</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <meta name="MobileOptimized" content="320">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/bootstrap/css/bootstrap-rtl.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2_metro_rtl.css" />
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME STYLES -->

    <link href="assets/css/style-metronic-rtl.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/style-rtl.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/style-responsive-rtl.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins-rtl.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/themes/default-rtl.css" rel="stylesheet" type="text/css" id="style_color" />
    <link href="assets/css/pages/login-soft-rtl.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/custom-rtl.css" rel="stylesheet" type="text/css" />

    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
    <style>
        @font-face {
            font-family: "hasanin";
            font-style: normal;
            font-weight: normal;
            src: local("☺"), url("assets/fonts/hasanin.woff") format("woff"), url("assets/fonts/hasanin.ttf") format("truetype"), url("assets/fonts/hasanin.svg") format("svg");
        }

        .font-ha {
            font-family: hasanin !important;
            text-decoration: none !important;
        }

        .isra-colorf {
            color: #fff !important;
        }

        .isra-error {
            border-color: #ee7f6d !important;
        }
    </style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
    <!-- BEGIN LOGO -->
    <div class="logo">
        <div style="width: 350px; margin: auto; margin-bottom: 10px;">
        </div>
    </div>
    <!-- END LOGO -->
    <!-- BEGIN LOGIN -->
    <form id="form2" runat="server">
        <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <div class="">
                <div style="width: 350px; margin: auto; margin-bottom: 10px;">
                    <img src="images/logo.png" width="65" height="85" class="col-md-4" />
                    <h3 class="form-title font-ha isra-colorf col-md-8" style="font-size: 20px!important; margin-bottom: 0px; padding-right: 0px;">جـــامـعــــــــة الإســـــــراء</h3>
                    <h3 class="form-title font-ha isra-colorf col-md-8" style="font-size: 18px; letter-spacing: 0.7px; margin-bottom: 0px; margin-top: 10px; padding-right: 0px;">ISRAA UNIVERSITY</h3>
                </div>
            </div>
            <div style="clear: both"></div>

            <h3 class="form-title font-ha" style="text-align: center">الشؤون الأكاديمية</h3>

            <div id="loginResponse" runat="server" class="alert alert-danger" ClientIDMode="Static" visible="false">
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                <button class="close" data-close="alert"></button>
            </div>
            <div class="form-group">
                <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                <label class="control-label visible-ie8 visible-ie9">الرقم الوظيفي</label>
                <div class="input-icon">
                    <i class="fa fa-user"></i>
                    <asp:TextBox ID="txtEmployeeNo" runat="server" placeholder="الرقم الوظيفي" CssClass="form-control placeholder-no-fix"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label visible-ie8 visible-ie9">كلمة المرور</label>
                <div class="input-icon">
                    <i class="fa fa-lock"></i>
                    <asp:TextBox ID="txtPassword" runat="server" autocomplete="off" placeholder="كلمة المرور" class="form-control placeholder-no-fix" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="form-actions">
                <asp:Button ID="btnLogin" runat="server" class="btn blue pull-right" Text="دخول" OnClick="btnLogin_Click" />
            </div>
        </div>
    </form>
    <!-- END LOGIN -->
    <!-- BEGIN COPYRIGHT -->
    <div class="copyright">
        2014 &copy; جامعة الاسراء
    </div>
    <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
    <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
    <script src="assets/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="assets/scripts/app.js" type="text/javascript"></script>
    <script src="assets/scripts/login-soft.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <script>
        jQuery(document).ready(function () {
            App.init();
            Login.init();
        });
    </script>
    <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
