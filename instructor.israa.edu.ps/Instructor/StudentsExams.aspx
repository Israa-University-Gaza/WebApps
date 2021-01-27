<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsExams.aspx.cs" Inherits="Instructor_StudentsExams" %>

<asp:Content ID="Style" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS CSS -->
    <link href="../assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS CSS -->
</asp:Content>

<asp:Content ID="Script" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS JS -->
    <script src="../assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS JS -->

    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#EExam, #ExamForm').addClass("active");

            $('#checkall').click(function (event) {
                var x = this.checked;
                $('.cbischecked :checkbox').each(function () {
                    this.checked = x;
                });
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>إمتحانات الطلاب</span>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">نموذج الإمتحان</span>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div id="divMsg" runat="server" class="alert alert-dismissable alert-top alert-success" visible="false">
                                <asp:Label ID="lblMsg" runat="server" Style="font-weight: bold; float: right;" Text=""></asp:Label>
                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <div class="col-md-12">
                            <div style="font-size: 14px;" class="alert alert-info">
                                <asp:Label ID="lblExamFormID" runat="server" Text="" Visible="true"></asp:Label>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <label class="control-label" style="font-weight: bold;">المساق :</label>
                                        <label class="control-label"><%# Eval("CourseArName") %></label>
                                        <span style="margin: 0 10px;">|</span>
                                        <label class="control-label" style="font-weight: bold;">نوع الإمتحان :</label>
                                        <label class="control-label"><%# Eval("ExamCategoryArName") %> </label>
                                        <span style="margin: 0 10px;">|</span>
                                        <label class="control-label" style="font-weight: bold;">الاسم :</label>
                                        <label class="control-label"><%# Eval("Name") %></label>
                                        <span style="margin: 0 10px;">|</span>
                                        <label class="control-label" style="font-weight: bold;">عدد الأسئلة :</label>
                                        <label class="control-label"><%# Eval("CountOfQuestions") %></label>
                                        <span style="margin: 0 10px;">|</span>
                                        <label class="control-label" style="font-weight: bold;">العلامة :</label>
                                        <label class="control-label"><%# Eval("TotalMark") %></label>
                                        <span style="margin: 0 10px;">|</span>
                                        <label class="control-label" style="font-weight: bold;">المدة :</label>
                                        <label class="control-label"><%# Eval("TimePeriod",@"{0:hh\:mm}") %></label>
                                        <span style="margin: 0 10px;">|</span>
                                        <label class="control-label" style="font-weight: bold;">من :</label>
                                        <label class="control-label"><%# Eval("ExamBeginning","{0: HH:mm yyyy/MM/dd}") %></label>
                                        <label class="control-label" style="font-weight: bold;">وحتي :</label>
                                        <label class="control-label"><%# Eval("ExamEnd","{0: HH:mm yyyy/MM/dd}") %></label>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                    SelectCommand="ExamFormGet" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblExamFormID" Name="ID" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <div style="clear: both;"></div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-md-12">
                            <div class="btn-group pull-right">
                                <button class="btn green btn-outline dropdown-toggle" data-toggle="dropdown">
                                    <span>خيارات</span>
                                    <i class="fa fa-angle-down"></i>
                                </button>
                                <ul class="dropdown-menu pull-right">
                                    <li style="text-align: right">
                                        <asp:LinkButton ID="lbSelectedStudentsExamsCorrect" runat="server" CssClass="btn" OnClick="lbSelectedStudentsExamsCorrect_Click"><i class="fa fa-calculator"></i> تصليح الامتحانات المحددة</asp:LinkButton>
                                    </li>
                                    <li style="text-align: right">
                                        <asp:LinkButton ID="lbSelectedStudentsExamsCalculateMarks" runat="server" CssClass="btn" OnClick="lbSelectedStudentsExamsCalculateMarks_Click"><i class="fa fa-calculator"></i> جمع علامات الامتحانات المحددة</asp:LinkButton>
                                    </li>
                                    <li style="text-align: right">
                                        <asp:LinkButton ID="lbSelectedStudentsExamsExcel" runat="server" CssClass="btn" OnClick="lbSelectedStudentsExamsExcel_Click"><i class="fa fa-file-excel-o"></i> تصدير العلامات Excel</asp:LinkButton>
                                    </li>
                                    <li style="text-align: right">
                                        <asp:LinkButton ID="lbSelectedStudentsExamsDelete" runat="server" CssClass="btn" OnClick="lbSelectedStudentsExamsDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف الامتحانات المحددة</asp:LinkButton>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 0.5%; text-align: center">
                                                <input id="checkall" type="checkbox" />
                                            </th>
                                            <th style="width: 0.5%; text-align: center">#</th>
                                            <th style="width: 1%; text-align: center">رقم الطالب</th>
                                            <th style="width: 2%; text-align: center">اسم الطالب</th>
                                            <th style="width: 2%; text-align: center">العلامة</th>
                                            <th style="width: 2%; text-align: center"></th>
                                            <th style="width: 2%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                            <ItemTemplate>
                                                <asp:Label ID="StudentExamID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td style="text-align: center;">
                                                        <asp:CheckBox ID="cbIsChecked" CssClass="cbischecked" runat="server" ClientIDMode="Static" />
                                                    </td>
                                                    <td style="text-align: center;"><span><%# Eval("RowNo") %></span></td>
                                                    <td style="text-align: center;"><span><%# Eval("StudentNo") %></span></td>
                                                    <td style="text-align: center;"><span><%# Eval("StudentName") %></span></td>
                                                    <td style="text-align: center;"><span><%# Eval("ResultMark") %></span></td>
                                                    <td style="text-align: center;"><span><%# Eval("StudentExamStatus") %></span></td>
                                                    <td>
                                                        <asp:LinkButton ID="lbOpenStudentExam" runat="server" CssClass="btn default btn-xs black" OnClick="lbOpenStudentExam_Click"><i class="fa fa-edit"></i> فتح امتحان الطالب</asp:LinkButton>
                                                        <asp:LinkButton ID="lbStudentExamDelete" runat="server" CssClass="btn default btn-xs purple" OnClick="lbStudentExamDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                            SelectCommand="GetExamFormStudentsExams" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblExamFormID" PropertyName="Text" Name="ExamFormID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center">
                                        <strong>لا يوجد امتحانات طلاب للشعبة المختارة</strong>
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
</asp:Content>

