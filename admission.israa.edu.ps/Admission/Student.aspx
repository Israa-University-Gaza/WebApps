<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Admission_Student" %>

<%@ Register Src="~/Admission/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/css/pages/profile-rtl.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/custom-rtl.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu1').addClass("active");

            $("#fuDocument").change(function () {
                $('#txtDocumentLink').val($(this).val());
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ChangePassword.aspx" class="font-ha">الطالب
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblEmployeeName" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblStdStatusID" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblStdProgramID" runat="server" Visible="False"></asp:Label>
    
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



                            <div id="tab1" class="tab-pane active" runat="server" clientidmode="Static">
                                <h3>
                                    <asp:Label ID="stdPass" runat="server" Text=""></asp:Label>
                                </h3>
                                <asp:Repeater ID="Repeater10" runat="server">
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-md-8 profile-info">
                                                <h1><%# Eval("StudentName") %></h1>
                                                <div class="portlet box blue">
                                                    <div class="portlet-title">
                                                        <div class="caption font-ha"><i class="fa fa-cogs"></i>تقارير خاصة بالطلبة</div>
                                                        <div class="tools">
                                                            <a href="javascript:;" class="collapse"></a>

                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <%--                                                        <% if (DataAccess.IsBlockedStudent(lblStudentID.Text).Rows[0]["status"].ToString() == "1")
                                                            {  %>--%>
                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7")
                                                            { %>
                                                        <asp:LinkButton ID="lbCertificateRegistrationReportPDF" runat="server" OnClick="lbCertificateRegistrationReportPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">شهادة قيد بالعربية </asp:LinkButton>
                                                        <asp:LinkButton ID="lbEnCertificateRegistrationReportPDF" runat="server" OnClick="lbEnCertificateRegistrationReportPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">شهادة قيد بالانجليزية</asp:LinkButton>
                                                        <asp:LinkButton ID="lbCardOneDayPDF" runat="server" OnClick="lbCardOneDayPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">بطاقة ليوم واحد</asp:LinkButton>
                                                        <asp:LinkButton ID="lbTransferPDF" runat="server" OnClick="lbTransferPDF_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">طلب تحويل التخصص</asp:LinkButton>
                                                        <asp:LinkButton ID="lbUNRWAModelPDF" runat="server" OnClick="lbUNRWAModelPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">استبيان الوكالة</asp:LinkButton>
                                                        <%--
                                                                                                               <asp:LinkButton ID="lbTransferModelPDF" runat="server" OnClick="lbTransferModelPDF_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">طلبات خاصة بالطلبة</asp:LinkButton>--%>
                                                        <% } %>
                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "3" || lblStdStatusID.Text == "5")
                                                            { %>
                                                        <asp:LinkButton ID="lbDelayPD" runat="server" OnClick="lbDelayPD_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">طلب تأجيل وإعادة قيد</asp:LinkButton>
                                                        <% } %>
                                                        <% if (lblStdStatusID.Text != "6" && lblStdStatusID.Text != "7" && lblStdStatusID.Text != "9" && lblStdStatusID.Text != "10" && lblStdStatusID.Text != "12")
                                                            { %>
                                                        <asp:LinkButton ID="lbGiveUp" runat="server" OnClick="lbGiveUp_Click" CssClass="btn default btn-sm isra-inline dark-stripe font-ha">طلب انسحاب من الجامعة</asp:LinkButton>
                                                        <% } %>
                                                        <asp:LinkButton ID="lbAdmissionAppPDF" runat="server" OnClick="lbAdmissionAppPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">طلب التحاق</asp:LinkButton>
                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                            { %>
                                                        <asp:LinkButton ID="lbTestimony" runat="server" OnClick="lbTestimony_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">افادة</asp:LinkButton>
                                                        <% } %>
                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                            { %>
                                                        <asp:LinkButton ID="lbFinancialBenefitPDF" runat="server" OnClick="lbFinancialBenefitPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">إفادة مالية</asp:LinkButton>
                                                        <% } %>
                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "3" || lblStdStatusID.Text == "12")
                                                            { %>
                                                        <asp:LinkButton ID="lbStdTransformationCourses" runat="server" OnClick="lbStdTransformationCourses_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">كشف غير معتمد بالمساقات المعادلة</asp:LinkButton>
                                                        <% } %>
                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "12")
                                                            { %>
                                                        <asp:LinkButton ID="lbAccrediteETransformation" runat="server" OnClick="lbAccrediteETransformation_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">كشف معتمد بالمساقات المعادلة</asp:LinkButton>
                                                        <% } %>

                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "12")
                                                            { %>
                                                        <asp:LinkButton ID="lbStudentInternalTransformationPDF" runat="server" OnClick="lbStudentInternalTransformationPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">كشف بالمواد المعادلة داخلياً</asp:LinkButton>
                                                        <asp:LinkButton ID="lbStudentRichnessCoursesPDF" runat="server" OnClick="lbStudentRichnessCoursesPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">كشف المواد الإثرائية</asp:LinkButton>
                                                        <% } %>
                                                        <%-- by RSR if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301" || lblEmployeeID.Text != "5497" ) /*&& (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "12")*/)
                                                            { --%>
                                                                    <%-- by RSR if (lblStdProgramID.Text == "2" /*&& lblStdStatusID.Text == "12"*/)
                                                                        { --%>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lbCertificate_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">شهادة مصدقة</asp:LinkButton>
                                                                  <%-- by RSR } --%>
                                                        <%-- %><asp:LinkButton ID="lbCertificate" runat="server" OnClick="lbCertificate_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">شهادة مصدقة</asp:LinkButton>
                                                        <asp:LinkButton ID="lbCertificate1" runat="server" OnClick="lbCertificate1_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">1شهادة مصدقة</asp:LinkButton>
                                                        --%>
                                                                     <%-- by RSR if (lblStdProgramID.Text == "1" && lblStdStatusID.Text == "12")
                                                                        { --%>
                                                                    <asp:LinkButton ID="lbCertificate1" runat="server" OnClick="lbCertificate1_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">شهادة مصدقة - دبلوم</asp:LinkButton>
                                                                    <%--RSR  } --%>
                                                        
                                                        <%-- by RSR } --%>
                                                        <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301" || lblEmployeeID.Text != "5497") && (lblStdStatusID.Text != "5" && lblStdStatusID.Text != "6" && lblStdStatusID.Text != "8" && lblStdStatusID.Text != "9" && lblStdStatusID.Text != "10"))
                                                            { %>
                                                        <asp:LinkButton ID="lbShowingStudentIssue" runat="server" OnClick="lbShowingStudentIssue_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">عرض قضية طلابية</asp:LinkButton>

                                                        <% } %>
                                                        <asp:LinkButton ID="lbCaseStudyPDF" runat="server" OnClick="lbCaseStudyPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">نموذج دراسة حالة</asp:LinkButton>
                                                        <%--                                                        <asp:LinkButton ID="lbAccreditationStudentMark" runat="server" OnClick="lbAccreditationStudentMark_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha"> كشف الدرجات بالعربية.م </asp:LinkButton>
                                                        <asp:LinkButton ID="lbUnaccreditationStudentMark" runat="server" OnClick="lbUnaccreditationStudentMark_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">  كشف الدرجات بالعربية.غ.م</asp:LinkButton>
                                                        <asp:LinkButton ID="lbAccreditationStudentMarkEn" runat="server" OnClick="lbAccreditationStudentMarkEn_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">كشف درجات بالانجليزية.م</asp:LinkButton>
                                                        <asp:LinkButton ID="lbUnaccreditationStudentMarkEn" runat="server" OnClick="lbUnaccreditationStudentMarkEn_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">كشف درجات بالانجليزية.غ.م</asp:LinkButton>--%>

                                                        <%-- Coding By Mariam --%>
                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                            { %>
                                                        <asp:LinkButton ID="lbClearancePDF" runat="server" OnClick="lbClearancePDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">براءة ذمة</asp:LinkButton>
                                                        <% } %>

                                                        <% if (lblStdStatusID.Text == "1")
                                                            { %>
                                                        <asp:LinkButton ID="lbGraduateAvowalPDF" runat="server" OnClick="lbGraduateAvowalPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">إقرار خريج</asp:LinkButton>
                                                        <% } %>
                                                        <% // Added by RSR
                                                            if (lblEmployeeID.Text != "5534" && lblEmployeeID.Text != "14" && lblEmployeeID.Text != "5084")
                                                            {
                                                            %>
                                                                    <% if (lblStdStatusID.Text == "1")
                                                                 { %>
                                                                    <asp:LinkButton ID="lbstdTranscriptPDF" runat="server" OnClick="lbstdTranscriptPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">كشف درجات بغرض التخرج</asp:LinkButton>
                                                                    <% } %>

                                                                    <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                                 { %>
                                                                    <asp:LinkButton ID="lbUnAccreditationStudentTranscript" runat="server" OnClick="lbUnAccreditationStudentTranscript_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">  كشف درجات</asp:LinkButton>
                                                                    <% } %>

                                                                    <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301" || lblEmployeeID.Text != "5497") && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12"))
                                                                 { %>
                                                                    <asp:LinkButton ID="lbAccreditationStudentTranscript" runat="server" OnClick="lbAccreditationStudentTranscript_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">كشف درجات خريج</asp:LinkButton>
                                                                    <asp:LinkButton ID="lbAccreditationStudentTranscript_D" runat="server" OnClick="lbAccreditationStudentTranscript_Click_D" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">كشف درجات خريج-دبلوم</asp:LinkButton>

                                                                    <asp:LinkButton ID="lbAccreditationStudentETranscript" runat="server" OnClick="lbAccreditationStudentETranscript_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">كشف درجات خريج باللغه الانجليزية</asp:LinkButton>
                                                                    <% } %>
                                                        <%
                                                            }
                                                            // end RSR%>
                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "3" || lblStdStatusID.Text == "12")
                                                            { %>
                                                        <asp:LinkButton ID="lbAcademicAdvisingPDF" runat="server" OnClick="lbAcademicAdvisingPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">كشف الارشاد الأكاديمي</asp:LinkButton>
                                                        <% } %>
                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7")
                                                            { %>
                                                        <asp:LinkButton ID="lbMidtermExamsSchedulePDF" runat="server" OnClick="lbMidtermExamsSchedulePDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">جدول الامتحانات النصفية</asp:LinkButton>
                                                        <asp:LinkButton ID="lbFinalExamsSchedulePDF" runat="server" OnClick="lbFinalExamsSchedulePDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">جدول الامتحانات النهائية</asp:LinkButton>
                                                        <% } %>
                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                            { %>
                                                        <asp:LinkButton ID="lbObservationMarkPDF" runat="server" OnClick="lbObservationMarkPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">رصد درجات</asp:LinkButton>
                                                        <% } %>
                                                        <% if (lblEmployeeID.Text != "5301" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12"))
                                                            { %>
                                                        <asp:LinkButton ID="SampleAuditInformationPDF" runat="server" OnClick="SampleAuditInformationPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">تدقيق عينة من بيانات الكلية</asp:LinkButton>
                                                        <% } %>
                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                            { %>
                                                        <asp:LinkButton ID="lbProofOFStudentAttendanceReportPDF" runat="server" OnClick="lbProofOFStudentAttendanceReportPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">نموذج اثبات حضور الطالب</asp:LinkButton>
                                                        <% } %>

                                                        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                            { %>
                                                        <asp:LinkButton ID="lbStudentBankPay" runat="server" OnClick="lbStudentBankPay_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">نموذج الدفع البنكي</asp:LinkButton>
                                                        <% } %>


                                                        <%-- coding By Mariam --%>

                                                        <%--                                                        <% }
                                                            else {
                                                        %>
                                                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                            <div class="col-xs-11" style="text-align: center;">
                                                                <strong>يوجد مستحقات مالية لم يتم دفعها بعد</strong>
                                                                <div style="clear: both"></div>
                                                            </div>
                                                            <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                            <div style="clear: both"></div>
                                                        </div>
                                                        <%  } %>--%>
                                                    </div>
                                                </div>
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
                                                                <span class="sale-info">ساعات التطوع : </span>
                                                                <span class="sale-num"><%# Eval("VolunteerHours") %></span>
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
                                                            <li>
                                                                <span class="sale-info">حالة صفحة الطالب : </span>
                                                                <asp:Label ID="lblStudentPageStatus" runat="server" Visible="false" Text='<%# Eval("StudentPageStatus") %>'></asp:Label>
                                                                <span class="sale-num">
                                                                    <a href='StudentSuspendedView.aspx?id=<%= lblStudentID.Text %>' class='btn default btn-xs red <%# Convert.ToBoolean(Eval("StudentPageStatus")) ? "hidden" : "" %>'>موقوفة</a>
                                                                    <a class="btn default btn-xs green" runat="server" visible='<%# Convert.ToBoolean(Eval("StudentPageStatus")) %>'>فعالة</a>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">رقم الملف : </span>
                                                                <span class="sale-num"><%# Eval("FileNumber") %></span>
                                                            </li>

                                                            <% if (lblEmployeeID.Text != "5497" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7"))
                                                                { %>
                                                            <% if (lblEmployeeID.Text != "5390" && lblEmployeeID.Text != "5301")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbGenerateFileNumber" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbGenerateFileNumber_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود توليد رقم الملف؟')">توليد رقم الملف</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <% } %>
                                                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                                { %>
                                                            <% if (lblEmployeeID.Text == "9" || lblEmployeeID.Text == "5083" || lblEmployeeID.Text == "12" || lblEmployeeID.Text == "5123")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbStdResetPassword" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbStdResetPassword_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود إعادة تعين كلمة المرور؟')">إعادة تعين كلمة المرور</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <% } %>
                                                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "7")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbAddCertificateRegistrationCost" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbAddCertificateRegistrationCost_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم شهادة قيد؟')">فرض رسوم شهادة قيد</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbAddCardOneDayCost" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbAddCardOneDayCost_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم بطاقة ليوم واحد؟')">فرض رسوم بطاقة ليوم واحد</asp:LinkButton>
                                                            </li>
                                                            <li>
                                                                <asp:LinkButton ID="lbAddReplacementStudentCardCost" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbAddReplacementStudentCardCost_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم بطاقة طالب بدل فاقد؟')">فرض رسوم بطاقة طالب بدل فاقد</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbStudentMarkTableCost" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbStudentMarkTableCost_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم كشف الدرجات؟')">فرض رسوم كشف الدرجات</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <% if (lblStdStatusID.Text == "1")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbUNRWAModeCost" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbUNRWAModeCost_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم استبان الوكالة؟')">فرض رسوم استبان الوكالة</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbAddExamTableCost" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbAddExamTableCost_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم جدول الإمتحانات؟')">فرض رسوم جدول الإمتحانات</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "3" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbAddFinancialGeneralBenefitCost" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbAddFinancialGeneralBenefitCost_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم كشف إفادة عامة؟')">فرض رسوم كشف إفادة عامة</asp:LinkButton>
                                                            </li>
                                                            <li>
                                                                <asp:LinkButton ID="lbAddFinancialBenefitCost" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbAddFinancialBenefitCost_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم كشف الإفادة المالية؟')">فرض رسوم كشف الإفادة المالية</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbAddReoprtCost1" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbAddReoprtCost1_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم طلب خطة دراسية بعد المرة الأولى؟')">فرض رسوم طلب خطة دراسية بعد المرة الأولى</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbAddReoprtCost2" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbAddReoprtCost2_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم دورات؟')">فرض رسوم دورات</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbAddReoprtCost3" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbAddReoprtCost3_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم كشف الإرشاد الأكاديمي؟')">فرض رسوم كشف الإرشاد الأكاديمي</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7")
                                                                { %>
                                                            <li>
                                                                <asp:LinkButton ID="lbAddReoprtCost4" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="lbAddReoprtCost4_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم تأخير تسجيل فصل دارسي؟')">فرض رسوم تأخير تسجيل فصل دارسي</asp:LinkButton>
                                                            </li>
                                                            <% } %>
                                                            <li>
                                                                <asp:LinkButton ID="AddTransactionCost129" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="AddTransactionCost129_OnClick" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم افادة خريج؟')">فرض رسوم افادة خريج</asp:LinkButton>
                                                            </li>
															                                                        <li>
                                                            <asp:LinkButton ID="AddTransactionCost130" runat="server" class="btn default btn-sm blue-stripe isra-inline-1 font-ha" OnClick="AddTransactionCost130_OnClick" OnClientClick="return confirm('هل انت متاكد من أنك تود فرض رسوم شهادة خريج ؟')">فرض رسوم شهادة خريج</asp:LinkButton>
                                                        </li>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-md-4-->
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>


                                <%--<div class="row">
                                    <div class="col-md-8">
                                        <div class="portlet box blue">
                                            <div class="portlet-title">
                                                <div class="caption font-ha"><i class="fa fa-cogs"></i>إرجاع الطالب</div>
                                                <div class="tools">
                                                    <a href="javascript:;" class="collapse"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body">
                                                <div class="row" style="padding-top: 15px;">
                                                    <label class="col-md-2 control-label">مبرر الإرجاع</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="txtReturnAdmissionNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row" style="padding-top: 15px;">
                                                    <div class="col-md-offset-2 col-md-6">
                                                        <asp:Button ID="btnReturnAdmissionStudent" runat="server" Text="إرجاع الطالب" CssClass="btn green" OnClick="btnReturnAdmissionStudent_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                            <div id="tab2" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>الجدول الدراسي</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />


                                        <% if (Repeater8.Items.Count > 0)
                                            { %>
                                        <div class="row">
                                            <div class="col-md-8" style="padding: 12px;">
                                                <asp:Repeater ID="Repeater8" runat="server">
                                                    <ItemTemplate>
                                                        <span style="font-size: 14px;"><%# Eval("ArName") %></span>
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </div>
                                            <div class="col-md-4" style="padding: 12px; text-align: left; vertical-align: middle;">
                                                <asp:CheckBox ID="cbCopyNo" runat="server" Checked="true" />
                                                <asp:LinkButton ID="lbStudyTablePDF" runat="server" OnClick="lbStudyTablePDF_Click">تصدير الجدول الى pdf</asp:LinkButton>
                                            </div>
                                        </div>
                                        <br />

                                        <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource116">
                                            <ItemTemplate>

                                                <div class=" row alert alert-info">
                                                    <div class="row">

                                                        <div class="col-md-3">
                                                            عدد ساعات النجاح : <%# Eval("SucceedHour") %>
                                                        </div>
                                                        <div class="col-md-3">
                                                            المعدل التراكمي :<%# Eval("GPAUniversity") %>
                                                        </div>
                                                        <div class="col-md-3">
                                                            عدد الساعات المسجلة :<%# Eval("CountOfRegisterHours") %>
                                                        </div>

                                                        <div class="col-md-3">
                                                            سعر الساعة :<%# Eval("HourCost") %>
                                                        </div>

                                                        <div class="col-md-3">
                                                            رصيد الطالب: <%# Eval("Balance") %>
                                                        </div>

                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        <asp:SqlDataSource ID="SqlDataSource116" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetStdStudyTableInfoReport" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <div class="row" style="padding-top: 15px;">


                                            <% if (Repeater7.Items.Count > 0)
                                                { %>
                                            <table class="table table-striped table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 8%; text-align: center; font-size: 11px">رقم المساق</th>
                                                        <th style="width: 15%; text-align: center; font-size: 11px">المساق</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">مدرس المساق</th>
                                                        <th style="width: 3%; text-align: center; font-size: 11px">شعبة</th>
                                                        <th style="width: 4%; text-align: center; font-size: 11px">قاعة</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">السبت</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">الأحد</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">الإثنين</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">الثلاثاء</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">الأربعاء</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">الخميس</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater7" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Employee") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Room") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Saturday") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Sunday") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Monday") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Tuesday") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Wednesday") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Thursday") %></span></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>

                                                </tbody>
                                            </table>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تسجيل مساقات لهذا الفصل الدراسي</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                        <% }
                                            else
                                            { %>
                                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                            <div class="col-xs-11" style="text-align: center;">
                                                <strong>لم يتم تسجيل ساعات دراسية</strong>
                                                <div style="clear: both"></div>
                                            </div>
                                            <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                            <div style="clear: both"></div>
                                        </div>
                                        <% } %>
                                    </div>
                                    <br />
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>المساقات الإستدراكية</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row" style="padding-top: 15px;">
                                            <% if (Repeater13.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 15%">كود المساق</th>
                                                        <th style="width: 20%; text-align: center">المساق</th>
                                                        <th style="width: 15%; text-align: center">رقم الشعبة</th>
                                                        <th style="width: 15%; text-align: center">تاريخ الإمتحان</th>
                                                        <th style="width: 20%; text-align: center">نوقيت الإمتحان</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater13" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ArNameCourse") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ExamDate", "{0:yyyy/MM/dd}") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ExamTime") %></span></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>

                                                </tbody>
                                            </table>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تسجيل مساقات إستدراكية</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab3" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>جدول الإمتحانات</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row" style="border-bottom: 1px solid #ddd; padding: 15px 0;">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">الفصل الدراسي</label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="ddlStdSemester1" OnSelectedIndexChanged="ddlStdSemester1_OnSelectedIndexChanged" runat="server" class="form-control" DataTextField="Semester" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 15px;">
                                            <% if (Repeater3.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 15%">كود المساق</th>
                                                        <th style="width: 20%; text-align: center">المساق</th>
                                                        <th style="width: 15%; text-align: center">رقم الشعبة</th>
                                                        <th style="width: 15%; text-align: center">تاريخ الإمتحان</th>
                                                        <th style="width: 20%; text-align: center">نوقيت الإمتحان</th>
                                                        <th style="width: 15%; text-align: center">قاعة الإمتحان</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater3" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ArNameCourse") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ExamDate", "{0:yyyy/MM/dd}") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ExamTime") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ExamRoom") %></span></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>

                                                    <%--   <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdExamsTable" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlStdSemester1" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>--%>
                                                </tbody>
                                            </table>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تسجيل مساقات لهذا الفصل الدراسي</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab4" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>الخطة الدراسية</h4>
                                            </div>
                                            <div class="col-md-9" style="text-align: left; font-size: 14px; padding: 9px;">
                                                <asp:LinkButton ID="lbPDF" runat="server" OnClick="lbPDF_Click">تصدير الى pdf</asp:LinkButton>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater1.Items.Count > 0)
                                                { %>
                                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_OnItemDataBound">
                                                <ItemTemplate>
                                                    <div class="col-md-12 isra-clear">
                                                        <asp:Label ID="PlanID" runat="server" Text='<%# Eval("PlanID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="CSemesterID" runat="server" Text='<%# Eval("CSemesterID") %>' Visible="false"></asp:Label>
                                                        <div class="portlet">
                                                            <div class="portlet-title">
                                                                <div class="caption"><i class="fa fa-briefcase" style="width: 25px;"></i><span class="font-ha"><%# Eval("CSemester") %></span></div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="width: 15%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                                <th style="width: 35%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                                <th style="width: 30%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>متطلب سابق</th>
                                                                                <th style="width: 20%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . الساعات</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <asp:Repeater ID="Repeater2" runat="server">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("PreRequestCourse") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                            <tr>
                                                                                <td colspan="3" style="text-align: center" class="font-ln">مجموع الساعات</td>
                                                                                <td style="text-align: center"><span><%# Eval("SumOfHours") %></span></td>
                                                                            </tr>
                                                                            <%--              <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetCSemesterPlanCourses" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="PlanID" PropertyName="Text" Name="PlanID" Type="Int32" />
                                                                                    <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>--%>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <%--       <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStdSemesterPlan" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>--%>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تعين خطة دراسية للطالب</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab23" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12" dir="ltr">
                                        <div class="row">

                                            <div class="col-md-9" style="text-align: end; font-size: 14px; padding: 9px;">
                                                <asp:LinkButton ID="lbStudyPlanPrint" runat="server" OnClick="lbStudyPlanPrint_Click"> pdf</asp:LinkButton>
                                            </div>
                                            <div class="col-md-3">
                                                <h4>Study Plan</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater17.Items.Count > 0)
                                                { %>
                                            <asp:Repeater ID="Repeater17" runat="server" OnItemDataBound="Repeater17_OnItemDataBound">
                                                <ItemTemplate>
                                                    <div class="col-md-12 isra-clear">
                                                        <asp:Label ID="PlanID" runat="server" Text='<%# Eval("PlanID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="CSemesterID" runat="server" Text='<%# Eval("CSemesterID") %>' Visible="false"></asp:Label>
                                                        <div class="portlet">
                                                            <div class="portlet-title">
                                                                <div class="caption" style="float: none"><i class="fa fa-briefcase" style="width: 25px; float: none"></i><span class="font-ha"><%# Eval("EnCSemester") %></span></div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="width: 15%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>Code</th>
                                                                                <th style="width: 35%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>Name</th>
                                                                                <th style="width: 30%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>Pre Course</th>
                                                                                <th style="width: 20%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>#Hours</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <asp:Repeater ID="Repeater2" runat="server">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseEnName") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("EnNamePreRequestCourse") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                            <tr>
                                                                                <td colspan="3" style="text-align: center" class="font-ln">SumOfHours</td>
                                                                                <td style="text-align: center"><span><%# Eval("SumOfHours") %></span></td>
                                                                            </tr>
                                                                            <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetCSemesterPlanCourses" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="PlanID" PropertyName="Text" Name="PlanID" Type="Int32" />
                                                                                    <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>--%>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>No student study plan has been identified</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab15" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>كشف الإرشاد الأكاديمي</h4>
                                            </div>
                                            <%--<div class="col-md-9" style="text-align: left; font-size: 14px; padding: 9px;">
                                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lbPDF_Click">تصدير الى pdf</asp:LinkButton>
                                            </div>--%>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater14.Items.Count > 0)
                                                { %>
                                            <asp:Repeater ID="Repeater14" runat="server" OnItemDataBound="Repeater14_OnItemDataBound">
                                                <ItemTemplate>
                                                    <div class="col-md-12 isra-clear">
                                                        <asp:Label ID="PlanID" runat="server" Text='<%# Eval("PlanID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="CSemesterID" runat="server" Text='<%# Eval("CSemesterID") %>' Visible="false"></asp:Label>
                                                        <div class="portlet">
                                                            <div class="portlet-title">
                                                                <div class="caption"><i class="fa fa-briefcase" style="width: 25px;"></i><span class="font-ha"><%# Eval("CSemester") %></span></div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="width: 15%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                                <th style="width: 35%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                                <th style="width: 20%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . الساعات</th>
                                                                                <th style="width: 30%; text-align: center"></th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <asp:Repeater ID="Repeater141" runat="server">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                                        <td style="text-align: center">
                                                                                            <span><%# (Eval("IsRegisterCourse").ToString()=="1")? "<img src='../assets/img/icons/11693605_10153855864475809_1372216708_n.gif' width='18' height='18' />": "" %></span>
                                                                                            <span><%# (Eval("IsDelayCourse").ToString()=="1")? "سحب": "" %></span>
                                                                                            <span><%# (Eval("IsWithdrawCourse").ToString()=="1")? "إنسحاب": "" %></span>
                                                                                            <span><%# (Eval("IsIncompleteCourse").ToString()=="1")? "غير مكتمل": "" %></span>
                                                                                            <span><%# (Eval("IsRepeatCourse").ToString()=="1")? "إعادة": "" %></span>
                                                                                            <span><%# (Eval("IsSuccessfulCourse").ToString()=="1")? "<img src='../assets/img/icons/12226411_10153855864455809_1009013865_n.jpg' width='18' height='18' />": "" %></span>
                                                                                            <span><%# (Eval("IsFailureCourse").ToString()=="1")?"<img src='../assets/img/icons/12207740_10153855864445809_964486009_n.jpg' width='18' height='18' />": "" %></span>
                                                                                            <span><%# (Eval("IsExternalTransformationCourse").ToString()=="1")?"<img src='../assets/img/icons/12036176_10153855864495809_1572926047_n.gif' width='18' height='18' />": "" %></span>
                                                                                            <span><%# (Eval("IsInternalTransformationCourse").ToString()=="1")?"<img src='../assets/img/icons/InternalTrans.png' width='18' height='18' />": "" %></span>
                                                                                            <span><%# (Eval("IsAvailableCourse").ToString()=="1")? "<img src='../assets/img/icons/sign_available.png' width='18' height='18' />": "" %></span>
                                                                                        </td>
                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                            <tr>
                                                                                <td colspan="2" style="text-align: center" class="font-ln">مجموع الساعات</td>
                                                                                <td style="text-align: center"><span><%# Eval("SumOfHours") %></span></td>
                                                                                <td></td>
                                                                            </tr>
                                                                            <%--           <asp:SqlDataSource ID="SqlDataSource141" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetStudentCSemesterAcademicGuidence" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                                    <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>--%>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <%--       <asp:SqlDataSource ID="SqlDataSource22" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStdSemesterPlan" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>--%>
                                            <div class="row">
                                                <div class="col-md-2">
                                                    مفاتيح الرموز :
                                                </div>
                                                <div class="col-md-2">
                                                    <img src="../assets/img/icons/11693605_10153855864475809_1372216708_n.gif" width="18" height="18" />
                                                    تسجيل
                                                </div>
                                                <div class="col-md-2">

                                                    <img src="../assets/img/icons/12226411_10153855864455809_1009013865_n.jpg" width="18" height="18" />
                                                    ناجح
                                                </div>
                                                <div class="col-md-2">
                                                    <img src="../assets/img/icons/12207740_10153855864445809_964486009_n.jpg" width="18" height="18" />
                                                    راسب
                                                </div>
                                                <div class="col-md-2">
                                                    <img src="../assets/img/icons/12036176_10153855864495809_1572926047_n.gif" width="18" height="18" />
                                                    معادلة خارجية
                                                </div>
                                                <div class="col-md-2">
                                                    <img src="../assets/img/icons/InternalTrans.png" width="18" height="18" />
                                                    معادلة داخلية
                                                </div>
                                            </div>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تعين خطة دراسية للطالب</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab5" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>علامات المساقات</h4>
                                            </div>
                                            <div class="col-md-9 isra-pl-0">
                                                <div id="divMsg5" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="lblMsg5" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                    <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row" style="border-bottom: 1px solid #ddd; padding: 15px 0;">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">الفصل الدراسي</label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="ddlStdSemester2" runat="server" class="form-control" DataTextField="Semester" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlStdSemester2_SelectedIndexChanged"></asp:DropDownList>
                                                        <%--        <asp:SqlDataSource ID="SqlDataSource9" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetStdSemesterWithoutTrans" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 15px;">
                                            <% if (Repeater4.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 8%">كود المساق</th>
                                                        <th style="width: 15%; text-align: center">المساق</th>
                                                        <th style="width: 5%; text-align: center">ع . س</th>
                                                        <th style="width: 5%; text-align: center">الحالة</th>
                                                        <th style="width: 10%; text-align: center">أعمال الفصل</th>
                                                        <th style="width: 10%; text-align: center">العلامة الفصلية</th>
                                                        <th style="width: 10%; text-align: center">العلامة النهائية</th>
                                                        <th style="width: 10%; text-align: center">العلامة</th>
                                                        <th style="width: 10%; text-align: center">خيارات</th>
                                                        <th style="width: 25%; text-align: center">ملاحظات</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater4" runat="server">
                                                        <ItemTemplate>
                                                            <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseHours") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseStatus") %></span></td>
                                                                <td style="text-align: center"><span><%# (((Convert.ToBoolean(Eval("IsTotalZero").ToString()))) ? "صفر في العلامة الكلية":Eval("WorkMark"))%></span></td>
                                                                <td style="text-align: center"><span><%# (Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "غير مكتمل": ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())) ? "غياب" : ((Convert.ToBoolean(Eval("IsTotalZero").ToString()))) ? "صفر في العلامة الكلية":  Eval("MidtermMark")) %></span>
                                                                    <%-- <br />
                                                                    <span runat="server" style="color: green" visible='<%#Convert.ToBoolean(Eval("IsMidtermNoMarkAccept").ToString()) %>'>غياب: تم تقديم العذرالنصفي</span>
                                                                    <br />
                                                                    <span runat="server" style="color: red" visible='<%#!Convert.ToBoolean(Eval("IsMidtermNoMarkAccept").ToString()) && Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())  %>'>لم يتم تقديم العذرالنصفي</span>--%>
                                                                </td>
                                                                <td style="text-align: center"><span><%# (Convert.ToBoolean(Eval("IsFinalIncomplete").ToString())) ? "غير مكتمل": ((Convert.ToBoolean(Eval("IsFinalNoMark").ToString())) ? "غياب" : ((Convert.ToBoolean(Eval("IsTotalZero").ToString()))) ? "صفر في العلامة الكلية":  Eval("FinalMark")) %></span>
                                                                    <br />
                                                                    <span runat="server" style="color: green" visible='<%#Convert.ToBoolean(Eval("IsFinalIncomplete").ToString()) && Convert.ToBoolean(Eval("IsFinalNoMark").ToString()) %>'>تم تقديم طلب غير مكتمل</span>
                                                                    <br />
                                                                    <span runat="server" style="color: red" visible='<%#!Convert.ToBoolean(Eval("IsFinalIncomplete").ToString()) && Convert.ToBoolean(Eval("IsFinalNoMark").ToString())  %>'>لم يتم تقديم طلب غير مكتمل</span>

                                                                </td>
                                                                <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                <td style="text-align: center">
                                                                    <div class="actions">
                                                                        <div class="btn-group">
                                                                            <a class="btn default btn-xs green" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">خيارات <i class="fa fa-angle-down"></i></a>
                                                                            <ul class="dropdown-menu pull-right">
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbMidtermRevision" runat="server" class="btn default btn-xs black" Visible='<%# (Convert.ToBoolean(Eval("CanRevisionInDays").ToString())) && !Convert.ToBoolean(Eval("IsMidtermMarkRevisionRequest").ToString()) %>' OnClick="lbMidtermRevision_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تقديم طلب المراجعة ؟');"><i class="fa fa-edit"></i> تقديم طلب مراجعة للنصفي</asp:LinkButton>
                                                                                </li>
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbFinalRevision" runat="server" class="btn default btn-xs black" Visible='<%# Convert.ToBoolean(Eval("FinalCanRevisionInDays").ToString()) && !Convert.ToBoolean(Eval("IsMarkRevisionRequest").ToString()) %>' OnClick="lbFinalRevision_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تقديم طلب المراجعة ؟');"><i class="fa fa-edit"></i> تقديم طلب مراجعة للنهائي</asp:LinkButton>
                                                                                </li>
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbIsMidtermIncomplete" runat="server" Visible='<%# Convert.ToBoolean(Eval("IsMidtermNoMark").ToString()) && !Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString()) && Convert.ToBoolean(Eval("MidAcademicAccreditation").ToString()) %>' CssClass="btn default btn-xs black" OnClick="lbIsMidtermIncomplete_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إحتساب علامة الإمتحان النهائي من 70 ؟');">إحتساب من 70</asp:LinkButton>
                                                                                </li>
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbIsMidtermUnIncomplete" runat="server" Visible='<%# Convert.ToBoolean(Eval("IsMidtermNoMark").ToString()) && Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString()) && Convert.ToBoolean(Eval("MidAcademicAccreditation").ToString()) %>' CssClass="btn default btn-xs black" OnClick="lbIsMidtermUnIncomplete_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود التراجع عن إحتساب علامة الإمتحان النهائي من 70 ؟');">التراجع عن احتساب من 70</asp:LinkButton>
                                                                                </li>
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbFinalMarkIncompleteAdd" runat="server" CssClass="btn default btn-xs black" OnClick="lbFinalMarkIncompleteAdd_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تقديم طلب غير مكتمل ؟');" Visible='<%# !Convert.ToBoolean(Eval("IsFinalIncomplete").ToString()) && Convert.ToBoolean(Eval("IsFinalNoMark").ToString()) %>'>نهائي غير مكتمل</asp:LinkButton>
                                                                                </li>

                                                                                <li>
                                                                                    <asp:LinkButton ID="lbFinalMarkUnIncomplete" runat="server" CssClass="btn default btn-xs black" OnClick="lbFinalMarkUnIncomplete_OnClick" OnClientClick="return confirm('هل أنت متأكد من أنك تود التراجع عن تقديم طلب غير مكتمل ؟');" Visible='<%# Convert.ToBoolean(Eval("IsFinalIncomplete").ToString()) && Convert.ToBoolean(Eval("IsFinalNoMark").ToString()) %>'>التراجع عن نهائي غير مكتمل</asp:LinkButton>
                                                                                </li>

                                                                                <%--                                                                                <li>
                                                                                    <asp:LinkButton ID="IsMidtermNoMarkAccept" runat="server" CssClass="btn default btn-xs black" OnClick="IsMidtermNoMarkAccept_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود قبول عذر الإمتحان النصفي  ؟');" Visible='<%# !Convert.ToBoolean(Eval("IsMidtermNoMarkAccept").ToString()) && Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())  %>'>قبول العذر النصفي</asp:LinkButton>
                                                                                --%><%--<asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn default btn-xs black" OnClick="lbIsNoMidtermZero_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود التراجع إحتساب علامة الإمتحان النصفي صفر ؟');" Visible='<%# Convert.ToBoolean(Eval("IsMidtermZero").ToString()) %>'>التراجع عن نصفي صفر</asp:LinkButton>--%>
                                                                                <%--  </li>--%>
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbIsMidtermZero" runat="server" CssClass="btn default btn-xs black" OnClick="lbIsMidtermZero_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إحتساب علامة الإمتحان النصفي صفر ؟');" Visible='<%# !Convert.ToBoolean(Eval("IsMidtermZero").ToString()) %>'>نصفي صفر</asp:LinkButton>
                                                                                    <asp:LinkButton ID="lbIsNoMidtermZero" runat="server" CssClass="btn default btn-xs black" OnClick="lbIsNoMidtermZero_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود التراجع إحتساب علامة الإمتحان النصفي صفر ؟');" Visible='<%# Convert.ToBoolean(Eval("IsMidtermZero").ToString()) %>'>التراجع عن نصفي صفر</asp:LinkButton>
                                                                                </li>
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbIsFinalZero" runat="server" CssClass="btn default btn-xs black" OnClick="lbIsFinalZero_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إحتساب علامة الإمتحان النهائي صفر ؟');" Visible='<%# !Convert.ToBoolean(Eval("IsFinalZero").ToString()) %>'>نهائي صفر</asp:LinkButton>
                                                                                    <asp:LinkButton ID="lbIsNoFinalZero" runat="server" CssClass="btn default btn-xs black" OnClick="lbIsNoFinalZero_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود التراجع إحتساب علامة الإمتحان النهائي صفر ؟');" Visible='<%# Convert.ToBoolean(Eval("IsFinalZero").ToString()) %>'>التراجع عن نهائي صفر</asp:LinkButton>
                                                                                </li>

                                                                                <li>
                                                                                    <asp:LinkButton ID="lbIsTotalZero" runat="server" CssClass="btn default btn-xs black" OnClick="lbIsTotalZero_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إحتساب صفر للعلامة النهائية ؟');" Visible='<%# !Convert.ToBoolean(Eval("IsTotalZero").ToString()) %>'>كلي صفر</asp:LinkButton>
                                                                                    <asp:LinkButton ID="lbIsTotalNoZero" runat="server" CssClass="btn default btn-xs black" OnClick="lbIsTotalNoZero_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود التراجع  عن إحتساب  صفر للعلامة النهائية ؟');" Visible='<%# Convert.ToBoolean(Eval("IsTotalZero").ToString()) %>'>التراجع عن كلي صفر</asp:LinkButton>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <span id="Span2" style="text-align: center; color: red" runat="server" visible='<%# Convert.ToBoolean(Eval("IsMarkRevisionRequest").ToString()) %>'>تم تقديم طلب المراجعة للنهائي</span>
                                                                    <span><%# (Eval("IsPlanCourse").ToString() == "1") ? "داخل الخطة" : "خارج الخطة" %></span>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <tr>
                                                        <td></td>
                                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource6">
                                                            <ItemTemplate>
                                                                <td colspan="2" style="text-align: center"><span>الساعات المسجلة :</span> <span><%# Eval("RegisteredHours") %></span>
                                                                </td>
                                                                <td colspan="2" style="text-align: center"><span>ساعات النجاح :</span> <span><%# Eval("SucceedHour") %></span></td>
                                                                <td colspan="2" style="text-align: center"><span>ساعات الرسوب :</span> <span><%# Eval("FailedHour") %></span></td>
                                                                <td colspan="2" style="text-align: center"><span>ساعات إثرائية :</span> <span><%# Eval("RichnessHour") %></span></td>
                                                                <td colspan="2" style="text-align: center"><span>المعدل الفصلي :</span> <span><%# Eval("SemesterGPA") %></span></td>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <td style="text-align: center"></td>
                                                    </tr>
                                                    <%--    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdSemesterMarks" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlStdSemester2" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>--%>
                                                    <%--  <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="CalculateSemesterGPA" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlStdSemester2" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>--%>
                                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdSemesterStatistic" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlStdSemester2" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تسجيل مساقات لهذا الفصل الدراسي</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--            <div id="tab22" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h4>علامات المساقات قبل المعادلة</h4>
                                            </div>
                                            <div class="col-md-9 isra-pl-0">
                                                <div id="div2" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="Label1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                    <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row" style="border-bottom: 1px solid #ddd; padding: 15px 0;">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">الفصل الدراسي</label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="ddlSemester_3" runat="server" class="form-control" DataTextField="Semester" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlStdSemester_3_SelectedIndexChanged"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource30" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetStdSemesterWithoutTrans" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 15px;">
                                            <% if (Repeater18.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 8%">كود المساق</th>
                                                        <th style="width: 15%; text-align: center">المساق</th>
                                                        <th style="width: 5%; text-align: center">ع . س</th>
                                                        <th style="width: 5%; text-align: center">الحالة</th>
                                                        <th style="width: 10%; text-align: center">أعمال الفصل</th>
                                                        <th style="width: 10%; text-align: center">العلامة الفصلية</th>
                                                        <th style="width: 10%; text-align: center">العلامة النهائية</th>
                                                        <th style="width: 10%; text-align: center">العلامة</th>
                                                        <th style="width: 10%; text-align: center">خيارات</th>
                                                        <th style="width: 25%; text-align: center">ملاحظات</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater18" runat="server">
                                                        <ItemTemplate>
                                                            <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseHours") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseStatus") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("WorkMark") %></span></td>
                                                                <td style="text-align: center"><span><%# (Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "غير مكتمل": ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())) ? "غياب" : Eval("MidtermMark")) %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("FinalMark") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                <td style="text-align: center">
                                                                    <div class="actions">
                                                                        <div class="btn-group">
                                                                            <a class="btn default btn-xs green" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">خيارات <i class="fa fa-angle-down"></i></a>
                                                                            <ul class="dropdown-menu pull-right">
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbMidtermRevision" runat="server" class="btn default btn-xs black" Visible='<%# Convert.ToBoolean(Eval("IsMidtermMarkRevisionAvailable").ToString()) && !Convert.ToBoolean(Eval("IsMidtermMarkRevisionRequest").ToString()) %>' OnClick="lbMidtermRevision_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تقديم طلب المراجعة ؟');"><i class="fa fa-edit"></i> تقديم طلب مراجعة للنصفي</asp:LinkButton>
                                                                                </li>
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbFinalRevision" runat="server" class="btn default btn-xs black" Visible='<%# Convert.ToBoolean(Eval("IsMarkRevisionAvailable").ToString()) && !Convert.ToBoolean(Eval("IsMarkRevisionRequest").ToString()) %>' OnClick="lbFinalRevision_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تقديم طلب المراجعة ؟');"><i class="fa fa-edit"></i> تقديم طلب مراجعة للنهائي</asp:LinkButton>
                                                                                </li>
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbIsMidtermIncomplete" runat="server" CssClass="btn default btn-xs black" OnClick="lbIsMidtermIncomplete_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إحتساب علامة الإمتحان النهائي من 70 ؟');">إحتساب من 70</asp:LinkButton>
                                                                                </li>
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbFinalMarkIncompleteAdd" runat="server" CssClass="btn default btn-xs black" OnClick="lbFinalMarkIncompleteAdd_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تقديم طلب غير مكتمل ؟');">تقديم طلب غير مكتمل</asp:LinkButton>
                                                                                </li>
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbIsFinalZero" runat="server" CssClass="btn default btn-xs black" OnClick="lbIsFinalZero_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إحتساب علامة الإمتحان النهائي صفر ؟');" Visible='<%# !Convert.ToBoolean(Eval("IsFinalZero").ToString()) %>'>نهائي صفر</asp:LinkButton>
                                                                                    <asp:LinkButton ID="lbIsNoFinalZero" runat="server" CssClass="btn default btn-xs black" OnClick="lbIsNoFinalZero_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود التراجع إحتساب علامة الإمتحان النهائي صفر ؟');" Visible='<%# Convert.ToBoolean(Eval("IsFinalZero").ToString()) %>'>التراجع عن نهائي صفر</asp:LinkButton>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <span id="Span2" style="text-align: center; color: red" runat="server" visible='<%# Convert.ToBoolean(Eval("IsMarkRevisionRequest").ToString()) %>'>تم تقديم طلب المراجعة للنهائي</span>
                                                                    <span><%# (Eval("IsInternalTransformation").ToString() == "1") ? "معادلة داخلية" : (Eval("IsPlanCourse").ToString() == "1") ? "داخل الخطة" : "خارج الخطة" %></span>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <tr>
                                                        <td></td>
                                                        <asp:Repeater ID="Repeater19" runat="server">
                                                            <ItemTemplate>
                                                                <td colspan="2" style="text-align: center"><span>الساعات المسجلة :</span> <span><%# Eval("StudyHours") %></span>
                                                                </td>
                                                                <td colspan="2" style="text-align: center"><span>ساعات النجاح :</span> <span><%# Eval("SuccessfulHours") %></span></td>
                                                                <td colspan="2" style="text-align: center"><span>ساعات الرسوب :</span> <span><%# Eval("FailureHours") %></span></td>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:Repeater ID="Repeater20" runat="server">
                                                            <ItemTemplate>
                                                                <td colspan="2" style="text-align: center"><span>المعدل الفصلي :</span> <span><%# Eval("W") %></span></td>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <td style="text-align: center"></td>
                                                    </tr>

                                                    <asp:SqlDataSource ID="SqlDataSource33" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdSemesterStatistic" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlSemester_3" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تسجيل مساقات لهذا الفصل الدراسي</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div id="tab21" class="tab-pane" runat="server" clientidmode="Static">
                                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" class="portlet-body form">
                                    <ContentTemplate>--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>إنسحاب المساقات</h4>
                                            </div>
                                            <div class="col-md-9 isra-pl-0">
                                                <div id="divMsg21" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="lblMsg21" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                    <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row" style="border-bottom: 1px solid #ddd; padding: 15px 0;">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">الفصل الدراسي</label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="ddlStdSemester21" runat="server" class="form-control" DataTextField="Semester" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlStdSemester21_SelectedIndexChanged"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 15px;">
                                            <% if (Repeater15.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%">كود المساق</th>
                                                        <th style="width: 13%; text-align: center">المساق</th>
                                                        <th style="width: 8%; text-align: center"></th>
                                                        <th style="width: 8%; text-align: center">أعمال الفصل</th>
                                                        <th style="width: 8%; text-align: center">العلامة الفصلية</th>
                                                        <th style="width: 8%; text-align: center">العلامة النهائية</th>
                                                        <th style="width: 8%; text-align: center">العلامة</th>
                                                        <th style="width: 40%; text-align: center"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater15" runat="server">
                                                        <ItemTemplate>
                                                            <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>

                                                            <tr>
                                                                <td><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseStatus") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("WorkMark") %></span></td>
                                                                <td style="text-align: center"><span><%# (Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "غير مكتمل": ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())) ? "غياب" : Eval("MidtermMark")) %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("FinalMark") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                <td style="text-align: center">
                                                                    <% if (EmployeeID == "12" || EmployeeID == "5123")
                                                                        { %>
                                                                    <asp:Button ID="btnCancelCourse" runat="server" Text="إلغاء التسجيل" CssClass="btn green" OnClick="btnCancelCourse_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إلغاء تسجيل المساق ؟');" />
                                                                    <asp:Button ID="btnWithdrawCourse" runat="server" Text="إنسحاب" CssClass="btn blue" OnClick="btnWithdrawCourse_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود الإنسحاب من المساق ؟');" />
                                                                    <asp:Button ID="btnDelayCourse" runat="server" Text="سحب" CssClass="btn red" OnClick="btnDelayCourse_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود سحب المساق ؟');" />
                                                                    <asp:Button ID="btnUnCalculatedCourse" runat="server" Text="غير محتسب" CssClass="btn default" OnClick="btnUnCalculatedCourse_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تثبت غير محتسب للمساق ؟');" />
                                                                    <% } %>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <%--        <asp:SqlDataSource ID="SqlDataSource28" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdSemesterMarks" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlStdSemester21" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>--%>
                                                </tbody>
                                            </table>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تسجيل مساقات لهذا الفصل الدراسي</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <%--</ContentTemplate>
                                </asp:UpdatePanel>--%>
                            </div>
                            <div id="tab6" class="tab-pane" runat="server" clientidmode="Static">
                                <%--                  <% if (DataAccess.InternalTransformationIsAccreditation(lblStudentID.Text, "3") == false)

                                    { %>--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>كشف درجات الطالب</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater9.Items.Count > 0)
                                                {%>
                                            <asp:Repeater ID="Repeater9" runat="server" OnItemDataBound="Repeater9_OnItemDataBound">
                                                <ItemTemplate>
                                                    <div class="col-md-12 isra-clear">
                                                        <asp:Label ID="StdSemesterID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                        <div class="portlet">
                                                            <div class="portlet-title">
                                                                <div class="caption"><i class="fa fa-briefcase" style="width: 25px;"></i><span class="font-ha"><%# Eval("Semester") %></span></div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="width: 8%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                                <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>عدد الساعات</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>العلامة</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>التقدير</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>ضمن الخطة</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <asp:Repeater ID="Repeater92" runat="server">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td><span><%# Eval("CourseCode") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseHours") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("MarkEstimation") %></span></td>
                                                                                        <td><%#Convert.ToBoolean(Eval("IsPlanCourse"))? "نعم" : Convert.ToBoolean(Eval("IsInternalTransformation"))? "معادلة" : "لا"  %> </td>
                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                            <%--     <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetStdSemesterMarks" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>--%>
                                                                            <tr>
                                                                                <td colspan="8" style="text-align: left;">
                                                                                    <asp:Repeater ID="Repeater44" runat="server">
                                                                                        <ItemTemplate>
                                                                                            <span style="font-weight: bold;">المعدل التراكمي : </span>
                                                                                            <span><%# Eval("CumulativeGPA").ToString() + " %" %></span>
                                                                                            <span style="font-weight: bold;">المعدل الفصلي : </span>
                                                                                            <span><%# Eval("SemesterGPA").ToString() + " %" %></span>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>

                                                                                    <%--    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                        SelectCommand="GetStdGPAs" SelectCommandType="StoredProcedure">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>--%>
                                                                                    <%--       <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                        SelectCommand="CalculateSemesterGPA" SelectCommandType="StoredProcedure">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>--%>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <%--  <asp:SqlDataSource ID="SqlDataSource8" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStdSemesters" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>--%>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تسجيل فصول دراسية</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>

                                <%--                                   <% }
                                    else
                                    { %>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                        <strong>لم يتم اعتماد الكشف من الشؤون الأكاديمية</strong>
                                        <div style="clear: both"></div>
                                    </div>
                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                    <div style="clear: both"></div>
                                </div>

                                <% } %>--%>
                            </div>
                            <%--                <div id="tab20" class="tab-pane" runat="server">

                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h4 class="font-ha">كشف درجات الطالب قبل المعادلة</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">

                                            <% if (Repeater16.Items.Count > 0)
                                                {%>
                                            <asp:Repeater ID="Repeater16" runat="server" OnItemDataBound="Repeater16_OnItemDataBound">
                                                <ItemTemplate>
                                                    <div class="col-md-12 isra-clear">
                                                        <asp:Label ID="StdSemesterID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                        <div class="portlet">
                                                            <div class="portlet-title">
                                                                <div class="caption"><i class="fa fa-briefcase" style="width: 25px;"></i><span class="font-ha"><%# Eval("Semester") %></span></div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="width: 8%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                                <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>عدد الساعات</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>العلامة</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>التقدير</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>ضمن الخطة</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <asp:Repeater ID="Repeater92" runat="server">
                                                                                <ItemTemplate>
                                                                                    <tr>

                                                                                        <td><span><%# Eval("CourseCode") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseHours") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("MarkEstimation") %></span></td>
                                                                                        <td><%#Convert.ToBoolean(Eval("IsPlanCourse"))? "نعم" : Convert.ToBoolean(Eval("IsInternalTransformation"))? "معادلة" : "لا"  %> </td>

                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                                     <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetStdSemesterMarksBITrans" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>
                                                                            <tr>
                                                                                <td colspan="8" style="text-align: left;">
                                                                                    <asp:Repeater ID="Repeater41" runat="server">
                                                                                        <ItemTemplate>
                                                                                            <span style="font-weight: bold;">المعدل التراكمي : </span>
                                                                                            <span><%# Eval("BITransCumulativeGPA").ToString() + " %" %></span>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                    <asp:Repeater ID="Repeater31" runat="server">
                                                                                        <ItemTemplate>
                                                                                            <span style="font-weight: bold;">المعدل الفصلي : </span>
                                                                                            <span><%# Eval("w").ToString() + " %" %></span>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                                <asp:SqlDataSource ID="SqlDataSource41" runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                        SelectCommand="GetStdGPAs" SelectCommandType="StoredProcedure">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>
                                                                                            <asp:SqlDataSource ID="SqlDataSource31" runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                        SelectCommand="CalculateSemesterGPABITrans" SelectCommandType="StoredProcedure">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>

                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource29" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStdSemesters" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تسجيل فصول دراسية</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>

                                </div>

                            </div>--%>
                            <div id="tab7" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>إضافة مستند جديد</h4>
                                            </div>
                                            <div class="col-md-7 isra-pl-0">
                                                <div id="divMsg7" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="lblMsg7" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                    <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:Label ID="lblStdDocumentID" runat="server" Visible="false" />
                                                <div class="row">
                                                    <label class="col-md-2 control-label">المستند : </label>
                                                    <div class="col-md-6">
                                                        <asp:DropDownList ID="ddlStdDocumentType" runat="server" class="select2_category form-control" DataTextField="Name" DataValueField="ID" DataSourceID="SqlDataSource25"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource25" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="Select ID, Name From StdDocumentType Where IsActive=1 and IsDelete=0 union select -1, N'إختر نوع الوثيقة'"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <div class="col-md-offset-2 col-md-6">
                                                        <asp:TextBox ID="txtDocumentLink" Enabled="false" runat="server" ClientIDMode="Static" CssClass="form-control" Style="width: 70%; float: right;"></asp:TextBox>
                                                        <div class="fileUpload btn btn-primary" style="width: 30%; float: right;">
                                                            <span>إختر المستند</span>
                                                            <asp:FileUpload ID="fuDocument" ClientIDMode="Static" runat="server" CssClass="upload" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <div class="col-md-4 col-md-offset-2">
                                                        <asp:Button ID="btnDocumentUpload" runat="server" Text="حفظ المستند" CssClass="btn green" OnClick="btnDocumentUpload_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="row">
                                                    <label class="col-md-4 control-label">رقم الملف : </label>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="txtFileNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <div class="col-md-offset-4 col-md-6">
                                                        <asp:Button ID="btnSaveFileNumber" runat="server" Text="حفظ رقم الملف" CssClass="btn green" OnClick="btnSaveFileNumber_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <br />
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>مستندات الطالب</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <% if (ListView1.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 30%">المستند</th>
                                                            <th style="width: 30%">المستند</th>
                                                            <th style="width: 25%; text-align: center">تاريخ الرفع</th>
                                                            <th style="width: 15%"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView1" runat="server">
                                                            <ItemTemplate>
                                                                <asp:Label ID="StdDocumentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <tr <%# (lblStdDocumentID.Text==Eval("ID").ToString())?"style='background-color:#F5F5F5'":"" %>>
                                                                    <td><a href='http://admission.israa.edu.ps/Document/Student/<%# Eval("DocumentLink") %>' target="_blank"><%# Eval("StdDocumentType") %></a></td>
                                                                    <td><a href='http://admission.israa.edu.ps/Document/Student/<%# Eval("DocumentLink") %>' target="_blank"><%# Eval("DocumentName") %></a></td>
                                                                    <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>
                                                                    <td style="text-align: center">
                                                                        <asp:LinkButton ID="lbStdDocumentEdit" runat="server" class="btn default btn-xs black" OnClick="lbStdDocumentEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                                                        <asp:LinkButton ID="lbStdDocumentDelete" runat="server" class="btn default btn-xs purple" OnClick="lbStdDocumentDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <%-- <asp:SqlDataSource ID="SqlDataSource13" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="Select *,(Select Name From StdDocumentType Where ID=StdDocumentTypeID) as StdDocumentType From StdDocument Where StudentID=@StudentID and IsDelete=0 order by ID DESC">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>--%>
                                                    </tbody>
                                                </table>

                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <strong>لم يتم إضافة مستندات بعد</strong>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab8" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="form-horizontal">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h4>تسجيل مساقات الخطة</h4>
                                                    </div>
                                                    <div class="col-md-9 isra-pl-0">
                                                    </div>
                                                </div>
                                                <hr style="margin: 10px 0 15px 0" />
                                                <div runat="server" id="div_lvl1" visible="False" class="row" style="padding-top: 15px;">
                                                    <div class=" col-md-6">
                                                        <asp:DropDownList CssClass="form-control" ID="ddlPlaceOfStudies" DataTextField="Name" DataValueField="ID" runat="server"></asp:DropDownList>
                                                    </div>


                                                    <div class=" col-md-4">
                                                        <asp:Button ID="btnRegisterBlock" runat="server" Text="تسجيل مساقات " CssClass="btn green" OnClick="btnRegisterBlock_Click" />
                                                    </div>



                                                </div>

                                                <div runat="server" id="div_notlvl1" visible="False" class="row" style="padding-top: 15px;">


                                                    <div class=" col-md-4">
                                                        <asp:Button ID="Button3" runat="server" Text="تسجيل مساقات فرع يـــافا" CssClass="btn green" OnClick="btnRegisterBlockBranch2_Click" />
                                                    </div>

                                                    <div class=" col-md-4">
                                                        <asp:Button ID="Button1" runat="server" Text="تسجيل مساقات فرع الزهراء " CssClass="btn green" OnClick="btnRegisterBlockBranch1_Click" />
                                                    </div>


                                                </div>



                                                <br />
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div id="divMsg8" runat="server" class="alert alert-warning alert-dismissable block-msg" visible="false">
                                                            <asp:Label ID="lblMsg8" runat="server" Style="font-weight: bold; float: right; font-size: 14px"></asp:Label>
                                                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                            <div style="clear: both"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab9" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>إرسال رسالة SMS للطالب</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="divMsg9" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg9" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row" style="padding-top: 15px;">
                                                <label class="col-md-2 control-label">نص الرسالة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtSMSText" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 15px;">
                                                <div class="col-md-offset-2 col-md-6">
                                                    <asp:Button ID="btnSendSMS" runat="server" Text="إرسال الرسالة" CssClass="btn green" OnClick="btnSendSMS_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>رسائل الطالب</h4>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <% if (ListView4.Items.Count > 0)
                                                        { %>
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 10%;">الجوال </th>
                                                                <th style="width: 40%; text-align: center;">نص الرسالة</th>
                                                                <th style="width: 10%; text-align: center;">الحالة</th>
                                                                <th style="width: 20%; text-align: center;">المرسل</th>
                                                                <th style="width: 15%; text-align: center;">توقيت الإرسال</th>
                                                                <th style="width: 10%; text-align: center;"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:ListView ID="ListView4" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td><%# Eval("Jawwal")%></td>
                                                                        <td style="text-align: center"><%# Eval("MessageBody") %></td>
                                                                        <td style="text-align: center"><%# Eval("MsgStatus") %></td>
                                                                        <td style="text-align: center"><%# Eval("EmployeeName") %></td>
                                                                        <td style="text-align: center"><%# Eval("SendDate","{0:yyyy/MM/dd HH:mm tt}") %></td>
                                                                        <td>
                                                                            <asp:LinkButton ID="btnSendAgain" runat="server" CssClass="btn green" Style="font-size: 11px; padding: 4px 10px;">إعادة إرسال</asp:LinkButton></td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:ListView>
                                                            <%--      <asp:SqlDataSource runat="server" ID="SqlDataSource27" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetStudentStdMessage" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>--%>
                                                        </tbody>
                                                    </table>
                                                    <% } %>
                                                    <%  else
                                                        { %>
                                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                        <div class="col-xs-11" style="text-align: center">
                                                            <strong>لا يوجد رسائل للعرض</strong>
                                                            <div style="clear: both"></div>
                                                        </div>
                                                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <%  } %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab10" class="tab-pane" runat="server">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" class="portlet-body form">
                                    <ContentTemplate>
                                        <div class="form-horizontal">
                                            <asp:UpdateProgress ID="UpdateProgress4" runat="server" AssociatedUpdatePanelID="UpdatePanel4">
                                                <ProgressTemplate>
                                                    <div class="divWaiting">
                                                        <div class="alert alert-warning loading">
                                                            <span class="glyphicon glyphicon-refresh glyphicon-spin"></span>
                                                            <strong>جاري إجراء العملية ...</strong>
                                                        </div>
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h4>رغبات الطالب</h4>
                                                    </div>
                                                </div>
                                                <hr style="margin: 10px 0 15px 0" />
                                                <div class="row">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 2%; text-align: center"></th>
                                                                <th style="width: 23%; text-align: center">الكلية</th>
                                                                <th style="width: 20%; text-align: center">القسم</th>
                                                                <th style="width: 13%; text-align: center">س.ق.طلاب</th>
                                                                <th style="width: 15%; text-align: center">#المنتسبين</th>
                                                                <th style="width: 13%; text-align: center">س.ق.طالبات</th>
                                                                <th style="width: 14%; text-align: center">#المنتسبات</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater11" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>1</td>
                                                                        <td style="text-align: center"><%# Eval("CollegeName1") %></td>
                                                                        <td style="text-align: center"><%# Eval("DepartmentName1") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdMCapacity1") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentMInDep1") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdFMCapacity1") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentFMInDep1") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>2</td>
                                                                        <td style="text-align: center"><%# Eval("CollegeName2") %></td>
                                                                        <td style="text-align: center"><%# Eval("DepartmentName2") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdMCapacity2") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentMInDep2") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdFMCapacity2") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentFMInDep2") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>3</td>
                                                                        <td style="text-align: center"><%# Eval("CollegeName3") %></td>
                                                                        <td style="text-align: center"><%# Eval("DepartmentName3") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdMCapacity3") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentMInDep3") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdFMCapacity3") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentFMInDep3") %></td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <%--     <asp:SqlDataSource ID="SqlDataSource14" runat="server"
                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                SelectCommand="StudentWishesGet" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>--%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h4>تحويل البرنامج</h4>
                                                    </div>
                                                    <div class="col-md-9 isra-pl-0">
                                                        <div id="divMsg20" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                            <asp:Label ID="lblMsg20" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                            <div style="clear: both"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr style="margin: 10px 0 15px 0" />
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" style="text-align: left">البرنامج : </label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="SqlDataSource26" CssClass="form-control" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource26" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select * From Program Where IsActive=1 and IsDelete=0"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-offset-2 col-md-2">
                                                        <asp:Button ID="btnAcridiateProgram" runat="server" Text="تحويل برنامج الطالب" class="btn green" OnClick="btnAcridiateProgram_Click" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h4>تحويل التخصص</h4>
                                                    </div>
                                                    <div class="col-md-9 isra-pl-0">
                                                        <div id="divMsg10" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                            <asp:Label ID="lblMsg10" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                            <div style="clear: both"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr style="margin: 10px 0 15px 0" />
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" style="text-align: left">الكلية : </label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlCollege" runat="server" DataSourceID="SqlDataSource15" CssClass="select2_category form-control" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableCollege" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label" style="text-align: left">القسم : </label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource16" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Department] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND ([CollegeID]=@CollegeID)) union select -1,N'إختر التخصص'">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-offset-2 col-md-2">
                                                        <asp:Button ID="btnAccridiateStudent" runat="server" Text="قبول تحويل الطالب" class="btn green" OnClick="btnAcridiateStudent_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div id="tab11" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>تأجيل الفصل الدراسي</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="div3" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="Label2" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row" style="padding-top: 15px;">
                                                <label class="col-md-2 control-label">الفصل الدراسي</label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlStdSemester3" runat="server" class="form-control" DataTextField="ArName" DataValueField="ID" DataSourceID="SqlDataSource17"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource17" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="Select top 1 ID , (Select ArName From Semester Where ID=SemesterID) as ArName From StdSemester Where StudentID=@StudentID and (Select Code From Semester Where ID=SemesterID)<>'111111111' Order by ID DESC">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 15px;">
                                                <div class="col-md-offset-2 col-md-6">
                                                    <asp:Button ID="btnDelaySemester" runat="server" Text="تأجيل الفصل الدراسي" CssClass="btn green" OnClick="btnDelaySemester_Click" OnClientClick="return confirm('هل انت متاكد من أنك تود تأجيل الفصل الدراسي؟')" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab12" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="form-horizontal">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>شروط انتساب الطالب</h4>
                                            </div>
                                            <div class="col-md-9 isra-pl-0">
                                                <div id="divMsg12" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="lblMsg12" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                    <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>


                                                        <th style="width: 40%; text-align: center">الشرط</th>
                                                        <th style="width: 10%; text-align: center">الكل
                                                            <input type="checkbox" id="selectAll" />
                                                        </th>

                                                        <th style="width: 40%; text-align: center">ملاحظات</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater12" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <asp:Label ID="lblAdmissionConditionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <td style="text-align: right"><%# Eval("ConditionName") %></td>
                                                                <td style="text-align: center">
                                                                    <asp:CheckBox ID="cbIsValidate" runat="server" Checked='<%# Eval("IsValidate") %>' /></td>
                                                                <td style="text-align: center">
                                                                    <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="1" Width="300px" Text='<%# Eval("Notes") %>'></asp:TextBox></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <%--        <asp:SqlDataSource ID="SqlDataSource18" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStudentCondition" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>--%>
                                                </tbody>
                                            </table>
                                            <div class="form-group">
                                                <div class="col-md-offset-2 col-md-2">
                                                    <asp:Button ID="btnSaveStudentCondition" runat="server" Text="حفظ الشروط" class="btn green" OnClick="btnSaveStudentCondition_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab13" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>تغير نوع الطالب</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="divMsg13" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg13" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row" style="padding-top: 15px;">
                                                <label class="col-md-2 control-label">نوع الطالب</label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlStudentType" runat="server" class="form-control" DataTextField="ArName" DataValueField="ID" DataSourceID="SqlDataSource19"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource19" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="Select ID, ArName From StudentTypes union select -1,N'اختر نوع الطالب'"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 15px;">
                                                <label class="col-md-2 control-label">سبب التغيير</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtchangeTypeNote" runat="server" CssClass="form-control " TextMode="MultiLine" Rows="5"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 15px;">
                                                <div class="col-md-offset-2 col-md-6">
                                                    <asp:Button ID="btnChangeStudentType" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnChangeStudentType_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>تغير حالة الطالب</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="divMsg14" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg14" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row" style="padding-top: 15px;">
                                                <label class="col-md-2 control-label">حالة الطالب</label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlStudentStatus" runat="server" class="form-control" DataTextField="ArName" DataValueField="ID" DataSourceID="SqlDataSource23"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource23" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="Select ID, ArName From StudentStatus union select -1,N'اختر حالة الطالب'"></asp:SqlDataSource>
                                                </div>
                                            </div>

                                            <div class="row" style="padding-top: 15px;">
                                                <label class="col-md-2 control-label">الفصل الدراسي</label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlSemester" runat="server" class="form-control" DataTextField="Name" DataValueField="ID" DataSourceID="SqlDataSource1"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                </div>
                                            </div>

                                            <div class="row" style="padding-top: 15px;">
                                                <label class="col-md-2 control-label">سبب التغيير</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtChangeStatusNote" runat="server" CssClass="form-control " TextMode="MultiLine" Rows="5"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 15px;">
                                                <div class="col-md-offset-2 col-md-6">
                                                    <asp:Button ID="btnChangeStudentStatus" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnChangeStudentStatus_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div id="tab14" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>إنذارات الحضور والغياب</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <% if (ListView2.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 50%;">الإنذار</th>
                                                            <th style="width: 30%; text-align: center">المساق</th>
                                                            <th style="width: 20%; text-align: center">تاريخ الإنذار</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView2" runat="server">
                                                            <ItemTemplate>
                                                                <asp:Label ID="AttendanceWarningID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="WarningTypeID" runat="server" Text='<%# Eval("WarningTypeID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td>
                                                                        <asp:LinkButton ID="lblAttendanceWarning" runat="server" OnClick="lblAttendanceWarning_Click"><%# Eval("AttendanceWarningType") %></asp:LinkButton>
                                                                    </td>
                                                                    <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <%--      <asp:SqlDataSource ID="SqlDataSource21" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>"
                                                            SelectCommand="GetStudentAttendanceWarning" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>--%>
                                                    </tbody>
                                                </table>
                                                <asp:DataPager ID="DataPager2" runat="server" PageSize="10" PagedControlID="ListView2" class="pager">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                                        <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                                        <asp:NumericPagerField ButtonType="Link" />
                                                        <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                                    </Fields>
                                                </asp:DataPager>
                                                <div class="clearfix"></div>
                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <strong>لا يوجد إنذارات حضور وغياب علي الطالب</strong>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab16" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>إحصائيات الحضور والغياب</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <% if (ListView3.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 15%;">كود المساق</th>
                                                            <th style="width: 15%; text-align: center">المساق</th>
                                                            <th style="width: 10%; text-align: center">الشعبة</th>
                                                            <th style="width: 15%; text-align: center">المحاضر</th>
                                                            <th style="width: 15%; text-align: center">ع. المحاضرات</th>
                                                            <th style="width: 15%; text-align: center">ع. الحضور</th>
                                                            <th style="width: 15%; text-align: center">نسبة الحضور</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView3" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("Employee") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CountOfLectures") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CountOfLecturesExist") %></span></td>
                                                                    <td style="text-align: center"><span><%# Math.Round(((Convert.ToDouble(Eval("CountOfLecturesExist")) / Convert.ToDouble(Eval("CountOfLectures"))) * 100),2) %> %</span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <%--             <asp:SqlDataSource ID="SqlDataSource24" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>"
                                                            SelectCommand="GetStudentSectionsAttendanceStatistics" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>--%>
                                                    </tbody>
                                                </table>
                                                <div class="clearfix"></div>
                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <strong>لا يوجد مساقات مسجلة لهذا الفصل الدراسي</strong>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
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