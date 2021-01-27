﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudentCourseSyllabus.aspx.cs" Inherits="Student_StudentCourseSyllabus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#StudentCourseSyllabus').addClass("active");
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
        <li><a href="#" class="font-ha">توصيف المساقات</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>توصيف المساقات</div>
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

                    </div>
                    <br />
                    <div class="row" style="padding-top: 15px;">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 10%; text-align: center; font-size: 11px">رقم المساق</th>
                                    <th style="width: 20%; text-align: center; font-size: 11px">المساق</th>
                                    <th style="width: 30%; text-align: center; font-size: 11px">مدرس المساق</th>
                                    <th style="width: 40%; text-align: center; font-size: 11px">توصيف المساق</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="SyllabusID" runat="server" Text='<%# Eval("SyllabusID") %>' Visible="false"></asp:Label>
                                            <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Employee") %></span></td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbPrint" runat="server" class="btn default btn-xs blue" Visible='<%# Eval("SyllabusID")!= DBNull.Value%> ' OnClick="lbPrint_Click"></i> طباعة الوصف</asp:LinkButton></td>
                                          
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStdCourseSyllabus" SelectCommandType="StoredProcedure">
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
                                <strong>لم يتم توصيف مساقات لهذا الفصل الدراسي</strong>
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
