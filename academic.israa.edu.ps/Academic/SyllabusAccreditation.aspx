<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="SyllabusAccreditation.aspx.cs" Inherits="Academic_SyllabusAccreditation" %>

<%@ Register Src="~/UserControl/SyllabusMenu.ascx" TagPrefix="uc1" TagName="SyllabusMenu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.steps li').removeClass("active");
            $('#SyllabusAccreditation').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>طلبات توصيف المساق</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblSyllabusID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblAccreditationDepartmentID" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>اعتماد توصيف  مساق-
                    <asp:Label ID="lblCourseName" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                </div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-wizard">
                            <div class="form-body">
                                <uc1:SyllabusMenu runat="server" ID="SyllabusMenu" />
                                <hr />
                                <div class="tab-content form">
                                    <div class="form-horizontal">
                                        <asp:Label ID="lblSyllabusEvaluationID" runat="server" Text="" Visible="false"></asp:Label>
                                        <div class="form-body">
                                            <div class="form-group row">
                                                <span class="col-md-offset-3 col-md-8">يمكنك طباعة التوصيف وإعتماده حال إستكمال إضافة جميع البيانات المطلوبة فيه</span>
                                            </div>
                                        </div>
                                        <div class="form-actions fluid row">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-4">
                                                    <asp:Button ID="btnSyllabusPrint" runat="server" Text="طباعة التوصيف" CssClass="btn blue" OnClick="btnSyllabusPrint_Click" />
                                                    <asp:Button ID="btnSyllabusAccredit" runat="server" Text="إعتماد التوصيف" CssClass="btn green" Enabled="false"  OnClick="btnSyllabusAccredit_Click"  />
                                                </div>
                                                <div class="col-md-4 text-right">
                                                    <asp:LinkButton ID="lbPrev" runat="server" CssClass="btn default" OnClick="lbPrev_Click">السابق</asp:LinkButton>
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
        </div>
</asp:Content>

