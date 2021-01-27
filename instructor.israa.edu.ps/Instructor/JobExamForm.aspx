<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="JobExamForm.aspx.cs" Inherits="Instructor_JobExamForm" %>

<asp:Content ID="Style" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS CSS -->
    <link href="../assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="../assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS CSS -->
</asp:Content>

<asp:Content ID="Script" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS JS -->
    <script src="../assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>

    <script src="../assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS JS -->

    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>

    <script src="../assets/pages/scripts/components-date-time-pickers.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#EExam, #ExamForm').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>الإمتحانات</span>
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="row">
        <div class="col-md-7">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">الإمتحانات</span>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div id="divMsg1" runat="server" class="alert alert-dismissable alert-top alert-success" visible="false">
                                <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;" Text=""></asp:Label>
                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="col-md-2 control-label">المساق</label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                SelectCommand="GetTeacherCourses" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                    <asp:ControlParameter ControlID="lblSemesterID" Name="SemesterID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
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
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="ExamFormID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="ExamFormType" runat="server" Text='<%# Eval("ExamFormType") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("ExamCategory") %> <%# Eval("Name") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("CountOfQuestions") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("TimePeriod",@"{0:hh\:mm\:ss}") %></span></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' />
                                        </td>
                                        <td style="text-align: center">
                                            <div class="actions">
                                                <div class="btn-group">
                                                    <a class="btn red btn-outline btn-circle btn-sm uppercase sbold" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">خيارات
                                                        <i class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li>
                                                            <asp:LinkButton ID="lbOpenExamForm" runat="server" OnClick="lbOpenExamForm_Click"><i class="fa fa-edit"></i> <span>فتح نموذج الامتحان</span></asp:LinkButton>
                                                        </li>
                                                        <li>
                                                            <asp:LinkButton ID="lbExamFormView" runat="server" OnClick="lbExamFormView_Click"><i class="fa fa-edit"></i> <span>استعراض الامتحان</span></asp:LinkButton>
                                                        </li>
                                                        <li>
                                                            <asp:LinkButton ID="lbGenerateStudentExam" runat="server" OnClick="lbGenerateStudentExam_Click"><i class="fa fa-edit"></i> <span>تنسيب الامتحان للطلبة</span></asp:LinkButton>
                                                        </li>
                                                        <li>
                                                            <asp:LinkButton ID="lbStudentsExams" runat="server" OnClick="lbStudentsExams_Click"><i class="fa fa-edit"></i> <span>امتحانات الطلاب</span></asp:LinkButton>
                                                        </li>
                                                        <li class="divider"></li>
                                                        <li>
                                                            <asp:LinkButton ID="lbEdit" runat="server" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> <span>تحرير</span></asp:LinkButton>
                                                        </li>
                                                        <li>
                                                            <asp:LinkButton ID="lbDelete" runat="server" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> <span>حذف</span></a></asp:LinkButton>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:IsraaEmploymentExam %>"
                                SelectCommand="GetEmployeeExamForms" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
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
        <div class="col-md-5">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="caption">
                        <i class=" icon-layers font-red"></i>
                        <span class="caption-subject font-red uppercase font-ha">إنشاء امتحان الكتروني</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <asp:Label ID="lblExamFormID" runat="server" Text="" Visible="false"></asp:Label>
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <div id="divMsg2" runat="server" class="alert alert-warning" visible="false">
                                        <asp:Label ID="lblMsg2" runat="server" Style="font-weight: bold; float: right;" ClientIDMode="Static"></asp:Label>
                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">المساق</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlCourse2" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">التصنيف</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlExamCategory" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                        SelectCommand="Select * From ExamCategory Where IsDelete=0"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">الاسم</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">النوع</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlExamFormType" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="1" Text="أسئلة ثابتة"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="أسئلة مولدة"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">اللغة</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlExamLanguage" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="1" Text="عربي"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="English"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">العلامة</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtTotalMark" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">عدد الأسئلة</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtCountOfQuestions" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">المدة</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtTimePeriod" runat="server" CssClass="form-control timepicker-24" Text="00:00:00"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">تسليم بعد</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtAllowFinish" runat="server" CssClass="form-control timepicker-24" Text="00:00:00"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">من</label>
                                <div class="col-md-5">
                                    <asp:TextBox ID="txtExamDateBeginning" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtExamTimeBeginning" runat="server" CssClass="form-control timepicker-24" Text="00:00:00"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">الي</label>
                                <div class="col-md-5">
                                    <asp:TextBox ID="txtExamDateEnd" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtExamTimeEnd" runat="server" CssClass="form-control timepicker-24" Text="00:00:00"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-offset-3 col-md-8">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
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

