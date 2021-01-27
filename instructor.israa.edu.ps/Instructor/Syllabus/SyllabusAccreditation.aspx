<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="SyllabusAccreditation.aspx.cs" Inherits="Instructor_Syllabus_SyllabusAccreditation" %>

<%@ Register Src="~/Instructor/Syllabus/UserControl/SyllabusMenu.ascx" TagPrefix="uc1" TagName="SyllabusMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">

    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="/assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.steps li').removeClass("active");
            $('#SyllabusAccreditation').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>توصيف المساق</span>
    <i class="fa fa-angle-left" style="font-size: 15px; padding: 0 5px;"></i>
    <span>إعتماد التوصيف</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <asp:Label ID="lblSyllabusID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">توصيف مساق
                                    <asp:Label ID="lblCourseName" runat="server"></asp:Label>
                                    - إعتماد التوصيف</span>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div id="divMsg" runat="server" class="alert alert-dismissable alert-top alert-success" visible="false">
                                <asp:Label ID="lblMsg" runat="server" Style="font-weight: bold; float: right;" Text=""></asp:Label>
                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-wizard">
                                <div class="form-body">
                                    <uc1:SyllabusMenu runat="server" ID="SyllabusMenu" />
                                    <div id="bar" class="progress progress-striped" role="progressbar">
                                        <div class="progress-bar progress-bar-success" style="width: 93%"></div>
                                    </div>
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
                                                        <asp:Button ID="btnSyllabusAccredit" runat="server" Text="إعتماد التوصيف" CssClass="btn green" OnClick="btnSyllabusAccredit_Click" />
                                                    </div>
                                                    <div class="col-md-4 text-right">
                                                        <asp:LinkButton ID="lbPrev" runat="server" CssClass="btn default" OnClick="lbPrev_Click">السابق</asp:LinkButton>
                                                        <asp:LinkButton ID="lbNext" runat="server" CssClass="btn green" Enabled="false">التالي</asp:LinkButton>
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
        </div>
    </div>
</asp:Content>
