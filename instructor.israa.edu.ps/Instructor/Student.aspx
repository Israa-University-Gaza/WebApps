<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Instructor_Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../assets/pages/css/profile-2-rtl.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>ملف الطالب</span>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false" Text="3"></asp:Label>
    <div class="profile">
        <div class="tabbable-line tabbable-full-width">
            <div class="row">
                <div class="col-md-3">
                    <ul class="ver-inline-menu tabbable margin-bottom-10">
                        <li>
                            <img src="WebServices/GetStudentImage.ashx?StudentID=<%= lblStudentID.Text %>" class="img-responsive pic-bordered" alt="" style="width: 100%" />
                        </li>
                        <li class="active">
                            <a href="Student?id=<%= lblStudentID.Text %>">
                                <i class="fa fa-cog"></i>
                                <span>الصفحة الرئيسية</span>
                            </a>
                            <span class="after"></span>
                        </li>

                    </ul>
                </div>

                <div class="col-md-9">
                    <div class="row">
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="col-md-8 profile-info">
                                    <h1 class="font-green sbold"><%# Eval("StudentName") %></h1>
                                    <h3><%# Eval("StudentNo") %></h3>
                                    <p>
                                    </p>
                                </div>
                                <!--end col-md-8-->
                                <div class="col-md-4">
                                    <div class="portlet sale-summary">
                                        <div class="portlet-title">
                                            <div class="caption font-red sbold">بيانات أكاديمية</div>
                                        </div>
                                        <div class="portlet-body">
                                            <ul class="list-unstyled">
                                                <li>
                                                    <span class="sale-info">الرقم الجامعي : </span>
                                                    <span class="sale-num"><%# Eval("StudentNo") %></span>
                                                </li>
                                                <li>
                                                    <span class="sale-info">الكلية : </span>
                                                    <span class="sale-num"><%# Eval("StudentCollege") %></span>
                                                </li>
                                                <li>
                                                    <span class="sale-info">القسم : </span>
                                                    <span class="sale-num"><%# Eval("StudentDepartment") %></span>
                                                </li>
                                                <li>
                                                    <span class="sale-info">نوع الطالب : </span>
                                                    <span class="sale-num"><%# Eval("StudentType") %></span>
                                                </li>
                                                <li>
                                                    <span class="sale-info">حالة الطالب : </span>
                                                    <span class="sale-num"><%# Eval("StudentStatus") %></span>
                                                </li>
                                                <li>
                                                    <span class="sale-info">المستوي الدراسي : </span>
                                                    <span class="sale-num"><%# Eval("Studentlevel") %></span>
                                                </li>
                                                <li>
                                                    <span class="sale-info">المعدل التراكمي خريج : </span>
                                                    <span class="sale-num"><%# Eval("GPAGraduate") %></span>
                                                </li>
                                                <li>
                                                    <span class="sale-info">المعدل التراكمي : </span>
                                                    <span class="sale-num"><%# Eval("GPAUniversity") %></span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!--end col-md-4-->
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                            SelectCommand="GetStudentInfo" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <!--end row-->
                    <%--<div class="tabbable-line tabbable-custom-profile">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab_1_11" data-toggle="tab">تاب 1</a>
                            </li>
                            <li>
                                <a href="#tab_1_22" data-toggle="tab">تاب 2</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_1_11">
                                <div class="row">
                                    <div class="col-md-12">
                                    </div>
                                </div>
                            </div>
                            <!--tab-pane-->
                            <div class="tab-pane" id="tab_1_22">
                                <div class="row">
                                    <div class="col-md-12">
                                    </div>
                                </div>
                            </div>
                            <!--tab-pane-->
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

