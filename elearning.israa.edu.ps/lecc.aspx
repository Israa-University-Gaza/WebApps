<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="lecc.aspx.cs" EnableEventValidation="true"  Inherits="Instructor_lecc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="row">
                <div class="col-sm-2 col-md-2">&nbsp;</div>

                <div class="col-sm-12 col-md-12">
                    
                          <div class="form-group">
                <label>الكلية </label>
                              
                              <asp:DropDownList ID="all" CssClass="form-control" runat="server" AutoPostBack="True" Visible="False">
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
            
        </asp:DropDownList>
                              <asp:DropDownList ID="d275" CssClass="form-control" runat="server" AutoPostBack="True" Visible="False">
           
            <asp:ListItem Value="2">الحقوق</asp:ListItem>
          
        </asp:DropDownList>

                
            </div>
                 <div class="col-sm-12 col-md-12">
        <div class="well">
              <h4><span style="font-size: 18px;" class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp; محاضرين الفصل الدراسي  الحالي </h4>
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
                  

    </div>

                    
   <%-- </form>--%>

    </div>
            <div class="col-sm-2 col-md-2">
            </div>
    </div>
       <hr/>
                     <br>
                     <div class="row">
                        
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
                         <Columns>
                             <asp:BoundField DataField="employeeNo" HeaderText="رقم المحاضر" SortExpression="employeeNo" />
                             <asp:BoundField DataField="instructor" HeaderText="المحاضر" SortExpression="instructor" />
                             <asp:BoundField DataField="lastLogin" HeaderText="اخر تسجيل دخول" SortExpression="lastLogin" />
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
                                  <a class="btn-danger" href='javascript:openDetailsWindow1("<%# Eval("employeeNo") %> ")'>عرض التفاصل</a>
                                      </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                         </asp:GridView>

                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [test]"></asp:SqlDataSource>
                         <hr/>
                     </div>

</asp:Content>

