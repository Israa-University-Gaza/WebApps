<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="TeacherStudyTable.aspx.cs" Inherits="Academic_TeacherStudyTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudyTable').addClass("active open");
            $('#StudyTable_7 a').css("background-color", "#575757");
            $('#StudyTable a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">المحاضر</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>جدول المحاضر الفصلي</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="TeacherStudyTable.aspx">جدول المحاضر الفصلي</a></li>
                <li class="font-ha"><a href="DeanSectionEmployee.aspx">تنسيب المحاضرين للشعب</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
                <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>

            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>جدول المحاضر الفصلي</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-4" style="padding: 12px;">
                                    <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="EmployeeID" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlCollegeInstructors" SelectCommandType="StoredProcedure">
                                          <SelectParameters>
                                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                <asp:Parameter DefaultValue="15" Name="SemesterID" Type="Int32" />
                                            </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <%--<asp:Panel id="divPTEmployee" runat="server" visible="false" class="col-md-4" style="padding: 12px;">
                                    <asp:DropDownList ID="ddlPTEmployee" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetPTEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </asp:Panel>--%>
                                <% if (Repeater7.Items.Count > 0)
                                    { %>
                                <div class="col-md-4" style="padding: 12px; text-align: left; vertical-align: middle;">
                                    <asp:LinkButton ID="lbStudyTablePDF" runat="server" OnClick="lbStudyTablePDF_Click">تصدير الجدول الى pdf</asp:LinkButton>
                                </div>
                                <% } %>
                            </div>
                            <div class="row" style="padding-top: 15px;">
                                <% if (Repeater7.Items.Count > 0)
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
                                        <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource3">
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
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetTeacherStudyTable" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlEmployee" PropertyName="SelectedValue" Name="EmployeeID" Type="Int32" />
                                                <asp:Parameter DefaultValue="16" Name="SemesterID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                        <% if (ddlEmployee.SelectedIndex > 0)
                                            { %>
                                        <strong>لا يوجد مساقات للمحاضر التي تم إختياره</strong>
                                        <% }
                                            else
                                            { %>
                                        <strong>إختر المحاضر لعرض جدوله الدراسي</strong>
                                        <% } %>
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
</asp:Content>

