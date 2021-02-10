<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lec.aspx.cs" Inherits="Login" %>

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
  <form runat="server">
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

                                          


                                                    <fieldset class="textbox" style="padding: 10px">

                                                        <asp:TextBox ID="loginId" runat="server" Style="margin-top: 8px" class="form-control input-sm" placeholder="اسم المستخدم"></asp:TextBox>

                                                        <asp:TextBox ID="password" runat="server" Style="margin-top: 8px" TextMode="Password" class="form-control input-sm" placeholder="كلمة المرور"></asp:TextBox>

                                                        <asp:Button ID="commit" runat="server" CssClass="btn btn-success" Style="margin-top: 8px" value="تسجيل الدخول"  Text="تسجيل الدخول" />
                                                    </fieldset>

                                               
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
                    
                          <div class="form-group">
                <label>الكلية </label>

                       <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="True">
            <asp:ListItem Value="9">الإدارة دبلوم</asp:ListItem>
            <asp:ListItem Value="6">العلوم الانسانية</asp:ListItem>
            <asp:ListItem Value="8">العلوم الهندسية</asp:ListItem>
            <asp:ListItem Value="3">المهن الصحية</asp:ListItem>
            <asp:ListItem Value="2">الحقوق</asp:ListItem>
            <asp:ListItem Value="4">كلية العلوم الإدارية والمالية</asp:ListItem>
            <asp:ListItem Value="5">كلية الهندسة</asp:ListItem>
            <asp:ListItem Value="10">كلية نظم المعلومات</asp:ListItem>
            <asp:ListItem Value="11">نظم المعلومات</asp:ListItem>
        </asp:DropDownList>

                
            </div>
                 <div class="col-sm-12 col-md-12">
        <div class="well">
              <h4><span style="font-size: 18px;" class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp; محاضرين الفصل الدراسي  الحالي </h4>
             <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound" >
                                <ItemTemplate>
            <div class="col-sm-3 col-md-3" style="
    height: 142px;
">
            <div class="well">
                <h4><span style="font-size: 14px;" class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server"><%# Eval("instructor") %></asp:HyperLink>
                </h4>
           
 <asp:Label ID="last" runat="server"  Text=<%# Eval("lastLogin") %>></asp:Label>
                <p class="text-justify">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </p>
            </div>
        </div>
                </ItemTemplate>
                            </asp:Repeater>
        </div>
    </div>

                    
   <%-- </form>--%>

    </div>
            <div class="col-sm-2 col-md-2">
            </div>
    </div>
  
    </div>
      </form>
</body>
</html>
