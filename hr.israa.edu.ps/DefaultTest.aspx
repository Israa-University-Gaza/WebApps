<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultTest.aspx.cs" Inherits="DefaultTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" ></asp:DropDownList>
        <asp:TextBox ID="TextBox1" runat="server" Text="2015"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />


        <asp:GridView ID="GridView1" runat="server" ></asp:GridView>
   
    </div>
    </form>
</body>
</html>
