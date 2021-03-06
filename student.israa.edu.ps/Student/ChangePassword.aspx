﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Student_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">تغير كلمة المرور
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>تغير كلمة المرور</div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-3">
                        <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                            <li>
                                 <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                            </li>
                            <li><a href="Default.aspx"><i class="fa fa-home"></i>الصفحة الرئيسية</a></li>
                            <li><a href="StudentProfile.aspx#tab1"><i class="fa fa-briefcase"></i>بيانات أساسية</a></li>
                            <li><a href="StudentProfile.aspx#tab2"><i class="fa fa-male"></i>بيانات ولي الأمر</a></li>
                            <li><a href="StudentProfile.aspx#tab3"><i class="fa fa-mobile-phone"></i>بيانات الإتصال</a></li>
                            <li><a href="StudentImage.aspx"><i class="fa fa-camera"></i>تغيير الصورة الشخصية</a></li>
                            <li class="active">
                                <a href="ChangePassword.aspx">
                                    <i class="fa fa-lock"></i>تغير كلمة المرور
                                </a>
                                <span class="after"></span>
                            </li>
                            <li>
                                <asp:LinkButton ID="lbSignOut" runat="server" OnClick="lbSignOut_Click"><i class="fa fa-key"></i>تسجيل الخروج</asp:LinkButton></li>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <div class="form-horizontal">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>تغير كلمة المرور</h4>
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
                                        <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                        <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
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
