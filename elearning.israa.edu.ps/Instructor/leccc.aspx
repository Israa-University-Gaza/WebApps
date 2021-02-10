<%@ Page Language="C#" AutoEventWireup="true" CodeFile="leccc.aspx.cs" Inherits="Instructor_leccc" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script async="" src="../temp_files/analytics.js"></script>
    <script src="../temp_files/Yk0I1VxupvpzTE1_hqjOdWDAqC8.js"></script>
    <script type="text/javascript" async="" src="../temp_files/js"></script>
            
    <link rel="stylesheet" type="text/css" href="../temp_files/libStyle.css">
    <link rel="stylesheet" type="text/css" href="../temp_files/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../temp_files/bootstrap-rtl.css">
  
     
    <script src="../temp_files/ajaxMethods.js" type="text/javascript"></script>
    <script type="text/javascript" lang="javascript" src="../temp_files/jquery.1.11.1.min.js"></script>
    <script type="text/javascript" lang="javascript" src="../temp_files/bootstrap.min.js"></script>
    <script type="text/javascript" lang="javascript" src="../temp_files/jquery.bootstrap.newsbox.min.js"></script>
    <script type="text/javascript" lang="javascript" src="../temp_files/jquery.dataTables.min.js"></script>
    <script type="text/javascript" lang="javascript" src="../temp_files/dataTables.bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="../temp_files/sidemenu.css">
    <script type="text/javascript" lang="javascript" src="../temp_files/SideMenu.js"></script>
    <script type="text/javascript" lang="javascript" src="../temp_files/tapclick.js"></script>
    <script type="text/javascript" lang="javascript" src="../temp_files/goolgeAnalytics.js"></script>
   <%--   <link href="../assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
     <link href="../assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
     <link href="../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
     <link href="../assets/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css" />--%>


    <title>جامعة الإسراء - التعليم الإلكتروني
    </title>
    
       
  
