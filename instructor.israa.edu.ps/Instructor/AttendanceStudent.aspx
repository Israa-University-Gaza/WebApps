<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="AttendanceStudent.aspx.cs" Inherits="Instructor_AttendanceStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS CSS -->
    <link href="../assets/global/plugins/data-tables/css/jquery.dataTables.css" rel="stylesheet" />
    <!-- END PAGE LEVEL PLUGINS CSS -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS JS -->
    <script src="../assets/global/plugins/data-tables/js/jquery.dataTables.js"></script>
    <!-- BEGIN PAGE LEVEL PLUGINS JS -->

    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#AttendanceStudent, #AttendanceStudentInsert').addClass("active");

            $('#checkall').click(function (event) {
                var x = this.checked;
                $('.cbisexist :checkbox').each(function () {
                    this.checked = x;
                });
            });

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

        function savedata() {
            if ($('#DataTables_Table_0_filter label input').val() != '') {
                alert('الرجاء إلغاء التصفية للحفظ');
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>إدراج جدول الضبط</span>
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
                                <span class="caption-subject font-red uppercase font-ha">إدراج جدول الضبط</span>
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
                                        <label class="col-md-1 control-label">المساق</label>
                                        <div class="col-md-2">
                                            <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="CourseName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic%>"
                                                SelectCommand="GetTeacherOfferdCourses" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" Name="SemesterID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-1 control-label">الشعبة</label>
                                        <div class="col-md-2">
                                            <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="SectionNum" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic%>"
                                                SelectCommand="GetTeacherOfferdCoursesSections" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="OfferdCourseID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-1 control-label">الأسبوع</label>
                                        <div class="col-md-2">
                                            <asp:DropDownList ID="ddlWeek" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlWeek_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>"
                                                SelectCommand="GetEmployeeSectionWeeks" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-1 control-label">المحاضرة</label>
                                        <div class="col-md-2">
                                            <asp:DropDownList ID="ddlLecture" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>"
                                                SelectCommand="GetEmployeeSectionWeekLectures" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="ddlWeek" PropertyName="SelectedValue" Name="WeekID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row table-responsive">
                                        <div class="col-md-12">
                                            <%
                                                if (ListView1.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" style="width: 10%; text-align: center">رقم</th>
                                                        <th scope="col" style="width: 15%; text-align: center">رقم الطالب</th>
                                                        <th scope="col" style="width: 25%; text-align: center">اسم الطالب</th>
                                                        <th scope="col" style="width: 15%; text-align: center">
                                                            <input id="checkall" type="checkbox" checked="checked" />
                                                            حاضر
                                                        </th>
                                                        <th scope="col" style="width: 15%; text-align: center">مأذون
                                                        </th>
                                                        <th scope="col" style="width: 15%; text-align: center">الحالة</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                                        <ItemTemplate>
                                                            <asp:Label ID="StudentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="AttendanceStudentID" runat="server" Text='<%# Eval("AttendanceStudentID") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                                                <td style="text-align: center; padding: 2px;">
                                                                    <asp:CheckBox ID="cbIsExist" CssClass="cbisexist" runat="server" ClientIDMode="Static" Checked='<%# (Eval("AttendanceStudentID").ToString()!= "0") && (Eval("IsExist").ToString()=="False")? false:true %>' />
                                                                </td>
                                                                <td style="text-align: center; padding: 2px;">
                                                                    <asp:CheckBox ID="cbIsNoProblem" runat="server" ClientIDMode="Static" Checked='<%# (Eval("AttendanceStudentID").ToString()!= "0") && (Eval("IsNoProblem").ToString()=="True")? true:false %>' />
                                                                </td>
                                                                <td style="text-align: center; padding: 2px;">
                                                                    <label runat="server" visible='<%# ((Eval("IsNoProblem").ToString()=="False") && (Eval("IsExist").ToString()=="True"))? true:false %>' class="btn green" style="font-size: 11px; cursor: default">حاضر</label>
                                                                    <label runat="server" visible='<%# (Eval("IsNoProblem").ToString()=="True")? true:false %>' class="btn purple" style="font-size: 11px; cursor: default">مأذون</label>
                                                                    <label runat="server" visible='<%# ((Eval("IsNoProblem").ToString()=="False") && (Eval("IsExist").ToString()=="False"))? true:false %>' class="btn red" style="font-size: 11px; cursor: default">غائب</label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>"
                                                        SelectCommand="GetAttendanceLectureStudents" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlLecture" PropertyName="SelectedValue" Name="AttendanceLectureID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                            <div style="margin:30px 0;">
                                                <strong>مأذون :</strong>
                                                <span>الطالب يأخذ إذن من محاضر المساق بعدم تواجده في المحاضرة بسبب مقنع بحيث يتابع الطالب مع المحاضر ومع زملاءه ويقدم المطلوب منه.</span>
                                            </div>
                                            <div style="text-align: center;">
                                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" OnClientClick="return savedata();" Style="padding: 15px; width: 100%" />
                                            </div>
                                            <% }
                                                else if (ddlLecture.SelectedIndex == 0)
                                                { %>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center">
                                                    <strong>لم يتم إختيار المحاضرة لعرض طلاب الشعبة</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
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

