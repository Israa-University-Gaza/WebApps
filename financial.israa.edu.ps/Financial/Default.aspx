<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Financial_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:LinkButton ID="lbFinancialStatistic1" runat="server" OnClick="lbFinancialStatistic1_Click">كشف مالية رقم 1</asp:LinkButton><br />

<a href="https://api.israa.edu.ps/students/printVouchersMain.php" target="_blank">التقارير الشهرية</a>

</asp:Content>