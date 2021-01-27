<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="SemesterAddEdit.aspx.cs" Inherits="Admission_SemesterAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu3').addClass("active open");
            $('#menu3_2 a').css("background-color", "#575757");
            $('#menu3 a span.arrow').addClass("open");

            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>الفصول الدراسية</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="Semester.aspx">عرض الفصول الدراسية</a></li>
                <li class="font-ha"><a href="SemesterAddEdit.aspx">إضافة فصل دراسي جديد</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="row">
        <asp:Label ID="lblSemesterID" runat="server" Text="" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>إضافة فصل دراسي</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form isra-text-aling-right">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <h3 class="form-section">بيانات رئيسية</h3>
                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">البرنامج</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlProgram" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Program] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر البرنامج'"></asp:SqlDataSource>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right">كود الفصل</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" placeholder="كود الفصل الدراسي مثال : 120152016"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">المسمى بالعربية</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtArName" runat="server" CssClass="form-control" placeholder="اسم الفصل الدراسي بالعربية"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right">المسمى بالإنجليزية</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtEnName" runat="server" CssClass="form-control" placeholder="اسم الفصل الدراسي بالإنجليزية"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3"></label>
                                <div class="col-md-3">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                            <h3 class="form-section">الأجندة الفصلية</h3>
                            <%--//--%>
                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">بداية تسجيل الطالب</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TxtStudentRegisterBeginning" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال بداية تسجيل الطلاب"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right">نهاية تسجيل الطالب</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TxtStudentRegisterEnd" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال نهاية تسجيل الطلاب"></asp:TextBox>
                                </div>
                            </div>

                            <%-- \\ --%>
                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">بداية التسجيل  الفصلي </label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtRegisterBeginning" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال بداية التسجيل"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right">نهاية التسجيل الفصلي </label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtRegisterEnd" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال نهاية التسجيل"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">بداية الدراسة</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtStudyBeginning" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال بداية الدراسة"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right">نهاية الدراسة</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtStudyEnd" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال نهاية الدراسة"></asp:TextBox>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">بداية الإضافة</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtAddBeginning" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال بداية الإضافة"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right">نهاية الإضافة</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtAddEnd" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال نهاية الإضافة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">نهاية السحب</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtDelayEnd" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال نهاية السحب"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right">نهاية الإنسحاب</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtWithdrawEnd" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال نهاية الإنسحاب"></asp:TextBox>
                                </div>
                            </div>

                            <%-- // --%>


                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">بدايةالامتحانات النصفية</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TxtStartMidtermExams" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال بدايةالامتحانات النصفية"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right">نهاية الامتحانات النصفية</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TxtEndMidtermExams" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال نهاية الامتحانات النصفية"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">

                                <label class="control-label col-md-3 isra-text-aling-right">بدء تقديم طلبات المراجعةالنصفية</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TxtMidtermExamRevisionBeginning" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال بداية تقديم الطلبات "></asp:TextBox>
                                </div>

                                <label class="control-label col-md-3 isra-text-aling-right">نهاية تقديم طلبات المراجعة النصفية</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TxtMidtermExamRevisionEnd" runat="server" CssClass="form-control date-picker" placeholder=" الرجاء ادخال نهاية تقديم الطلبات"></asp:TextBox>
                                </div>
                            </div>

                            <%-- \\ --%>
                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">بداية الإمتحانات النهائية</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtStartFinalExams" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال بداية الإمتحانات النهائية"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right">نهاية الإمتحانات النهائية</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtEndFinalExams" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال نهاية الإمتحانات النهائية"></asp:TextBox>
                                </div>
                            </div>
                            <%-- // --%>
                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">بدء تقديم طلبات المراجعة</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TxtMarkRevisionBeginning" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال بداية تقديم طلبات المراجعة"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right">نهايةتقديم طلبات المراجعة</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TxtMarkRevisionEnd" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال نهاية تقديم طلبات المراجعة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">اعلان نتائج الامتحانات النصفية</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TxtMidtermExamResults" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال تاريخ الاعلان عن نتائج الامتحانات النصفية"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right">اعلان نتائج الامتحانات النهائية</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TxtMarkResults" runat="server" CssClass="form-control date-picker" placeholder="الرجاءادخال تاريخ الاعلان عن نتائج الامتحانات النهائية"></asp:TextBox>
                                </div>
                            </div>

                            <%--\\  --%>

                            <div class="form-group">
                                <label class="control-label col-md-3 isra-text-aling-right">تاريخ نهاية تسديد الرسوم</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtDeadlinePayment" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال تاريخ نهاية تسديد الرسوم"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-3 isra-text-aling-right"></label>
                                <div class="col-md-3">
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="form-group">
                                <label class="control-label col-md-3"></label>
                                <div class="col-md-9">
                                    <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
