<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudyTable.aspx.cs" Inherits="Student_StudyTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu6').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">نشاطات عامة</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الجدول الدراسي</div>
                </div>
                <div class="portlet-body">
                    <% if (Repeater8.Items.Count > 0)
                       { %>
                    <div class="row">
                        <div class="col-md-8" style="padding: 12px;">
                            <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource7">
                                <ItemTemplate>
                                    <span style="font-size: 14px;"><%# Eval("ArName") %></span>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetStdSemesterName" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-md-4" style="padding: 12px; text-align: left; vertical-align: middle;">
                          <%--  <asp:LinkButton ID="lbStudyTablePDF" runat="server" OnClick="lbStudyTablePDF_Click">تصدير الجدول الى pdf</asp:LinkButton>--%>
                        </div>
                    </div>
                    <br />
                    <div class="row" style="padding-top: 15px;">
                        <% if (Repeater7.Items.Count > 0)
                           { %>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 8%; text-align: center; font-size: 11px">رقم المساق</th>
                                    <th style="width: 15%; text-align: center; font-size: 11px">المساق</th>
                                    <th style="width: 10%; text-align: center; font-size: 11px">مدرس المساق</th>
                                    <th style="width: 3%; text-align: center; font-size: 11px">شعبة</th>
                                    <th style="width: 4%; text-align: center; font-size: 11px">قاعة</th>
                                    <th style="width: 10%; text-align: center; font-size: 11px">السبت</th>
                                    <th style="width: 10%; text-align: center; font-size: 11px">الأحد</th>
                                    <th style="width: 10%; text-align: center; font-size: 11px">الإثنين</th>
                                    <th style="width: 10%; text-align: center; font-size: 11px">الثلاثاء</th>
                                    <th style="width: 10%; text-align: center; font-size: 11px">الأربعاء</th>
                                    <th style="width: 10%; text-align: center; font-size: 11px">الخميس</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <tr>
                                            <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Employee") %></span></td>
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
                                    SelectCommand="GetStdStudyTable" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
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
                       { %>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center;">
                            <strong>لم يتم تسجيل ساعات دراسية</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
</asp:Content>
