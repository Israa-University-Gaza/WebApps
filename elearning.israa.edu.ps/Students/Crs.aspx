<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage.master" AutoEventWireup="true" CodeFile="Crs.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server"> المحاضر  </asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="lec" runat="server" Text="لا يوجد"></asp:Label>                </p>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server">رقم المساق </asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="c_code" runat="server" Text="لا يوجد"></asp:Label>                </p>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink3" runat="server">اسم المساق </asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="c_name" runat="server" Text="لا يوجد"></asp:Label>                </p>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server">رقم الشعبة </asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="section" runat="server" Text="لا يوجد"></asp:Label>                </p>
            </div>
        </div>
    </div>

    <div class="row">
        
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;<asp:HyperLink ID="OverVeiwL" runat="server">نبذة عن المساق </asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="OverVeiw" runat="server" Text="لا يوجد"></asp:Label>                </p>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-road	"></span>&nbsp;&nbsp;<asp:HyperLink ID="SyllbusL" runat="server">وصف المساق</asp:HyperLink>
                </h4>
                <p class="text-justify">
                   <asp:Label ID="Syllbus" runat="server" Text="لا يوجد"></asp:Label> 
                </p>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-book	"></span>&nbsp;&nbsp;<asp:HyperLink ID="bookL" runat="server" NavigateUrl="~/Instructor/books.aspx">كتاب المساق</asp:HyperLink> </h4>
                <p class="text-justify">
                <asp:Label ID="book" runat="server" Text="لا يوجد"></asp:Label>
                </p>
            </div>
        </div>
              <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-briefcase	"></span>&nbsp;&nbsp;<asp:HyperLink ID="h1" runat="server">تقرير الواجبات</asp:HyperLink> </h4>
               
            </div>
        </div>
        
    </div>
   
       <asp:Repeater ID="Repeater" runat="server"  DataSourceID="SqlDataSource1" OnItemDataBound="Repeater_ItemDataBound" OnItemCommand="Repeater_ItemCommand" >
          <ItemTemplate>

           
               <div class="col-sm-6 col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 style="font-family:Tahoma"><span style="font-size: 18px;display: inline-block;" class="glyphicon glyphicon-fullscreen"></span>&nbsp;&nbsp;
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("startdate") %>' />
                                  <asp:Label ID="Label1" runat="server" Text='إلى' ForeColor="Red" />
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("enddate") %>' />
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
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"   Width="15px" Height="15px" runat="server" /><%# Eval("title") %><span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='ViewFile.aspx?id=<%# Eval("id")%>'> التفاصيل...</a></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                          <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"  ImageUrl="~/assets/icon.svg"  Width="15px" Height="15px" runat="server" /><%# Eval("title") %><span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='ViewAnnouncements.aspx?id=<%# Eval("id")%>'> التفاصيل...</a></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                          <asp:Repeater ID="Repeater3" runat="server" OnItemDataBound="Repeater3_ItemDataBound">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"  ImageUrl="~/assets/homework.png"  Width="25px" Height="20px" runat="server" />واجب<span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='Viewhomework.aspx?id=<%# Eval("id")%>'> التفاصيل...</a></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="Repeater4" runat="server">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"  ImageUrl="~/assets/links.png"  Width="25px" Height="20px" runat="server" /><%# Eval("title") %><span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='Viewlink.aspx?id=<%# Eval("id")%>'> التفاصيل...</a></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="Repeater5" runat="server">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"  ImageUrl="~/assets/video.png"  Width="25px" Height="20px" runat="server" /><%# Eval("title") %><span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='ViewVideo.aspx?id=<%# Eval("id")%>'> التفاصيل...</a></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="Repeater6" runat="server">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"  ImageUrl="~/assets/discussion.png"  Width="25px" Height="20px" runat="server" /> نقاش <span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='ViewDialog.aspx?id=<%# Eval("id")%>'> التفاصيل...</a></li>
                                         
                                                 </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="Repeater7" runat="server">
                                            <ItemTemplate>
                                                <li style=""  class="news-item"> <asp:Image ID="Image1"  ImageUrl="~/assets/quiz.png"  Width="25px" Height="27px" runat="server" /> <%# Eval("title") %> <span style="color:red"> <%# Eval("EnterDate").ToString().Split(' ')[0] %></span>  <a href='ViewExam.aspx?id=<%# Eval("id")%>'> التفاصيل...</a></li>
                                         
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
    
     
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [e_crs_week] where sem=(select top 1 semester_id from e_semester)"></asp:SqlDataSource>


</asp:Content>

