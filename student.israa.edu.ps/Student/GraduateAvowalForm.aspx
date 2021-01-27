<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="GraduateAvowalForm.aspx.cs" Inherits="Student_GraduateAvowalForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#GraduateAvowalForm').addClass("active");
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
        <li><a href="#" class="font-ha">نموذج اقرار خريج
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lbIsExist" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>نموذج اقرار خريج</div>
                </div>
                <div class="portlet-body">
                    <div class="form-horizontal">
                        <div class="form-group row">
                            <label class="col-md-2 control-label">رقم الطالب</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtStudentNo" CssClass="form-control " runat="server" Enabled="false"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">السنة والعام الدراسي</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtSemesterName" CssClass="form-control " runat="server" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">اسم الطالب _ عربي</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtArName" CssClass="form-control " runat="server" Enabled="false"></asp:TextBox>
                            </div>

                            <label class="col-md-2 control-label">اسم الطالب _ انجليزي</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtEnName" CssClass="form-control " runat="server" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">الكلية</label>

                            <div class="col-md-4">
                                <asp:TextBox ID="txtCollege" CssClass="form-control " runat="server" Enabled="false"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">القسم</label>

                            <div class="col-md-4">
                                <asp:TextBox ID="txtDepartment" CssClass="form-control " runat="server" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">رقم الهوية</label>

                            <div class="col-md-4">
                                <asp:TextBox ID="txtSSN" CssClass="form-control " runat="server" Enabled="false"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">تاريخ الميلاد</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtDOB" CssClass="form-control " runat="server" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">نوع الطالب</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtStudentType" CssClass="form-control " runat="server" Enabled="false"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">المعدل التراكمي</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtStudentGPA" CssClass="form-control " runat="server" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">العنوان</label>

                            <div class="col-md-10">
                                <asp:TextBox ID="txtStudentAddress" CssClass="form-control " runat="server" TextMode="MultiLine" Rows="1"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">جوال</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtMobileNo" CssClass="form-control " runat="server"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">جوال للطوارئ</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtEMobileNo" CssClass="form-control " runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">المشاكل التي واجهتك</label>

                            <div class="col-md-10">
                                <asp:TextBox ID="txtProblem" CssClass="form-control " runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">الاقتراحات</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtSuggestion" CssClass="form-control " runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="form-actions fluid">
                    <div class="col-md-offset-2 col-md-9">
                        <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

