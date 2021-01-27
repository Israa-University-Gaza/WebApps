<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionAddEditEn.aspx.cs" Inherits="Instructor_QuestionAddEditEn" ValidateRequest="false" %>


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

    <script src="//cdn.ckeditor.com/4.5.9/full/ckeditor.js"></script>
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->


    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass('active');
            $('#EExam, #QuestionAddEditEn').addClass('active');

            $('.answers-type' + $('.question-type').val()).show();
            $('.question-type').change(function () {
                $('.answers-type').hide();
                $('.answers-type' + $(this).val()).show();
            });
            CKEDITOR.replace('txtQuestionText', {
                language: 'en'
            });
        });
    </script>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>الأسئلة</span>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="row add-question-en" dir="ltr">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">Add/Edit Question</span>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div id="divMsg1" runat="server" class="alert alert-warning alert-top" visible="false">
                                <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;" ClientIDMode="Static"></asp:Label>
                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body form">
                    <asp:Label ID="lblQuestionID" runat="server" Text="" Visible="false"></asp:Label>
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-2 control-label">Question</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtQuestionText" runat="server" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label">Course</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCourse" runat="server" DataSourceID="SqlDataSource1" DataTextField="EnName" DataValueField="ID" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                        SelectCommand="GetTeacherCourses" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                            <asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" Name="SemesterID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">Course Part</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCoursePart" runat="server" DataSourceID="SqlDataSource2" DataTextField="PartName" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                        SelectCommand="Select ID, PartName From CoursePart Where CourseID=@CourseID and IsActive=1 and IsDelete=0 union select -1, N'Choose Course Part'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="CourseID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label">Question Type</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlQuestionType" runat="server" DataSourceID="SqlDataSource4" DataTextField="EnName" DataValueField="ID" CssClass="form-control question-type"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                        SelectCommand="Select ID, EnName From QuestionType Where IsActive=1 and IsDelete=0 union select -1, N'Chosse Question Type'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">Question Hardness</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlQuestionHardness" runat="server" DataSourceID="SqlDataSource3" DataTextField="EnName" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                        SelectCommand="Select ID, EnName From QuestionHardness Where IsActive=1 and IsDelete=0 union select -1, N'Chosse Question Hardness'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row answers-type answers-type1" style="display: none;">
                                <label class="col-md-2 control-label">Answers</label>
                                <div class="col-md-8 divAnswers">
                                    <div class="form-group row">
                                        <div class="col-md-1" style="padding: 6px 15px;">
                                            <asp:Label ID="lblAnswerID11" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:RadioButton ID="rbAnswer11" runat="server" GroupName="groupType1" />
                                        </div>
                                        <div class="col-md-11">
                                            <asp:TextBox ID="txtAnswer11" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-1" style="padding: 6px 15px;">
                                            <asp:Label ID="lblAnswerID12" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:RadioButton ID="rbAnswer12" runat="server" GroupName="groupType1" />
                                        </div>
                                        <div class="col-md-11">
                                            <asp:TextBox ID="txtAnswer12" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-1" style="padding: 6px 15px;">
                                            <asp:Label ID="lblAnswerID13" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:RadioButton ID="rbAnswer13" runat="server" GroupName="groupType1" />
                                        </div>
                                        <div class="col-md-11">
                                            <asp:TextBox ID="txtAnswer13" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-1" style="padding: 6px 15px;">
                                            <asp:Label ID="lblAnswerID14" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:RadioButton ID="rbAnswer14" runat="server" GroupName="groupType1" />
                                        </div>
                                        <div class="col-md-11">
                                            <asp:TextBox ID="txtAnswer14" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row answers-type answers-type2" style="display: none;">
                                <label class="col-md-2 control-label">Answers</label>
                                <div class="col-md-8 divAnswers">
                                    <div class="form-group row">
                                        <div class="col-md-1" style="padding: 6px 15px;">
                                            <asp:Label ID="lblAnswerID21" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:RadioButton ID="rbAnswer21" runat="server" GroupName="groupType2" />
                                        </div>
                                        <div class="col-md-11">
                                            <asp:TextBox ID="txtAnswer21" runat="server" CssClass="form-control" Text="Correct"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-1" style="padding: 6px 15px;">
                                            <asp:Label ID="lblAnswerID22" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:RadioButton ID="rbAnswer22" runat="server" GroupName="groupType2" />
                                        </div>
                                        <div class="col-md-11">
                                            <asp:TextBox ID="txtAnswer22" runat="server" CssClass="form-control" Text="Incorrect"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row answers-type answers-type3 answers-type4 answers-type5 answers-type8 answers-type10" style="display: none;">
                                <label class="col-md-2 control-label">Answer</label>
                                <div class="col-md-8 divAnswers">
                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <asp:Label ID="lblAnswerID31" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:TextBox ID="txtAnswer31" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-offset-2 col-md-8">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="Active" Checked="true" />
                                </div>
                            </div>
                        </div>

                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-9">
                                <asp:Button ID="btnSaveQuestion" runat="server" Text="Save" CssClass="btn green" OnClick="btnSaveQuestion_Click" />
                                <asp:Button ID="btnCancelQuestion" runat="server" Text="New Question" CssClass="btn default" OnClick="btnCancelQuestion_Click" />
                                <a class="btn default" href="Question">Questions</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
