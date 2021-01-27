<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="SendSMS.aspx.cs" Inherits="SendSMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="SendSMS.aspx" class="font-ha">إرسال رسائل SMS للطلاب
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>ارسال رسائل جوال لطلبة الكلية</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-actions fluid">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            <div class="col-md-offset-3 col-md-9"> 
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="5" Columns="50"></asp:TextBox><br /><br />
                                <asp:Button ID="btnSend" runat="server" Text="إرسال الرسالة" class="btn green" OnClick="btnSend_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
