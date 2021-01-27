<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="AttendanceStudentStatistics.aspx.cs" Inherits="Instructor_AttendanceStudentStatistics" %>

<asp:Content ID="Style" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS CSS -->
    <link href="../assets/global/plugins/data-tables/css/jquery.dataTables.css" rel="stylesheet" />
    <!-- END PAGE LEVEL PLUGINS CSS -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS JS -->
    <script src="../assets/global/plugins/data-tables/js/jquery.dataTables.js"></script>
    <!-- END PAGE LEVEL PLUGINS JS -->

    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#AttendanceStudent, #AttendanceStudentStatistics').addClass("active");

            $('.table').DataTable({
                "paging": false,
                "language": {
                    "search": "تصفية : ",
                    "zeroRecords": "لا يوجد بيانات",
                    "info": "عدد الطلاب : _TOTAL_",
                    "infoEmpty": "لا يوجد بيانات",
                    "infoFiltered": "(تصفية من _MAX_ طالب)"
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>إحصائيات جدول الضبط</span>
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
                                <span class="caption-subject font-red uppercase font-ha">إحصائيات جدول الضبط</span>
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
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="form-horizontal">
                                <div class="form-body">
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">المساق</label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="CourseName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                SelectCommand="GetTeacherOfferdCourses" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" Name="SemesterID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-2 control-label">الشعبة</label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="SectionNum" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                SelectCommand="GetTeacherOfferdCoursesSections" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="OfferdCourseID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row table-responsive">
                                        <div class="col-md-12">
                                            <% if (ListView1.Items.Count > 0)
                                                { %>
                                            <div class="col-md-12" style="padding: 12px; text-align: left; vertical-align: middle;">
                                                <asp:LinkButton ID="lbAttendanceStudentStatisticsExcel" runat="server" OnClick="lbAttendanceStudentStatisticsExcel_Click">كشف Excel</asp:LinkButton>
                                            </div>

                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" style="width: 10%; text-align: center">رقم</th>
                                                        <th scope="col" style="width: 15%; text-align: center">رقم الطالب</th>
                                                        <th scope="col" style="width: 25%; text-align: center">اسم الطالب</th>
                                                        <th scope="col" style="width: 20%; text-align: center">عدد المحاضرات</th>
                                                        <th scope="col" style="width: 10%; text-align: center">حضور</th>
                                                        <th scope="col" style="width: 20%; text-align: center">نسبة الحضور</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                                        <ItemTemplate>
                                                            <asp:Label ID="StudentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CountOfLectures") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CountOfLecturesExist") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("PercentOfLecturesExist").ToString() + " %" %></span></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>"
                                                        SelectCommand="GetSectionAttendanceStudentStatistics" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                            <div class="clearfix"></div>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center">
                                                    <strong>لا يوجد طلاب مسجلين في الشعبة</strong>
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
    </div>
</asp:Content>

