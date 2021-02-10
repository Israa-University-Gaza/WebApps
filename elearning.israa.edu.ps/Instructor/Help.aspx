<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Instructor_Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;النشرات الإرشادية الخاصة بالمحاضر ! </h4>
            <%--<p class="text-justify">
                بامكانك وضع المواد الإثرائية للطالب باختيار احد الخيارات التالية
            </p>--%>
        </div>
    </div>
    <div class="row">
           <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/Instructor/z1.pdf"> كيفية عقد محاضرة افتراضية  من خلال حساب الكلية على  ZOOM </asp:HyperLink>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/Instructor/z2.pdf"> كيفية إجراء محاضرة متزامنة للطالب عبر منصة ZOOM  </asp:HyperLink>
                </h4>
                
            </div>
        </div>





        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Instructor/h1.pdf">كيفية إضافة إعلان للطلاب </asp:HyperLink>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Instructor/h2.pdf">كيفية إضافة عرض تقديمي للطلاب</asp:HyperLink>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Instructor/h3.pdf">كيفية إضافة فيديو من اليوتيوب</asp:HyperLink>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Instructor/h4.pdf">كيفية إضافة كتاب </asp:HyperLink>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Instructor/h5.pdf">كيفية إضافة نبذة ووصف المساق</asp:HyperLink>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Instructor/h6.pdf">كيفية إضافة واجب وتصليحه للطلاب</asp:HyperLink>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Instructor/h7.pdf">كيفية تسجيل الدخول</asp:HyperLink>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink8" runat="server"  NavigateUrl="~/Instructor/h9.pdf" >كيفية تنزيل برنامج تسجيل المحاضرات فيديو وتفعيله</asp:HyperLink> 
                </h4>
                
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink9" runat="server"  NavigateUrl="~/Instructor/h11.pdf" >كيفية تسجيل محاضرة صوت وصورة للطلاب</asp:HyperLink>
                </h4>
                
            </div>
        </div>
        <%--<div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink10" runat="server"  NavigateUrl="~/Instructor/h12.pdf" >كيفية إنشاء قناة على اليوتيوب</asp:HyperLink>
                </h4>
                
            </div>
        </div>--%>
         <%--<div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink11" runat="server"  NavigateUrl="~/Instructor/h13.pdf" >كيفية رفع الفيديو لقناة اليوتيوب الخاصة بالمحاضر</asp:HyperLink>
                </h4>
                
            </div>
        </div>--%>
        
          <%--<div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span><asp:HyperLink ID="HyperLink16" runat="server"  NavigateUrl="~/Instructor/h14.pdf" >كيفية إضافة فيديو من قناة المحاضر إلي بوابة التعليم الإلكتروني</asp:HyperLink>
                </h4>
                
            </div>
        </div>--%>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span><asp:HyperLink ID="HyperLink12" runat="server"  NavigateUrl="~/Instructor/zoom.pdf" >كيفية إنشاء محاضرة متزامنة للطلاب عبر منصة Zoom  (فصل افتراضي)</asp:HyperLink>
                </h4>
                
            </div>
        </div>
          <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span><asp:HyperLink ID="HyperLink13" runat="server"  NavigateUrl="~/Instructor/exam.pptx" >نشرة إرشادية عن كيفية إضافة أسئلة متنوعة للاختبار</asp:HyperLink><span style="color:red;font-size:small"> خاص بالامتحانات الإلكتورنية </span>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-save-file	"></span><asp:HyperLink ID="HyperLink14" runat="server"  NavigateUrl="~/Instructor/exam2.pdf" >نشرة إرشادية مفصلة عن كيفية إعداد امتحان إلكتروني باستخدام Moodle ومن ثم إضافته للبوابة التعليم الإلكتروني</asp:HyperLink><span style="color:red;font-size:small"> خاص بالامتحانات الإلكتورنية </span>
                </h4>
                
            </div>
        </div>
        <hr />
    </div>
    
</asp:Content>

