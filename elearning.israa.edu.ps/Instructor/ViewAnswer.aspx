<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAnswer.aspx.cs" Inherits="Instructor_ViewAnswer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
     <div class="form-group" style="text-align: center">
            <label>الاجابة   </label>
      <div>

 <asp:Label ID="det" runat="server" ></asp:Label>        
    </div>
      
        </div>
        <hr/>
        <div class="form-group" style="text-align: center">
            <label>التقييم   </label>
      <div>

          <strong>

          <asp:TextBox ID="TextBox1" runat="server" Font-Size="X-Large" ForeColor="Red" Height="55px" TextMode="Number" Width="102px"></asp:TextBox>       
          </strong>       
    </div>
      
        </div>

        <asp:Button ID="Button1" CssClass="btn-danger" runat="server" Text="تققيم " BackColor="Red" ForeColor="White" OnClick="Button1_Click" Width="40px" />
    </div>
    </form>
</body>
</html>