</head>
<body>
    
    <div id="main" class="container-fluid">
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <script type="text/javascript">
                    $(function () {
                        $("#loginId").attr("placeholder", "اسم المستخدم");
                        $("#password").attr("placeholder", "كلمة المرور");

                    });

                   
                     //put nav in top when srolling
                        $(function() {
                            var nav = $('#scroller');
                            var navHomeY = nav.offset().top;
                            var isFixed = false;
                            var $w = $(window);
                            $w.scroll(function() {
                                var scrollTop = $w.scrollTop();
                                var shouldBeFixed = scrollTop > navHomeY;
                                if (shouldBeFixed && !isFixed) {
                                    nav.removeClass("navbar-static-top")
                                    nav.addClass("navbar-fixed-top")
                    
                                    isFixed = true;
                                }
                                else if (!shouldBeFixed && isFixed)
                                {
                                    nav.removeClass("navbar-fixed-top")
                                    nav.addClass("navbar-static-top")
                                    isFixed = false;
                                }
                            });
                        });
                    $(document).ready(function () {
                        $('#scroller.navbar .container').append($('<div id="navbar-height-col"></div>'));
                        var toggler = '.navbar-toggle';
                        var pagewrapper = '#page-content';
                        var navigationwrapper = '.navbar-header';
                        var menuwidth = '100%'; // the menu inside the slide menu itself
                        var slidewidth = '80%';
                        var menuneg = '-100%';
                        var slideneg = '-80%';
                        $("#scroller").on("click", toggler, function (e) {
                            var selected = $(this).hasClass('slide-active');
                            $('#slidemenu').stop().animate({
                                left: selected ? menuneg : '0px'
                            });
                            $('#navbar-height-col').stop().animate({
                                left: selected ? slideneg : '0px'
                            });
                            $(pagewrapper).stop().animate({
                                left: selected ? '0px' : slidewidth
                            });
                            $(navigationwrapper).stop().animate({
                                left: selected ? '0px' : slidewidth
                            });
                            $(this).toggleClass('slide-active', !selected);
                            $('#slidemenu').toggleClass('slide-active');
                            $('#page-content, .navbar, body, .navbar-header').toggleClass('slide-active');
                        });
                        var selected = '#slidemenu, #page-content, body, .navbar, .navbar-header';
                        $(window).on("resize", function () {
                            if ($(window).width() > 767 && $('.navbar-toggle').is(':hidden')) {
                                $(selected).removeClass('slide-active');
                            }
                        });
                    });

                </script>
                
                <div class="row" style="background-color: #f5f5f5;">
                    <div class="col-sm-1 col-md-1"></div>
                      <div class="col-sm-12 col-md-12 no-padding img-respon">
                            <div id="hdrLogo">
                                <div id="qouLogo" style="padding-right:20px">
                                <img class="" style="width: 104px; padding-top: 13px;" src="http://jobs.israa.edu.ps/Sofouf_files/img/logo.png"></div>
                          <%--  <div id="qouTitle">
                                <h3 class="label-logo" style="padding-right: 20px; padding-bottom: 45px;">جامعة الإسراء </h3>
                            </div>--%>
                          <%--  <div id="qouDash">
                                <h3 class="label-logo">−</h3>
                            </div>--%>
                              <div id="libTitle" style="padding-right:10px">
                                <h3 class="label-logo">التعليم الإلكتروني</h3>
                            </div>
                            <div id="empty"></div>
                        </div>
                    </div>
                    <div class="col-sm-1 col-md-1"></div>
                </div>
                <nav id="scroller" class="navbar navbar-default bgColorBar navHeight" role="navigation">
                    <div class="row">
                        <div class="col-lg-1 col-md-1"></div>
                        <div class="col-lg-10 col-md-10">
                            <div class="navbar-header text-left">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#slidemenu">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand label-default" href="Default.aspx"><span class="glyphiconBtn glyphicon-home" aria-hidden="true"></span></a>
                            </div>
                            <div class="collapse navbar-collapse" id="slidemenu">
                                <ul id="myUl" class="nav navbar-nav  right-border">
                                    <li class=""><a target="_blank" href="http://www.israa.edu.ps/">صفحة الجامعة</a></li>
                                    <li class=""><a href="Default.aspx">المصادر</a></li>
                                    <li class=""><a href="Std.aspx">طلاب الشعب</a></li>
                                    <li><a href="../Ads.aspx">لوحة الإعلانات </a></li>
                                    <li><a href="../Contact.aspx">اتصل بنا </a></li>
                                </ul>
                               <%-- اخر تسجيل الدخول : <asp:Label ID="Label2" runat="server" ForeColor="#009933" Font-Names="Tahoma"></asp:Label>--%>
                                <ul class="nav navbar-nav navbar-left  right-border">
                                    <li class="dropdown" id="menu0">
                                        <div class="top-search">
                                            <div class="input-group add-on">
                                                <%--<form method="get" id="searchbox_008887245908611241414:owmfdkaihwy" target="_blank" action="">
                                                    <input value="008887245908611241414:owmfdkaihwy" name="cx" type="hidden">
                                                    <input value="FORID:11" name="cof" type="hidden">
                                                    <input type="text" placeholder="البحث في الموقع" name="s" id="s" class="form-control input-sm" style="width: 70%">
                                                    <div class="input-group-btn">
                                                        <button type="submit" id="searchsubmit" class="btn btn-success">
                                                            <i class="glyphiconBtn glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </form>--%>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a class="english-font" href="#">English </a></li>
                                    <li class="dropdown" id="menu1">
                                        <a class="dropdown-toggle label-default white-ground" data-toggle="dropdown" href="#"><asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                            <b class="caret1"></b>
                                        </a>
                                        <div class="dropdown-menu pull-left">
                                            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Logout.aspx" runat="server">تسجيل خروج</asp:HyperLink>
                                             <div>
    اخر تسجيل الدخول : <asp:Label ID="Label2" runat="server" ForeColor="#009933" Font-Names="Tahoma"></asp:Label>
                                            </div>
                              <%--              <div style="margin: 0; padding: 0; display: inline">
                                                <input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="4L/A2ZMYkhTD3IiNDMTuB/fhPRvyCNGEsaZocUUpw40=">
                                            </div>
                                            <fieldset class="textbox" style="padding: 10px">
                                                <input type="text" name="loginId" value="" id="loginId" style="margin-top: 8px" class="form-control input-sm" placeholder="اسم المستخدم">
                                                <input type="password" name="password" value="" id="password" style="margin-top: 8px" class="form-control input-sm" placeholder="كلمة المرور">
                                                <input class="btn btn-success" name="commit" type="submit" style="margin-top: 8px" value="تسجيل الدخول">
                                            </fieldset>

                                            <script type="text/javascript" lang="JavaScript">
  <!--
    var focusControl = document.forms["loginForm"].elements["loginId"];

    if (focusControl.type != "hidden" && !focusControl.disabled) {
        focusControl.focus();
    }
    // -->
                                            </script>--%>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-1 col-md-1"></div>
                    </div>
                </nav>
            </div>
        </div>
         
        <div class="row">
            <div class="col-sm-1 col-md-1">&nbsp;</div>
            <div class="col-sm-3 col-md-2">
                <script>
                    (function ($) {
                        $(document).ready(function () {
                            $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function (event) {
                                event.preventDefault();
                                event.stopPropagation();
                                $(this).parent().siblings().removeClass('open');
                                $(this).parent().toggleClass('open');
                            });

                            $('#scroller1.navbar .container').append($('<div id="navbar-height-col"></div>'));
                            var toggler = '.navbar-toggle';
                            var pagewrapper = '#page-content';
                            var navigationwrapper = '.navbar-header';
                            var menuwidth = '100%'; // the menu inside the slide menu itself
                            var slidewidth = '80%';
                            var menuneg = '-100%';
                            var slideneg = '-80%';
                            $("#scroller1").on("click", toggler, function (e) {
                                var selected = $(this).hasClass('slide-active');
                                $('#slidemenu1').stop().animate({
                                    left: selected ? menuneg : '0px'
                                });
                                $('#navbar-height-col').stop().animate({
                                    left: selected ? slideneg : '0px'
                                });
                                $(pagewrapper).stop().animate({
                                    left: selected ? '0px' : slidewidth
                                });
                                $(navigationwrapper).stop().animate({
                                    left: selected ? '0px' : slidewidth
                                });
                                $(this).toggleClass('slide-active', !selected);
                                $('#slidemenu1').toggleClass('slide-active');
                                $('#page-content, .navbar, body, .navbar-header').toggleClass('slide-active');
                            });
                            var selected = '#slidemenu1, #page-content, body, .navbar, .navbar-header';
                            $(window).on("resize", function () {
                                if ($(window).width() > 767 && $('.navbar-toggle').is(':hidden')) {
                                    $(selected).removeClass('slide-active');
                                }
                            });
                        });
                    })(jQuery);
                </script>
                <nav id="scroller1" class="navbar navbar-default bgColorBar sidebar" role="navigation">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" style="margin-left: 30px" data-toggle="collapse" data-target="#slidemenu1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse" id="slidemenu1">
                            <ul class="nav navbar-nav">
                                   <asp:Repeater ID="Repeater" runat="server">
                                <ItemTemplate>
                                       <li> <a  href='<%# "Crs.aspx?crs="+Eval("courseCode")+"&section="+Eval("sectionNum") %>'><span style="font-size: 15px;" class="glyphicon glyphicon-home"></span>&nbsp;<%# Eval("courseArName") %> <span style="color:red"> <%# Eval("sectionNum") %></span>  </a></li>
                                   

                                      </ItemTemplate>
                            </asp:Repeater>
                                 <li runat="server" id="admin"><a href="lecc.aspx"><span style="font-size: 15px;" class="glyphicon glyphicon-education"></span>&nbsp;&nbsp; التحكم بالمحاضرين</a></li>
                               <%-- <li><a href="Default.aspx"><span style="font-size: 15px;" class="glyphicon glyphicon-home"></span>&nbsp;الرئيسية </a></li>
                                <li><a href="Conf.aspx"><span style="font-size: 15px;" class="glyphicon glyphicon-education"></span>&nbsp;&nbsp; المؤتمرات</a></li>
                                <li><a href="Researches.aspx"><span style="font-size: 15px;" class="glyphicon glyphicon-briefcase"></span>&nbsp;&nbsp;الأبحاث العلمية </a></li>
                                <li><a href="Projects.aspx"><span style="font-size: 15px;" class="glyphicon glyphicon-globe"></span>&nbsp;&nbsp;مشاريع </a></li>
                                <li><a href="Workshop.aspx"><span style="font-size: 15px;" class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;ورش عمل </a></li>
                                <li><a href="Act.aspx"><span style="font-size: 15px;" class="glyphicon glyphicon-fullscreen"></span>&nbsp;&nbsp; انشطة مجتمعية</a></li>
                                <li><a href="Books.aspx"><span style="font-size: 15px;" class="glyphicon glyphicon-book"></span>&nbsp;&nbsp; كتب</a></li>
                                <li><a href="videos.aspx"><span style="font-size: 15px;" class="glyphicon glyphicon-facetime-video"></span>&nbsp;&nbsp;فيديو</a></li>
                                <li><a href="Score.aspx"><span style="font-size: 15px;" class="glyphicon glyphicon-signal"></span>&nbsp;&nbsp;الإحصائيات</a></li>--%>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            
                
            <div class="col-sm-7 col-md-8">
                <script type="text/javascript">
                    $(function () {
                        $(".demo").bootstrapNews({
                            newsPerPage: 5,
                            navigation: true,
                            autoplay: true,
                            direction: 'up', // up or down
                            animationSpeed: 'normal',
                            newsTickerInterval: 2000, //4 secs
                            pauseOnHover: true,
                            onStop: null,
                            onPause: null,
                            onReset: null,
                            onPrev: null,
                            onNext: null,
                            onToDo: null,
                            urlAll: 'google.com'
                          
                        });
                        $(".demo1").bootstrapNews({
                            newsPerPage: 4,
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
               

                    <div class="row">
                        <div class="col-12">
                           
                                <%--<h4><span style="font-size:18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;عزيزي الزائر ! </h4>
                            <p class="text-justify">
                                اهلا وسهلا بك
                            </p>--%>
<form id="form1" runat="server">
                                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="emp_id" HeaderText="emp_id" SortExpression="emp_id" />
            <asp:BoundField DataField="path" HeaderText="path" SortExpression="path" />
            <asp:BoundField DataField="dt" HeaderText="dt" SortExpression="dt" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [e_Errors]"></asp:SqlDataSource>
</form>
                          
                        </div>
                    </div>

             
                
            </div>
        </div>
    
        
    </div>
  
            
   
     <script src="../assets/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
    
           
      
        <script src="../assets/global/plugins/morris/morris.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/horizontal-timeline/horizontal-timeline.js" type="text/javascript"></script>
        <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
         <script src="../assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
    <script>
                    function openDetailsWindow(serNo, typ) {
                        //var broswerName = new String(navigator.appName);

                        //if (broswerName.indexOf("Microsoft") >= 0)
                        //{
                        //    var win = window.open('qlbBookDetails.do?.rv=9WYhKFFcxJzJ35j&serNo=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=520');
                        //}
                        //else if (broswerName.indexOf("Netscape") >= 0)
                        //{
                        //    var win = window.open('qlbBookDetails.do?.rv=TkEeMU529TKa&serNo=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=520');
                        //}
                        if (typ == "1") {
                            var win = window.open('ViewAnswer.aspx?id=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=520');
                        }
                        else if (typ == "2") {
                            var win = window.open('ConfDet.aspx?No=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=520');
                        }
                        else if (typ == "3") {
                            var win = window.open('ProjectsDet.aspx?No=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=520');
                        }
                        else if (typ == "4") {
                            var win = window.open('ResearchesDet.aspx?No=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=520');
                        }
                        else if (typ == "5") {
                            var win = window.open('WorkshopDet.aspx?No=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=520');
                        }
                        else if (typ == "6") {
                            var win = window.open('ActDet.aspx?No=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=520');

                        }
                        else if (typ == "7") {
                            var win = window.open('VideoDet.aspx?No=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=520');

                        }
                    }
                    $(document).ready(function () {
                        $('#example').dataTable(); setColumnLabel('example');
                    });
                </script>
    <script>
        function openDetailsWindow1(empNo) {
            var win = window.open('lec_display.aspx?emp=' + empNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=1200,height=520');

                        
                        }
                    
                    $(document).ready(function () {
                        $('#example').dataTable(); setColumnLabel('example');
                    });
                </script>
               

</body>
</html>
