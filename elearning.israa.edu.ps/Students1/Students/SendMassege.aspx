<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMassege.aspx.cs" ValidateRequest="false" Inherits="Students_SendMassege" %>
<%@ Register TagPrefix="RTE" Namespace="RTE" Assembly="RichTextEditor" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" type="text/css" href="../temp_files/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../temp_files/bootstrap-rtl.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div id="mas" runat="server" >
        <h4 style="text-align:center">مراسلة المحاضر: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h4>
 <div class="row" style=" padding-right: 24px;">
          <div class="form-group">
                    <label>المرسل </label>
        <asp:TextBox ID="sender1" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                    </div>
         <div class="form-group">
                    <label>عنوان الرسالة </label>
        <asp:TextBox ID="title" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="title" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ></asp:RequiredFieldValidator>
                </div>
        <div class="form-group">
                    <label>نص الرسالة </label>
           <RTE:Editor runat="server" ID="Editor2" ContentCss="example.css" Height="200px" Skin="officexpblue" Toolbar="email" />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Editor2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ></asp:RequiredFieldValidator>
                </div>
     </div>
         <div style="text-align:center">
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text=" ارسال " OnClick="Button1_Click" />
        <br/>
         <br/>
        <hr/>
        </div>
    </div>
        <div runat="server" id="Done" style="text-align: -webkit-center;" class="well">

                <asp:Image ID="Image1" ImageUrl="~/assets/true.png" runat="server" />
                <h3>تم ارسال الرسالة بنجاح</h3>
                <asp:Button ID="Button2" CssClass="btn-danger" runat="server" Text="اغلاق " BackColor="Red" ForeColor="White" OnClick="Button2_Click" Width="40px" />
     </div>
    </form>
</body>
</html>
