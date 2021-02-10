<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" enableEventValidation="false" CodeFile="Crs.aspx.cs" Inherits="_Default" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-sm-6 col-md-6">
            <div class="well">
              اسم المساق:   <h4 ><span style="font-size: 18px;" class="glyphicon glyphicon-bell">
                   
                    </span>&nbsp;&nbsp;
                  <span runat="server" id="crs_name"></span>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
                 رقم الشعبة:<h4 ><span style="font-size: 18px;" class="glyphicon glyphicon-pushpin">
                   
                    </span>&nbsp;&nbsp;
                       <span runat="server" id="setinon"></span>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
              عدد الطلبة :  <h4 ><span style="font-size: 18px;" class="glyphicon glyphicon-user
">
                  
                    </span>&nbsp;&nbsp;
                   <span runat="server" id="std_count"></span>
                </h4>
                
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-sm-2 col-md-2">
            <div class="well">
             عدد الملفات:   <h4 ><span style="font-size: 18px;" class="glyphicon glyphicon-file">
                   
                    </span>&nbsp;&nbsp;
                   <span runat="server" id="files"></span>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-2 col-md-2">
            <div class="well">
                الواجبات:<h4 ><span style="font-size: 18px;" class="glyphicon glyphicon-paperclip">
                   
                    </span>&nbsp;&nbsp;
                    <span runat="server" id="hw"></span>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-2 col-md-2">
            <div class="well">
             النقاشات :  <h4 ><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer">
                  
                    </span>&nbsp;&nbsp;
                 <span runat="server" id="dialog"></span>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-2 col-md-2">
            <div class="well">
             روابط :  <h4 ><span style="font-size: 18px;" class="glyphicon glyphicon-check
