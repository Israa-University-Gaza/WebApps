<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Instructor_Crs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <style>
        table * {
            text-align: center;
        }
    </style>
    <iframe runat="server" id="mood"  style="width: 1px;height: 1px;"></iframe>
       <script>
    $(document).ready(function(){
        $("#exampleModal_____").modal('show');
    });
</script>
     
    <div class="modal fade" id= 'exampleModal' tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          
        <h5 class="modal-title" id="exampleModalLabel"> إعلان هام </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body" style="direction:rtl">
       <span> الزملاء الأعزاء نود التنويه أنه تم تفعيل منصة الامتحانات الإلكترونية (Moodle) نتمنى منكم التأكد من أسماء المساقات المنسبة لكم وكذلك أعداد وأسماء الطلاب في الشعب. ..</span> <br/>

           <br/>
            
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-danger"  data-dismiss="modal">إغلاق</button>

         
      </div>
    </div>
  </div>
</div>
    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;عزيزي المحاضر ! </h4>
            <p class="text-justify">
                بامكانك وضع المواد الإثرائية للطالب باختيار احد الخيارات التالية
                
            </p>
            
        </div>
    </div>
    <hr/>
    <div  class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;    جدول المحاضرات الافتراضية عبر تقنية ال zoom للفصل الدراسي الأول للعام الجامعي 2020/2021 </h4>
         
               <span style="color:red">تنويه: يتم تسجيل الدخول من حساب الكلية عبر منصة الزوم وليس حساب المحاضر الشخصي ..</span>
       <br/>
            <span style="color:green">  جداول المحاضرات الافتراضية عبر تقنية الزوم هي نفسها لجميع الفصل الدراسي </span>
             </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" text-align="center"  OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSource1" Width="100%" AllowSorting="True" CellPadding="10" CellSpacing="3" ForeColor="#333333" HorizontalAlign="Center" CssClass="table-condensed">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="day" HeaderText="اليوم" SortExpression="day" />
                <asp:BoundField DataField="courseCode" HeaderText="رقم المساق" SortExpression="courseCode" />
                <asp:BoundField DataField="crs_name" HeaderText="اسم المساق" SortExpression="crs_name" />
                <asp:TemplateField HeaderText="المحاضر" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lec" runat="server" style="font-size: 10px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="time" HeaderText="الساعة" SortExpression="time" />
                <asp:BoundField DataField="section" HeaderText="الشعبة" SortExpression="section" />
                <asp:BoundField DataField="sectionid" HeaderText="sectionid" SortExpression="sectionid" Visible="False" />
                <asp:TemplateField HeaderText=" Zoom" SortExpression="url">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink8" runat="server" CssClass="bg-danger" NavigateUrl='https://zoom.us/signin'>الانتقال الى منصة  Zoom</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" Wrap="True" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT distinct dbo.days.id, dbo.timee.id, dbo.std_crs.courseCode, dbo.zoom.crs_name, dbo.zoom.url, dbo.zoom.mettingID, dbo.zoom.time, dbo.zoom.day, dbo.zoom.section, dbo.std_crs.sectionid FROM dbo.days INNER JOIN dbo.zoom ON dbo.days.day = dbo.zoom.day INNER JOIN dbo.timee ON dbo.zoom.time = dbo.timee.time  INNER JOIN dbo.std_crs ON dbo.zoom.crs_id = dbo.std_crs.courseCode WHERE (dbo.std_crs.std_id = @std_id) ORDER BY dbo.days.id, dbo.timee.id">
            <SelectParameters>
                <asp:SessionParameter Name="std_id" SessionField="log" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
     <hr/>
    <br/>
    <br/>
    <br/>
    <div class="row">
        
         <div class="col-sm-4 col-md-4">
             <br/>
               <iframe runat="server" id="fram" width="100%" height="315" src="https://www.youtube.com/embed/PEryKdNB5F0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
   
             </div>
        <div class="col-sm-4 col-md-4">
            <br/>
  <iframe runat="server" id="fram1" width="100%" height="315" src="https://www.youtube.com/embed/ZOGbP_d5Ssg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
   
             </div>
        <div class="col-sm-4 col-md-4">
            <br/>
<iframe runat="server" id="fram2" width="100%" height="315" src="https://www.youtube.com/embed/6avXeZjm7oE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
   
             </div>

    </div>
    <div class="row">
        <div id="pulsate-regular" style="border-color:red;color: red;"  class="col-sm-12 col-md-12">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-exclamation-sign	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Instructor/HELP.aspx">ارشادات عامة</asp:HyperLink>
                </h4>
                <p class="text-justify">
                  ارشادات عامة عن كيفية استخدام بوابة التعليم الالكتروني الخاصة بجامعة الاسراء
                </p>
            </div>
        </div>
       <%-- <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Instructor/OverVeiw.aspx">نبذة عن المساق </asp:HyperLink>
                </h4>
                <p class="text-justify">
                    نبذة عامة عن المساق واهدافة واستراتيجيات التدريس ومعلومات اخرى 
                </p>
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-road	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Instructor/Syllbus.aspx">وصف المساق</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    وصف المساق اسبوعيا وكل تفاصيل الخاصة بة 
                </p>
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-book	"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Instructor/books.aspx">كتاب المساق</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    الكتاب المعتمد للتدريس
                </p>
            </div>
        </div>--%>
        
    </div>
     <div class="row">
         <hr />
         </div>
    <%--<div class="row">
        <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Instructor/Files.aspx">ملف</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    تتيح الملفات للمعلم توفير ملف كمورد للمواد التعليمية
                </p>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Instructor/HomeWork.aspx">واجب</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    تُمكِّن الواجب المعلم من توصيل المهام وجمع العمل وتوفير الدرجات والتعليقات.
                </p>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-flag"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Instructor/Announcements.aspx">إعلان</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    وضع اعلانات للطلبة اسبوعيا للتواصل معهم باخبار المساق والمواعيد التي طرأ عليها تغيرات 
                </p>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Instructor/Links.aspx">رابط</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    تتيح الروابط للمعلم للمدرس توفير رابط ويب كمورد للمواد. يمكن ربط أي شيء متاح مجانًا عبر الإنترنت ، مثل المستندات أو الصور
                </p>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-facetime-video"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Instructor/vids.aspx">فيديو</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    تتيح الفيديوهات للمعلم للمدرس توفير فيديو على اليوتيوب كمورد للمواد.
                </p>
            </div>
        </div>
          <div class="col-sm-4 col-md-4">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/Instructor/Dialog.aspx">حوار نقاش</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    تتيح الحوار  للمدرس فتح نقاش مع الطلبة واستقبال الردود على  موضوع يتم طرحة ويغلق بموعد.
                </p>
            </div>
        </div>
          <div class="col-sm-4 col-md-4">
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
        </div>

    </div>--%>
</asp:Content>

