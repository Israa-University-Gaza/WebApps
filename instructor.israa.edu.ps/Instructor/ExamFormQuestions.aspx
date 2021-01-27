<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="ExamFormQuestions.aspx.cs" Inherits="Instructor_ExamFormQuestions" %>

<asp:Content ID="Style" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS CSS -->
    <link href="../assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="../assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS CSS -->
</asp:Content>

<asp:Content ID="Script" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS JS -->
    <script src="../assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>

    <script src="../assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
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
    <span>نموذج الإمتحان</span>
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
                                <asp:Label ID="lblExamFormID" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblCourseID" runat="server" Visible="false" Text=""></asp:Label>

                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <%# lblCourseID.Text = Eval("CourseID").ToString()  %>
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
                    <hr />
                    <div class="form-group row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th style="width: 40%">السؤال</th>
                                        <th style="width: 12%; text-align: center">جزء المساق</th>
                                        <th style="width: 12%; text-align: center">نوع السؤال</th>
                                        <th style="width: 12%; text-align: center">مستوى الصعوبة</th>
                                        <th style="width: 12%; text-align: center">العلامة</th>
                                        <th style="width: 10%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="sdsExamFormQuestions">
                                        <ItemTemplate>
                                            <asp:Label ID="ExamFormQuestionsID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <tr>
                                                <td><span><%# Eval("RowNo") %></span></td>
                                                <td><span><%# Eval("QuestionText") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("CoursePart") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("QuestionType") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("QuestionHardness") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("Mark") %></span></td>
                                                <td style="text-align: center">
                                                    <asp:LinkButton ID="lbExamFormQuestionsDelete" runat="server" CssClass="btn default btn-xs purple" OnClick="lbExamFormQuestionsDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="sdsExamFormQuestions" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                        SelectCommand="GetExamFormQuestions" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblExamFormID" Name="ExamFormID" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>
                            <% }
                                else
                                {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center;">
                                    <strong>لا يوجد أسئلة للامتحان لعرضها</strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 7px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <hr />
                    <div class="form-group row">
                        <div class="col-md-12">
                            <% if (ListView2.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th style="width: 42%">السؤال</th>
                                        <th style="width: 13%; text-align: center">جزء المساق</th>
                                        <th style="width: 13%; text-align: center">نوع السؤال</th>
                                        <th style="width: 13%; text-align: center">مستوى الصعوبة</th>
                                        <th style="width: 18%; text-align: center">العلامة</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView2" runat="server" DataSourceID="sdsQuestions">
                                        <ItemTemplate>
                                            <asp:Label ID="QuestionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <tr>
                                                <td>
                                                    <img src="WebServices/GetEmployeeImage.ashx?EmployeeID=<%# Eval("InsertEmployeeID") %>" class="img-thumbnail tooltips" alt="<%# Eval("EmployeeNo") %>" title="<%# Eval("EmployeeName") %>" data-original-title="<%# Eval("EmployeeName") %>" style="padding: 2px; width: 40px; height: 40px;"></td>
                                                <td><span><%# Eval("QuestionText") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("CoursePart") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("QuestionType") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("QuestionHardness") %></span></td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="txtMark" runat="server" CssClass="form-control" placeholder="العلامة" Style="text-align: center; float: right; width: 70px"></asp:TextBox>
                                                    <asp:LinkButton ID="lbAddQuestion" runat="server" CssClass="btn green" OnClick="lbAddQuestion_Click" Style="text-align: center; float: right"><i class="fa fa-edit"></i> إضافة</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="sdsQuestions" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                        SelectCommand="GetQuestions" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblCourseID" Name="CourseID" PropertyName="Text" Type="Int32" />
                                            <asp:Parameter Name="CoursePartID" DefaultValue="-1" Type="Int32" />
                                            <asp:Parameter Name="QuestionTypeID" DefaultValue="-1" Type="Int32" />
                                            <asp:Parameter Name="QuestionHardnessID" DefaultValue="-1" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>
                            <% }
                                else
                                {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center;">
                                    <strong>لا يوجد بيانات لعرضها</strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 7px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

