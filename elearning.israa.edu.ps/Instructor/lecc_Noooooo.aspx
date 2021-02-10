<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="lecc.aspx.cs" EnableEventValidation="true"  Inherits="Instructor_lecc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="row">
                <div class="col-sm-2 col-md-2">&nbsp;</div>

                <div class="col-sm-12 col-md-12">
                    
                          <div class="form-group">
                <label>الكلية </label>
                              
                              <asp:DropDownList ID="all" CssClass="form-control" runat="server" AutoPostBack="True" Visible="False">
                                   <asp:ListItem Value="1">متطلبات الجامعة</asp:ListItem>
                                  <asp:ListItem Value="7">متطلبات الجامعة 1</asp:ListItem>
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
                              <asp:DropDownList ID="d127" CssClass="form-control" runat="server" AutoPostBack="True" Visible="False">
           
            <asp:ListItem Value="3">المهن الصحية</asp:ListItem>
            
        </asp:DropDownList>
                              <asp:DropDownList ID="d110" CssClass="form-control" runat="server" AutoPostBack="True" Visible="False">
            <asp:ListItem Value="9">الإدارة دبلوم</asp:ListItem>
           
            <asp:ListItem Value="4">كلية العلوم الإدارية والمالية</asp:ListItem>
           
        </asp:DropDownList>
                              <asp:DropDownList ID="d269" CssClass="form-control" runat="server" AutoPostBack="True" Visible="False">
         
           
            <asp:ListItem Value="8">العلوم الهندسية</asp:ListItem>
            <asp:ListItem Value="5">كلية الهندسة</asp:ListItem>
            <asp:ListItem Value="10">كلية نظم المعلومات</asp:ListItem>
            <asp:ListItem Value="11">نظم المعلومات</asp:ListItem>
        </asp:DropDownList>
                              <asp:DropDownList ID="d8118" CssClass="form-control" runat="server" AutoPostBack="True" Visible="False">
           
            <asp:ListItem Value="6">العلوم الانسانية</asp:ListItem>
                                     <asp:ListItem Value="1">متطلبات الجامعة</asp:ListItem>
                                  <asp:ListItem Value="7">متطلبات الجامعة 1</asp:ListItem>
            
        </asp:DropDownList>
                              <asp:DropDownList ID="d275" CssClass="form-control" runat="server" AutoPostBack="True" Visible="False">
           
            <asp:ListItem Value="2">الحقوق</asp:ListItem>
          
        </asp:DropDownList>

                
            </div>
                 <div class="col-sm-12 col-md-12">
        <div class="well">
              <h4><span style="font-size: 18px;" class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp; محاضرين الفصل الدراسي  الحالي </h4>
             
        </div>
                  <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound" >
                                <ItemTemplate>
            <div class="col-sm-4 col-md-4" style="
    height: 142px;
