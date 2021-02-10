<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lec_display.aspx.cs" Inherits="Instructor_lec_display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" href="../temp_files/libStyle.css"/>
    <link rel="stylesheet" type="text/css" href="../temp_files/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../temp_files/bootstrap-rtl.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <asp:Image ID="Image1" runat="server" ImageUrl="http://hr.israa.edu.ps/images/logo.png" />
        <asp:Label ID="Label1" runat="server" Text="Label" style="font-size: 12pt"></asp:Label>
        <hr />
    <asp:gridview runat="server" ID="g2" AutoGenerateColumns="False" CssClass="table" OnRowDataBound="g2_RowDataBound">
                             <Columns>
                                 <asp:BoundField DataField="courseCode" HeaderText="رقم المساق" SortExpression="courseCode" />
                                 <asp:BoundField DataField="courseArName" HeaderText="اسم المساق" SortExpression="courseArName" />
                                 <asp:BoundField DataField="collegeArName" HeaderText="الكلية" SortExpression="collegeArName" />
                                 <asp:BoundField DataField="departmentArName" HeaderText="القسم" SortExpression="departmentArName" />
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
                         </asp:gridview>
    </div>
        <hr/>
        <asp:Button ID="Button1" CssClass="btn-danger" runat="server" Text="اغلاق " BackColor="Red" ForeColor="White" OnClick="Button1_Click" Width="40px" />
    </form>
</body>
</html>
