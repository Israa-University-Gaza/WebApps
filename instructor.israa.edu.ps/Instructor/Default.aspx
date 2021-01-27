<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Instructor_Default" %>

<asp:Content ID="Style" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../assets/pages/css/profile-rtl.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
</asp:Content>

<asp:Content ID="Script" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <script src="../assets/global/plugins/counterup/jquery.waypoints.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>

    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#Default').addClass("active");
        });
    </script>

    <script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.8&appId=250255785419212";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

    </script>

</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>الصفحة الرئيسية</span>
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PROFILE SIDEBAR -->
            <div class="profile-sidebar">
                <!-- PORTLET MAIN -->
                <div class="portlet light profile-sidebar-portlet bordered">
                    <!-- SIDEBAR USERPIC -->
                    <div class="profile-userpic">
                        <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <img src='<%# Eval("Emp_Picture") %>' class="img-responsive img-thumbnail" style="display: block;" alt="">
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <!-- END SIDEBAR USERPIC -->
                    <!-- SIDEBAR USER TITLE -->
                    <div class="profile-usertitle">
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="profile-usertitle-name font-ha">د. <%# Eval("DisplayName") %></div>
                                <div class="profile-usertitle-job"><%# Eval("JobTitle") %></div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:IsraPermissions %>"
                            SelectCommand="GetEmployeeData" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <!-- END SIDEBAR USER TITLE -->
                    <!-- SIDEBAR MENU -->
                    <div class="profile-usermenu">
                        <ul class="nav">
                            <li class="active">
                                <a href="Default">
                                    <i class="icon-home"></i>الصفحة الرئيسية</a>
                            </li>
                            <li>
                                <a href="MyStudyTable">
                                    <i class="fa fa-table"></i>جدول محاضراتي</a>
                            </li>
                            <li>
                                <a href="MySectionsStudents">
                                    <i class="fa fa-user"></i>طلاب الشعب</a>
                            </li>
                            <%--<li>
                                <a href="MySectionsStudents">
                                    <i class="icon-pie-chart"></i>تقيم المحاضر الفصلي</a>
                            </li>--%>
                            <li>
                                <asp:LinkButton ID="lbLock" runat="server" OnClick="lbLock_Click"><i class="icon-lock"></i>تأمين الصفحة</asp:LinkButton>
                            </li>
                            <li>
                                <asp:LinkButton ID="lbSignOut1" runat="server" OnClick="lbSignOut_Click"><i class="icon-logout"></i>تسجيل الخروج</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                    <!-- END MENU -->
                </div>
                <!-- END PORTLET MAIN -->
                <!-- PORTLET MAIN -->
                <div class="portlet light bordered">
                    <!-- STAT -->
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <div class="row list-separated profile-stat">
                                <div class="col-md-4 col-sm-4 col-xs-6">
                                    <div class="uppercase profile-stat-title"><%# Eval("CountOfCourses") %></div>
                                    <div class="uppercase profile-stat-text font-ha">مساق</div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-6">
                                    <div class="uppercase profile-stat-title"><%# Eval("CountOfSections") %></div>
                                    <div class="uppercase profile-stat-text font-ha">شعبة</div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-6">
                                    <div class="uppercase profile-stat-title"><%# Eval("CountOfStudents") %></div>
                                    <div class="uppercase profile-stat-text font-ha">طالب</div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                        SelectCommand="GetInstructorStatistics" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                           <%--                                        <asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" Name="SemesterID" Type="Int32" />--%>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                        ConnectionString="<%$ ConnectionStrings:IsraaEvaluation %>"
                        SelectCommand="EvaluationLecturerResultInAllSections" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <!-- END STAT -->
                </div>
                <!-- END PORTLET MAIN -->
            </div>
            <!-- END BEGIN PROFILE SIDEBAR -->
            <!-- BEGIN PROFILE CONTENT -->
            <div class="profile-content">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="dashboard-stat2 bordered" style="padding: 15px;">
                            <div class="display" style="margin-bottom: 0">
                                <div class="number">
                                    <span class="font-ha">نرحب بك في <a href="http://elearning.israa.edu.ps/" target="_blank">برنامج التعليم الإلكتروني</a></span>
                                    <br />
                                    <span style="font-family: tahoma; font-size: 14px">ملاحظة يمكنك تسجيل الدخول لبرنامج التعليم الإلكتروني بإستخدام رقمك الوظيفي وكلمة المرور الخاصة بك لأول مرة</span>
                                </div>
                                <div class="icon">
                                    <a href="http://elearning.israa.edu.ps/" target="_blank">
                                        <img src="/images/moodle.png" style="height: 50px" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="dashboard-stat2 bordered" style="padding: 15px;">
                                    <div class="display" style="margin-bottom: 0">
                                        <div class="number">
                                            <h3 class="font-green-sharp">
                                                <span data-counter="counterup" data-value="<%# Eval("SumOfHours") %>">0</span>
                                            </h3>
                                            <span class="font-ha">عدد الساعات الأسبوعية</span>
                                        </div>
                                        <div class="icon">
                                            <i class="icon-pie-chart"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="dashboard-stat2 bordered" style="padding: 15px;">
                                    <div class="display" style="margin-bottom: 0">
                                        <div class="number">
                                            <h3 class="font-red-haze">
                                                <span data-counter="counterup" data-value="<%# Eval("CountOfLectures") %>">0</span>
                                            </h3>
                                            <span class="font-ha">عدد المحاضرات الأسبوعية</span>
                                        </div>
                                        <div class="icon">
                                            <i class="icon-"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="dashboard-stat2 bordered" style="padding: 15px;">
                                    <div class="display" style="margin-bottom: 0">
                                        <div class="number">
                                            <h3 class="font-blue-sharp">
                                                <span data-counter="counterup" data-value="<%# Eval("CountOfStudents") %>">0</span>
                                            </h3>
                                            <span class="font-ha">عدد الطلاب</span>
                                        </div>
                                        <div class="icon">
                                            <i class="icon-user"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                        </ItemTemplate>
                    </asp:Repeater>
                    <%--                    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="dashboard-stat2 bordered" style="padding: 15px;">
                                    <div class="display" style="margin-bottom: 0">
                                        <div class="number">
                                            <h3 class="font-red-haze">
                                                <span data-counter="counterup" data-value="<%# Eval("EvaluatedPercentage") %>">0</span>
                                                <span>%</span>
                                            </h3>
                                            <span class="font-ha">تقيم المحاضر</span>
                                        </div>
                                        <div class="icon">
                                            <i class="icon-pie-chart"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>--%>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="dashboard-stat2 bordered" style="padding: 15px;">
                            <div class="display" style="margin-bottom: 0">
                                <div class="number">
                                    <div style="padding: 0 0 7px 0; height: 35px;">
                                        <div class="fb-like" data-href="https://www.facebook.com/israaedu/" data-layout="button_count" data-action="like" data-size="large" data-show-faces="true" data-share="true"></div>
                                    </div>
                                    <span class="font-ha">صفحتنا علي الفيس بوك</span>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-facebook"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-12">
                        <%--<!-- BEGIN PORTLET -->
                        <div class="portlet light bordered">
                            <div class="portlet-title">
                                <div class="caption caption-md">
                                    <i class="icon-bar-chart theme-font hide"></i>
                                    <span class="caption-subject font-blue-madison bold uppercase">تقيم المحاضر الفصلي</span>
                                </div>
                                <div class="actions">
                                    <a href="#" class="btn btn-transparent grey-salsa btn-circle btn-sm active">تقيم المحاضر</a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-scrollable table-scrollable-borderless">
                                    <% if (Repeater6.Items.Count > 0)
                                        { %>
                                    <table class="table table-hover table-light">
                                        <thead>
                                            <tr class="uppercase">
                                                <th style="width: 15%; text-align: center;">كود المساق</th>
                                                <th style="width: 25%; text-align: center;">اسم المساق </th>
                                                <th style="width: 10%; text-align: center;">الشعبة</th>
                                                <th style="width: 15%; text-align: center;">عدد المسجلين</th>
                                                <th style="width: 15%; text-align: center;">عدد المقيمين</th>
                                                <th style="width: 20%; text-align: center;">النسبة</th>
                                            </tr>
                                        </thead>
                                        <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("NumOfRegisterd") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("EvaluatedStudentCount") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("Percentage") %> %</span></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                            ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>'
                                            SelectCommand="GetEvaluationTeacherResult" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                <asp:Parameter DefaultValue="5" Name="SemesterID" Type="Int32"></asp:Parameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </table>
                                    <% }
                                        else
                                        {%>
                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                        <div class="col-xs-11" style="text-align: center;">
                                            <strong>لا يوجد لديك شعب للتقييم</strong>
                                            <div style="clear: both"></div>
                                        </div>
                                        <button type="button" style="margin-top: 7px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <!-- END PORTLET -->--%>

                        <!-- BEGIN PORTLET -->
                        <div class="portlet light bordered">
                            <div class="portlet-title">
                                <div class="caption caption-md">
                                    <i class="icon-bar-chart theme-font hide"></i>
                                    <span class="caption-subject font-blue-madison bold uppercase">محاضرات اليوم</span>
                                </div>
                                <div class="actions">
                                    <a href="MyStudyTable" class="btn btn-transparent grey-salsa btn-circle btn-sm active">جدول المحاضرات</a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-scrollable table-scrollable-borderless">
                                    <% if (Repeater3.Items.Count > 0)
                                        { %>
                                    <table class="table table-hover table-light">
                                        <thead>
                                            <tr class="uppercase">
                                                <th style="width: 40%;">المساق</th>
                                                <th style="width: 25%; text-align: center;">القاعة</th>
                                                <th style="width: 35%; text-align: center;">الموعد</th>
                                            </tr>
                                        </thead>
                                        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("CourseArName") %></td>
                                                    <td style="text-align: center;"><%# Eval("Room") %></td>
                                                    <td style="text-align: center;"><%# Eval("LectureTime") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                            SelectCommand="GetInstructorTodayLectures" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                <asp:ControlParameter ControlID="lblSemesterID" Name="SemesterID" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </table>
                                    <% }
                                        else
                                        {%>
                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                        <div class="col-xs-11" style="text-align: center;">
                                            <strong>لا يوجد لديك محاضرات اليوم</strong>
                                            <div style="clear: both"></div>
                                        </div>
                                        <button type="button" style="margin-top: 7px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <!-- END PORTLET -->
                    </div>
                </div>
                <% if (ListView2.Items.Count > 0)
                    { %>
                <div class="row">
                    <div class="col-md-12" style="
    visibility: hidden;
">
                        <!-- BEGIN PORTLET -->
                        <div class="portlet light bordered">
                            <div class="portlet-title">
                                <div class="caption caption-md">
                                    <i class="icon-bar-chart theme-font hide"></i>
                                    <span class="caption-subject font-blue-madison bold uppercase">طلبات توصيف المساق</span>
                                </div>
                                <div class="actions">
                                    <a href="#" class="btn btn-transparent grey-salsa btn-circle btn-sm active">توصيف المساق</a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-scrollable table-scrollable-borderless">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%">البرنامج</th>
                                                <th style="width: 20%; text-align: center">الكلية</th>
                                                <th style="width: 30%; text-align: center">القسم</th>
                                                <th style="width: 30%; text-align: center">المساق</th>
                                                <th style="width: 10%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource7">
                                                <ItemTemplate>
                                                    <asp:Label ID="SyllabusID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("ProgramName") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("CollegeName") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("DepartmentName") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                                        <td style="text-align: center">
                                                            <div class="actions">
                                                                <div class="btn-group">
                                                                    <a class="btn red btn-outline btn-circle btn-sm uppercase sbold" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">خيارات
                                                                        <i class="fa fa-angle-down"></i>
                                                                    </a>
                                                                    <ul class="dropdown-menu pull-right">
                                                                        <li>
                                                                            <asp:LinkButton ID="lbOpenSyllabus" runat="server" OnClick="lbOpenSyllabus_Click"><i class="fa fa-edit"></i> <span>توصيف المساق</span></asp:LinkButton>
                                                                        </li>
                                                                        <li>
                                                                            <asp:LinkButton ID="lbPrintSyllabus" runat="server" OnClick="lbPrintSyllabus_Click"> طباعة توصيف المساق</asp:LinkButton>
                                                                        </li>
                                                                        <li>
                                                                            <%-- <asp:LinkButton ID="lbAccreditSyllabus" runat="server" OnClick="lbAccreditSyllabus_Click" Visible='<%# ((Eval("SyllabusFilled").ToString() == "1") && (Eval("ValidatePlace").ToString() == "1")) %>'>اعتماد توصيف المساق</asp:LinkButton>--%>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource ID="SqlDataSource7" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                SelectCommand="GetSyllabus" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblEmployeeID" Name="InstructorID" PropertyName="Text" Type="Int32" />
                                                    <asp:Parameter Name="PlaceID" DefaultValue="1" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- END PORTLET -->
                    </div>
                </div>
                <% } %>
                <%--<div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN PORTLET -->
                        <div class="portlet light bordered">
                            <div class="portlet-title tabbable-line">
                                <div class="caption caption-md">
                                    <i class="icon-globe theme-font hide"></i>
                                    <span class="caption-subject font-blue-madison bold uppercase">الإمتحانات الإلكترونية</span>
                                </div>
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#tab_1_1" data-toggle="tab">آخر إمتحاناتي</a>
                                    </li>
                                    <li>
                                        <a href="Question">بنك الأسئلة</a>
                                    </li>
                                    <li>
                                        <a href="CourseQuestionStatistics">إحصائيات الأسئلة</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="portlet-body">
                                <!--BEGIN TABS-->
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1_1">
                                        <div class="scroller" style="min-height: 150px" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
                                            <% if (ListView1.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 15%">الإمتحان</th>
                                                        <th style="width: 15%; text-align: center">ع. الأسئلة</th>
                                                        <th style="width: 15%; text-align: center">العلامة</th>
                                                        <th style="width: 15%; text-align: center">المدة</th>
                                                        <th style="width: 10%; text-align: center">فعال</th>
                                                        <th style="width: 10%"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ExamFormID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="ExamFormType" runat="server" Text='<%# Eval("ExamFormType") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td><span><%# Eval("ExamCategory") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CountOfQuestions") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("TimePeriod",@"{0:hh\:mm\:ss}") %></span></td>
                                                                <td style="text-align: center">
                                                                    <asp:CheckBox ID="cbIsActive" runat="server" Enabled="false" Checked='<%# Eval("IsActive") %>' />
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <div class="actions">
                                                                        <div class="btn-group">
                                                                            <a class="btn red btn-outline btn-circle btn-sm uppercase sbold" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">خيارات
                                                                            <i class="fa fa-angle-down"></i>
                                                                            </a>
                                                                            <ul class="dropdown-menu pull-right">
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbOpenExamForm" runat="server" OnClick="lbOpenExamForm_Click"><i class="fa fa-edit"></i> فتح النموذج</asp:LinkButton>
                                                                                </li>
                                                                                <li>
                                                                                    <asp:LinkButton ID="lbGenerateStudentExam" runat="server" OnClick="lbGenerateStudentExam_Click"><i class="fa fa-edit"></i> توليد الإمتحان</asp:LinkButton>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                                        SelectCommand="GetEmployeeCourseExamForms" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lblEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                                                            <asp:ControlParameter ControlID="lblSemesterID" Name="SemesterID" PropertyName="Text" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                            <div class="clearfix"></div>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لا يوجد نماذج إمتحانات مضافة</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 7px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <!--END TABS-->
                            </div>
                        </div>
                        <!-- END PORTLET -->
                    </div>
                </div>--%>
            </div>
            <!-- END PROFILE CONTENT -->
        </div>
    </div>
</asp:Content>

