<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StudentMain.aspx.cs" Inherits="Academic_StudentMain" %>

<%@ Register Src="~/Academic/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_1 a').css("background-color", "#575757");
            $('#Student a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                    <uc1:StudentSideBar runat="server" ID="StudentSideBar" />
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div id="tab1" runat="server" class="tab-pane active" clientidmode="Static">
                                <asp:Repeater ID="Repeater10" runat="server">
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-md-8 profile-info">
                                                <h1 class="font-ha"><%# Eval("StudentName") %></h1>
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
                                                                <span class="sale-info">البرنامج : </span>
                                                                <span class="sale-num"><%# Eval("StudentProgram") %></span>
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
                                                                <span class="sale-info">الرصيد : </span>
                                                                <span class="sale-num"><%# Eval("Balance") %></span>
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
                                                                <span class="sale-num"><%# Eval("SemesterCumulativeGraduateGPA") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">عدد ساعات التسجيل للفصل الحالي </span>
                                                                <span class="sale-num"><%# Eval("RegisteredHours") %></span>
                                                            </li>

                                                            <li>
                                                                <span class="sale-info">ساعات تراكمية: </span>
                                                                <span class="sale-num"><%# Eval("SemesterCumulativeRegisteredHours") %></span>
                                                            </li>

                                                            <li>
                                                                <span class="sale-info">ساعات إثرائية : </span>
                                                                <span class="sale-num"><%# Eval("RichnessHour") %></span>
                                                            </li>


                                                            <%--    <li>
                                                                <span class="sale-info">المعدل قبل المعادلة : </span>
                                                                <span class="sale-num"><%# Eval("BITransGPAUniversity") %></span>
                                                            </li>--%>
                                                            <li>
                                                                <span class="sale-info">ساعات الدراسة : </span>
                                                                <span class="sale-num"><%# Eval("StudiedHour") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات النجاح : </span>
                                                                <span class="sale-num"><%# Eval("SucceedHour") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات الخطة : </span>
                                                                <span class="sale-num"><%# Eval("StudentPlanHours") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات الإنجاز : </span>
                                                                <span class="sale-num"><%# Eval("PlanSucceedHour") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات معادلة داخلية : </span>
                                                                <span class="sale-num"><%# Eval("ITransHour") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات معادلة خارجية : </span>
                                                                <span class="sale-num"><%# Eval("TransformationHours") %></span>
                                                            </li>


                                                            <li>
                                                                <span class="sale-info">سعر الساعة : </span>
                                                                <span class="sale-num"><%# Eval("HourCost") %> دينار</span>
                                                            </li>

                                                            <li>
                                                                <span class="sale-info">حالة التخرج : </span>
                                                                <span class="sale-num" style="color: red"><%# Eval("GraduationStatus") %> </span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">حالة الطالب أكاديمياً : </span>
                                                                <span class="sale-num" style="color: red"><%# Eval("AcademicWarning") %> </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-md-4-->
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <%--  <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStudentInfo" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>--%>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

