<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Instructor_ChangePassword" %>

<asp:Content ID="Style" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Script" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>تغير كلمة المرور</span>
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="caption">
                        <i class=" icon-layers font-red"></i>
                        <span class="caption-subject font-red uppercase font-ha">تغير كلمة المرور</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <asp:Label ID="Label2" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="form-body">
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <div id="divMsg" runat="server" class="alert alert-warning" visible="false">
                                        <asp:Label ID="lblMsg" runat="server" Style="font-weight: bold; float: right;" ClientIDMode="Static"></asp:Label>
                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">كلمة المرور القديمة :</label>
                                <div class="col-md-5">
                                    <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control" placeholder="الرجاء ادخال كلمة المرور القديمة" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">كلمة المرور الجديدة :</label>
                                <div class="col-md-5">
                                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" placeholder="الرجاء ادخال كلمة المرور الجديدة" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">تأكيد كلمة المرور :</label>
                                <div class="col-md-5">
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="الرجاء ادخال تأكيد كلمة المرور" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
