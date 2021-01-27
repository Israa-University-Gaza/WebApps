<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="APP_HRM_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ChangePassword.aspx" class="font-ha">تغيير كلمة المرور</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        <asp:Label ID="lblEmpID" runat="server" Visible="false"></asp:Label>
    <div class="row">
    <div class="col-md-12">
                <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> تغيير كلمة المرور </div>
                    <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                        <div class="form-horizontal">
                            <div class="form-body">
                                <div class="row">
                                   
                                    <div class="col-md-8 isra-pl-0">
                                        <div id="divMsg" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                            <asp:Label ID="lblMsg" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                            <div style="clear: both"></div>
                                        </div>
                                    </div>
                                </div>
                                <hr style="margin: 10px 0 15px 0" />
                                <div class="form-group">
                                    <label class="col-md-3 control-label">كلمة المرور القديمة :</label>
                                    <div class="col-md-5">
                                        <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control" autocomplete="off" placeholder="الرجاء ادخال كلمة المرور القديمة" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">كلمة المرور الجديدة :</label>
                                    <div class="col-md-5">
                                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" autocomplete="off" placeholder="الرجاء ادخال كلمة المرور الجديدة" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">تأكيد كلمة المرور :</label>
                                    <div class="col-md-5">
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" autocomplete="off" placeholder="الرجاء ادخال تأكيد كلمة المرور" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3"></label>
                                    <div class="col-md-5">
                                        <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click"  />
                                        <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

    </div></div></div>
</asp:Content>

