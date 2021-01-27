<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="AttImportScript.aspx.cs" Inherits="Attendance_AttImportScript" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
         $('document').ready(function () {
             $('.page-sidebar-menu li').removeClass("active");
             $('#menu4').addClass("active");
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i><a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="AttImportScript.aspx" class="font-ha">استيراد ملف الدوام يوميا  </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
       <asp:FileUpload ID="FileUpload1" runat="server"  />
    <asp:Button ID="btnUpload" runat="server" class="btn green col-md-2" Text="استيراد ملف الداوم"
            OnClick="btnUpload_Click" />
</asp:Content>

