<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Det.aspx.cs" Inherits="Det" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>جامعة الإسراء</title>

    <meta content="MSHTML 6.00.2600.0" name="GENERATOR">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    <script src="temp_files/Yk0I1VxupvpzTE1_hqjOdWDAqC8.js"></script>
    <script type="text/javascript" async="" src="temp_files/js"></script>
    <link rel="stylesheet" type="text/css" href="temp_files/bootstrap.min1.css">
    <link rel="stylesheet" type="text/css" href="temp_files/bootstrap-rtl.css">
    <script type="text/javascript" language="javascript" src="temp_files/ajaxMethods.js"></script>
    <!--<script type="text/javascript" async="" src="temp_files/in.php"></script>-->
    <script type="text/javascript" language="javascript" src="temp_files/jquery.1.11.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="temp_files/bootstrap.min.js"></script>
    <script type="text/javascript" language="javascript" src="temp_files/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript" src="temp_files/dataTables.bootstrap.js"></script>
    <script type="text/javascript" language="javascript" src="temp_files/jquery.bootstrap.newsbox.min.js"></script>

    <link rel="stylesheet" type="text/css" href="temp_files/bootstrap-datepicker.css">
    <script type="text/javascript" language="javascript" src="temp_files/bootstrap-datepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="temp_files/qouNewStyle.css">
    <script type="text/javascript" language="javascript" src="temp_files/commonsQou.js"></script>
    <link rel="stylesheet" type="text/css" href="temp_files/sidemenu.css">
    <script type="text/javascript" language="javascript" src="temp_files/SideMenu.js"></script>
    <script type="text/javascript" language="javascript" src="temp_files/tapclick.js"></script>
