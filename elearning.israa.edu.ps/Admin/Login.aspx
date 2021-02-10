<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" type="text/css" href="../temp_files/libStyle.css">
    <script type="text/javascript" lang="javascript" src="../temp_files/jquery.1.11.1.min.js"></script>
<script type="text/javascript" lang="javascript" src="../temp_files/bootstrap.min.js"></script>

    
    <link rel="stylesheet" type="text/css" href="../temp_files/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../temp_files/bootstrap-rtl.css">


    
        

   
    

    <title>جامعة الإسراء - التعليم الإلكتروني
    </title>


</head>
<body>
   <%-- <form runat="server">--%>
        <div id="main" class="container-fluid">
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    

                    <div class="row" style="background-color: #f5f5f5;">
                        <div class="col-sm-1 col-md-1"></div>
                        <div class="col-sm-12 col-md-12 no-padding img-respon">
                            <div id="hdrLogo">
                                <div id="qouLogo" style="padding-right:20px">
                                    <img class="" style="width: 104px; padding-top: 13px;" src="http://jobs.israa.edu.ps/Sofouf_files/img/logo.png">
                                </div>
                                <div id="qouTitle">
                                 <%--   <h3 class="label-logo" style="padding-right: 20px; padding-bottom: 45px;">جامعة الإسراء </h3>--%>
                                </div>
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
                                        <li class=""><a  href="http://www.israa.edu.ps/">صفحة الجامعة</a></li>
                                        
                                        <li><a  href="Ads.aspx">لوحة الإعلانات </a></li>
                                        <li><a href="Contact.aspx">اتصل بنا </a></li>
                                    </ul>
                                    <ul class="nav navbar-nav navbar-left  right-border">
                                        <li class="dropdown" id="menu0">
                                            <div class="top-search">
                                                <div class="input-group add-on">
                                                    
                                                </div>
                                            </div>
                                        </li>
                                        <li><a class="english-font" href="#">English </a></li>
                                        <li class="dropdown" id="menu1">
                                            <a class="dropdown-toggle label-default white-ground" data-toggle="dropdown" href="#menu1">تسجيل الدخول
                                            <b class="caret1"></b>
                                            </a>
                                            <div class="dropdown-menu pull-left">

                                                <form runat="server" name="loginForm">


                                                    <fieldset class="textbox" style="padding: 10px">

                                                        <asp:TextBox ID="loginId" runat="server" Style="margin-top: 8px" class="form-control input-sm" placeholder="اسم المستخدم"></asp:TextBox>

                                                        <asp:TextBox ID="password" runat="server" Style="margin-top: 8px" TextMode="Password" class="form-control input-sm" placeholder="كلمة المرور"></asp:TextBox>

                                                        <asp:Button ID="commit" runat="server" CssClass="btn btn-success" Style="margin-top: 8px" value="تسجيل الدخول" OnClick="Button1_Click" Text="تسجيل الدخول" />
                                                    </fieldset>

                                                </form>
                                                <script type="text/javascript" lang="JavaScript">
  <!--
  var focusControl = document.forms["loginForm"].elements["loginId"];

  if (focusControl.type != "hidden" && !focusControl.disabled) {
     focusControl.focus();
  }
  // -->
</script>
                                                <script>
    (function($){
    	$(document).ready(function(){
    		$('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
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
                <div class="col-sm-2 col-md-2">&nbsp;</div>

                <div class="col-sm-8 col-md-8">
                    

                 

                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="well">
                                <div class="alert alert-danger " runat="server" id="log">
                                    <strong>خطأ في عملية المصادقة</strong>
                                    <div>
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>.
                                    </div>



                                </div>
                                <div runat="server" id="no" align="center" class="alert alert-danger text-justify" role="alert"><br><br>
<div class="row">
<div class="col-sm-1 col-md-1">&nbsp;</div>
<div class="col-sm-8 col-md-8">
<b> <font color="red">عذراً يجب تسجيل مواد للفصل الدراسي الثاني لتنفيذ هذا الاجراء.</font><br>
<br>إذا كان لديك أي سؤال حول هذا الموضوع، يرجى الاتصال على مسؤول النظام</b>
<br><br>

</div>
<div class="col-sm-2 col-md-2">
<img class="img-responsive center-block" src="assets/noPermission.png">
</div>
<div class="col-sm-1 col-md-1">&nbsp;</div>
</div>
<br><br>
<div class="br"></div>
</div>
                                <div  style="background-color: #ffe9dc;border-color: #31708f;padding: 15px;
    margin-bottom: 20px;
    border: 1px solid ;
    border-radius: 4px;">
                                  
                                         <div style="color: #7c3d18;"> <strong style="color: #7c3d18;">دخول مقيد: </strong>الشؤون الاكاديمية.</div>
                                     <div style="color: #7c3d18;"> <strong style="color: #7c3d18;">دخول مقيد: </strong>دائرة التعليم الإلكتروني.</div>
                                      <div style="color: #7c3d18;"> <strong style="color: #7c3d18;">دخول مقيد: </strong>عمداء الكليات.</div>
                                        </div>
                                
                              <%--  <img src="temp_files/into.jpg" />--%>
                            </div>
                        </div>
                    </div>
   <%-- </form>--%>

    </div>
            <div class="col-sm-2 col-md-2">
            </div>
    </div>
  
    
</body>
</html>
