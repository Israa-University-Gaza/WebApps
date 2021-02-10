<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Stat_Departments.aspx.cs" Inherits="Instructor_Stat_Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
              <div class="col-sm-5 col-md-5">
            <div class="form-group">
                <label>الكلية </label>

                <asp:DropDownList ID="coll" CssClass="form-control" runat="server" OnDataBound="DropDownList1_DataBound" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [COLL]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="coll" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            </div>
                  </div>
            <div class="col-sm-5 col-md-5">
            <div class="form-group">
                <label>التخصص </label>

                <asp:DropDownList ID="dept" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="dept" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [DEPT] WHERE ([coll_id] = @coll_id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="coll" Name="coll_id" PropertyName="SelectedValue" Type="Double" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </div>
                  </div>
            <div class="col-sm-2 col-md-2">
            <div class="form-group">
                <asp:Button ID="Button1" CssClass="btn-success" runat="server" Text="عرض" OnClick="Button1_Click" />
            </div>
                  </div>
             
                </div>
     <br />
                        
                     


    <hr/>
    <br>
   <div class="row">

   </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" Font-Size="Smaller">
                         <Columns>
                             <asp:BoundField DataField="courseDepartment" HeaderText="القسم" SortExpression="courseDepartment" />
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
                                             <asp:BoundField DataField="departmentArName" HeaderText="القسم" SortExpression="departmentArName" Visible="False" />
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
   
</asp:Content>

