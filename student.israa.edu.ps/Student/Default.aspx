<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/css/pages/profile-rtl.css" rel="stylesheet" type="text/css" />
    <style>
        .sale-summary li .sale-num {
            color: #169ef4;
            font-family: hasanin;
            font-size: 14px;
            font-weight: 100;
        }

        .sale-summary li .sale-info {
            color: #646464;
            float: right;
            font-family: hasanin;
            font-size: 12px;
            text-transform: uppercase;
        }

        .sale-summary li {
            border-top: none;
            overflow: hidden;
            padding: 1.9px 0;
        }
    </style>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu1').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Default.aspx" class="font-ha">الصفحة الرئيسية</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="alert alert-info" role="alert">
    <h4>
       <a href="http://student.israa.edu.ps/ELearning.pdf" > نشرة ارشادية لمميزات التعليم الاكتروني</a>
    </h4>
    </div>
<div class="col-md-12" id="box" runat="server" visible="false">
    <div class="alert alert-danger" role="alert">
    <h2>
        لديك تحذير اكاديمي الرجاء مراجعة القبول و التسجيل في أسرع وقت لاكمال عملية التسجيل
    </h2>
    </div>
</div>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>الرئيسية</div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-3">
                        <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                            <li>
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                            </li>
                            <li class="active">
                                <a href="Default.aspx">
                                    <i class="fa fa-home"></i>الصفحة الرئيسية
                                </a>
                                <span class="after"></span>
                            </li>
                            <li><a href="StudentProfile.aspx#tab1"><i class="fa fa-briefcase"></i>بيانات أساسية</a></li>
                            <li><a href="StudentProfile.aspx#tab2"><i class="fa fa-male"></i>بيانات ولي الأمر</a></li>
                            <li><a href="StudentProfile.aspx#tab3"><i class="fa fa-mobile-phone"></i>بيانات الإتصال</a></li>
                            <li><a href="StudentImage.aspx"><i class="fa fa-camera"></i>تغيير الصورة الشخصية</a></li>
                            <li><a href="StudyTable.aspx"><i class="fa fa-table"></i>الجدول الدراسي</a></li>
                            <li><a href="StdSemesterMark.aspx"><i class="fa fa-table"></i>علامات المساقات</a></li>
                            <li><a href="ChangePassword.aspx"><i class="fa fa-lock"></i>تغير كلمة المرور</a></li>
                            <li>
                                <asp:LinkButton ID="lbSignOut" runat="server" OnClick="lbSignOut_Click"><i class="fa fa-key"></i>تسجيل الخروج</asp:LinkButton></li>
                        </ul>
                    </div>
                    <div class="col-md-9">
                       <%-- %> <% if (IsGraduated )
                        {  %>


                        <br />
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h1 class="panel-title text-danger"> التسجيل لحفل الخريجين الاول 2019 </h1>
                            </div>
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>
                                            <span style="font-family: tahoma; font-size: 14px">
                                                - رسوم التسجيل 20 دينار شاملة روب التخرج يتم فرضها على الطالب بمجرد التسجيل
                                                <br />
                                                - يرجى التوجه للدائرة  المالية بعد التسجيل لتسديد رسوم التخرج وتثبيت الاشتراك في الحفل
                                                <br />
                                                - آخر موعد للتسجيل 10/8/2019
                                                <br />
                                                <br />
                                                <asp:Button ID="Button1" CssClass="btn green " OnClick="Button1_OnClick" runat="server" Text="اضغط هنا للاشتراك" />

                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br />




                        <%  } %> --%>



                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-md-8 profile-info">
                                        <h1><%# Eval("StudentName") %></h1>
                                        <br />
                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                            <ItemTemplate>
                                                <div class="portlet box blue tabbable">
                                                    <div class="portlet-title">
                                                        <div class="caption font-ha" style="font-size: 13px"><i class="fa fa-reorder" style="line-height: 9px;"></i>تقويم <%# Eval("ArName") %></div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <div class=" portlet-tabs">
                                                            <ul class="nav nav-tabs">
                                                                <li class="active"><a data-toggle="tab" href="#portlet_tab1">1</a></li>
                                                                <li class=""><a data-toggle="tab" href="#portlet_tab2">2</a></li>
                                                            </ul>
                                                            <div class="tab-content">
                                                                <div id="portlet_tab1" class="tab-pane active">
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="text-align: right; width: 80%">البيان</th>
                                                                                <th style="width: 20%">التاريخ</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>بداية التسجيل</td>
                                                                                <td><%# Eval("RegisterBeginning","{0:yyyy/MM/dd}") %></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>نهاية التسجيل</td>
                                                                                <td><%# Eval("RegisterEnd","{0:yyyy/MM/dd}") %></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>نهاية السحب</td>
                                                                                <td><%# Eval("DelayEnd","{0:yyyy/MM/dd}") %></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>نهاية الإنسحاب</td>
                                                                                <td><%# Eval("WithdrawEnd","{0:yyyy/MM/dd}") %></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div id="portlet_tab2" class="tab-pane">
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="text-align: right; width: 80%">البيان</th>
                                                                                <th style="width: 20%">التاريخ</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>بداية الدراسة</td>
                                                                                <td><%# Eval("StudyBeginning","{0:yyyy/MM/dd}") %></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>بداية السحب و الإضافة</td>
                                                                                <td><%# Eval("AddBeginning","{0:yyyy/MM/dd}") %></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>بداية الإمتحانات النهائية</td>
                                                                                <td><%# Eval("StartFinalExams","{0:yyyy/MM/dd}") %></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>نهاية الإمتحانات النهائية</td>
                                                                                <td><%# Eval("EndFinalExams","{0:yyyy/MM/dd}") %></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetStdLastSemesterAgenda" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <br />
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><span>نرحب بك في <a href="http://elearning.israa.edu.ps/Login.aspx" target="_blank">برنامج التعليم الإلكتروني</a></span></h3>
                                            </div>
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td><span style="font-family: tahoma; font-size: 14px">ملاحظة يمكنك تسجيل الدخول لبرنامج التعليم الإلكتروني بإستخدام رقمك الجامعي وكلمة المرور الخاصة بك لأول مرة</span></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <br />
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">إعلانات الطلبة</h3>
                                            </div>
                                            <table class="table">
                                                <tbody>
                                                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="width: 80%"><a href="StudentAdvertisement.aspx?id=<%# Eval("ID") %>"><%# Eval("Title") %></a></td>
                                                                <td style="width: 20%"><%# Eval("AdvDate") %></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                            </table>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="StdAdvertismentGet" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
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
                                                        <span class="sale-info">الكلية : </span>
                                                        <span class="sale-num"><%# Eval("StudentCollege") %></span>
                                                    </li>
                                                    <li>
                                                        <span class="sale-info">القسم : </span>
                                                        <span class="sale-num"><%# Eval("StudentDepartment") %></span>
                                                    </li>
                                                    <li>
                                                        <%-- By RSR --%>
                                                        <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                            <ItemTemplate>
                                                                <span class="sale-info">الرصيد(بدون قروض) : </span>
                                                                <span class="sale-num"><%# Eval("Balance") %></span>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        
                                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                                            SelectCommand="GetRealStudentBalance" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <%-- end By RSR --%>
                                                    </li>
                                                    <li>
                                                        <%-- By RSR --%>
                                                        <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
                                                            <ItemTemplate>
                                                                <span class="sale-info">قروض : </span>
                                                                <span class="sale-num"><%# Eval("TotalLoans") %></span>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                                            SelectCommand="GetRealStudentLoans" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <%-- end By RSR --%>
                                                    </li>
                                                    <li>
                                                        <%-- By RSR --%>
                                                        <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
                                                            <ItemTemplate>
                                                                <span class="sale-info">إجمالي الرصيد : </span>
                                                                <span class="sale-num"><%# Eval("TotalBalanceAndLoans") %> دينار</span>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        
                                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                                            SelectCommand="GetRealStudentBalanceAndLoans" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <%-- end By RSR --%>
                                                    </li>
                                                    <li>
                                                        <span class="sale-info">حالة الطالب : </span>
                                                        <span class="sale-num"><%# Eval("StudentStatus") %></span>
                                                    </li>
                                                    <li>
                                                        <span class="sale-info">المستوي الدراسي : </span>
                                                        <span class="sale-num"><%# Eval("Studentlevel") %></span>
                                                    </li>
                                                    <% if (DataAccess.IsBlockedStudent(StudentID).Rows[0]["status"].ToString() == "1")
                                                        {
                                                    %>
                                                    <%--                                             <li>
                                                        <span class="sale-info">المعدل التراكمي خريج : </span>
                                                        <span class="sale-num"><%# Eval("GPAGraduate") %></span>
                                                    </li>--%>
                                                    <li>
                                                        <span class="sale-info">المعدل التراكمي : </span>
                                                        <span class="sale-num"><%# Eval("SemesterCumulativeGraduateGPA") %></span>
                                                    </li>
                                                    <%--                                                    <li>
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
                                                    </li>--%>

                                                    <% } %>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col-md-4-->
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:isra %>"
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
</asp:Content>
