<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StdSemesterMarks.aspx.cs" Inherits="StdSemesterMarks" %>


<%@ Register Src="~/Academic/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_1 a').css("background-color", "#575757");
            $('#Student a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <uc1:StudentSideBar ActiveTab="StdSemesterMarks" runat="server" ID="StudentSideBar" />
                    <div style="width: 81%; float: right;">
                        <div id="tab12" class="" runat="server" clientidmode="Static">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <h4>علامات المساقات</h4>
                                        </div>
                                        <div class="col-md-9 isra-pl-0">
                                            <div id="divMsg1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr style="margin: 10px 0 15px 0" />
                                    <div class="row" style="border-bottom: 1px solid #ddd; padding: 15px 0;">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">الفصل الدراسي</label>
                                                <div class="col-md-9">
                                                    <asp:DropDownList ID="ddlStdSemester2" runat="server" class="form-control" DataTextField="Semester" DataValueField="ID" AutoPostBack="true" DataSourceID="SqlDataSource12"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource12" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdSemesterWithoutTrans" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="padding-top: 15px;">
                                        <% if (Repeater4.Items.Count > 0)
                                            { %>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width: 8%">كود المساق</th>
                                                    <th style="width: 15%; text-align: center">المساق</th>
                                                    <th style="width: 5%; text-align: center">ع . س</th>
                                                    <th style="width: 5%; text-align: center">الحالة</th>
                                                    <th style="width: 10%; text-align: center">أعمال الفصل</th>
                                                    <th style="width: 10%; text-align: center">العلامة الفصلية</th>
                                                    <th style="width: 10%; text-align: center">العلامة النهائية</th>
                                                    <th style="width: 10%; text-align: center">العلامة</th>
                                                    <th style="width: 10%; text-align: center">ملاحظات</th>
                                                    <th style="width: 25%; text-align: center"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                    <ItemTemplate>
                                                        <asp:Label ID="MarkID" runat="server" Text='<%# Eval("MarkID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                        <tr>
                                                            <td><span><%# Eval("CourseCode") %></span></td>
                                                            <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                            <td style="text-align: center"><span><%# Eval("CourseHours") %></span></td>
                                                            <td style="text-align: center"><span><%# Eval("CourseStatus") %></span></td>
                                                            <td style="text-align: center"><span><%# (((Convert.ToBoolean(Eval("IsTotalZero").ToString()))) ? "صفر في العلامة الكلية":Eval("WorkMark"))%></span></td>
                                                            <td style="text-align: center"><span><%# (Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "غير مكتمل": ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())) ? "غياب" : ((Convert.ToBoolean(Eval("IsTotalZero").ToString()))) ? "صفر في العلامة الكلية":  Eval("MidtermMark")) %></span>
                                                                <%-- <br />
                                                                    <span runat="server" style="color: green" visible='<%#Convert.ToBoolean(Eval("IsMidtermNoMarkAccept").ToString()) %>'>غياب: تم تقديم العذرالنصفي</span>
                                                                    <br />
                                                                    <span runat="server" style="color: red" visible='<%#!Convert.ToBoolean(Eval("IsMidtermNoMarkAccept").ToString()) && Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())  %>'>لم يتم تقديم العذرالنصفي</span>--%>
                                                            </td>
                                                            <td style="text-align: center"><span><%# (Convert.ToBoolean(Eval("IsFinalIncomplete").ToString())) ? "غير مكتمل": ((Convert.ToBoolean(Eval("IsFinalNoMark").ToString())) ? "غياب" : ((Convert.ToBoolean(Eval("IsTotalZero").ToString()))) ? "صفر في العلامة الكلية":  Eval("FinalMark")) %></span>
                                                                <br />
                                                                <span runat="server" style="color: green" visible='<%#Convert.ToBoolean(Eval("IsFinalIncomplete").ToString()) && Convert.ToBoolean(Eval("IsFinalNoMark").ToString()) %>'>تم تقديم طلب غير مكتمل</span>
                                                                <br />
                                                                <span runat="server" style="color: red" visible='<%#!Convert.ToBoolean(Eval("IsFinalIncomplete").ToString()) && Convert.ToBoolean(Eval("IsFinalNoMark").ToString())  %>'>لم يتم تقديم طلب غير مكتمل</span>

                                                            </td>
                                                            <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                            <td style="text-align: center">
                                                                <span id="Span2" style="text-align: center; color: red" runat="server" visible='<%# Convert.ToBoolean(Eval("IsMarkRevisionRequest").ToString()) %>'>تم تقديم طلب المراجعة للنهائي</span>
                                                                <span><%# (Eval("IsPlanCourse").ToString() == "1") ? "داخل الخطة" : "خارج الخطة" %></span>
                                                            </td>
                                                            <td style="text-align: center">

                                                                <% if (Permissions.Contains("MidtermIncomplete"))
                                                                    { %>
                                                                <asp:Button ID="btnIsMidtermIncomplete2" runat="server" Text="إحتساب من 70"            Visible='<%# Convert.ToBoolean(Eval("IsMidtermNoMark").ToString()) && !Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString()) && Convert.ToBoolean(Eval("MidAcademicAccreditation").ToString()) %>'  CssClass="btn green" OnClick="btnIsMidtermIncomplete2_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إحتساب علامة الإمتحان النهائي من 70 ؟');"  />
                                                                <% } %>
                                                                <% if (Permissions.Contains("FinalMarkIncomplet"))
                                                                    { %>
                                                                    <asp:LinkButton ID="lbFinalMarkIncompleteAdd" runat="server"   Visible='<%# !Convert.ToBoolean(Eval("IsFinalIncomplete").ToString()) && Convert.ToBoolean(Eval("IsFinalNoMark").ToString()) %>' CssClass="btn default btn-xs black" OnClick="lbFinalMarkIncompleteAdd_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تقديم طلب غير مكتمل ؟');">تقديم طلب غير مكتمل</asp:LinkButton>
                                                                <% } %>
                                                            </td>

                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <tr></tr>
                                                <tr>
                                                    <td></td>
                                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource6">
                                                        <ItemTemplate>
                                                            <td colspan="2" style="text-align: center"><span>الساعات المسجلة :</span> <span><%# Eval("RegisteredHours") %></span>
                                                            </td>
                                                            <td colspan="2" style="text-align: center"><span>ساعات النجاح :</span> <span><%# Eval("SucceedHour") %></span></td>
                                                            <td colspan="2" style="text-align: center"><span>ساعات الرسوب :</span> <span><%# Eval("FailedHour") %></span></td>
                                                            <td colspan="2" style="text-align: center"><span>المعدل الفصلي :</span> <span><%# Eval("SemesterGPA") %></span></td>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <td style="text-align: center"></td>
                                                </tr>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                    SelectCommand="GetStdSemesterMarks" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="ddlStdSemester2" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                    SelectCommand="GetStdSemesterStatistic" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="ddlStdSemester2" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </tbody>
                                        </table>
                                        <% }
                                            else
                                            {%>
                                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                            <div class="col-xs-11" style="text-align: center;">
                                                <strong>لم يتم تسجيل مساقات لهذا الفصل الدراسي</strong>
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
        </div>
    </div>
</asp:Content>

