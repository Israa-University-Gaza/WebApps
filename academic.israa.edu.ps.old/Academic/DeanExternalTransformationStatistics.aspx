﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="DeanExternalTransformationStatistics.aspx.cs" Inherits="Academic_DeanExternalTransformationStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        thead tr:last-child {
            background-color: #eee !important;
        }
    </style>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicExternalTransformationStatistics').addClass("active open");
            $('#AcademicExternalTransformationStatistics_1 a').css("background-color", "#575757");
            $('#AcademicExternalTransformationStatistics a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إحصائيات المساقات المعادلة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <asp:Label ID="DepartmentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <div class="portlet box blue">
                                    <div class="portlet-title">
                                        <div class="caption"><i class="fa fa-cogs"></i><%# Eval("ArName") %></div>
                                        <div class="tools">
                                            <a class="collapse" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <table class="table table-hover table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="2" style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">ذكور</th>
                                                        </tr>
                                                        <tr style="border-top: 1px solid #ddd!important">
                                                            <th style="text-align: center; width: 15%; border-top: none!important; font-size: 12px;">الكود</th>
                                                            <th style="text-align: center; width: 55%; border-top: none!important; font-size: 12px;">المساق</th>
                                                            <th style="text-align: center; width: 30%; border-top: none!important; font-size: 12px;">عدد الطلاب</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="Repeater11" runat="server" DataSourceID="SqlDataSource11">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td style="text-align: center"><span><%# Eval("Coursecode") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CountOfStudents") %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetDepartmentExternalTransformationStatistic" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DepartmentID" Name="DepartmentID" PropertyName="Text" Type="Int32" />
                                                                <asp:Parameter Name="Gender" DefaultValue="1" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-4">
                                                <table class="table  table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="2" style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">إناث</th>
                                                        </tr>
                                                        <tr style="border-top: 1px solid #ddd!important">
                                                            <th style="text-align: center; width: 15%; border-top: none!important; font-size: 12px;">الكود</th>
                                                            <th style="text-align: center; width: 55%; border-top: none!important; font-size: 12px;">المساق</th>
                                                            <th style="text-align: center; width: 30%; border-top: none!important; font-size: 12px;">عدد الطالبات</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="Repeater12" runat="server" DataSourceID="SqlDataSource12">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CountOfStudents") %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:SqlDataSource ID="SqlDataSource12" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetDepartmentExternalTransformationStatistic" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DepartmentID" Name="DepartmentID" PropertyName="Text" Type="Int32" />
                                                                <asp:Parameter Name="Gender" DefaultValue="2" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-4">
                                                <table class="table  table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="2" style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">المجموع</th>
                                                        </tr>
                                                        <tr style="border-top: 1px solid #ddd!important">
                                                            <th style="text-align: center; width: 15%; border-top: none!important; font-size: 12px;">الكود</th>
                                                            <th style="text-align: center; width: 55%; border-top: none!important; font-size: 12px;">المساق</th>
                                                            <th style="text-align: center; width: 30%; border-top: none!important; font-size: 12px;">عدد الطلاب</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="Repeater13" runat="server" DataSourceID="SqlDataSource13">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CountOfStudents") %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:SqlDataSource ID="SqlDataSource13" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetDepartmentExternalTransformationStatistic" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DepartmentID" Name="DepartmentID" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:isra %>"
                            SelectCommand="GetDepartmentByDean" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
