<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="MySectionsStudents.aspx.cs" Inherits="Instructor_MySectionsStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#MySectionsStudents').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>طلاب الشعب</span>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="caption">
                        <i class=" icon-layers font-red"></i>
                        <span class="caption-subject font-red uppercase font-ha">طلاب الشعب</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group row">
                                <label class="col-md-2 control-label">الفصل الدراسي</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                        SelectCommand="GetInstructorSemesters" SelectCommandType="StoredProcedure">
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label">المساق</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="CourseName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                        SelectCommand="GetTeacherOfferdCourses" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">الشعبة</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="SectionNum" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                        SelectCommand="GetTeacherOfferdCoursesSections" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="OfferdCourseID" Type="Int32" />
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnView" runat="server" Text="عرض" CssClass="btn green" OnClick="btnView_Click" />
                                </div>
                            </div>
                            <hr />
                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <div class="col-md-6">
                                    <label>
                                        عدد الطلاب في الشعبة : 
                                     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
                                         <ItemTemplate>
                                             <span style="font-weight: bold;"><%# Eval("CountOfSectionStudents") %></span>
                                         </ItemTemplate>
                                     </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                            SelectCommand="GetSectionStatistics" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </label>
                                </div>
                                <div class="col-md-6" style="padding: 12px; text-align: left; vertical-align: middle;">
                                    <asp:LinkButton ID="lbSectionStudentPDF" runat="server" OnClick="lbSectionStudentPDF_Click">كشف طلاب الشعبة</asp:LinkButton><br />
                                    <asp:LinkButton ID="lbSectionStudentsAttendancePDF" runat="server" OnClick="lbSectionStudentsAttendancePDF_Click">كشف حضور وغياب</asp:LinkButton><br />
                                    <asp:LinkButton ID="lbSectionStudentExcel" runat="server" OnClick="lbSectionStudentExcel_Click">كشف Excel</asp:LinkButton>
                                </div>
                                <div class="col-md-12">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="width: 4%; text-align: center">رقم</th>
                                                <th scope="col" style="width: 10%; text-align: center">رقم الطالب</th>
                                                <th scope="col" style="width: 15%; text-align: center">اسم الطالب</th>
                                                <th scope="col" style="width: 15%; text-align: center">نوع الطالب</th>
                                                <th scope="col" style="width: 15%; text-align: center">الكلية</th>
                                                <th scope="col" style="width: 15%; text-align: center">القسم</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                                <ItemTemplate>
                                                    <asp:Label ID="StudentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                        <td style="text-align: center"><a href="Student?id=<%# Eval("ID") %>" target="_blank"><%# Eval("StudentName") %></a></td>
                                                        <td style="text-align: center"><span><%# Eval("StudentType") %></span></td>
                                                        <td style="text-align: center;"><%# Eval("StudentCollege") %></td>
                                                        <td style="text-align: center;"><%# Eval("StudentDepartment") %></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                SelectCommand="GetSectionStudents" SelectCommandType="StoredProcedure">
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
</asp:Content>

