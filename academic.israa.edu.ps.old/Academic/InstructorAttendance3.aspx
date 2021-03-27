<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="InstructorAttendance3.aspx.cs" Inherits="Academic_InstructorAttendance3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />


    <script type="text/javascript" src="../assets/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/clockface.js"></script>
    <script type="text/javascript" src="../assets/datepicker/moment.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-datetimepicker.min.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script src="../assets/datepicker/quick-sidebar.js" type="text/javascript"></script>
    <script src="../assets/datepicker/demo.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js"></script>
    <script>
        jQuery(document).ready(function () {
            QuickSidebar.init(); // init quick sidebar
            Demo.init(); // init demo features
            ComponentsPickers.init();
        });
    </script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#InstructorAttendance').addClass("active open");
            $('#InstructorAttendance_2 a').css("background-color", "#575757");
            $('#InstructorAttendance a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">دوام المحاضر</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>دوام المحاضر </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>
            </div>
        </div>
        <div class="portlet-body">

            <div class="form-group row">
                <div class="form-group">
                    <label class="col-md-2 control-label" style="text-align: right">الفصل الدراسي </label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlSemester" runat="server" DataSourceID="SqlDataSource1" DataTextField="ArName" AutoPostBack="true" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT ID,[ArName] FROM [Semester] where IsDelete=0  and IsActive=1 and ID<>1 order by ID desc"></asp:SqlDataSource>
                    </div>
                    <label class="col-md-2 control-label">اسم الموظف </label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlEmployee" CssClass="select2_category form-control"  runat="server" DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="EmployeeID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetSemesterCollegeEmployees" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                </div>
            </div>

            
                <div class="form-group row">
                    <label class="col-md-2 control-label">من تاريخ </label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa fa-calendar"></i>
                            <asp:TextBox ID="DateFrom" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>
                    <label class="col-md-2 control-label">الى تاريخ </label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa fa-calendar"></i>
                            <asp:TextBox ID="DateTo" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>

                </div>
             <div class="row">
                        <div class="col-md-offset-2 col-md-3">
                            <asp:Button ID="btnView" runat="server" Text="عرض" class="btn green" OnClick="btnView_Click" />
                                                <asp:Button ID="btnLate" runat="server" Text="طباعة كشف التاخير" CssClass="btn blue" OnClick="btnLate_Click" />

                        </div>
                    </div>
        </div>
        <div class="portlet-body">
          <br />
            <br />
                <% if (ListView1.Items.Count > 0)
                        { %>
            <table class="table table-striped">
                <thead>
                    <tr>


                        <th style="width: 23%">اسم الموظف</th>
                        <th style="width: 8%">التاريخ </th>
                        <th style="width: 8%"> الحضور</th>
                        <th style="width: 8%"> الانصراف</th>
                        <th style="width: 17%">اسم المساق</th>
                        <th style="width: 5%">القاعة</th>
                        <th style="width: 14%">موعد المحاضرة</th>
                        <th style="width: 5%">ع.س المحاضرة</th>
                        <th style="width: 8%">ع.س دوام المحاضر</th>
                        <th style="width: 9%">ع. س </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>

                            <tr <%# Eval("IsLate").ToString()=="True"? "style='color:red;'" : "" %>>
                                <asp:Label ID="Date" runat="server" Text='<%# Eval("Date") %>' Visible="false"></asp:Label>

                                <td><%# Eval("EmployeeNo")%>  <%#Eval("DisplayName") %> </td>
                                <td><%# Eval("Date") %> </td>
                                <td><%# Eval("Attendance_From") %></td>
                                <td><%# Eval("Attendance_To") %></td>
                                <td><%# Eval("CourseArName") %></td>
                                <td><%# Eval("Room") %></td>
                                <td><%# Eval("LectureTime") %></td>
                                <td><%# Eval("lectureHours") %></td>
                                <td><%# Eval("InstructorLectureAttendanceHours") %></td>
                                <td><%# Eval("GetInstructorLectureCalculatedHour") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>


                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                        SelectCommand="GetInstructorAttendance3" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DateFrom" Name="DateFrom" PropertyName="Text" Type="string" />
                            <asp:ControlParameter ControlID="DateTo" Name="DateTo" PropertyName="Text" Type="string" />
                            <asp:ControlParameter ControlID="ddlEmployee" Name="EmployeeID" PropertyName="SelectedValue" Type="Int16" />
                            <asp:ControlParameter ControlID="ddlSemester" Name="SemesterID" PropertyName="SelectedValue" Type="string" DefaultValue="5" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </tbody>
            </table>
                <% } %>
                    <%  else
                        { %>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجد بيانات للعرض  </strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <%  } %>
        </div>
    </div>

</asp:Content>

