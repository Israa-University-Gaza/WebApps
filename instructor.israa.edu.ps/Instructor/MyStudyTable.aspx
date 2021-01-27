<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="MyStudyTable.aspx.cs" Inherits="Instructor_MyStudyTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="/assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#AcademicMenu, #MyStudyTable').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>جدول محاضراتي</span>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="caption">
                        <i class=" icon-layers font-red"></i>
                        <span class="caption-subject font-red uppercase font-ha">جدول محاضراتي</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">الفصل الدراسي</label>
                                        <div class="col-md-8">
                                            <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                SelectCommand="GetInstructorSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <%--<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <span style="font-weight: bold;"><%# Eval("Semester") %></span>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                        SelectCommand="GetTeacherStudyTableInfo" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                            <asp:Parameter Name="SemesterID" DefaultValue="4" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>--%>
                                </div>
                                <% if (Repeater2.Items.Count > 0)
                                    { %>
                                <div class="col-md-6">
                                    <asp:LinkButton ID="lbStudyTablePDF" runat="server" OnClick="lbStudyTablePDF_Click" CssClass="pull-right">تصدير الجدول الى pdf</asp:LinkButton>
                                </div>
                                <% } %>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <% if (Repeater2.Items.Count > 0)
                                        { %>
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 8%; text-align: center; font-size: 11px">رقم المساق</th>
                                                <th style="width: 15%; text-align: center; font-size: 11px">المساق</th>
                                                <th style="width: 5%; text-align: center; font-size: 11px">شعبة</th>
                                                <th style="width: 8%; text-align: center; font-size: 11px">قاعة</th>
                                                <th style="width: 9%; text-align: center; font-size: 11px">السبت</th>
                                                <th style="width: 9%; text-align: center; font-size: 11px">الأحد</th>
                                                <th style="width: 9%; text-align: center; font-size: 11px">الإثنين</th>
                                                <th style="width: 9%; text-align: center; font-size: 11px">الثلاثاء</th>
                                                <th style="width: 9%; text-align: center; font-size: 11px">الأربعاء</th>
                                                <th style="width: 9%; text-align: center; font-size: 11px">الخميس</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Room") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Saturday") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Sunday") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Monday") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Tuesday") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Wednesday") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Thursday") %></span></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                SelectCommand="GetTeacherStudyTable" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="Text" Name="SemesterID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                    <% }
                                        else
                                        {%>
                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                        <div class="col-xs-11" style="text-align: center;">
                                            <strong>لا يوجد مساقات</strong>
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
</asp:Content>

