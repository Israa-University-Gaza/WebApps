<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMessage.aspx.cs" Inherits="SendMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="direction:rtl">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <div>
                    <asp:DropDownList ID="ddlSendTo" runat="server">
                        <asp:ListItem Text="الكل" Value="0" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="محمد مشتهى" Value="9"></asp:ListItem>
                        <asp:ListItem Text="محمد التركماني" Value="12"></asp:ListItem>
                        <asp:ListItem Text="أحمد أبو جمعة" Value="2016"></asp:ListItem>
                        <asp:ListItem Text="رمزي حمدان" Value="14"></asp:ListItem>
                    </asp:DropDownList>
                     <br />
                    <asp:RadioButtonList ID="rblMsgType" runat="server">
                        <asp:ListItem Text="Success" Value="success" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Info" Value="info"></asp:ListItem>
                        <asp:ListItem Text="Warning" Value="warning"></asp:ListItem>
                        <asp:ListItem Text="Error" Value="error"></asp:ListItem>
                    </asp:RadioButtonList>
                     <br />
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Rows="5" Columns="50"></asp:TextBox><br />
                    <br />
                    <asp:Button ID="btnSend" runat="server" Text="إرسال الرسالة" class="btn green" OnClick="btnSend_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
