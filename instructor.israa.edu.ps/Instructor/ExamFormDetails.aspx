<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="ExamFormDetails.aspx.cs" Inherits="Instructor_ExamFormDetails" %>

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
                        <div class="col-md-12">
                            <div style="font-size: 14px;" class="alert alert-info">
                                <asp:Label ID="lblExamFormID" runat="server" Visible="false"></asp:Label>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <label class="control-label" style="font-weight: bold;">المساق :</label>
                                        <label class="control-label"><%# Eval("CourseArName") %></label>
                                        <span style="margin: 0 10px;">|</span>
                                        <label class="control-label" style="font-weight: bold;">نوع الإمتحان :</label>
                                        <label class="control-label"><%# Eval("ExamCategoryArName") %></label>
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
                        <asp:Label ID="lblExamFormDetailsID" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlCoursePart" runat="server" DataSourceID="SqlDataSource3" DataTextField="PartName" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                SelectCommand="Select ID, PartName From CoursePart Where CourseID=(Select CourseID From ExamForm Where ID=@ExamFormID) and IsActive=1 and IsDelete=0 union select -1, N'إختر جزء المساق'">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblExamFormID" Name="ExamFormID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlQuestionType" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                SelectCommand="Select ID, ArName From QuestionType Where IsActive=1 and IsDelete=0 union select -1, N'إختر نوع السؤال'"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlQuestionHardness" runat="server" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                SelectCommand="Select ID, ArName From QuestionHardness Where IsActive=1 and IsDelete=0 union select -1, N'إختر درجة الصعوبة'"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtCountOfQuestions" runat="server" CssClass="form-control" placeholder="ع. الأسئلة" Style="text-align: center; float: right; width: 100px; margin-left: 15px;"></asp:TextBox>
                            <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control" placeholder="العلامة" Style="text-align: center; float: right; width: 100px; margin-left: 15px;"></asp:TextBox>
                            <asp:TextBox ID="txtTimePeriod" runat="server" CssClass="form-control" placeholder="الوقت بالدقائق" Style="text-align: center; float: right; width: 100px;"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" Style="width: 45%; float: right" />
                            <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" Style="width: 45%; float: left" />
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
                                        <th style="width: 15%; text-align: center">نوع السؤال</th>
                                        <th style="width: 15%; text-align: center">الصعوبة</th>
                                        <th style="width: 15%">جزء المساق</th>
                                        <th style="width: 15%; text-align: center">عدد الأسئلة</th>
                                        <th style="width: 15%; text-align: center">الوزن بالعلامة</th>
                                        <th style="width: 15%; text-align: center">الوقت اللازم</th>
                                        <th style="width: 10%; text-align: center">فعال</th>
                                        <th style="width: 10%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                        <ItemTemplate>
                                            <asp:Label ID="ExamFormDetailsID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <tr>
                                                <td style="text-align: center"><span><%# Eval("QuestionType") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("QuestionHardness") %></span></td>
                                                <td><span><%# Eval("CoursePart") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("CountOfQuestions") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("Weight") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("TimePeriod") %></span></td>
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
                                                                    <asp:LinkButton ID="lbEdit" runat="server" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                </li>
                                                                <li>
                                                                    <asp:LinkButton ID="lbDelete" runat="server" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                        SelectCommand="GetExamFormDetailsByExamForm" SelectCommandType="StoredProcedure">
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
                                    <strong>لا يوجد بيانات مضافة</strong>
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

