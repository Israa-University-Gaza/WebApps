<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentAcademicCalendar.aspx.cs" Inherits="Admission_StudentAcademicCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentAcademicCalendar').addClass("active open");

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
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="StudentAcademicCalendar.aspx" class="font-ha">التقويم الأكاديمي
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <asp:Label ID="lblSemesterID" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>إضافة تقويم أكاديمي للفصل الدراسي</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form isra-text-aling-right">
                    <div class="form-horizontal">
                        <div class="form-body">


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
                                <label class="control-label col-md-3 isra-text-aling-right">نهاية تقديم طلبات المراجعة</label>
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

        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>التقويم الأكاديمي للفصول الدراسية</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 25%">الفصل الدراسي</th>

                                <th style="width: 12%; text-align: center">بداية التسجيل</th>
                                <th style="width: 12%; text-align: center">نهاية التسجيل</th>
                                <th style="width: 12%; text-align: center">بداية الدراسـة</th>
                                <th style="width: 12%; text-align: center">بداية الإمتحانات</th>
                                <th style="width: 12%; text-align: center">نهاية الإمتحانات</th>

                                <th style="width: 3%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("SemesterName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("RegisterBeginning", "{0:yyyy/MM/dd}") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("RegisterEnd", "{0:yyyy/MM/dd}") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("StudyBeginning", "{0:yyyy/MM/dd}") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("StartFinalExams", "{0:yyyy/MM/dd}") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("EndFinalExams", "{0:yyyy/MM/dd}") %></span></td>

                                        <td style="text-align: center">

                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <%--    <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>--%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetStudentAcademicCalendar" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </tbody>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                            <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                            <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                    <div class="clearfix"></div>
                    <% }
                        else
                        {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لم يتم إضافة تقويم أكاديمي </strong>
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



</asp:Content>

