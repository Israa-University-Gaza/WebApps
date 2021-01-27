<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudentPoll.aspx.cs" Inherits="Student_StudentPoll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#StudentPoll').addClass("active");
        });
    </script>
    <style type="text/css">
        .question {
            font-size: 22px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">استفتاء الرأي</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>استفتاء الرأي</div>
            </div>
            <div class="portlet-body form">
                <br />
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <h4>عزيزي الطالب .. عزيزتي الطالبة</h4>
                        <ul style="font-size: 15px;">
                            <li>مشاركتك بهذا الإستفتاء "بأمانة" تساعدنا بالنهوض أكثر بالجامعة والعملية التدريسية.</li>
                        </ul>
                    </div>
                </div>
                <br />
                <div id="divMsg" runat="server" class="alert alert-warning alert-dismissable" visible="true" style="font-size: 14px;">
                    <div class="col-xs-10">
                        <strong>
                            <asp:Label ID="lblMsg" runat="server" Text="الإستفتاء"></asp:Label>
                        </strong>
                        <div style="clear: both"></div>
                    </div>
                    <button aria-hidden="true" data-dismiss="alert" class="close col-xs-2" style="margin-top: 4px;" type="button"></button>
                    <div style="clear: both"></div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="row">
                                    <asp:Label ID="OfferdPollID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="PollID" runat="server" Text='<%# Eval("PollID") %>' Visible="false"></asp:Label>
                                    <div class="col-md-12"><span class="question"><%# Eval("QuestionTitle") %></span></div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-offset-1  col-md-8">
                                        <asp:RadioButtonList ID="rblAnswers" RepeatColumns="1" runat="server" DataSourceID="SqlDataSource2" DataTextField="AnswerText" DataValueField="ID" RepeatLayout="Flow">
                                        </asp:RadioButtonList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>' SelectCommand="GetPollAnswers" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="PollID" PropertyName="Text" Name="PollID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:IsraaEvaluation %>"
                            SelectCommand="GetStudentOfferdPoll" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="form-actions fluid">
                    <div class="col-md-offset-3 col-md-9">
                        <asp:Button ID="btnSave" runat="server" Text="حفظ الإستفتاء" class="btn green" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
