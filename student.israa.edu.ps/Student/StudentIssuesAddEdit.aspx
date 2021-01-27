<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudentIssuesAddEdit.aspx.cs" Inherits="Student_StudentIssuesAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu20').addClass("active");
            $('#menu20_1 a').css("background-color", "#575757");
            $('#menu20 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="StudentIssuesAddEdite.aspx" class="font-ha">قضايا الطالب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblIssueID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>إضافة أو تعديل قضية 
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>

                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group row">
                        <label class="col-md-2 control-label">القضايا :</label>
                        <div class="col-md-10">
                            <asp:RadioButtonList ID="Issues" Width="100%" RepeatColumns="2" runat="server" DataSourceID="SqlDataSource1" DataTextField="IsuueName" DataValueField="ID"></asp:RadioButtonList>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaStudentIssue %>' SelectCommand="GetIssueInfo" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="IsActive" Type="string"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group">
                    </div>
                    <div class="clearfix"></div>

                </div>
                <div class="form-group row">

                    <asp:Label ID="Label2" runat="server" Text="وصف القضية :" CssClass="col-md-2 control-label"></asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="Description" runat="server" placeholder="ادخل وصف القضية المراد تقديمها" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="form-group">
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="form-actions fluid">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button ID="btnAdd" runat="server" Text="حفظ" OnClick="btnAdd_Click" CssClass="btn green" />
                    <asp:Button ID="btnclear" runat="server" Text="تفريغ الحقول" OnClick="btnclear_Click" CssClass="btn blue" />

                </div>
            </div>
        </div>
    </div>
</asp:Content>

