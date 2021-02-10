<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Stat.aspx.cs" Inherits="Instructor_Stat" %>

<%-- Add content controls here --%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="font-size:medium;text-align: center;">

    
    <asp:gridview runat="server" ID="g2" AutoGenerateColumns="False" CssClass="table" OnRowDataBound="g2_RowDataBound" Font-Size="Small" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                             <AlternatingRowStyle BackColor="White" />
                             <Columns>
                                 <asp:BoundField DataField="courseCode" HeaderText="رقم المساق" SortExpression="courseCode" />
                                 <asp:BoundField DataField="courseArName" HeaderText="اسم المساق" SortExpression="courseArName" />
                                 <asp:BoundField DataField="collegeArName" HeaderText="الكلية" SortExpression="collegeArName" />
                                 <asp:BoundField DataField="departmentArName" HeaderText="القسم" SortExpression="departmentArName" />
                                 <asp:BoundField DataField="sectionNum" HeaderText="الشعبة" SortExpression="sectionNum" />
                                 <asp:TemplateField HeaderText="الفرع" SortExpression="branchId">
                                     <EditItemTemplate>
                                         <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("branchId") %>'></asp:TextBox>
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:Label ID="branch" runat="server" Text='<%# Bind("branchId") %>'></asp:Label>
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
                             <FooterStyle BackColor="#CCCC99" />
                             <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                             <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                             <RowStyle BackColor="#F7F7DE" />
                             <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                             <SortedAscendingCellStyle BackColor="#FBFBF2" />
                             <SortedAscendingHeaderStyle BackColor="#848384" />
                             <SortedDescendingCellStyle BackColor="#EAEAD3" />
                             <SortedDescendingHeaderStyle BackColor="#575357" />
                         </asp:gridview>
        </div>
    <div style="text-align:center">
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text=" تحميل التقرير Excel" OnClick="Button1_Click1" />
        <br/>
         <br/>
        <hr/>
        </div>
    </asp:Content>