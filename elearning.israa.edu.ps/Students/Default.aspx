<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        table * {
            text-align: center;
        }
    </style>
   <%--<script>
    $(document).ready(function(){
        $("#exampleModal").modal('show');
    });
</script>--%>
     
    <div class="modal fade" id= 'exampleModal' tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          
        <h5 class="modal-title" id="exampleModalLabel"> إعلان هام </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div style="color:red;text-align:center">
 <span style="color:red;text-align:center">اعلان هام</span>
          </div>
         
          <br/>
      <span>
الطلبة الأعزاء سيتم اليوم عقد امتحان تجريبي عبر بوابة الامتحانات الإلكترونية بغرض التدريب على نمط الامتحانات النهائية
<br/>
الساعة السابعة مساء عبر الرابط التالي
<br/>


<a href="https://moodle.israa.edu.ps/mod/quiz/view.php?id=6711" target="_blank">https://moodle.israa.edu.ps/mod/quiz/view.php?id=6711</a>

<br/>
<div style="
    direction: ltr;
"> 
    </div>
دائرة التعليم الالكتروني 
    </span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-danger"  data-dismiss="modal">إغلاق</button>

         
      </div>
    </div>
  </div>
</div>
   <iframe runat="server" id="mood"  style="width: 0px;height: 1px;"></iframe>
    <div class="row">
    
        </div>
    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp; اهلا
                <asp:Label ID="f_name" runat="server" Text=""></asp:Label>
                ! </h4>
            <p class="text-justify">
                يمكنكم مشاهدة الانشطة التي تم وضعها من قبل المحاضرين بالضغط على المواد الدراسية في القائمة           
            </p>
        </div>
    </div>
     <div class="row">
         <div class="col-sm-6 col-md-6">
               <iframe runat="server" id="fram" width="100%" height="315" src="https://www.youtube.com/embed/ySwjwkazm4M" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
   
             </div>
           <div class="col-sm-6 col-md-6">
               <iframe runat="server" id="Iframe1" width="100%" height="315" src="https://www.youtube.com/embed/HNoI3T7M2PQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
   
             </div>
        
    </div>
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink3" runat="server">الكلية</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="coll" runat="server" Text=""></asp:Label>
                </p>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server">القسم</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="dept" runat="server" Text=""></asp:Label>
                </p>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-flag"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server">البرنامج</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="prod" runat="server" Text=""></asp:Label>
                </p>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <%--<div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink7" runat="server">المعدل</asp:HyperLink>
                </h4>
                <p class="text-justify">


                    <asp:Label ID="gpa" runat="server" Text=""></asp:Label>
                </p>
            </div>--%>
        </div>

    </div>



    <div   class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;    جدول المحاضرات الافتراضية عبر تقنية ال zoom للفصل الدراسي  الثاني للعام الجامعي 2020/2021 </h4>
            <span style="color:red"> لجميع المساقات  Pass Code=123456 </span>
           <br/>
             
        </div>
        <div class="row">
              <div   class="col-sm-12 col-md-12">
        <div class="well">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" text-align="center"  OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSource1" Width="100%" AllowSorting="True" CellPadding="10" CellSpacing="3" ForeColor="#333333" HorizontalAlign="Center" CssClass="table-bordered" Height="220px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="day" HeaderText="اليوم" SortExpression="day" />
                <asp:BoundField DataField="courseCode" HeaderText="رقم المساق" SortExpression="courseCode" />
                <asp:BoundField DataField="crs_name" HeaderText="اسم المساق" SortExpression="crs_name" />
                <asp:TemplateField HeaderText="المحاضر">
                    <ItemTemplate>
                        <asp:Label ID="lec" runat="server" style="font-size: 10px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="mettingID" SortExpression="mettingID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("mettingID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div style="direction:initial">
   <asp:Label ID="Label1" runat="server" Text='<%# Bind("mettingID") %>'></asp:Label>
                        </div>
                     
                   
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
                        <asp:HyperLink ID="HyperLink8" runat="server" CssClass="bg-danger" NavigateUrl='<%# Eval("url") %>'>الانتقال الى منصة  Zoom</asp:HyperLink>
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
            </div>
                  </div>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT distinct dbo.days.id, dbo.timee.id, dbo.std_crs.courseCode, dbo.zoom.crs_name, dbo.zoom.url, dbo.zoom.mettingID, dbo.zoom.time, dbo.zoom.day, dbo.zoom.section, dbo.std_crs.sectionid FROM dbo.days INNER JOIN dbo.zoom ON dbo.days.day = dbo.zoom.day INNER JOIN dbo.timee ON dbo.zoom.time = dbo.timee.time INNER JOIN dbo.std_crs ON dbo.zoom.crs_id = dbo.std_crs.courseCode WHERE (dbo.std_crs.std_id = @std_id)  and std_crs.sectionNum=zoom.section ORDER BY dbo.days.id, dbo.timee.id">
            <SelectParameters>
                <asp:SessionParameter Name="std_id" SessionField="log" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>








    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp; محاضرين الفصل الدراسي  الحالي </h4>

        </div>
        <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
            <ItemTemplate>
                <div class="col-sm-4 col-md-4">
                    <div class="well">
                        <h4><span style="font-size: 14px;" class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server"><%# Eval("arName") %></asp:HyperLink>
                        </h4>
                        <p class="text-justify">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="~/assets/mmm.png" ImageWidth="40px" Text="مراسلة" ToolTip="ارسال رسالة"></asp:HyperLink>
<%--          <span style="font-size: 18px; color:red"   class="glyphicon glyphicon-send"><asp:HyperLink ID="HyperLink5" runat="server"></asp:HyperLink></span> --%>

                             
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <div class="col-sm-3 col-md-3">
        <div class="well">
            <h4>&nbsp;&nbsp;
            </h4>
            <p class="text-justify">
               
            </p>
        </div>
    </div>
    <script>
                    function openDetailsWindow2(serNo) {
                       
                        
                        var win = window.open('SendMassege.aspx?id=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=800,height=570');
                       
                    }
                    $(document).ready(function () {
                        $('#example').dataTable(); setColumnLabel('example');
                    });
                </script>



</asp:Content>

