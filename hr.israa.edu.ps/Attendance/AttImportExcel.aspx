<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="AttImportExcel.aspx.cs" Inherits="Attendance_AttImportExcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="btnUpload" runat="server" Text="استيراد اكسل الداوم"
            OnClick="btnUpload_Click" />
  
</asp:Content>

