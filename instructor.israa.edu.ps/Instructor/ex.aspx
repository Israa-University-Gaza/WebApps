<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ex.aspx.cs" Inherits="Instructor_q" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="row">
            <div class="col-md-12">
                <div class="portlet light portlet-fit bordered calendar">
                    <div class="portlet-body">
                        <div class="form-group row">
                            <div class="col-md-12">
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater2_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="question">
                                            <asp:Label ID="lblQuestionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
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
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                    SelectCommand="GetFinalExamFormQuestions" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="id" Name="ExamFormID" DefaultValue="5057" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
