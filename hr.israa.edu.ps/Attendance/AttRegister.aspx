<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="AttRegister.aspx.cs" Inherits="Attendance_AttRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu4').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i><a href="../APP_HRM/Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="AttRegister.aspx" class="font-ha">تسجيل الحضور </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">

            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>تسجيل الحضور</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>


                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label" id="Label1" runat="server">الفرع</label>
                            <div class="col-md-4">
                                <asp:RadioButtonList ID="rblBranch" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">يافا</asp:ListItem>
                                        <asp:ListItem Value="2">الزهراء</asp:ListItem>
                                    </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label" id="msg" runat="server"></label>
                            <div class="col-md-4">

                                <asp:Button ID="Button1" class="btn green" runat="server" Text="تسجيل الحضور"  Visible="true"  OnClick="Button1_Click"/>
                                <asp:Button ID="Button2" class="btn green" runat="server" Text="تسجيل الانصراف" Visible="true" OnClick="Button2_Click"/>

                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

