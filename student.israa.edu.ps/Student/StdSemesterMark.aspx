<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StdSemesterMark.aspx.cs" Inherits="Student_StdSemesterMark" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu9').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">علامات المساقات</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>علامات المساقات</div>
                </div>
                <div class="portlet-body">
                    <% if (ddlStdSemester.Items.Count > 0)
                       { %>
                    <div class="row" style="border-bottom: 1px solid #ddd; padding: 15px 0;">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="control-label col-md-3">الفصل الدراسي</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlStdSemester" runat="server" class="form-control" DataTextField="Semester" DataValueField="ID" AutoPostBack="true" DataSourceID="SqlDataSource1"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
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
                                    <th style="width: 10%">كود المساق</th>
                                    <th style="width: 15%; text-align: center">المساق</th>
                                    <th style="width: 10%; text-align: center">أعمال الفصل</th>
                                    <th style="width: 10%; text-align: center">العلامة الفصلية</th>
                                    <th style="width: 10%; text-align: center">العلامة النهائية</th>
                                    <th style="width: 10%; text-align: center">العلامة</th>
                                    <th style="width: 10%; text-align: center">الحالة</th>
                                    <th style="width: 35%; text-align: center">مراجعة العلامة</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("CourseCode") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>


                                            <%if (ddlStdSemester.SelectedItem.Text == "الفصل الدراسي الثاني للعام الجامعي 2019 -2020")
                                                {%>
                                            <td style="text-align: center"><span></span></td>
                                            <td style="text-align: center"><span><%# " " %></span></td>
                                            <td style="text-align: center"><span><%# (Convert.ToBoolean(Eval("IsFinalZero").ToString())) ? "P": " " %></span></td>
                                            <td style="text-align: center"><span><%# " " %></span></td>
                                            <% }
                                            else
                                            { %>

                                            <td style="text-align: center"><span><%# Eval("WorkMark") %></span></td>
                                            <td style="text-align: center"><span><%# (Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "من 70": ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())) ? "غياب" : Eval("MidtermMark")) %></span></td>
                                            <td style="text-align: center"><span><%# (Convert.ToBoolean(Eval("IsFinalZero").ToString())) ? "P": Eval("FinalMark") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                            <% }  %>
                                            <td style="text-align: center"><span><%# Eval("MarkEstimation") %></span></td>
                                            <td style="text-align: center">
                                                <%--                                                <span id="td1" runat="server" visible='<%# (Eval("AdmissionAccreditation").ToString() == "False") && (Eval("Revision").ToString() == "False")  %>'>
                                                    <asp:LinkButton ID="lbRevision" runat="server" class="btn default btn-xs black" Visible='<%# (Eval("AdmissionAccreditation").ToString() == "True") && (Eval("Revision").ToString() == "False") %>' OnClick="lbRevision_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تقديم طلب المراجعة ؟');"><i class="fa fa-edit"></i> تقديم طلب مراجعة</asp:LinkButton>
                                                </span>
                                                <span id="td2" style="text-align: center; color: red" runat="server" visible='<%# Eval("Revision").ToString() == "True" %>'>تم تقديم طلب المراجعة</span>
                                                <%# Eval("LastRevisionDate","{0:yyyy/MM/dd}") %> --%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <tr>

                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource6">
                                        <ItemTemplate>
                                            <tr>
                                                <td colspan="1"><span>مسجل:</span> <span><%# Eval("RegisteredHours") %></span></td>
                                                <td colspan="2"><span>ساعات نجاح:</span> <span><%# Eval("SucceedHour") %></span></td>
                                                <td colspan="2"><span>ساعات رسوب:</span> <span><%# Eval("FailedHour") %></span></td>
                                                <td colspan="2"><span>ساعات إثرائية:</span> <span><%# Eval("RichnessHour") %></span></td>
                                                <td colspan="2"><span>المعدل:</span> <span><%# Eval("SemesterGPA") %></span></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tr>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStdSemesterMarks" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlStdSemester" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStdSemesterStatistic" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlStdSemester" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
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
                    <% }
                        else
                        {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center;">
                            <strong>لم يتم تسجيل فصول دراسية بعد</strong>
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
</asp:Content>
