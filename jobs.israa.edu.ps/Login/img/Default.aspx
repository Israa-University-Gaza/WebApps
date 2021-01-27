<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../Default.aspx.cs" Inherits="Login_Default" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width,initial-scale=1" name="viewport">
    <link rel="stylesheet" href="n/bootstrap/dist/css/bootstrap.min.css">
   
<link href="css/material.blue-deep_purple.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
    <link href="fonts/fontello/css/fontello.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrap-offset-right.css">
    <link rel="stylesheet" href="css/style.css">
    <title>بوابة التوظيف الإلكتروني</title>
    <style>
        .mdl-textfield__label {
            margin-bottom: 0;
            color: #d7dbdc;
            font-weight: normal;
        }
        
        .mdl-textfield--floating-label.is-focused .mdl-textfield__label,
        .mdl-textfield--floating-label.is-dirty .mdl-textfield__label {
            text-transform: uppercase
        }
        
        .has-feedback label~.form-control-feedback {
            top: 15px;
        }
        
        .mdl-textfield {
            width: 100%;
        }
        
        .mdl-checkbox__label {
            cursor: text;
            font-size: 13px;
            float: left;
            color: #b0b3b4;
            font-weight: normal;
        }
        
        .mdl-checkbox__box-outline {
            border: 1px solid #b0b3b4;
        }
        
        .mdl-textfield__input {
            border: none;
            font-family:Al-Jazeera-Arabic;
            border-bottom: 1px solid rgba(0, 0, 0, .12);
            display: block;
            font-size: 16px;
            margin: 0;
            padding: 4px 0;
            width: 100%;
            background: 0 0;
            text-align: left;
            color: inherit;
            font-weight: bold;
        }
        
        .mdl-switch__label {
            float: left;
            font-weight: normal;
            color: #b0b3b4;
            font-size: 14px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="center-block">
            <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-sm-12 col-xs-12 no-padding" style="z-index:1">
                <!-- Slider -->
                   <form runat="server">
                <div class="mlt-carousel">
                    <div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img class="img-responsive center-block" src="../Sofouf_files/img/logo.png" alt="step1">
                                <div class="item-content">
                                    <h3>جامعة الإسـراء - غزة</h3>
                                    <h3>بوابة التوظيف الإلكتروني</h3>
                                    <br>
                                  <p>الوظائف المطروحة حاليا</p>

                                       <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="table" EmptyDataText="لا يوجد شواغر مطروحة" GridLines="None" Width="100%" >
                                      <Columns>
                                          <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                                          <asp:BoundField DataField="job_name" HeaderText="الوظيفة" SortExpression="job_name" >
                                         <%-- <ItemStyle HorizontalAlign="Right" />--%>
                                          </asp:BoundField>
                                          <asp:BoundField DataField="Deadline" HeaderText="اخر موعد للتقديم" />
                                      </Columns>
                                    </asp:GridView>

                                    



                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT dbo.hr_jobs_addv.id, dbo.hr_jobs_addv.job_name, dbo.hr_jobs_addv.qualification,
CONVERT(varchar, dbo.hr_adv.Deadline, 1) Deadline
FROM dbo.hr_jobs_addv INNER JOIN dbo.hr_adv ON dbo.hr_jobs_addv.adv_id = dbo.hr_adv.adv_id WHERE (dbo.hr_adv.Deadline &gt; GETDATE())">
                                        
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                            <!--<div class="item">
                                <img class="img-responsive center-block" src="img/step2.png" alt="step2">
                                <div class="item-content">
                                    <h3>Pellentesque tincidunt</h3>
                                    <p>Laoreet placerat justo congue vulputate</p>
                                    <p>Diam felis dapibus nulla</p>
                                    <p>Phasellus molestie</p>
                                </div>
                            </div>
                            <div class="item">
                                <img class="img-responsive center-block" src="img/step3.png" alt="step3">
                                <div class="item-content">
                                    <h3> Proin sed leo sodales</h3>
                                    <p>ultricies posuere leo</p>
                                    <p>Phasellus orci dolor</p>
                                    <p>dapibus suscipit quam</p>
                                </div>
                            </div>-->
                        </div>
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <!--<li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>-->
                        </ol>
                    </div>
                    <!--mlt-carousel-->
                </div>
                <!-- Slider -->
            </div>
            <!-- Login -->
         

            
            <div class="col-lg-6 col-lg-offset-right-1 col-md-6 col-md-offset-right-1 col-sm-12 col-xs-12 no-padding">
                <div class="mlt-content">
                    <ul class="nav nav-tabs">
                        <li runat="server" id="reg" ><a href="#register" data-toggle="tab">إنشاء حساب</a></li>
                        <li runat="server" id="log" class="active"><a href="#login" data-toggle="tab">تسجيل دخول</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div runat="server"  id="register" class="tab-pane fade">
                            <!--register form-->

                        
                                <div class="col-lg-10 col-lg-offset-1 col-lg-offset-right-1 col-md-10 col-md-offset-1 col-md-offset-right-1 col-sm-12 col-xs-12 pull-right ">

                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label form-group has-feedback">
                                        <asp:TextBox ID="IDD" runat="server" class="mdl-textfield__input" ValidationGroup="g1" placeholder=" رقم الهوية"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="IDD" ErrorMessage="ادخل" ValidationGroup="g1" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="هوية خطأ" ValidationGroup="g1" ControlToValidate="IDD" ForeColor="#CC0000" ValidationExpression="\d\d\d\d\d\d\d\d\d"></asp:RegularExpressionValidator>
            
                                    </div>
                                    <!--
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input " type="text" id="fullName ">
                                        <label class="mdl-textfield__label " for="fullName ">Full Name</label>
                                    </div>-->
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label ">
                                      <asp:TextBox ID="passs" ValidationGroup="g1" runat="server" class="mdl-textfield__input" placeholder="كلمة المرور" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="g1" ControlToValidate="passs" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
           
                                    </div>

                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label ">
                                       <asp:TextBox ID="pass2" runat="server" ValidationGroup="g1" class="mdl-textfield__input" placeholder=" تاكيد كلمة المرور " TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="g1" runat="server" ControlToValidate="pass2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="g1" ErrorMessage="غير متطابق" ControlToCompare="passs" ControlToValidate="pass2" ForeColor="#CC0000"></asp:CompareValidator>
               
                                    </div>

                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label ">
                                      <asp:TextBox ID="email" runat="server" ValidationGroup="g1" class="mdl-textfield__input" placeholder=" البريد الالكتروني "></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="g1" ControlToValidate="email" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationGroup="g1" ErrorMessage="غير صحيح" ControlToValidate="email" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
             
                                    </div>

                                    <%--<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect termsLabel" for="ageFlag">
                                <input type="checkbox" id="ageFlag" class="mdl-checkbox__input " checked>
                                <span class="mdl-checkbox__label ">I herby certify that I am atleast 18 years of age</span>
                                </label>--%>

<%--                                    <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="termsFlag">
                                <input type="checkbox" id="termsFlag" class="mdl-checkbox__input ">
                                <span class="mdl-checkbox__label ">I have read and accept the <a href="# ">Terms of Use</a> and <a href="# ">Privacy Policy</a></span>
                                </label>--%>
                                    <asp:Button ID="Button2" runat="server" ValidationGroup="g1"  class="btn lt-register-btn"  Text="تسجيل" OnClick="Button11_Click" />
                                   <%-- <button class="btn lt-register-btn " formaction="# ">register now <i class="icon-right pull-right "></i></button>--%>
                                </div>
                         
                            <!--register form-->
                        </div>
                        <div runat="server" id="login" class="tab-pane fade in active" >
                            <!--login form-->
                          <%--  <form runat="server">--%>
                              <div id="msg" runat="server" style="direction:rtl;width: 53%;" class="alert alert-danger" >
                                <p style="font-size:small">خطأ المستخدم او كلمة المرور   </p>
                            </div>
                            
                                <div id="msgg" runat="server" style="direction:rtl" class="alert alert-danger" >
                                <p style="font-size:small"> رقم الهوية مستخدم  </p>
                            </div>
            <div id="msg1" runat="server" style="direction:rtl" class="alert alert-danger" >
                                <p style="font-size:small"> رقم الهوية خطأ  </p>
                            </div>

              <div id="suc" runat="server" style="direction:rtl" class="note note-success" >
                                <p style="font-size:small">  تم انشاء الحساب بنجاح يرجى تسجيل دخول والتقدم بالطلب  <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Login.aspx" runat="server">من هنا</asp:HyperLink></p>
                            </div>




                                <div class="col-lg-10 col-lg-offset-1 col-lg-offset-right-1 col-md-10 col-md-offset-1 col-md-offset-right-1 col-sm-12 col-xs-12 pull-right ">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                          <asp:TextBox ID="id" runat="server" ValidationGroup="g2" class="mdl-textfield__input"  ForeColor="Red" placeholder="رقم الهوية  "></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="g2"  runat="server" ControlToValidate="id" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="g2" runat="server" ErrorMessage="هوية خطأ" ControlToValidate="id" ForeColor="#CC0000" ValidationExpression="\d\d\d\d\d\d\d\d\d"></asp:RegularExpressionValidator>

                                    </div>
                                </div>

                                <div class="col-lg-10 col-lg-offset-1 col-lg-offset-right-1 col-md-10 col-md-offset-1 col-md-offset-right-1 col-sm-12 col-xs-12 pull-right ">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:TextBox ID="pass" runat="server" ValidationGroup="g2" class="mdl-textfield__input" TextMode="Password" placeholder=" كلمة السر"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="g2" runat="server" ControlToValidate="pass" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
            
                                    </div>
                                </div>

                                <div class="col-lg-10 col-lg-offset-1 col-lg-offset-right-1 col-md-10 col-md-offset-1 col-md-offset-right-1 col-sm-12 col-xs-12 pull-right ">
                                    <div class="row">
                                        <br>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                            <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="rememberPass">
                                        <input type="checkbox" id="rememberPass" class="mdl-switch__input">
                                        <span class="mdl-switch__label">تذكرني</span>
                                        </label>

                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style=" text-align:right;">
                                            <a href="#">إعادة تعيين كلمة السر</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-10 col-lg-offset-1 col-lg-offset-right-1 col-md-10 col-md-offset-1 col-md-offset-right-1 col-sm-12 col-xs-12 pull-right ">
                                 <%--   <button class="btn lt-register-btn">login <i class="icon-right "></i></button>--%>
                                        <asp:Button ID="Button1" CssClass="btn lt-register-btn" ValidationGroup="g2"  style="margin-top: 10px;"  runat="server" Text="دخول " OnClick="Button1_Click" />
                               
                                     </div>
                            

                           <%-- </form>--%>
                            <!--login form-->
                        </div>
                        
                    </div>
               <div id="Div2" runat="server" style="direction:rtl;/* width: 53%; */height: 38px;margin-top: 464px; background-color: #e2ce62;padding: 7px" class="alert alert-warning" >
                                <p style="font-size:small;    color: #272262">للدعم الفني التواصل على هاتف رقم :082843433 او المراسلة على jods@israa.edu.ps   </p>
                            </div>
                       </div>
              
                <!--Login-->
            </div>
                </form>
            <!--center-block-->
        </div>
        <!--container-->
    </div>







    <script src="n/jquery/dist/jquery.min.js "></script>

    <script src="n/bootstrap/dist/js/bootstrap.min.js "></script>
    
    <script src="libs/mdl/material.min.js "></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js "></script>

    <script>
        //Google analytics.
        (function(i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function() {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-79865537-1', 'auto');
        ga('send', 'pageview');
    </script>

    <script>
        //Form validation.
        $('form').validate({
            rules: {
                fname: {
                    minlength: 3,
                    maxlength: 15,
                }
            },
            errorPlacement: function(error, element) {},
            highlight: function(element) {
                var id_attr = "#" + $(element).attr("id") + "1";
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                $(id_attr).removeClass('icon-ok-circled2').addClass('icon-cancel-circled2');
            },
            unhighlight: function(element) {
                var id_attr = "#" + $(element).attr("id") + "1";
                $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                $(id_attr).removeClass('icon-cancel-circled2').addClass('icon-ok-circled2');
            },
        });
    </script>

</body>

</html>