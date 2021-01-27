<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Academic_Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/css/preloading.css" rel="stylesheet" />
    <style>
        .sale-summary li .sale-num {
            color: #169ef4;
            font-family: hasanin;
            font-size: 14px;
            font-weight: 100;
            float: left;
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

        .dropdown-menu li > a {
            clear: both;
            color: #333;
            display: block;
            font-weight: normal;
            line-height: 18px;
            padding: 0;
            text-decoration: none;
            white-space: nowrap;
        }

        .dropdown.open .dropdown-toggle {
            background: #e0eaf0 !important;
            color: #121212;
        }

        .sp > a {
            height: 30px;
            width: 242px;
            text-align: right;
            color: #fff !important;
            background-color: #169ef4 !important;
            display: inline-block;
            line-height: 29px;
            font-family: hasanin;
            padding: 0 10px 0 0;
        }

        .sp .dropdown-menu li > a {
            clear: both;
            color: #fff;
            display: block;
            font-weight: normal;
            line-height: 22px;
            padding: 0;
            text-decoration: none;
            white-space: nowrap;
            height: 30px !important;
            display: inline-block;
            width: 100%;
        }

        .sp .dropdown.open .dropdown-toggle {
            background: #fff !important;
            color: #4b8df8 !important;
        }

        .spa {
            background: #fff !important;
            color: #4b8df8 !important;
            border: none !important;
            text-align: right;
            padding: 0 15px !important;
        }

            .spa:hover {
                background-color: #4b8df8 !important;
                color: #fff !important;
            }
    </style>

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
                                        <h5 class="font-ha" style="text-align: center;"><%# Eval("DisplayName") %> (<%# Eval("StudentNo") %>)</h5>
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
                            <li id="litab1" runat="server" class="active"><a data-toggle="tab" href="#tab1"><i class="fa fa-home"></i>الصفحة الرئيسية</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-list"></i>ملف الطالب </a>
                                <ul class="dropdown-menu ver-inline-menu tabbable margin-bottom-10 font-ha" role="menu" style="width: 199px; margin-right: 199px; margin-top: -38px">
                                    <li><a href="StudentProfile.aspx#tab1"><i class="fa fa-briefcase"></i>بيانات أساسية</a></li>
                                    <li><a href="StudentProfile.aspx#tab2"><i class="fa fa-male"></i>بيانات ولي الأمر</a></li>
                                    <li><a href="StudentProfile.aspx#tab3"><i class="fa fa-mobile-phone"></i>بيانات الإتصال</a></li>
                                    <li><a href="StudentFinancialProfile.aspx"><i class="fa fa-edit"></i>الملف المالي</a></li>
                                </ul>
                            </li>
                            <li><a data-toggle="tab" href="#tab2"><i class="fa fa-book"></i>شروط الإنتساب</a></li>
                            <li id="litab3" runat="server"><a data-toggle="tab" href="#tab3"><i class="fa fa-book"></i>معادلة خارجية</a></li>
                            <li id="li3" runat="server"><a href="StdInternalTransformationAdd.aspx"><i class="fa fa-lock"></i>معادلة داخلية </a></li>
                            <%--                            <li id="litab4" runat="server"><a data-toggle="tab" href="#tab4"><i class="fa fa-book"></i>معادلة داخلية</a></li>--%>
                            <li><a data-toggle="tab" href="#tab5"><i class="fa fa-book"></i>الخطة الدراسية</a></li>
                            <li><a data-toggle="tab" href="#tab25"><i class="fa fa-book"></i>الخطة الدراسية باللغة الانجليزية</a></li>
                            <li><a data-toggle="tab" href="#tab6"><i class="fa fa-list-alt"></i>الجدول الدراسي</a></li>
                            <li id="litab12" runat="server"><a data-toggle="tab" href="#tab12"><i class="fa fa-stack-exchange"></i>علامات المساقات</a></li>
                            <li id="litab16" runat="server"><a data-toggle="tab" href="#tab16"><i class="fa fa-stack-exchange"></i>علامات المساقات ماقبل المعادلة</a></li>
                            <li id="litab15" runat="server"><a data-toggle="tab" href="#tab15"><i class="fa fa-lock"></i>كشف الإرشاد الأكاديمي</a></li>
                            <li id="litab7" runat="server"><a data-toggle="tab" href="#tab7"><i class="fa fa-table"></i>جدول الإمتحانات</a></li>
                            <li><a data-toggle="tab" href="#tab8"><i class="fa fa-lock"></i>كشف الدرجات</a></li>
                            <li><a data-toggle="tab" href="#tab20"><i class="fa fa-lock"></i>كشف الدرجات قبل المعادلة</a></li>
                            <li><a data-toggle="tab" href="#tab9"><i class="fa fa-lock"></i>مستندات الطالب</a></li>
                            <li id="litab11" runat="server"><a data-toggle="tab" href="#tab11"><i class="fa fa-lock"></i>إنذارات الحضور والغياب</a></li>
                            <li id="litab10" runat="server"><a data-toggle="tab" href="#tab10"><i class="fa fa-book"></i>رفض الطالب</a></li>
                            <li id="li1"><a href="ExceptionStudentGeneralAdd.aspx"><i class="fa fa-book"></i>استثناءات التسجيل الفصلي</a></li>
                            <li id="litab18" runat="server"><a href="ExceptionStudentCourseAdd.aspx"><i class="fa fa-lock"></i>استثناء تسجيل مساق </a></li>
                            <% if (Permissions.Contains("StudentInfraction"))
                                { %>
                            <li id="li2" runat="server"><a href="StdInfractionAddEdit.aspx"><i class="fa fa-lock"></i>مخالفات الطالب </a></li>
                            <% } %>
                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div id="tab1" runat="server" class="tab-pane active" clientidmode="Static">
                                <asp:Repeater ID="Repeater10" runat="server" DataSourceID="SqlDataSource11">
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
                                <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStudentInfo" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div id="tab2" class="tab-pane">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4 class="font-ha">شروط الإنتساب</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater2.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%; text-align: center">متحقق</th>
                                                        <th style="width: 40%; text-align: center">الشرط</th>
                                                        <th style="width: 50%; text-align: center">ملاحظات</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource5">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <asp:Label ID="lblAdmissionConditionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label><td style="text-align: center">
                                                                    <asp:CheckBox ID="cbIsValidate" runat="server" Checked='<%# Eval("IsValidate") %>' Enabled="false" /></td>
                                                                <td style="text-align: right"><%# Eval("ConditionName") %></td>
                                                                <td style="text-align: center"><span><%# Eval("Notes") %></span></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStudentCondition" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لا يوجد شروط مضافة للطالب</strong>
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
                                                <h4 class="font-ha" style="padding: 0;">معادلة خارجية</h4>
                                            </div>
                                            <div class="col-md-9" style="font-size: 14px; padding: 0px; direction: ltr!important">
                                                <% if ((Permissions.Contains("UniversityDeanStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "1")) ||
                                                                                                                 (Permissions.Contains("HeadStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "2")) ||
                                                                                                                     (Permissions.Contains("DeanStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "3")) ||
                                                                                                                     (Permissions.Contains("AcademicStudentExternalTransforamtion")))
                                                    { %>
                                                <asp:LinkButton ID="lbTransformationAccreditation" runat="server" OnClick="lbTransformationAccreditation_Click" CssClass="btn default green col-md-offset-4 col-md-3 font-ha">إعتماد المعادلة</asp:LinkButton>
                                                <% } %>
                                                <ul class="col-md-5" style="padding: 0px 15px 0 0; float: left">
                                                    <li class="dropdown sp blue" style="list-style: none">
                                                        <a href="#" class="stdropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down" style="float: left; line-height: 27px; margin-left: 5px;"></i>تقارير المعادلة </a>
                                                        <ul class="dropdown-menu ver-inline-menu tabbable margin-bottom-10 font-ha" role="menu" style="margin-right: 0px; width: 243px;">
                                                            <li>
                                                                <asp:LinkButton ID="lbUnAccrediteETransformation" runat="server" OnClick="lbUnAccrediteETransformation_Click" CssClass="btn  spa">كشف غير معتمد بالمساقات المعادلة</asp:LinkButton></li>
                                                            <li>
                                                                <asp:LinkButton ID="lbAccrediteETransformation" runat="server" OnClick="lbAccrediteETransformation_Click" CssClass="btn  spa">كشف معتمد بالمساقات المعادلة</asp:LinkButton></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if ((Permissions.Contains("UniversityDeanStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "1")) ||
                                                                                                                 (Permissions.Contains("HeadStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "2")) ||
                                                                                                                     (Permissions.Contains("DeanStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "3")) ||
                                                                                                                     (Permissions.Contains("AcademicStudentExternalTransforamtion")))
                                                { %>
                                            <div class="row">
                                                <% if (Repeater5.Items.Count > 0)
                                                    { %>
                                                <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource6">
                                                    <ItemTemplate>
                                                        <div class=" isra-clear">
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
                                                                                    <th style="width: 10%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                                    <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                                    <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق المعادل</th>
                                                                                    <th style="width: 10%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . س</th>
                                                                                    <th style="width: 13%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع.س.م</th>
                                                                                    <th style="width: 27%; text-align: center"></th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblCourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="false"></asp:Label>
                                                                                        <asp:Label ID="TransformationID" runat="server" Text='<%# Eval("TransformationID") %>' Visible="false"></asp:Label>
                                                                                        <tr>
                                                                                            <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseCode") %></span></td>
                                                                                            <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseArName") %></span></td>
                                                                                            <td style="text-align: center;">
                                                                                                <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" Style="text-align: center; height: 30px; font-size: 12px;" Text='<%# Eval("TransCourseName") %>' Enabled='<%# Eval("CanTrans").ToString()=="1"? true :false %>'></asp:TextBox>
                                                                                            </td>
                                                                                            <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                                            <td style="text-align: center;">
                                                                                                <asp:TextBox ID="txtCourseHours" runat="server" CssClass="form-control" Style="text-align: center; height: 30px; font-size: 12px;" Text='<%# Eval("TransCourseHours") %>' Enabled='<%# !Convert.ToBoolean(Eval("IsTransformation").ToString()) && Eval("CanTrans").ToString()=="1"  %>'></asp:TextBox>
                                                                                            </td>
                                                                                            <td style="text-align: center;">
                                                                                                <asp:Panel ID="Panel1" runat="server" CssClass="row" Visible='<%# !Convert.ToBoolean(Eval("IsTransformation").ToString()) && Eval("CanTrans").ToString()=="1" %>'>
                                                                                                    <div class="col-md-12">
                                                                                                        <label class="control-label" style="float: right; margin-left: 10px;">الدرجة : </label>
                                                                                                        <div class="input-group">
                                                                                                            <asp:TextBox ID="txtMark" runat="server" CssClass="form-control" Style="text-align: center; height: 30px;"></asp:TextBox>
                                                                                                            <span class="input-group-btn">

                                                                                                                <asp:Button ID="btnExternalTransformation" runat="server" Text="معادلة" CssClass="btn green" OnClick="btnExternalTransformation_Click" />
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </asp:Panel>
                                                                                                <span><%# (Eval("CanTrans").ToString()=="0"? "نجح الطالب في المساق" : "")%></span>
                                                                                                <asp:Panel ID="Panel2" runat="server" Style="padding: 4px;" Visible='<%# Eval("IsTransformation" ) %>'>
                                                                                                    <span>تمت معادلة المساق</span>
                                                                                                    <asp:LinkButton ID="lbEditExternalTransformation" runat="server" CssClass="btn default btn-xs black" OnClick="lbEditExternalTransformation_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                                                                                    <asp:LinkButton ID="lbDeleteExternalTransformation" runat="server" CssClass="btn default btn-xs purple" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbDeleteExternalTransformation_Click"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                                                                </asp:Panel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
                                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                    SelectCommand="GetStdExternalCSemesterPlanCourses" SelectCommandType="StoredProcedure">
                                                                                    <SelectParameters>
                                                                                        <asp:ControlParameter ControlID="PlanID" PropertyName="Text" Name="PlanID" Type="Int32" />
                                                                                        <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
                                                                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                                    </SelectParameters>
                                                                                </asp:SqlDataSource>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                    SelectCommand="GetStdSemesterPlan" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <% }
                                                    else
                                                    { %>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <strong>لا يوجد مساقات للمعادلة</strong>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
                                            </div>
                                            <div class=" isra-clear">
                                                <asp:Label ID="PlanID" runat="server" Text='<%# Eval("PlanID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="CSemesterID" runat="server" Text='<%# Eval("CSemesterID") %>' Visible="false"></asp:Label>
                                                <% if (Repeater11.Items.Count > 0)
                                                    { %>

                                                <div class="portlet">
                                                    <div class="portlet-title">
                                                        <div class="caption"><i class="fa fa-briefcase" style="width: 25px;"></i><span class="font-ha">مساقات معادلة خارج الخطة</span></div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <div class="table-responsive">

                                                            <table class="table table-striped table-bordered table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                        <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                        <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق المعادل</th>
                                                                        <th style="width: 10%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . س</th>
                                                                        <th style="width: 13%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع.س.م</th>
                                                                        <th style="width: 27%; text-align: center"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <asp:Repeater ID="Repeater11" runat="server" DataSourceID="SqlDataSource14">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="TransformationID" runat="server" Text='<%# Eval("TransformationID") %>' Visible="false"></asp:Label>
                                                                            <tr>


                                                                                <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseCode") %></span></td>
                                                                                <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseArName") %></span></td>
                                                                                <td style="text-align: center;">
                                                                                    <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" Style="text-align: center; height: 30px; font-size: 12px;" Text='<%# Eval("TransCourseName") %>' Enabled='<%# !Convert.ToBoolean(Eval("IsTransformation").ToString()) %>'></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                                <td style="text-align: center;">
                                                                                    <asp:TextBox ID="txtCourseHours" runat="server" CssClass="form-control" Style="text-align: center; height: 30px; font-size: 12px;" Text='<%# Eval("TransCourseHours") %>' Enabled='<%# !Convert.ToBoolean(Eval("IsTransformation").ToString()) %>'></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: center;">
                                                                                    <asp:Panel ID="Panel1" runat="server" CssClass="row" Visible='<%# !Convert.ToBoolean(Eval("IsTransformation").ToString()) %>'>
                                                                                        <div class="col-md-12">
                                                                                            <label class="control-label" style="float: right; margin-left: 10px;">الدرجة : </label>
                                                                                            <div class="input-group">
                                                                                                <asp:TextBox ID="txtMark" runat="server" CssClass="form-control" Style="text-align: center; height: 30px;"></asp:TextBox>
                                                                                                <span class="input-group-btn">
                                                                                                    <asp:Button ID="btnExternalTransformation" runat="server" Text="معادلة" CssClass="btn green" OnClick="btnExternalTransformation_Click" />
                                                                                                </span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </asp:Panel>
                                                                                    <asp:Panel ID="Panel2" runat="server" Style="padding: 4px;" Visible='<%# Eval("IsTransformation") %>'>
                                                                                        <span>تمت معادلة المساق</span>
                                                                                        <asp:LinkButton ID="lbEditExternalTransformation" runat="server" CssClass="btn default btn-xs black" OnClick="lbEditExternalTransformation_Click1"><i class="fa fa-edit"></i></asp:LinkButton>
                                                                                        <asp:LinkButton ID="lbDeleteExternalTransformation" runat="server" CssClass="btn default btn-xs purple" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbDeleteExternalTransformation_Click1"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                                                    </asp:Panel>
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource14" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetStdExternalNotPlanCourses" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                                <% } %>
                                            </div>
                                            <% }
                                                else
                                                { %>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>تم إعتماد المعادلة الخارجية</strong>
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


                            <div id="tab5" class="tab-pane">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4 class="font-ha">الخطة الدراسية</h4>
                                            </div>
                                            <div class="col-md-9" style="text-align: left; font-size: 14px; padding: 9px;">
                                                <asp:LinkButton ID="lbPDF" runat="server" OnClick="lbPDF_Click">تصدير الى pdf</asp:LinkButton>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater1.Items.Count > 0)
                                                { %>
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
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
                                                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
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
                                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetCSemesterPlanCourses" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="PlanID" PropertyName="Text" Name="PlanID" Type="Int32" />
                                                                                    <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStdSemesterPlan" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
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
                            <div id="tab25" class="tab-pane" runat="server" clientidmode="Static">
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
                                            <% if (Repeater1.Items.Count > 0)
                                                { %>
                                            <asp:Repeater ID="Repeater18" runat="server" DataSourceID="SqlDataSource1">
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
                                                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
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
                                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetCSemesterPlanCourses" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="PlanID" PropertyName="Text" Name="PlanID" Type="Int32" />
                                                                                    <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource23" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStdSemesterPlan" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
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
                            <div id="tab6" class="tab-pane">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4 class="font-ha">الجدول الدراسي</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <% if (Repeater8.Items.Count > 0)
                                            { %>
                                        <div class="row">
                                            <div class="col-md-8" style="padding: 12px;">
                                                <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource7">
                                                    <ItemTemplate>
                                                        <span style="font-size: 14px;"><%# Eval("ArName") %></span>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource7" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                    SelectCommand="GetStdSemesterName" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                            <div class="col-md-4" style="padding: 12px; text-align: left; vertical-align: middle;">
                                                <asp:LinkButton ID="lbStudyTablePDF" runat="server" OnClick="lbStudyTablePDF_Click">تصدير الجدول الى pdf</asp:LinkButton>
                                            </div>
                                        </div>
                                        <br />
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
                                                    <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource3">
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
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdStudyTable" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
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
                                </div>
                                <br />
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <h4 class="font-ha">المساقات الإستدراكية</h4>
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
                                                <asp:Repeater ID="Repeater13" runat="server" DataSourceID="SqlDataSource20">
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
                                                <asp:SqlDataSource ID="SqlDataSource20" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                    SelectCommand="GetStdSemesterRemedialCourse" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
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
                            <div id="tab12" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>علامات المساقات</h4>
                                            </div>
                                            <div class="col-md-9 isra-pl-0">
                                                <div id="divMsg1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
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
                                                        <asp:DropDownList ID="ddlStdSemester2" runat="server" class="form-control" DataTextField="Semester" DataValueField="ID" AutoPostBack="true" DataSourceID="SqlDataSource12"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource12" runat="server"
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
                                            <% if (Repeater4.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%">كود المساق</th>
                                                        <th style="width: 15%; text-align: center">المساق</th>
                                                        <th style="width: 10%; text-align: center">أعمال الفصل</th>
                                                        <th style="width: 10%; text-align: center">العلامة الفصلية</th>
                                                        <th style="width: 10%; text-align: center">العلامة النهائية</th>
                                                        <th style="width: 10%; text-align: center">العلامة</th>
                                                        <th style="width: 35%; text-align: center"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                        <ItemTemplate>
                                                            <asp:Label ID="MarkID" runat="server" Text='<%# Eval("MarkID") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                <td style="text-align: center"><span>
                                                                    <asp:Label ID="lblWorkMark" runat="server" Text='<%# Eval("WorkMark") %>'></asp:Label>
                                                                    <asp:TextBox ID="txtWorkMark" runat="server" CssClass="form-control text-center" Text='<%# Eval("WorkMark") %>' Visible="false"></asp:TextBox>
                                                                    <asp:Button ID="btnSaveWorkMark" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSaveWorkMark_Click" Visible="false" />
                                                                    <asp:Button ID="btnCancelWorkMark" runat="server" Text="إلغاء" CssClass="btn red" OnClick="btnCancelWorkMark_Click" Visible="false" />
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="lblMidtermMark" runat="server" Text='<%# (Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "غير مكتمل": ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())) ? "غياب" : Eval("MidtermMark")) %>'></asp:Label>
                                                                    <asp:TextBox ID="txtMidtermMark" runat="server" CssClass="form-control text-center" Text='<%# Eval("MidtermMark") %>' Visible="false"></asp:TextBox>
                                                                    <asp:Button ID="btnSaveMidtermMark" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSaveMidtermMark_Click" Visible="false" />
                                                                    <asp:Button ID="btnCancelMidtermMark" runat="server" Text="إلغاء" CssClass="btn red" OnClick="btnCancelMidtermMark_Click" Visible="false" />
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="lblFinalMark" runat="server" Text='<%# Eval("FinalMark") %>'></asp:Label>
                                                                    <asp:TextBox ID="txtFinalMark" runat="server" CssClass="form-control text-center" Text='<%# Eval("FinalMark") %>' Visible="false"></asp:TextBox>
                                                                    <asp:Button ID="btnSaveFinalMark" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSaveFinalMark_Click" Visible="false" />
                                                                    <asp:Button ID="btnCancelFinalMark" runat="server" Text="إلغاء" CssClass="btn red" OnClick="btnCancelFinalMark_Click" Visible="false" />
                                                                </td>
                                                                <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                <td style="text-align: center">
                                                                    <% if (Permissions.Contains("MarkEdit"))
                                                                        { %>
                                                                    <asp:Button ID="btnEditMark" runat="server" Text="تعديل الدرجة" CssClass="btn green" OnClick="btnEditMark_Click" />
                                                                    <% } %>
                                                                    <% if (Permissions.Contains("MidtermIncomplete"))
                                                                        { %>
                                                                    <asp:Button ID="btnIsMidtermIncomplete2" runat="server" Text="إحتساب من 70" CssClass="btn green" OnClick="btnIsMidtermIncomplete2_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إحتساب علامة الإمتحان النهائي من 70 ؟');" Visible='<%# (!Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? true:false %>' />
                                                                    <% } %>
                                                                    <% if (Permissions.Contains("FinalMarkIncomplet"))
                                                                        { %>
                                                                    <asp:LinkButton ID="lbFinalMarkIncompleteAdd" runat="server" CssClass="btn default btn-xs black" OnClick="lbFinalMarkIncompleteAdd_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تقديم طلب غير مكتمل ؟');">تقديم طلب غير مكتمل</asp:LinkButton>
                                                                    <% } %>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <span><%# (Eval("IsPlanCourse").ToString() == "1") ? "داخل الخطة" : "خارج الخطة" %></span>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdSemesterMarks" SelectCommandType="StoredProcedure">
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

                            <div id="tab16" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h4>علامات المساقات ماقبل المعادلة</h4>
                                            </div>
                                            <div class="col-md-9 isra-pl-0">
                                                <div id="div3" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="lblMsg11" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
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
                                                        <asp:DropDownList ID="ddlStdSemester22" runat="server" class="form-control" DataTextField="Semester" DataValueField="ID" AutoPostBack="true" DataSourceID="SqlDataSource18"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource18" runat="server"
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
                                            <% if (Repeater17.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%">كود المساق</th>
                                                        <th style="width: 15%; text-align: center">المساق</th>
                                                        <th style="width: 10%; text-align: center">أعمال الفصل</th>
                                                        <th style="width: 10%; text-align: center">العلامة الفصلية</th>
                                                        <th style="width: 10%; text-align: center">العلامة النهائية</th>
                                                        <th style="width: 10%; text-align: center">العلامة</th>
                                                        <th style="width: 35%; text-align: center"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater17" runat="server" DataSourceID="SqlDataSource19">
                                                        <ItemTemplate>
                                                            <asp:Label ID="MarkID" runat="server" Text='<%# Eval("MarkID") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                <td style="text-align: center"><span>
                                                                    <asp:Label ID="lblWorkMark" runat="server" Text='<%# Eval("WorkMark") %>'></asp:Label>
                                                                    <asp:TextBox ID="txtWorkMark" runat="server" CssClass="form-control text-center" Text='<%# Eval("WorkMark") %>' Visible="false"></asp:TextBox>
                                                                    <asp:Button ID="btnSaveWorkMark" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSaveWorkMark_Click" Visible="false" />
                                                                    <asp:Button ID="btnCancelWorkMark" runat="server" Text="إلغاء" CssClass="btn red" OnClick="btnCancelWorkMark_Click" Visible="false" />
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="lblMidtermMark" runat="server" Text='<%# (Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "غير مكتمل": ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())) ? "غياب" : Eval("MidtermMark")) %>'></asp:Label>
                                                                    <asp:TextBox ID="txtMidtermMark" runat="server" CssClass="form-control text-center" Text='<%# Eval("MidtermMark") %>' Visible="false"></asp:TextBox>
                                                                    <asp:Button ID="btnSaveMidtermMark" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSaveMidtermMark_Click" Visible="false" />
                                                                    <asp:Button ID="btnCancelMidtermMark" runat="server" Text="إلغاء" CssClass="btn red" OnClick="btnCancelMidtermMark_Click" Visible="false" />
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="lblFinalMark" runat="server" Text='<%# Eval("FinalMark") %>'></asp:Label>
                                                                    <asp:TextBox ID="txtFinalMark" runat="server" CssClass="form-control text-center" Text='<%# Eval("FinalMark") %>' Visible="false"></asp:TextBox>
                                                                    <asp:Button ID="btnSaveFinalMark" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSaveFinalMark_Click" Visible="false" />
                                                                    <asp:Button ID="btnCancelFinalMark" runat="server" Text="إلغاء" CssClass="btn red" OnClick="btnCancelFinalMark_Click" Visible="false" />
                                                                </td>
                                                                <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                <td style="text-align: center">
                                                                    <% if (Permissions.Contains("MarkEdit"))
                                                                        { %>
                                                                    <asp:Button ID="btnEditMark" runat="server" Text="تعديل الدرجة" CssClass="btn green" OnClick="btnEditMark_Click" />
                                                                    <% } %>
                                                                    <% if (Permissions.Contains("MidtermIncomplete"))
                                                                        { %>
                                                                    <asp:Button ID="btnIsMidtermIncomplete2" runat="server" Text="إحتساب من 70" CssClass="btn green" OnClick="btnIsMidtermIncomplete2_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إحتساب علامة الإمتحان النهائي من 70 ؟');" Visible='<%# (!Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? true:false %>' />
                                                                    <% } %>
                                                                    <% if (Permissions.Contains("FinalMarkIncomplet"))
                                                                        { %>
                                                                    <asp:LinkButton ID="lbFinalMarkIncompleteAdd" runat="server" CssClass="btn default btn-xs black" OnClick="lbFinalMarkIncompleteAdd_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تقديم طلب غير مكتمل ؟');">تقديم طلب غير مكتمل</asp:LinkButton>
                                                                    <% } %>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <span><%# (Eval("IsPlanCourse").ToString() == "1") ? "داخل الخطة" : "خارج الخطة" %></span>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource19" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdSemesterMarksBITrans" SelectCommandType="StoredProcedure">
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
                            <div id="tab7" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4 class="font-ha">جدول الإمتحانات</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row" style="border-bottom: 1px solid #ddd; padding: 15px 0;">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">الفصل الدراسي</label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="ddlStdSemester1" runat="server" class="form-control" DataTextField="Semester" DataValueField="ID" AutoPostBack="true" DataSourceID="SqlDataSource9"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource9" runat="server"
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
                                                        <th style="width: 15%; text-align: center">استدراكي</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource2">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <asp:Label ID="SectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <td><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ArNameCourse") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ExamDate", "{0:yyyy/MM/dd}") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ExamTime") %></span></td>
                                                                <td style="text-align: center">
                                                                    <asp:CheckBox ID="cbIsRemedialCourse" runat="server" Checked='<%# Eval("IsRemedialCourse") %>' OnCheckedChanged="cbIsRemedialCourse_CheckedChanged" AutoPostBack="true" /></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdExamsTable" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlStdSemester1" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
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
                            <div id="tab8" class="tab-pane">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4 class="font-ha">كشف درجات الطالب</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater9.Items.Count > 0)
                                                {%>
                                            <asp:Repeater ID="Repeater9" runat="server" DataSourceID="SqlDataSource8">
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
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <asp:Repeater ID="Repeater92" runat="server" DataSourceID="SqlDataSource2">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td><span><%# Eval("CourseCode") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseHours") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("MarkEstimation") %></span></td>

                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetStdSemesterMarks" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />

                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>
                                                                            <tr>
                                                                                <td colspan="8" style="text-align: left;">
                                                                                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                                                        <ItemTemplate>
                                                                                            <span style="font-weight: bold;">المعدل التراكمي : </span>
                                                                                            <span><%# Eval("CumulativeGPA").ToString() + " %" %></span>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                                                                        <ItemTemplate>
                                                                                            <span style="font-weight: bold;">المعدل الفصلي : </span>
                                                                                            <span><%# Eval("w").ToString() + " %" %></span>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                        SelectCommand="GetStdGPAs" SelectCommandType="StoredProcedure">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>
                                                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                        SelectCommand="CalculateSemesterGPA" SelectCommandType="StoredProcedure">
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
                                            <asp:SqlDataSource ID="SqlDataSource8" runat="server"
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
                            </div>
                            <div id="tab20" class="tab-pane">


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h4 class="font-ha">كشف درجات الطالب ماقبل المعادلة</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater16.Items.Count > 0)
                                                {%>
                                            <asp:Repeater ID="Repeater16" runat="server" DataSourceID="SqlDataSource17">
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
                                                                            <asp:Repeater ID="Repeater93" runat="server" DataSourceID="SqlDataSource50">
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
                                                                            <asp:SqlDataSource ID="SqlDataSource50" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetStdSemesterMarksBItrans" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />

                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>
                                                                            <tr>
                                                                                <td colspan="8" style="text-align: left;">
                                                                                    <asp:Repeater ID="Repeater41" runat="server" DataSourceID="SqlDataSource41">
                                                                                        <ItemTemplate>
                                                                                            <span style="font-weight: bold;">المعدل التراكمي : </span>
                                                                                            <span><%# Eval("BITransCumulativeGPA").ToString() + " %" %></span>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                    <asp:Repeater ID="Repeater31" runat="server" DataSourceID="SqlDataSource31">
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
                                            <asp:SqlDataSource ID="SqlDataSource17" runat="server"
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
                                <%--                 <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4 class="font-ha">كشف درجات الطالب ماقبل المعادلة</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <asp:Repeater ID="Repeater17" runat="server" DataSourceID="SqlDataSource16">
                                                <ItemTemplate>

                                                    <div class=" row alert alert-info">
                                                        <div class="row">


                                                            <div class="col-md-4">
                                                                المعدل التراكمي ( قبل) : <%# Eval("PrevGPAUniversity") %></br>
                                           المعدل التراكمي ( بعد) : <%# Eval("GPAUniversity") %>
                                                            </div>
                                                            <div class="col-md-4">
                                                                المعدل التراكمي (خريج قبل) : <%# Eval("PrevGPAGraduate") %> </br>
                                           المعدل التراكمي (خريج بعد) : <%# Eval("GPAGraduate") %>
                                                            </div>


                                                            <div class="col-md-4">
                                                                ساعات نجاح ضمن الخطة ( قبل) : <%# Eval("PrevPlanSucceedHour") %> </br>
                                    ساعات نجاح ضمن الخطة ( بعد مع المعادلة) : <%# Convert.ToInt32(Eval("PlanSucceedHour")) + Convert.ToInt32(Eval("InternalTransformationHours"))  %>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                عدد ساعات معادلة  : <%# Eval("InternalTransformationHours") %></br>
                                         
                                                            </div>

                                                            <div class="col-md-4">
                                                                ساعات الانجاز :<%# Eval("SucceedHour") %>
                                                            </div>
                                                            <div class="col-md-4">
                                                                عدد ساعات مسجلة  : <%# Eval("RegisteredHour") %>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row"></br></div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource18" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="CalculateGPAInternalTransRequestCheck" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <% if (Repeater9.Items.Count > 0)
                                                {%>
                                            <asp:Repeater ID="Repeater16" runat="server" DataSourceID="SqlDataSource8">
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
                                                                            <asp:Repeater ID="Repeater92" runat="server" DataSourceID="SqlDataSource2">
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
                                                                                SelectCommand="GetStdSemesterMarks_New" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>
                                                                            <tr>
                                                                                <td colspan="8" style="text-align: left;">
                                                                                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                                                        <ItemTemplate>
                                                                                            <span style="font-weight: bold;">المعدل التراكمي : </span>
                                                                                            <span><%# Eval("GPAUniversity").ToString() + " %" %></span>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                                                                        <ItemTemplate>
                                                                                            <span style="font-weight: bold;">المعدل الفصلي : </span>
                                                                                            <span><%# Eval("w").ToString() + " %" %></span>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                        SelectCommand="GetStdGPAUniversity_New" SelectCommandType="StoredProcedure">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>
                                                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                        SelectCommand="CalculateSemesterGPA_New" SelectCommandType="StoredProcedure">
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
                                            <asp:SqlDataSource ID="SqlDataSource17" runat="server"
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
                                </div>--%>
                            </div>
                            <div id="tab15" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>كشف الإرشاد الأكاديمي</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater14.Items.Count > 0)
                                                { %>
                                            <asp:Repeater ID="Repeater14" runat="server" DataSourceID="SqlDataSource22">
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
                                                                            <asp:Repeater ID="Repeater141" runat="server" DataSourceID="SqlDataSource141">
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
                                                                            <asp:SqlDataSource ID="SqlDataSource141" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetStudentCSemesterAcademicGuidence" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                                    <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource22" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStdSemesterPlan" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
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

                            <div id="tab9" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4 class="font-ha">مستندات الطالب</h4>
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
                                            <div class="col-md-12">
                                                <% if (ListView1.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 30%">المستند</th>
                                                            <th style="width: 30%">المستند</th>
                                                            <th style="width: 25%; text-align: center">تاريخ الرفع</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource13">
                                                            <ItemTemplate>
                                                                <asp:Label ID="StdDocumentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td><a href='http://admission.israa.edu.ps/Document/Student/<%# Eval("DocumentLink") %>' target="_blank"><%# Eval("StdDocumentType") %></a></td>
                                                                    <td><a href='http://admission.israa.edu.ps/Document/Student/<%# Eval("DocumentLink") %>' target="_blank"><%# Eval("DocumentName") %></a></td>
                                                                    <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource13" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="Select *,(Select Name From StdDocumentType Where ID=StdDocumentTypeID) as StdDocumentType From StdDocument Where StudentID=@StudentID and IsDelete=0 order by ID DESC">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                                <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
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
                            <div id="tab10" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4 class="font-ha">رفض الطالب</h4>
                                            </div>
                                            <div class="col-md-7 isra-pl-0">
                                                <div id="div2" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="Label1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                    <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row" style="padding-top: 15px;">
                                            <label class="col-md-2 control-label">سبب الرفض</label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtRefusalNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 15px;">
                                            <div class="col-md-offset-2 col-md-6">
                                                <asp:Button ID="btnRefusalStudent" runat="server" Text="رفض الطالب" CssClass="btn green" OnClick="btnRefusalStudent_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="tab11" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4 class="font-ha">إنذارات الحضور والغياب</h4>
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
                                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource21">
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
                                                        <asp:SqlDataSource ID="SqlDataSource21" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>"
                                                            SelectCommand="GetStudentAttendanceWarning" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
