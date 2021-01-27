<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportView.aspx.cs" Inherits="ReportView" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="../assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script lang="JavaScript">
        $('document').ready(function () {
          
            $('.w').click(function () {
                //$('.w').hide();
                window.print();
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
     <%--  <asp:Button class="s" ID="Button1" runat="server" Text="pdf" OnClick="Button1_Click1" />--%>
        
     <%--   <input class="w" type="button" value="طباعة" onclick="x()">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        


       

    </form>
</body>
</html>
