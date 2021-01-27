<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="StudentApplyScholarship.aspx.cs" Inherits="Financial_StudentApplyScholarship" %>

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
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ChangePassword.aspx" class="font-ha">الطالب
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>

    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div style="width: 19%; float: right;">
                        <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                            <li>
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource10">
                                    <ItemTemplate>
                                        <h5 style="text-align: center;"><%# Eval("DisplayName") %> (<%# Eval("StudentNo") %>)</h5>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStudentData" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </li>
                            <li><a href="Student.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-home"></i>الصفحة الرئيسية<span class="after"></span></a></li>
                            <li><a href="StudentFinancialProfile.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>الملف المالي</a></li>
                            <li class="active"><a href="StudentScholarship.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>منح الطالب</a></li>
                            <li><a href="StudentApplyScholarship.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>إضافة منحة مالية للطالب</a></li>
                            <li><a href="StudentInstallment.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>أقساط الطالب</a></li>
                            <li><a href="StudentBook.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-book"></i>الكتب الدراسية</a></li>
                            <li><a href="StudentVoucher.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-book"></i>السندات المالية</a></li>
                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="form-horizontal">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>اضافة منحة بمبلغ مالي</h4>
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
                                    <div class="col-md-12">
                                        <label class="col-md-2">الفصل الدراسي : </label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlSemesterScholarship" runat="server" CssClass="form-control" DataSourceID="SqlDataSource81" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource81" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) And Code<>'111111111') union select -1,N'إختر الفصل الدراسي'"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="col-md-2">المنحة : </label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlActionScholarship" runat="server" CssClass="form-control" DataSourceID="SqlDataSource82" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource82" runat="server" ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                                SelectCommand="SELECT ID, ArName FROM [Action] WHERE [IsScholarship]=1 and [RVType]=2 and IsDelete=0"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="col-md-2">قيمة المنحة بالدينار : </label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtScholarshipValue" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-offset-2 col-md-4">
                                            <asp:Button ID="btnAddScholarship" runat="server" CssClass="btn blue btn btn-rounded default" OnClick="btnAddScholarship_Click" Text="إضافة منحة المبلغ المالي" />
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

