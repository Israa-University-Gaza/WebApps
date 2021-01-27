<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="ExamFormView.aspx.cs" Inherits="Instructor_ExamFormView" %>

<asp:Content ID="Style" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
    <link href="../assets/pages/css/take-exam-rtl.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Script" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">

    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">

        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#EExam, #ExamForm').addClass("active");

            $('.showanswer').click(function () {
                $(this).parent().children('.answer').toggle();
            });

            $('.print').click(function () {
                w = window.open();
                w.document.write('<div style="direction: rtl;">' + $('#for-print').html() + '</div>');
                w.print();
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>استعراض الإمتحان</span>
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
                                <span class="caption-subject font-red uppercase font-ha">استعراض الإمتحان</span>
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
                <div class="row">
                    <div class="col-md-12" style="text-align: right">
                        <a class="print">طباعة</a>
                    </div>
                </div>
                <div id="for-print" class="portlet-body">
                    <div class="form-group row">
                        <div class="col-md-12">
                            <div style="font-size: 14px;" class="alert alert-info">
                                <asp:Label ID="lblExamFormID" runat="server" Text="" Visible="false"></asp:Label>
                                <asp:Label ID="lblCourseID" runat="server" Visible="false" Text=""></asp:Label>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource11">
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
                                <asp:SqlDataSource ID="SqlDataSource11" runat="server"
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
                    <hr />
                    <div class="form-group row">
                        <div class="col-md-12">
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <asp:Label ID="lblQuestionID" runat="server" Text='<%# Eval("QuestionID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblStudentExamQuestionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblQuestionTypeID" runat="server" Text='<%# Eval("QuestionTypeID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblCorrectAnswer" runat="server" Text='<%# Eval("CorrectAnswer") %>' Visible="false"></asp:Label>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <%# Eval("QuestionText") %>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div runat="server" class="question-answers" visible='<%# (Eval("QuestionTypeID").ToString() == "1" || Eval("QuestionTypeID").ToString() == "2") %>'>
                                                        <asp:RadioButtonList ID="rblAnswers" runat="server" DataValueField="ID" DataTextField="AnswerText" DataSourceID="SqlDataSource11" Enabled="false"></asp:RadioButtonList>
                                                        <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                                            SelectCommand="GetQuestionAnswers" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblQuestionID" Name="QuestionID" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                    <%--<br />
                                                    <div runat="server" class="question-answers" visible='<%# (Eval("QuestionTypeID").ToString() != "1" && Eval("QuestionTypeID").ToString() != "2") %>'>
                                                        <div class="col-md-3 showanswer">الإجابة النموذجية</div>
                                                        <div class="col-md-9 answer" style="display: none;">
                                                            <%# Eval("QCorrectAnswer") %>
                                                        </div>
                                                    </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <span>درجة السؤال :</span>
                                            <span><%# Eval("Mark") %></span>
                                        </div>
                                    </div>
                                    <br />
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                SelectCommand="GetExamFormViewQuestions" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblExamFormID" Name="ExamFormID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

