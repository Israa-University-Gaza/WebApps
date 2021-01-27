<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="CourseQuestionStatistics.aspx.cs" Inherits="Instructor_CourseQuestionStatistics" %>

<asp:Content ID="Style" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Script" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('#EExam, #CourseQuestionStatistics').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>إحصائيات الأسئلة</span>
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
                                <span class="caption-subject font-red uppercase font-ha">إحصائيات الأسئلة</span>
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
                        <label class="col-md-1 control-label">المساق</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                SelectCommand="GetTeacherCourses" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                    <asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" Name="SemesterID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <label class="col-md-1 control-label">جزء المساق</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlCoursePart" runat="server" DataSourceID="SqlDataSource2" DataTextField="PartName" DataValueField="ID" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                SelectCommand="Select ID, PartName From CoursePart Where CourseID=@CourseID and IsActive=1 and IsDelete=0 union select -1, N'كل الأجزاء'">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="CourseID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <label class="col-md-1 control-label">نوع السؤال</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlQuestionType" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                SelectCommand="Select ID, ArName From QuestionType Where IsActive=1 and IsDelete=0 union select -1, N'كل الأنواع'"></asp:SqlDataSource>
                        </div>
                        <label class="col-md-1 control-label">درجة الصعوبة</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlQuestionHardness" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                SelectCommand="Select ID, ArName From QuestionHardness Where IsActive=1 and IsDelete=0 union select -1, N'كل الدرجات'"></asp:SqlDataSource>
                        </div>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 20%; text-align: center">المساق</th>
                                <th style="width: 20%; text-align: center">جزء المساق</th>
                                <th style="width: 20%; text-align: center">نوع السؤال</th>
                                <th style="width: 20%; text-align: center">درجة الصعوبة</th>
                                <th style="width: 20%; text-align: center">عدد الأسئلة</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="sdsQuestions">
                                <ItemTemplate>
                                    <tr>
                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("CoursePart") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("QuestionType") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("QuestionHardness") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("CountOfQuestion") %></span></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="sdsQuestions" runat="server"
                                ConnectionString="<%$ ConnectionStrings:IsraaEExam %>"
                                SelectCommand="GetCourseQuestionStatistics" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlCourse" Name="CourseID" DefaultValue="-1" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlCoursePart" Name="CoursePartID" DefaultValue="-1" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlQuestionType" Name="QuestionTypeID" DefaultValue="-1" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlQuestionHardness" Name="QuestionHardnessID" DefaultValue="-1" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="30" PagedControlID="ListView1" class="pager">
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
</asp:Content>

