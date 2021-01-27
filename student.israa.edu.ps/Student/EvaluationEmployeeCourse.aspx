<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="EvaluationEmployeeCourse.aspx.cs" Inherits="Student_EvaluationEmployeeCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu15').addClass("active");
        });
    </script>
    <style>
        .answers {
            width: 100%;
        }

            .answers tbody tr {
                width: 20%;
                float: right;
            }

                .answers tbody tr td {
                    padding: 0px;
                    border-top: none;
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
        <li><a href="#" class="font-ha">تقيم العملية التعليمية</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>تقيم العملية التعليمية</div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="row">
                            <div style="font-size: 14px;" class="alert alert-info alert-dismissable">
                                <asp:Label ID="StdSectionID" runat="server" Visible="false"></asp:Label>
                                <div class="col-md-3">
                                    <strong>رقم المساق : </strong>
                                    <asp:Label ID="CourseCode" runat="server"></asp:Label><br />
                                </div>
                                <div class="col-md-3">
                                    <strong>المساق : </strong>
                                    <asp:Label ID="CourseArName" runat="server"></asp:Label><br />
                                </div>
                                <div class="col-md-3">
                                    <strong>الشعبة : </strong>
                                    <asp:Label ID="SectionNum" runat="server"></asp:Label><br />

                                </div>
                                <div class="col-md-3">
                                    <strong>المحاضر : </strong>
                                    <asp:Label ID="Employee" runat="server"></asp:Label><br />
                                </div>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div id="divMsg" runat="server" class="alert alert-warning alert-dismissable" visible="true" style="font-size: 14px;">
                                <div class="col-xs-10">
                                    <strong>
                                        <asp:Label ID="lblMsg" runat="server" Text="التقيم الجامعي"></asp:Label>
                                    </strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button aria-hidden="true" data-dismiss="alert" class="close col-xs-2" style="margin-top: 4px;" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <asp:Label ID="EvaluationQuestionGroupID" runat="server" Text="12" Visible="false"></asp:Label>
                        <%--     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="EvaluationQuestionGroupID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <h4><%# Eval("GroupName") %></h4>
                                        </div>
                                    </div>
                                    <hr style="margin: 10px 0 15px 0" />--%>
                        <div class="col-md-12">
                            <h4>بنود التقييم</h4>
                        </div>
                    </div>
                    <hr style="margin: 10px 0 15px 0" />
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 5%;">#</th>
                                        <th style="width: 45%; text-align: center">السؤال</th>
                                        <th style="width: 50%; text-align: center">الدرجة</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater11" runat="server" DataSourceID="SqlDataSource11">
                                        <ItemTemplate>
                                            <tr>
                                                <td><span><%# Eval("RowNo") %></span>
                                                    <asp:Label ID="EvaluationQuestionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label></td>
                                                <td><span><%# Eval("QuestionName") %></span></td>
                                                <td>
                                                    <asp:RadioButtonList ID="rblAnswers" runat="server" CssClass="answers" DataSourceID="SqlDataSource2" DataTextField="OptionText" DataValueField="OptionID">
                                                    </asp:RadioButtonList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>' SelectCommand="EvaluationQuestionOptionsGet" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EvaluationQuestionID" PropertyName="Text" Name="QuestionID" Type="Int32"></asp:ControlParameter>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:IsraaEvaluation %>"
                                        SelectCommand="GetEvaluationQuestionsByGroup" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="EvaluationQuestionGroupID" PropertyName="Text" Name="EvaluationQuestionGroupID" Type="Int32" />
                                            <asp:ControlParameter ControlID="StdSectionID" PropertyName="Text" Name="StdSectionID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                        </div>
                        <div class="form-actions fluid">
                    <div class="col-md-offset-3 col-md-9">
                        <asp:Button ID="btnSave" runat="server" Text="تقديم وحفظ التقيم" class="btn green" OnClick="btnSave_Click" />
                    </div>
                </div>
                    </div>
                    <%--          </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>"
                            SelectCommand="GetEvaluationQuestionGroup" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>--%>
                    <div class="col-md-12">
                        <h4>الرجاء اختيار الاجابة التي تلائمك  </h4>
                    </div>
                </div>
                <%--<hr style="margin: 10px 0 15px 0" />
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 45%; text-align: center">السؤال</th>
                                    <th style="width: 50%; text-align: center"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <tr>
                                            <td><span><%# Eval("RowNo") %></span>
                                                <asp:Label ID="EvaluationQuestionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label></td>
                                            <td><span><%# Eval("QuestionName") %></span></td>
                                            <td>
                                                <asp:RadioButtonList ID="rblAnswers" RepeatColumns="1" runat="server" DataSourceID="SqlDataSource2" DataTextField="OptionText" DataValueField="OptionID" RepeatLayout="Flow">
                                                </asp:RadioButtonList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>' SelectCommand="EvaluationQuestionOptionsGet" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="EvaluationQuestionID" PropertyName="Text" Name="QuestionID" Type="Int32"></asp:ControlParameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:IsraaEvaluation %>"
                                    SelectCommand="GetEvaluationQuestionsByGroup" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="2" Name="EvaluationQuestionGroupID" Type="Int32"></asp:Parameter>

                                        <asp:ControlParameter ControlID="StdSectionID" PropertyName="Text" Name="StdSectionID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="form-actions fluid">
                    <div class="col-md-offset-3 col-md-9">
                        <asp:Button ID="btnSave" runat="server" Text="تقديم وحفظ التقيم" class="btn green" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>--%>
        </div>
    </div>
    </div>
</asp:Content>
