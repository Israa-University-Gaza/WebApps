<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Subscription.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html dir="rtl" lang="ar" xml:lang="ar"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        .content{

        background: url(http://hr.israa.edu.ps/assets/img/bg-white-lock.png) repeat;
    width: 360px;
    margin: 0 auto;
    margin-bottom: 0px;
    padding: 30px;
    padding-top: 20px;
    padding-bottom: 15px;
    border-radius: 5px!important;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="بوابة التوظيف الالكتروني جامعة الاسراء غزة">
    <meta name="author" content="بوابة التوظيف الالكتروني">
    <meta name="keywords" content="بوابة التوظيف الالكتروني">
    <link rel="icon" href="Sofouf_files/img/logo.png">
    <meta property="og:image" content="Sofouf_files/img/logo.png">
    
    <!-- Google / Search Engine Tags -->
    <meta itemprop="name" content="Sofouf|صفوف">
    <meta itemprop="description" content="بوابة التوظيف الالكتروني">
    <meta itemprop="image" content="ofouf_files/img/logo.png">


    <meta property="og:url" content="https://www.sofouf.net">
    <meta property="og:type" content="site">
    <meta property="og:title" content="بوابة التوظيف الالكتروني">
    <meta property="og:description" content="">

   

    
    <title>جامعة الاسراء </title>
    <!-- Bootstrap core CSS -->
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="http://keenthemes.com/preview/metronic/theme/assets/global/css/components.min.css" rel="stylesheet" />
        
<link href="Sofouf_files/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="Sofouf_files/all.css">
    <!-- Custom styles for this template -->
   <%-- <link href="./Sofouf_files/custom-style.css" rel="stylesheet">--%>
  
            <link href="Sofouf_files/login-ar.css" rel="stylesheet">
        <link rel="stylesheet" href="Sofouf_files/jquery-confirm.min.css">
    <style type="text/css">
        #error_msg{
            color: #ff5854;
        }
        .red-color{
            color: #ff5854;
            font-size: 14px;
            width: 335px;
            display: block;
        }
    </style>
</head>
<body class="bg-box">
<div class="container-fluid">
    <form runat="server">
    <div class="row">
        <div class="col-xl-6 col-md-12 col-12  login-right  text-center">
              <div class="content">
            <h1 class="mb-30"  style="color:black"> بوابة التوظيف </h1>
            <p  style="color:black">جامعة الاسراء -غزة</p>
                  </div>
          <%--  <p>تدريبات ذهنية . امتحانات تجريبية . تواصل اجتماعي</p>--%>
        </div>
        <div class="col-1 col-xl-1 col-md-4 col-sm-2"> </div>
        <div class="col-xl-4 col-md-4 col-sm-8 col-12 white-bg">
            <ul class="top-menu col-md-12">
               <%-- <li class="lang pull-right"><a href="javascript:void(0)"><i class="fas fa-globe-asia"></i> اللغة <i class="fas fa-chevron-down"></i></a>
                    <ul class="submenu col-md-4 col-4">
                        <li><a href="https://www.sofouf.net/lang/2" class="english"><span> إنجليزي</span></a></li>
                        <li><a href="https://www.sofouf.net/lang/1" class="arabic"><span>عربي</span></a></li>
                    </ul>
                </li>--%>
                <li class=" pull-left "><a href="#"><i class="far fa-question-circle"></i> الدعم الفني </a></li>
            </ul>

            <picture>
                <img src="https://ar.israa.edu.ps/style/assets/images/logo.png" alt="" width="140">
            </picture>
            <%--<h1 class="text-center mt-0 mb-20">دخول</h1>--%>
           <div class="mb-5">
           
            <span id="success_msg"></span>
            <span style="color:#000;" id="resend_active_msg"></span>
            <span id="error_msg"></span>
           </div>
         <%--  <h1 id="msg" runat="server" class="text-center mt-0 mb-20" style="color:red">رقم الهوية مستخدم </h1>--%>
            <div id="msg" runat="server" style="direction:rtl" class="alert alert-danger" >
                                <p style="font-size:small"> رقم الهوية مستخدم  </p>
                            </div>
            <div id="msg1" runat="server" style="direction:rtl" class="alert alert-danger" >
                                <p style="font-size:small"> رقم الهوية خطأ  </p>
                            </div>

              <div id="suc" runat="server" style="direction:rtl" class="note note-success" >
                                <p style="font-size:small">  تم انشاء الحساب بنجاح يرجى تسجيل دخول والتقدم بالطلب  <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Login.aspx" runat="server">من هنا</asp:HyperLink></p>
                            </div>
                <div class="form-group">
                  <%--  <input type="text" name="email" id="email" class="form-control" placeholder="البريد الالكتروني">--%>
                   <asp:TextBox ID="ID" runat="server" class="form-control" placeholder=" رقم الهوية"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ID" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="هوية خطأ" ControlToValidate="ID" ForeColor="#CC0000" ValidationExpression="\d\d\d\d\d\d\d\d\d"></asp:RegularExpressionValidator>
                          </div>   
                <div class="form-group">
 <asp:TextBox ID="pass" runat="server" class="form-control" placeholder="كلمة المرور" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pass" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
 <asp:TextBox ID="pass2" runat="server" class="form-control" placeholder=" تاكيد كلمة المرور " TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="pass2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="غير متطابق" ControlToCompare="pass" ControlToValidate="pass2" ForeColor="#CC0000"></asp:CompareValidator>
                </div>
                <div class="form-group">
 <asp:TextBox ID="email" runat="server" class="form-control" placeholder=" البريد الالكتروني "></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="email" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="غير صحيح" ControlToValidate="email" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                     </div>
                <span class="red-color" id="password_msg"></span>
                <div class="form-action  text-right ">
                    <img hidden="" width="40" id="loading" style="  margin-left: 30% ;" src="./Sofouf_files/spin.gif">
                  
                       <asp:Button ID="Button1" runat="server"  class="btn text-center"  Text="تسجيل" OnClick="Button1_Click" />
                 
                  
                    
                </div>
           
        </div>
        <div class="col-1 col-xl-1 col-md-4 col-sm-2"> </div>
    </div>
        </form>
</div>


    
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="Sofouf_files/jquery.min.js"></script>


<script src="Sofouf_files/bootstrap.min.js"></script>
<script src="Sofouf_files/jquery-confirm.min.js"></script>
<script>
$("#reset-form").submit(function (e) {
        $("#loading_reset").removeAttr("hidden");
        $('#loading_reset').show();
        e.preventDefault();
        $action = $(this).attr("action");
        $data = $(this).serialize();
        $.ajax({
            url: $action,
            type: "POST",
            data: $data,
            dataType: "json",
            success: function (response) {
                if (response.status == true) {
                    $('#exampleModal').modal('toggle');
                    var a=  $.confirm({
                        title: '<h5 style="color:#1b6bac">'+response.msg+'</h5>',
                        content: '<i style="font-size: 50px;color:#1b6bac;text-align:center;display:block;" class="fa fa-check" ></i>',
                        type: 'blue',
                        buttons: {
                            Close: {
                                text: 'إغلاق',
                                action: function () {
                                    a.close();
                                }
                            }
                        }
                    });
                     $('#exampleInputEmail_01').val('');
                    setTimeout(function(){ a.close(); },1500);
                     $("#loading_reset").hide();
                     $("#reset_msg").html('');
                } else {
                     $("#loading_reset").hide();
                     $("#reset_msg").html(response.msg);
                }
            },error: function(data){
                var error = data.responseJSON;
                var errors= error.errors;
                if(typeof(errors['email']) != "undefined"){
                    $("#reset_msg").html(errors['email'][0]);
                }
                $('#loading').hide();
                $("#loading_reset").hide();
            }
        });
    });
    
    $("#login-form").submit(function (e) {
        $("#loading").removeAttr("hidden");
        $('#loading').show();
        $("#success_msg").html('');
        $("#error_msg").html('');
        e.preventDefault();
        $action = $(this).attr("action");
        $data = $(this).serialize();
        $.ajax({
            url: $action,
            type: "POST",
            data: $data,
            dataType: "json",
            success: function (response) {
                if (response.status == true) {
                    // document.getElementById("success_msg").innerHTML = response.msg;
                    $("#email_msg").html('');
                    $("#password_msg").html('');
                    window.location.href = "https://www.sofouf.net/user/home";
                } else {
                    document.getElementById("error_msg").innerHTML = response.msg;
                    if(response.code==true){
                        $("#activation_link").removeAttr("hidden");
                        $("#activation_link").show();
                        $("#email_msg").html('');
                        $("#password_msg").html('');
                        $('#loading').hide();
                        $('#resend_active_msg').text('');
                    }else{
                        $("#email_msg").html('');
                        $("#password_msg").html('');
                        $('#loading').hide();
                        $("#activation_link").hide();
                    }
                }
            },error: function(data){
                $("#success_msg").html('');
                $("#email_msg").html('');
                $("#password_msg").html('');

                var error = data.responseJSON;
                var errors= error.errors;
                if(typeof(errors['password']) != "undefined"){
                    $("#password_msg").html(errors['password'][0]);
                }
                if(typeof(errors['email']) != "undefined"){
                    $("#email_msg").html(errors['email'][0]);
                }
                $('#loading').hide();
                $("#activation_link").hide();
            }
        });
    });
    $( "#resend_active" ).click(function() {
        var email = $("#email").val();
        if(email!=null && email !=''){
            $.get('https://www.sofouf.net/resend/activation',{email:email},function(data){
                $("#resend_active_msg").html(data.msg);
                $("#activation_link").hide();

            });
        }else{
            $msg='حقل الايميل مطلوب';
            $('#email_msg').text($msg);
        }
    });

</script>

<script type="text/javascript">
    $(document).ready(function(){
        $('.lang').on('click',function(e){
            if($(this).hasClass('active')){
                $(this).removeClass('active');
                $('.submenu').removeClass('active');
            }else{
                $(this).addClass('active');
                $('.submenu').addClass('active');
            }
        });


        $('.submenu li').on('click',function(){
            $('.lang span').html($(this).children('a').children('span').html());
        });


        $(document).on('click',function(e){
            if (!$(e.target).is('.lang , .lang *')) {
                $('.lang').removeClass('active');
                $('.submenu').removeClass('active');
            }
        });
    });
</script>




</body></html>