">
                  
                    </span>&nbsp;&nbsp;
                 <span runat="server" id="links"></span>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-2 col-md-2">
            <div class="well">
             فيديوهات :  <h4 ><span style="font-size: 18px;" class="glyphicon glyphicon-facetime-video">
                  
                    </span>&nbsp;&nbsp;
                 <span runat="server" id="vids"></span>
                </h4>
                
            </div>
        </div>
        <div class="col-sm-2 col-md-2">
            <div class="well">
             إعلانات :  <h4 ><span style="font-size: 18px;" class="glyphicon glyphicon-flag">
                  
                    </span>&nbsp;&nbsp;
                 <span runat="server" id="ann"></span>
                </h4>
                
            </div>
        </div>
    </div>


    <div class="row">
        
        <div class="col-sm-4 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;<asp:HyperLink ID="OverVeiwL" runat="server">نبذة عن المساق </asp:HyperLink><asp:HyperLink ID="L1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ToolTip="ادخال نبذة المساق">+</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="OverVeiw" runat="server" Text="لا يوجد"></asp:Label>                </p>
            </div>
        </div>
        <div class="col-sm-4 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-road	"></span>&nbsp;&nbsp;<asp:HyperLink ID="SyllbusL" runat="server">وصف المساق</asp:HyperLink> <asp:HyperLink ID="L2" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ToolTip="ادخال وصف المساق">+</asp:HyperLink>
                </h4>
                <p class="text-justify">
                   <asp:Label ID="Syllbus" runat="server" Text="لا يوجد"></asp:Label> 
                </p>
            </div>
        </div>
        <div class="col-sm-4 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-book	"></span>&nbsp;&nbsp;<asp:HyperLink ID="bookL" runat="server" NavigateUrl="~/Instructor/books.aspx">كتاب المساق</asp:HyperLink> <asp:HyperLink ID="L3" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ToolTip="ادخال كتاب المساق">+</asp:HyperLink></h4>
                <p class="text-justify">
                <asp:Label ID="book" runat="server" Text="لا يوجد"></asp:Label>
                </p>
            </div>
        </div>
            <div class="col-sm-4 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-briefcase	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Instructor/books.aspx">تقرير الواجبات</asp:HyperLink> </h4>
               
            </div>
        </div>
        
    </div>
   
       <asp:Repeater ID="Repeater" runat="server"   OnItemDataBound="Repeater_ItemDataBound" OnItemCommand="Repeater_ItemCommand" >
          <ItemTemplate>

           
               <div class="col-sm-6 col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="direction:rtl" >
                            
                            <h4 style="direction:rtl""><%--<span style="font-size: 18px;" class="glyphicon glyphicon-fullscreen"></span>--%>&nbsp;&nbsp;
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("startdate") %>' />
                                <asp:Label ID="Label1" runat="server" Text='إلى' ForeColor="Red" />
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("enddate") %>' />
                                <asp:HyperLink ID="HyperLink2" NavigateUrl="#" class="glyphicon glyphicon-plus" data-toggle="modal" style="font-family:Al-Jazeera-Arabic;direction:rtl;font-weight: bold;color: mediumblue;"  data-target='<%# "#exampleModal"+Eval("id") %>' runat="server"> اضافة مصدر</asp:HyperLink>
                         
                    <div class="modal fade" id= '<%# "exampleModal"+Eval("id") %>' tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
           <asp:Label ID="Label6" runat="server" Text='<%# Eval("startdate") %>' />
                                  <asp:Label ID="Label7" runat="server" Text='إلى' ForeColor="Red" />
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("enddate") %>' />
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="row">
        <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl=<%#"~/Instructor/Files.aspx?week="+Eval("id")+"&crs="+Request.QueryString["crs"]+"&section="+Request.QueryString["section"] %>>ملف</asp:HyperLink>
                </h4>
           <%--     <p >
                    تتيح الملفات للمعلم توفير ملف كمورد للمواد التعليمية
                </p>--%>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl=<%#"~/Instructor/HomeWork.aspx?week="+Eval("id")+"&crs="+Request.QueryString["crs"]+"&section="+Request.QueryString["section"]  %>>واجب</asp:HyperLink>
                </h4>
              <%--  <p >
                    تُمكِّن الواجب المعلم من توصيل المهام وجمع العمل وتوفير الدرجات والتعليقات.
                </p>--%>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-flag"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl=<%#"~/Instructor/Announcements.aspx?week="+Eval("id")+"&crs="+Request.QueryString["crs"]+"&section="+Request.QueryString["section"]  %> >إعلان</asp:HyperLink>
                </h4>
              <%--  <p >
                    وضع اعلانات للطلبة اسبوعيا للتواصل معهم باخبار المساق والمواعيد التي طرأ عليها تغيرات 
                </p>--%>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink7" runat="server"  NavigateUrl=<%#"~/Instructor/Links.aspx?week="+Eval("id")+"&crs="+Request.QueryString["crs"]+"&section="+Request.QueryString["section"]  %>>رابط</asp:HyperLink>
                </h4>
               <%-- <p >
                    تتيح الروابط للمعلم للمدرس توفير رابط ويب كمورد للمواد. يمكن ربط أي شيء متاح مجانًا عبر الإنترنت ، مثل المستندات أو الصور
                </p>--%>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-facetime-video"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl=<%#"~/Instructor/vids.aspx?week="+Eval("id")+"&crs="+Request.QueryString["crs"]+"&section="+Request.QueryString["section"]  %> >فيديو</asp:HyperLink>
                </h4>
                <%--<p >
                    تتيح الفيديوهات للمعلم للمدرس توفير فيديو على اليوتيوب كمورد للمواد.
                </p>--%>
            </div>
        </div>
          <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl=<%#"~/Instructor/Dialog.aspx?week="+Eval("id")+"&crs="+Request.QueryString["crs"] +"&section="+Request.QueryString["section"] %>>حوار نقاش</asp:HyperLink>
                </h4>
              <%--  <p >
                    تتيح الحوار  للمدرس فتح نقاش مع الطلبة واستقبال الردود على  موضوع يتم طرحة ويغلق بموعد.
                </p>--%>
            </div>
        </div>
          <%--<div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink11" runat="server" Enabled="false" NavigateUrl="~/Instructor/Exam.aspx">الامتحانات القصيرة </asp:HyperLink>
                </h4>
                <p class="text-justify">
                    يمكّن نشاط الاختبار المدرس من إنشاء اختبارات تشتمل على أسئلة من أنواع مختلفة
                    <br>
                    <span style="color:red">يمكنك إعداد الامتحانات الإلكترونية عن طريق المودل وتوجيه الطلاب مباشرة للمودل عن طريق ايقونة الامتحانات الإلكترونية التي تم إضافتها مؤخرا لموقع الجامعة</span>
                </p>
            </div>
        </div>--%>

    </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn-danger" onclick="msg(<%# Eval("id") %>)" data-dismiss="modal">إغلاق</button>

         
      </div>
    </div>
  </div>
</div>
                                <asp:Label ID="Label4" Visible="false" runat="server" Text='<%# Eval("id") %>' />
                                 </h4>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="row" style="padding-right:30px"><asp:Label ID="Label5" Visible="false" runat="server" Text="لا يوجد انشطة"></asp:Label></div>
                                 
                               <div class="col-xs-12" runat="server" id="r11" style="overflow-y: hidden; height: 200px;">
                                    <ul class="demo" runat="server" id="r1" style="overflow-y: hidden; height: 187px;">
                                       
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"   Width="15px" Height="15px" runat="server" /><%# Eval("title") %><span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='ViewFile.aspx?id=<%# Eval("id")%>'> التفاصيل...</a> <asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton1_Click" runat="server" Width="25px" Height="25px" ImageUrl="~/assets/del.png" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" /></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                           <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"  ImageUrl="~/assets/icon.svg"  Width="15px" Height="15px" runat="server" /><%# Eval("title") %><span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='ViewAnnouncements.aspx?id=<%# Eval("id")%>'> التفاصيل...</a><asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton2_Click" runat="server" Width="25px" Height="25px" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" ImageUrl="~/assets/del.png" /></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="Repeater3" runat="server" OnItemDataBound="Repeater3_ItemDataBound">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"  ImageUrl="~/assets/homework.png"  Width="25px" Height="20px" runat="server" />واجب<span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='Viewhomework.aspx?id=<%# Eval("id")%>'> التفاصيل...</a><asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton3_Click" runat="server" Width="25px" Height="25px" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" ImageUrl="~/assets/del.png" />  <asp:ImageButton ID="ImageButton2"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton2_Click1" runat="server" Width="25px" Height="25px"  ImageUrl="~/assets/Edit-validated-icon.png" /></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="Repeater4" runat="server">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"  ImageUrl="~/assets/links.png"  Width="25px" Height="20px" runat="server" /><%# Eval("title") %><span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='Viewlink.aspx?id=<%# Eval("id")%>'> التفاصيل...</a><asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton4_Click" runat="server" Width="25px" Height="25px" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" ImageUrl="~/assets/del.png" /></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="Repeater5" runat="server">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"  ImageUrl="~/assets/video.png"  Width="25px" Height="20px" runat="server" /><%# Eval("title") %><span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='ViewVideo.aspx?id=<%# Eval("id")%>'> التفاصيل...</a><asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton5_Click" runat="server" Width="25px" Height="25px" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" ImageUrl="~/assets/del.png" /></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                          <asp:Repeater ID="Repeater6" runat="server">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"  ImageUrl="~/assets/discussion.png"  Width="25px" Height="20px" runat="server" /> نقاش <span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='ViewDialog.aspx?id=<%# Eval("id")%>'> التفاصيل...</a><asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton6_Click" runat="server" Width="25px" Height="25px" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" ImageUrl="~/assets/del.png" /></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                         <asp:Repeater ID="Repeater7" runat="server">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"   ImageUrl="~/assets/quiz.png"  Width="25px" Height="27px" runat="server" /> <%# Eval("title") %> <span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='ViewExam.aspx?id=<%# Eval("id")%>'> التفاصيل...</a><asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton7_Click" runat="server" Width="25px" Height="25px" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" ImageUrl="~/assets/del.png" /></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">

                            <div class="clearfix">
                                <!--<ul class="pagination pull-left">
                                        <li><button href="#" class="all btn btn-default"><span class="glyphicon glyphicon-chevron-left"></span></button></li>
                                    </ul>-->
                            </div>
                        </div>
                    </div>
                </div>
            
        
        </ItemTemplate>
           </asp:Repeater>
    
     
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [e_crs_week] where sem=(select top 1 semester_id from e_semester)"></asp:SqlDataSource>--%>


</asp:Content>

