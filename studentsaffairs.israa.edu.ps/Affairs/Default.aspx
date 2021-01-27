<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Affairs_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#mainmenu').addClass("active open");
            $('#mainmenu a').css("background-color", "#575757");
            $('#mainmenu a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <h1>شؤون الطلاب - مرحبًا</h1>
</asp:Content>
