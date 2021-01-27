<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="SyllabusGeneralDescription.aspx.cs" Inherits="Academic_SyllabusGeneralDescription" %>

<%@ Register Src="~/UserControl/SyllabusMenu.ascx" TagPrefix="uc1" TagName="SyllabusMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.steps li').removeClass("active");
            $('#SyllabusGeneralDescription').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">توصيف المساق</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>الوصف العام للمساق</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblSyllabusID" runat="server" Visible="false"></asp:Label>
     <asp:Label ID="lblAccreditationDepartmentID" runat="server" Visible="false"></asp:Label>
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-reorder"></i>الوصف العام لمساق-
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
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">الوصف العام للمساق</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txtArGeneralDescription" runat="server" TextMode="MultiLine" Rows="5" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">General Description</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txtEnGeneralDescription" runat="server" TextMode="MultiLine" Rows="5" ClientIDMode="Static" CssClass="form-control" Style="text-align: left;"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-actions fluid">
                                    <div class="col-md-offset-3 col-md-4">
                                        <asp:Button ID="btnSave" runat="server" Text="حفظ الوصف العام للمساق" CssClass="btn blue" OnClick="btnSave_Click" />
                                    </div>
                                    <div class="col-md-4 text-right">
                                        <asp:LinkButton ID="lbPrev" runat="server" CssClass="btn default" Enabled="false">السابق</asp:LinkButton>
                                        <asp:LinkButton ID="lbNext" runat="server" CssClass="btn green" OnClick="lbNext_Click">التالي</asp:LinkButton>
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

