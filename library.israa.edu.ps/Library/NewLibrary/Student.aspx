<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="NewLibrary_Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/css/pages/profile-rtl.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/custom-rtl.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library5 a').css("background-color", "#575757");
            $('#new-library a span.arrow').addClass("open");

            $("#fuDocument").change(function () {
                $('#txtDocumentLink').val($(this).val());
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <a href="Student.aspx" class="font-ha">الطالب</a>
    </li>
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
                            <li style="margin-bottom: 0;">
                                <div class="input-group">
                                    <asp:TextBox ID="txtStudentNo" runat="server" class="form-control" placeholder="الرجاء ادخال رقم الطالب" Style="font-family: Tahoma; font-size: 12px !important;"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button ID="btnChechStudent" runat="server" Text="بحث" class="btn green" OnClick="btnChechStudent_Click" Style="height: 34px;" />
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource10">
                                    <ItemTemplate>
                                        <h5 style="text-align: center;"><%# Eval("DisplayName") %> (<%# Eval("StudentNo") %>)</h5>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                    SelectCommand="GetStudentData" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </li>
                            <li class="active"><a href="Student.aspx"><i class="fa fa-home"></i>الصفحة الرئيسية</a></li>
                            <li><a href="StudentBorrowBook.aspx"><i class="fa fa-edit"></i>استعارة كتاب</a></li>
                            <li><a href="StudentBorrowedBooks.aspx"><i class="fa fa-edit"></i>الكتب المستعارة</a></li>
                            <li><a href="StudentSMS.aspx"><i class="fa fa-edit"></i>ارسال SMS</a></li>

                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div id="tab1" class="tab-pane active" runat="server" clientidmode="Static">
                                <asp:Repeater ID="Repeater10" runat="server" DataSourceID="SqlDataSource11">
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-md-8 profile-info">
                                                <h1><%# Eval("StudentName") %></h1>
                                            </div>
                                            <!--end col-md-8-->
                                            <div class="col-md-4">
                                                <div class="portlet sale-summary">
                                                    <div class="portlet-title">
                                                        <div class="caption font-ha">البيانات الأساسية</div>
                                                        <div class="tools">
                                                            <a class="reload" href="javascript:;"></a>
                                                        </div>
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
                                                                <span class="sale-info">المستوي الدراسي : </span>
                                                                <span class="sale-num"><%# Eval("Studentlevel") %></span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-md-4-->
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                    SelectCommand="GetStudentInfo" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