">
            <div class="well">
                <h4><span style="font-size: 14px;" class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server"><%# Eval("instructor") %></asp:HyperLink>
                </h4>
           
 <asp:Label ID="last" runat="server"  Text=<%# Eval("lastLogin") %>></asp:Label>
                <p class="text-justify">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </p>
                 <span style="font-size: 14px;" class="glyphicon glyphicon-file"> <asp:Label ID="files" ToolTip="ملفات"  runat="server" Text="" Font-Size="Large"></asp:Label></span>
                 <span  style="font-size: 14px;" class="glyphicon glyphicon-paperclip"> <asp:Label ID="homeworks" ToolTip="واجبات" runat="server" Text=""></asp:Label></span>
                 <span  style="font-size: 14px;" class="glyphicon glyphicon-flag">  <asp:Label ID="Announcements" ToolTip="اعلانات" runat="server" Text=""></asp:Label> </span>
                 <span style="font-size: 14px;" class="glyphicon glyphicon-link"> <asp:Label ID="links" runat="server"  ToolTip="روابط" Text=""></asp:Label> </span>
                 <span  style="font-size: 14px;" class="glyphicon glyphicon-facetime-video"><asp:Label ID="videos" ToolTip="فيدوهات" runat="server" Text=""></asp:Label> </span>
            <span  style="font-size: 14px;" class="glyphicon glyphicon-equalizer">          <asp:Label ID="dis" ToolTip="مناقشات" runat="server" Text=""></asp:Label> </span>
           
            </div>
        </div>
             
                </ItemTemplate>
                            </asp:Repeater>

    </div>

                    
   <%-- </form>--%>

    </div>
            <div class="col-sm-2 col-md-2">
            </div>
    </div>
       <hr/>
                     <br>
                     

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <div class="row" runat="server" style="font-size:8pt ;padding-right: 25px;">
                        
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" Font-Size="Smaller">
                         <Columns>
                             <asp:BoundField DataField="instructor" HeaderText="المحاضر" SortExpression="instructor" />
                             <asp:TemplateField HeaderText="المساقات">
                                 <ItemTemplate>
                                     <asp:Label ID="Label3" runat="server" Text='<%# Eval("employeeNo") %>' Visible="False"></asp:Label>
                                     <div style="text-align:center">
                                         <asp:GridView text-align="Center" ID="g2" runat="server" Font-Size="10pt"  AutoGenerateColumns="False" OnRowDataBound="g2_RowDataBound" HorizontalAlign="Center">
                                         <Columns>
                                             <asp:BoundField DataField="courseCode" HeaderText="رقم المساق" SortExpression="courseCode" />
                                             <asp:BoundField DataField="courseArName" HeaderText="اسم المساق" SortExpression="courseArName" />
                                             <asp:BoundField DataField="sectionNum" HeaderText="الشعبة" SortExpression="sectionNum" />
                                                  <asp:TemplateField HeaderText="ع.طلاب">
                                     <ItemTemplate>
                                         <asp:Label ID="sec" runat="server" Text="Label"></asp:Label>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="مشاهدات ">
                                     <ItemTemplate>
                                         <asp:Label ID="viwe" runat="server" Text="Label"></asp:Label>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                             <asp:TemplateField HeaderText="ملفات">
                                                 <ItemTemplate>
                                                     <asp:Label ID="files_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="واجبات">
                                                 <ItemTemplate>
                                                     <asp:Label ID="homework_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="اعلانات">
                                                 <ItemTemplate>
                                                     <asp:Label ID="Announcements_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="روابط">
                                                 <ItemTemplate>
                                                     <asp:Label ID="link_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="فيديوهات">
                                                 <ItemTemplate>
                                                     <asp:Label ID="vedio_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="مناقشات">
                                                 <ItemTemplate>
                                                     <asp:Label ID="dis_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="المجموع">
                                                 <ItemTemplate>
                                                     <asp:Label ID="total_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         </Columns>
                                     </asp:GridView></div>
                                     
                                 </ItemTemplate>
                                 <ItemStyle Width="40%" />
                             </asp:TemplateField>
                             <asp:BoundField DataField="lastLogin" HeaderText="اخر تسجيل دخول" SortExpression="lastLogin" >
                             <ItemStyle Width="2%" />
                             </asp:BoundField>
                             <asp:TemplateField HeaderText="ملفات">
                                 <FooterTemplate>
                                     <asp:Label ID="t_files" runat="server" Text="Label" ForeColor="Red" style="font-weight: 700"></asp:Label>
                                 </FooterTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="files1" runat="server" Text="Label"></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="واجبات">
                                 <FooterTemplate>
                                     <asp:Label ID="t_homeworks" runat="server" Text="Label" ForeColor="Red" style="font-weight: 700"></asp:Label>
                                 </FooterTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="homeworks1" runat="server" Text="Label"></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="اعلانات">
                                 <FooterTemplate>
                                     <asp:Label ID="t_Announcements" runat="server" Text="Label" ForeColor="Red" style="font-weight: 700"></asp:Label>
                                 </FooterTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="Announcements1" runat="server" Text="Label"></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="روابط">
                                 <FooterTemplate>
                                     <asp:Label ID="t_links" runat="server" Text="Label" ForeColor="Red" style="font-weight: 700"></asp:Label>
                                 </FooterTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="links1" runat="server" Text="Label"></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="فيدوهات">
                                 <FooterTemplate>
                                     <asp:Label ID="t_videos" runat="server" Text="Label" ForeColor="Red" style="font-weight: 700"></asp:Label>
                                 </FooterTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="videos1" runat="server" Text="Label" ></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="مناقشات">
                                 <FooterTemplate>
                                     <asp:Label ID="t_dis" runat="server" Text="Label" ForeColor="Red" style="font-weight: 700"></asp:Label>
                                 </FooterTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="dis" runat="server" Text="Label" ></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="المجموع">
                                 <FooterTemplate>
                                     <asp:Label ID="tot" runat="server" Text="Label" ForeColor="Blue" style="font-weight: 700" BorderColor="Blue" Font-Size="Larger"></asp:Label>
                                 </FooterTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="total" runat="server" Text="Label" ForeColor="#009933" style="font-weight: 700"></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="تفاصيل">
                                 <ItemTemplate>
                                     <%--<asp:Button ID="Button1" runat="server"  CssClass="btn-danger" OnClick="Button1_Click" Text="عرض التفاصل" CommandArgument='<%# Eval("employeeNo") %>' />--%>
                                  <a class="btn-danger" href='javascript:openDetailsWindow1("<%# Eval("employeeNo") %> ")'>عرض التفاصيل</a>
                                      </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                         </asp:GridView>

                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [test]"></asp:SqlDataSource>
                         <hr/>
                     </div>
    <div style="text-align:center">
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text=" تحميل التقرير Excel" OnClick="Button1_Click1" />
        <br/>
         <br/>
        </div>
</asp:Content>