</head>
<body topmargin="0" class="">
    <script>
        $(document).ready(function () {

            $(function () {

                if ($('#ftr').hasScrollBar())
                    $("#ftr").removeClass("navbar-fixed-bottom")
                else
                    $("#ftr").addClass("navbar-fixed-bottom")
            });

            (function ($) {
                $.fn.hasScrollBar = function () {
                    var db = document.body;
                    var dde = document.documentElement;
                    var docHeight = Math.max(db.scrollHeight, dde.scrollHeight, db.offsetHeight, dde.offsetHeight, db.clientHeight, dde.clientHeight)
                    return (docHeight !== document.documentElement.clientHeight);
                }
            })(jQuery);

        });

    </script>
    <style>
        body {
            background-image: url('https://ar.israa.edu.ps/uploads/images/2019/09/N6M9i.jpeg');
            background-repeat: no-repeat;
            background-size: 100%;
            background-size: cover;
        }

        html, body {
            min-height: 100%;
        }
    </style>
    <form runat="server">
    <div id="main" class="container-fluid">
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <script>
                    function makeArray() {
                        for (i = 0; i < makeArray.arguments.length; i++)
                            this[i] = makeArray.arguments[i];
                    }

                    function getFullYear(d) {
                        var y = d.getYear();
                        if (y < 1000) { y += 1900 };
                        return y;
                    }


                    //var zone = "EDT";
                    var days = new makeArray("&#1575;&#1604;&#1575;&#1581;&#1583;", "&#1575;&#1604;&#1575;&#1579;&#1606;&#1610;&#1606;", "&#1575;&#1604;&#1579;&#1604;&#1575;&#1579;&#1575;&#1569;", "&#1575;&#1604;&#1575;&#1585;&#1576;&#1593;&#1575;&#1569;", "&#1575;&#1604;&#1582;&#1605;&#1610;&#1587;", "&#1575;&#1604;&#1580;&#1605;&#1593;&#1577;", "&#1575;&#1604;&#1587;&#1576;&#1578;");
                    var months = new makeArray("يناير", "فبراير", "مارس", "ابريل", "مايو", "يونيو", "يوليو", "أغسطس", "سبتمبر", "أكتوبر", "نوفمبر", "ديسمبر");

                    function format_time(t) {

                        var Day = t.getDay();
                        var Date = t.getDate();
                        var Month = t.getMonth();
                        var Year = t.getFullYear();

                        timeString = "";
                        timeString += days[Day];
                        timeString += "/ ";
                        timeString += " ";
                        timeString += Date;
                        timeString += " ";
                        timeString += months[Month];
                        timeString += "/ ";
                        timeString += " ";
                        timeString += Year;

                        return timeString;
                    }
                </script>
                <div class="row panel-header">
                    <div class="col-sm-1 col-md-1"></div>
                    <div class="col-sm-10 col-md-10">
                        <div id="hdrLogo" class="visible-xs hidden-lg hidden-md hidden-sm panel-header">
                            <div id="qouLogo">
                                <img class="qouLogoNew" src="http://jobs.israa.edu.ps/Sofouf_files/img/logo.png">
                                <span class="label-logo">&nbsp;</span>
                            </div>
                        </div>
                        <div class="hidden-xs visible-lg visible-md visible-sm paddingRight13">
                            <img id="logo" class="pull-right qouLogoNew" src="http://jobs.israa.edu.ps/Sofouf_files/img/logo.png" border="0" alt="شعار جامعة القدس المفتوحة" title="شعار جامعة القدس المفتوحة" style="vertical-align: middle;">
                            <div id="" class="pull-right col-md-5 col-sm-5 col-md-5 col-xs-6 paddingTop10">
                                <span class="label-logo">جامعة الإســراء</span>
                                <br>
                                <span class="label-logo-small">دائرة التعليم الإلكتروني</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-1 col-md-1"></div>
                </div>
                <nav id="scroller" class="navbar navbar-default bgColorBar navHeight  noprint" role="navigation">
                    <div class="row">
                        <div class="col-sm-1 col-md-1"></div>
                        <div class="col-sm-10 col-md-10">
                            <div class="navbar-header text-left">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#slidemenu">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="collapse navbar-collapse" id="slidemenu">
                                <ul id="myUl" class="nav navbar-nav  white-ground">
                                    <li>
                                        <a href="Default.aspx">الصفحة الرئيسية</a>
                                    </li>
                                    <li>
                                        <a href="https://israa.edu.ps/">صفحة الجامعة</a>
                                    </li>
                                    <li>
                                        <a href="Contact.aspx">اتصل بنا</a>
                                    </li>
                                </ul>
                                <ul class="nav navbar-nav navbar-left  right-border">
                                    <li class="dropdown" id="menu1">
                                        <a href="#">
                                            <div align="left">
                                                <script lang="JavaScript">
                                    <!--
    d = new Date();
    document.write(format_time(d));
    // -->
                                                </script>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-1 col-md-1"></div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="">
            <div class="col-sm-12 col-md-12 ">
                <script>
              

              


               



                    $(function () {
                        $(".demo").bootstrapNews({
                            newsPerPage: 11,
                            navigation: true,
                            autoplay: true,
                            direction: 'up', // up or down
                            animationSpeed: 'normal',
                            newsTickerInterval: 3000, //4 secs
                            pauseOnHover: true,
                            onStop: null,
                            onPause: null,
                            onReset: null,
                            onPrev: null,
                            onNext: null,
                            onToDo: null,
                            urlAll: '#'
                        });
                    });

                </script>
                <link rel="stylesheet" type="text/css" href="temp_files/font-awesome.css">
                <link rel="stylesheet" type="text/css" href="temp_files/special-icons.css">
                <div class="">
                    <div class="col-sm-1 col-md-1 "></div>

                </div>
                <%--                for non mobile--%>
                <div class="col-sm-2 col-md-1 visible-lg visible-md hidden-sm hidden-xs ">
                </div>
                <div class="col-sm-4 col-md-8 visible-lg visible-md hidden-sm hidden-xs ">
                    <div class="panelPadding transparent2 ">
                        <div class="br"></div>
                        <div>
                            <div class="panel panel-default transparent">
                                <div class="text-center">
                                   
                                    <h4><strong>&nbsp;&nbsp; <asp:Label ID="title" runat="server" Text="title"></asp:Label> </strong></h4>
                                     <asp:Label ID="dt11" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="br hr_custom "></div>
                                <div class="panel-body"  style="padding: 21px;">
                                    <asp:Label ID="bady2" runat="server" Text="bady"></asp:Label>
                                </div>
                                <div class="panel-footer panel-footer2 ">
                                    <div class="clearfix">
                                        <ul class="pagination pull-left"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="br"></div>
                        
                    </div>
                </div>
                <div class="col-sm-2 col-md-1 visible-lg visible-md hidden-sm hidden-xs ">
                </div>
                <%--                for mobile--%>
                <div class="col-sm-4 col-md-6 visible-sm visible-xs hidden-lg hidden-md transparent2 ">
                    <div class="br"></div>
                    <div>
                        <div class="panel panel-default transparent">
                            <div class="text-center">
                                <h4><strong>  <asp:Label ID="title1" runat="server" Text="title1"></asp:Label> </strong></h4>
                                    <asp:Label ID="dt1" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="br hr_custom "></div>
                            <div class="panel-body" style="padding: 21px;">
                                <div class="row">
                                    <asp:Label ID="bady1" runat="server" Text="bady"></asp:Label>
                                </div>
                            </div>
                            <%--<div class="panel-footer panel-footer2 "> <ul class="pagination pull-right" style="margin: 0px;"><li><button href="#" class="prev btn btn-default"><span class="glyphicon glyphicon-chevron-down"></span></button></li><li><button href="#" class="next btn btn-default"><span class="glyphicon glyphicon-chevron-up"></span></button></li></ul><div class="clearfix"><ul class="pagination pull-left"><li><button href="#" class="all btn btn-default"><span class="glyphicon glyphicon-chevron-left"></span></button></li></ul></div></div>--%>
                        </div>
                    </div>
                    <div class="br"></div>
                    
                    <br>
                </div>
                
                <div class="col-sm-1 col-md-1  "></div>
            </div>
            <div class="br"></div>
            
        </div>
    </div>
    <div id="ftr" class="row navbar-fixed-bottom">
        <div class="col-sm-12 col-md-12">
            <br>
            <div class="page-footer defaultFont ">
                <div class="row">
                    <div class="col-sm-1 col-md-1"></div>
                    <div class="col-sm-10 col-md-10 text-center">
                        جامعة الإسراء - غزة
                            ©&nbsp; 2019
                    </div>
                    <div class="col-sm-1 col-md-1"></div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
