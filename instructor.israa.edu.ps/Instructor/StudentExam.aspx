<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="StudentExam.aspx.cs" Inherits="Instructor_StudentExam" %>

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
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>إمتحان الطالب</span>
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
                                <span class="caption-subject font-red uppercase font-ha">إمتحان الطالب</span>
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
                        <div class="col-md-10">
                            <div style="font-size: 14px;" class="alert alert-info">
                                <asp:Label ID="lblStudentExamID" runat="server" Text="" Visible="false"></asp:Label>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <label class="control-label" style="font-weight: bold;">رقم الطالب :</label>
                                        <label class="control-label"><%# Eval("StudentNo") %></label>
                                        <span style="margin: 0 10px;">|</span>
                                        <label class="control-label" style="font-weight: bold;">اسم الطالب :</label>
                                        <label class="control-label"><%# Eval("StudentName") %> </label>
                                        <span style="margin: 0 10px;">|</span>
                                        <label class="control-label" style="font-weight: bold;">علامة الطالب :</label>
                                        <label class="control-label"><%# (Eval("ResultMark").ToString()=="")? "(لم يتم جمع العلامات)":Eval("ResultMark").ToString() %> </label>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                    SelectCommand="GetStudentExam" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentExamID" Name="StudentExamID" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div style="clear: both;"></div>
                        </div>
                        <div class="col-md-2">
                            <div style="font-size: 14px; text-align: center;" class="alert alert-info">
                                <asp:Label ID="lblExamFormID" runat="server" Text="" Visible="false"></asp:Label>
                                <label class="control-label" style="font-weight: bold;">
                                    <asp:LinkButton ID="lbStudentsExams" runat="server" OnClick="lbStudentsExams_Click">إمتحانات الطلاب</asp:LinkButton></label>
                            </div>
                            <div style="clear: both;"></div>
                        </div>
                    </div>
                    <hr />
                    <div class="form-group row">
                        <div class="col-md-12">
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater2_ItemDataBound">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <asp:Label ID="lblQuestionID" runat="server" Text='<%# Eval("QuestionID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblStudentExamQuestionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblQuestionTypeID" runat="server" Text='<%# Eval("QuestionTypeID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblStudentAnswer" runat="server" Text='<%# Eval("StudentAnswer") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblCorrectAnswer" runat="server" Text='<%# Eval("CorrectAnswer") %>' Visible="false"></asp:Label>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <%# Eval("QuestionText") %>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div runat="server" class="question-answers" visible='<%# (Eval("QuestionTypeID").ToString() == "1" || Eval("QuestionTypeID").ToString() == "2") %>'>
                                                        <asp:Label ID="Label1" runat="server"></asp:Label>

                                                        <asp:RadioButtonList ID="rblAnswers" runat="server" DataValueField="ID" DataTextField="AnswerText" DataSourceID="SqlDataSource11" Enabled="false"></asp:RadioButtonList>
                                                        <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                                            SelectCommand="GetQuestionAnswers" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblQuestionID" Name="QuestionID" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                    <br />
                                                    <div runat="server" class="question-answers" visible='<%# (Eval("QuestionTypeID").ToString() != "1" && Eval("QuestionTypeID").ToString() != "2") %>'>
                                                        <div class="col-md-3 showanswer">الإجابة النموذجية</div>
                                                        <div class="col-md-9 answer" style="display: none;">
                                                            <%# Eval("QCorrectAnswer") %>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <div runat="server" class="question-answers" visible='<%# (Eval("QuestionTypeID").ToString() != "1" && Eval("QuestionTypeID").ToString() != "2") %>'>
                                                        <div class="col-md-3">إجابة الطالب</div>
                                                        <div class="col-md-9">
                                                            <%# Eval("StudentAnswer") %>
                                                        </div>
                                                    </div>
                                                    <div runat="server" class="question-answers" visible='<%# ((Eval("QuestionTypeID").ToString() == "7" || Eval("QuestionTypeID").ToString() == "8") &&  (Eval("StudentFileName").ToString() != "")) %>'>
                                                        <div class="col-md-3">ملفات الطالب</div>
                                                        <div class="col-md-9">
                                                            <a href="WebServices/DownloadFile.ashx?filename=<%# Eval("StudentFileName") %>">تنزيل</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <span>درجة السؤال :</span>
                                            <span>
                                                <asp:Label ID="lblQuestionMark" runat="server" Text='<%# Eval("Mark") %>'></asp:Label>
                                            </span>
                                            <br />
                                            <span style="float: right; line-height: 30px; margin-left: 5px;">درجة الطالب : </span>
                                            <asp:TextBox ID="txtStudentMark" runat="server" CssClass="form-control" Text='<%# Eval("ResultMark") %>' Style="width: 60px; float: right; text-align: center; margin-top: 3px !important; padding: 4px 12px !important; height: 28px;" Enabled='<%# (Eval("QuestionTypeID").ToString() != "1" && Eval("QuestionTypeID").ToString() != "2") %>'></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                SelectCommand="GetStudentExamQuestions" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblStudentExamID" Name="StudentExamID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <hr />
                    <div style="text-align: center;">
                        <asp:Button ID="btnSave" runat="server" Text="إعتماد التصليح وجمع العلامات" CssClass="btn green" OnClick="btnSave_Click" Style="padding: 15px; width: 100%" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

