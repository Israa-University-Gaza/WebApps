<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8" />
    <title>بوابة المحاضر الإلكترونية | تسجيل الدخول</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="assetslogin/skin/default_skin/css/theme.css" />
    <link rel="stylesheet" type="text/css" href="assetslogin/admin-tools/admin-forms/css/admin-forms.css" />
    <link href="assets/layouts/layout3/css/custom-rtl.css" rel="stylesheet" />
</head>
<body class="external-page sb-l-c sb-r-c">

    <!-- Start: Main -->
    <div id="main" class="animated fadeIn">
        <!-- Start: Content -->
        <section id="content_wrapper">
            <!-- begin canvas animation bg -->
            <div id="canvas-wrapper">
                <canvas id="demo-canvas"></canvas>
            </div>
            <!-- Begin: Content -->
            <section id="content">
                <div class="admin-form theme-info" id="login1">
                    <form id="form2" runat="server">
                        <div class="panel panel-info mt10 br-n">
                            <div class="panel-heading heading-border bg-white">
                                <div class="section row mn">
                                    <!-- BEGIN LOGO -->
                                    <div class="page-logo">
                                        <div style="padding: 0 0 0 15px; float: right">
                                            <img src="../images/logo.jpg" class="logo-default" height="70" />
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-8" style="border-right: 1px solid #E3E8EC;">
                                            <span class="font-ha" style="font-size: 17.5px">بوابة المحـاضـر الإلكترونية</span><br />
                                            <span class="font-ha" style="font-size: 18px">Lecturer Web-Portal</span>
                                        </div>
                                        <div class="pull-left">
                                            <i class="fa fa-sign-in fs50 pt15"></i>
                                        </div>
                                    </div>
                                    <!-- END LOGO -->
                                </div>
                            </div>
                            <!-- end .form-header section -->
                            <div class="panel-body bg-light p30">
                                <div class="row">
                                    <div class="col-sm-7 pr30">
                                        <div class="section">
                                            <div id="loginResponse" runat="server" class="alert alert-danger alert-dismissable" clientidmode="Static" visible="false">
                                                <i class="fa fa-remove pr10"></i>
                                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                                <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                                            </div>
                                        </div>
                                        <div class="section">
                                            <label for="username" class="field-label text-muted fs18 mb10 font-ha">الرقم الوظيفي</label>
                                            <label for="username" class="field prepend-icon font-Ta">
                                                <asp:TextBox ID="txtEmployeeNo" runat="server" class="gui-input font-Ta" placeholder="الرجاء إدخال الرقم الوظيفي"></asp:TextBox>
                                                <label for="username" class="field-icon">
                                                    <i class="fa fa-user"></i>
                                                </label>
                                            </label>
                                        </div>
                                        <!-- end section -->
                                        <div class="section">
                                            <label for="username" class="field-label text-muted fs18 mb10 font-ha">كلمة المرور</label>
                                            <label for="password" class="field prepend-icon font-Ta">
                                                <asp:TextBox ID="txtPassword" runat="server" autocomplete="off" class="gui-input font-Ta" placeholder="الرجاء إدخال كلمة المرور" TextMode="Password"></asp:TextBox>
                                                <label for="password" class="field-icon">
                                                    <i class="fa fa-lock"></i>
                                                </label>
                                            </label>
                                        </div>
                                        <div class="section">
                                            <div class="row">
                                                <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                                                    <asp:CheckBox ID="cbRememberMe" runat="server" Text="تذكرني في المرة القادمة" />
                                                </div>
                                                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                                    <asp:Button ID="btnLogin" runat="server" class="button btn-primary pull-left font-ha" Text="تسجيل الدخول" OnClick="btnLogin_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end section -->
                                    </div>
                                    <div class="col-sm-5 br-l br-grey pl30">
                                        <h3 class="mb25 font-ha">خدماتنا الإلكترونية</h3>

                                        <div class="section" style="text-align: left;">
                                            <a class="button btn-social facebook span-left btn-block" href="#">
                                                <span><i class="fa fa-graduation-cap"></i></span>
                                                <label style="padding: 2px; color: #fff">بوابة الطالب الإلكترونية</label>
                                            </a>
                                            <a class="button btn-social twitter span-left btn-block" href="#">
                                                <span><i class="fa fa-user"></i></span>
                                                <label>بوابة المحاضر الإلكترونية</label>
                                            </a>
                                            <a class="button btn-social googleplus span-left btn-block" href="#">
                                                <span><i class="fa fa-book"></i></span>
                                                <label>بوابة الشؤون الأكاديمية</label>
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- end .form-body section -->
                            <div class="panel-footer clearfix p10">
                                <span class="pull-left pr20" style="line-height: 25px;"><%= DateTime.Now.Year.ToString() %> &copy; <a href="https://israa.edu.ps" target="_blank">جامعة الإسراء بغزة</a> - دائرة تكنولوجيا المعلومات</span>
                            </div>
                            <!-- end .form-footer section -->
                        </div>
                    </form>
                </div>
            </section>
            <!-- End: Content -->
        </section>
        <!-- End: Content-Wrapper -->
    </div>
    <!-- End: Main -->
    <!-- BEGIN: PAGE SCRIPTS -->
    <!-- jQuery -->
    <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Page Plugins -->
    <script type="text/javascript" src="assetslogin/js/pages/login/EasePack.min.js"></script>
    <script type="text/javascript" src="assetslogin/js/pages/login/TweenLite.min.js"></script>
    <script type="text/javascript" src="assetslogin/js/pages/login/login.js"></script>
    <!-- Theme Javascript -->
    <script type="text/javascript" src="assetslogin/js/utility/utility.js"></script>
    <script type="text/javascript" src="assetslogin/js/main.js"></script>
    <script type="text/javascript" src="assetslogin/js/demo.js"></script>
    <!-- Page Javascript -->
    <script type="text/javascript">
        jQuery(document).ready(function () {

            "use strict";

            // Init Theme Core
            Core.init();

            // Init CanvasBG and pass target starting location
            CanvasBG.init({
                Loc: {
                    x: window.innerWidth / 2,
                    y: window.innerHeight / 3.3
                },
            });
        });
    </script>
    <!-- END: PAGE SCRIPTS -->
</body>
</html>
