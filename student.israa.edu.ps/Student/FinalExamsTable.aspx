<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="FinalExamsTable.aspx.cs" Inherits="Student_FinalExamsTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#FinalExamsTable').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">جدول الإمتحانات النهائية</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>جدول الإمتحانات النهائية</div>
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
                        <% if (Repeater3.Items.Count > 0)
                           { %>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 15%">كود المساق</th>
                                    <th style="width: 20%; text-align: center">المساق</th>
                                    <th style="width: 15%; text-align: center">رقم الشعبة</th>
                                    <th style="width: 15%; text-align: center">تاريخ الإمتحان</th>
                                    <th style="width: 20%; text-align: center">نوقيت الإمتحان</th>
                                    <th style="width: 15%; text-align: center">قاعة الإمتحان</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <tr>
                                            <td><span><%# Eval("CourseCode") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("ArNameCourse") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("ExamDate") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("ExamTime") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("ExamRoom") %></span></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStdFinalExamsTable" SelectCommandType="StoredProcedure">
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
