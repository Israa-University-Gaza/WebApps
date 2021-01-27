<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="InstructorAttendance.aspx.cs" Inherits="Academic_InstructorAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#InstructorAttendance').addClass("active open");
            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
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
        <li><a href="#" class="font-ha">دوام محاضري الجامعة</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="col-md-12">

        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>دوام محاضري الجامعة</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">

                <div class="form-group row">
                    <label class="col-md-1 control-label">المحاضر</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control" AutoPostBack="true" placeholder="رقم او اسم المحاضر" OnTextChanged="DataBind_Click"></asp:TextBox>
                    </div>
                    <label class="col-md-2 control-label">التاريخ</label>

                    <div class="col-md-2">
                        <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control date-picker" AutoPostBack="true" OnTextChanged="DataBind_Click" placeholder="من تاريخ"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control date-picker" AutoPostBack="true" OnTextChanged="DataBind_Click" placeholder="حتى تاريخ">></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-1 control-label">الفصل</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlSemesterID" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="DataBind_Click"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                            SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                    <label class="col-md-2 control-label">نوع التعيين</label>

                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlEmploymentTypeID" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="DataBind_Click"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaHumanResource %>"
                            SelectCommand="ddlEmploymentTypes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-1 control-label">الحالة</label>

                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlAttendanceInstructorStatusID" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="DataBind_Click"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaHumanResource %>"
                            SelectCommand="ddlAttendanceInstructorStatuses" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                    <div class="col-md-offset-2 col-md-4">
                        <asp:Button ID="Button1" runat="server" Text="عرض" class="btn green" OnClick="DataBind_Click" />
                    </div>
                </div>

                <%--                <div class="form-group row">

                        <asp:Button ID="btnAttendance" runat="server" Text="طباعة تقرير الحضور" class="btn green" OnClick="btnAttendance_Click" />
                        <asp:Button ID="lbAbsentPDF" runat="server" Text=" كشف المتغيبين" class="btn red" OnClick="lbAbsentPDF_Click" />
                        <asp:Button ID="btnLate" runat="server" Text="كشف المتاخرين" class="btn yellow" OnClick="btnLate_Click" />

                    </div>--%>
                <br />
                <% if (ListView1.Items.Count > 0)
                    { %>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="width: 3%">#</th>
                            <th style="text-align: center; width: 9%">رقم المحاضر</th>
                            <th style="text-align: center; width: 15%">اسم المحاضر</th>
                            <th style="text-align: center; width: 7%">التاريخ </th>
                            <th style="text-align: center; width: 17%">المساق</th>
                            <th style="text-align: center; width: 15%">وقت المحاضرة</th>
                            <th style="text-align: center; width: 15%">حضور المحاضر</th>
                            <th style="text-align: center; width: 6%">ع.س المحاضرة</th>
                            <th style="text-align: center; width: 6%">ع.س الدوام</th>
                            <th style="text-align: center; width: 6%">ع.س المحاضر</th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <tr <%# Eval("IsInstructorLate").ToString()=="1"? "style='color:red;'" : "" %>>
                                    <td><span><%# Eval("RowNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("InstructorNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("InstructorName") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("LectureDate") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>

                                    <td style="text-align: center"><span><%# Eval("LectureFrom") +" - " + Eval("LectureTo")%>  </span></td>
                                    <td style="text-align: center">
                                        <span><%# Eval("IsExist").ToString()=="0" ? "غياب":  Eval("AttendanceFrom") +" - " + Eval("AttendanceTo")%></span>
                                    </td>
                                    <td style="text-align: center"><span><%# Eval("LectureHours") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("AttendanceHours") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("InstructorHours") %></span></td>

                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                            ConnectionString="<%$ ConnectionStrings:IsraaHumanResource %>"
                            SelectCommand="GetInstructorsAttendance" SelectCommandType="StoredProcedure">
                            <SelectParameters>

                                <asp:ControlParameter ControlID="txtEmployeeName" Name="InstructorName" PropertyName="Text" Type="String" DefaultValue="%" />
                                  <asp:ControlParameter ControlID="lblEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int16" />
                                <asp:ControlParameter ControlID="txtDateFrom" Name="LectureDateFrom" PropertyName="Text" Type="String" DefaultValue="1900/01/01" />
                                <asp:ControlParameter ControlID="txtDateTo" Name="LectureDateTo" PropertyName="Text" Type="String" DefaultValue="1900/01/01" />
                                <asp:ControlParameter ControlID="ddlSemesterID" Name="SemesterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                                <asp:ControlParameter ControlID="ddlEmploymentTypeID" Name="EmploymentTypeID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                                <asp:ControlParameter ControlID="ddlAttendanceInstructorStatusID" Name="AttendanceInstructorStatusID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>

                <% }
                    else
                    {%>
                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                    <div class="col-xs-11" style="text-align: center;">
                        <strong>لا يوجد  بيانات للعرض</strong>
                        <div style="clear: both"></div>
                    </div>
                    <button type="button" style="margin-top: 7px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                    <div style="clear: both"></div>
                </div>
                <% } %>
            </div>
        </div>
    </div>

</asp:Content>

