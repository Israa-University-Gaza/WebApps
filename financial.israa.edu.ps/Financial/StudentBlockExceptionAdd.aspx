<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="StudentBlockExceptionAdd.aspx.cs" Inherits="Financial_StudentBlockExceptionAdd" %>

<%@ Register Src="~/Financial/UserControl/StudentMenu.ascx" TagPrefix="uc1" TagName="StudentMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Students').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ChangePassword.aspx" class="font-ha">الطالب
        </a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>

    <div class="col-md-12">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div style="width: 19%; float: right;">
                        <uc1:StudentMenu runat="server" ID="StudentMenu" />
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="form-horizontal">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>فتح صفحة الطالب</h4>
                                    </div>
                                    <div class="col-md-9 isra-pl-0">
                                        <div id="divMsg" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                            <asp:Label ID="lblMsg" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                            <div style="clear: both"></div>
                                        </div>
                                    </div>
                                </div>
                                <hr style="margin: 10px 0 15px 0" />
                                <div class="row">
                                    <%--<div class="not not-info">

                                    </div>--%>
                                    <div class="col-md-12">
                                        <label class="col-md-2">الفصل : </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataTextField="ArName" DataValueField="ID" ></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="Select ID, ArName From Semester Where ID<>1 and IsDelete=0 ORDER BY id DESC"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="col-md-2">ملاحظة : </label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtNote" TextMode="MultiLine" runat="server"  CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-offset-2 col-md-4">
                                            <asp:Button ID="btnStudentBlock" runat="server" CssClass="btn blue btn btn-rounded default" OnClick="btnStudentBlock_Click" Text="فتح الصفحة"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

