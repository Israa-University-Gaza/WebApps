<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
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
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
