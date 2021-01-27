<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="AttendanceInstructor.aspx.cs" Inherits="Instructor_AttendanceInstructor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS CSS -->
    <link href="../assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="../assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS JS -->
    <script src="../assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>

    <script src="../assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
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
            $('#AcademicMenu, #AttendanceInstructor').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>الشؤون الأكاديمية</span>
    <i class="fa fa-angle-left" style="font-size: 15px; padding: 0 5px;"></i>
    <span>كشف دوام المحاضر</span>
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
                                <span class="caption-subject font-red uppercase font-ha">كشف دوام المحاضر</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">

                    <%--        <div class="form-group">

                        <label class="col-md-1 control-label">التاريخ</label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control date-picker" Text="من تاريخ"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control date-picker" Text="الى تاريخ"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn green" OnClick="btnSearch_Click" />
                        </div>

                    </div>--%>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 3%;">#</th>
                                <th style="width: 24%; text-align: center;">المساق</th>
                                <th style="width: 10%; text-align: center;">التاريخ</th>
                                <th style="width: 15%; text-align: center;">وقت المحاضرة</th>
                                <th style="width: 15%; text-align: center;">دوام  المحاضر</th>
                                <th style="width: 11%; text-align: center;">ع.س المحاضرة</th>
                                <th style="width: 11%; text-align: center;">ع.س الدوام</th>
                                <th style="width: 11%; text-align: center;">ع.س المحاضر</th>


                            </tr>
                        </thead>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("RowNo")%></td>
                                    <td style="text-align: center;"><%# Eval("CourseName")%></td>
                                    <td style="text-align: center;"><%# Eval("LectureDate")%></td>
                                    <td style="text-align: center;"><%# Eval("LectureFrom")%> -  <%# Eval("LectureTo")%></td>
                                    <td style="text-align: center;"><%# Eval("AttendanceFrom")%> - <%# Eval("AttendanceTo")%></td>
                                    <td style="text-align: center;"><%# Eval("LectureHours")%></td>
                                    <td style="text-align: center;"><%# Eval("AttendanceHours")%></td>
                                    <td style="text-align: center;"><%# Eval("InstructorHours")%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:IsraaHumanResource %>"
                            SelectCommand="GetInstructorDateRangeAttendance" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="InstructorID" Type="Int32" />
                                <asp:ControlParameter ControlID="lblSemesterID" Name="SemesterID" PropertyName="Text" Type="Int32" />


                            </SelectParameters>
                        </asp:SqlDataSource>
                    </table>

                    <div class="clearfix"></div>
                    <% }
                        else
                        {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center;">
                            <strong>لا يوجد دوام خلال الفترة المختارة</strong>
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
</asp:Content>

