<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeStatistics.aspx.cs" Inherits="APP_HRM_EmployeeStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        th, td {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إحصائية الموظفين</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        <asp:Button ID="btnPrint" runat="server" Text="طباعة" CssClass="btn blue" OnClick="btnPrint_Click" />
                    </div>

                    <div style="overflow-x: scroll">
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th>نوع التعين</th>
                                    <th colspan="4">عقد</th>
                                    <th rowspan="2">عقد فصلي</th>
                                    <th colspan="3">نظام الساعة</th>
                                    <th colspan="4">متطوع</th>
                                    <th rowspan="2">العيادة الطبية</th>
                                    <th rowspan="2">وزارة العمل</th>
                                    <th rowspan="2">تدريب</th>
                                    <th colspan="3">نوع الموظف</th>
                                    <th rowspan="2">الإجمالي</th>
                                </tr>
                                <tr>
                                    <th>حالة العمل</th>
                                    <th>أكاديمي</th>
                                    <th>أكاديمي اداري</th>
                                    <th>اداري</th>
                                    <th>الكل</th>

                                    <th>عقد</th>
                                    <th>تطوع</th>
                                    <th>الكل</th>

                                    <th>أكاديمي</th>
                                    <th>أكاديمي اداري</th>
                                    <th>اداري</th>
                                    <th>الكل</th>

                                    <th>أكاديمي</th>
                                    <th>أكاديمي اداري</th>
                                    <th>اداري</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <tr>

                                            <td><%# Eval("EmployeeStatus") %></td>
                                            <td><%# Eval("x11") %></td>
                                            <td><%# Eval("x12") %></td>
                                            <td><%# Eval("x13") %></td>
                                            <td><%# Eval("x14") %></td>
                                            
                                            <td><%# Eval("x2222") %></td>

                                            <td><%# Eval("x21") %></td>
                                            <td><%# Eval("x22") %></td>
                                            <td><%# Eval("x23") %></td>

                                            <td><%# Eval("x31") %></td>
                                            <td><%# Eval("x32") %></td>
                                            <td><%# Eval("x33") %></td>
                                            <td><%# Eval("x34") %></td>

                                            <td><%# Eval("x4") %></td>
                                            <td><%# Eval("x5") %></td>
                                            <td><%# Eval("x6") %></td>
                                            <td><%# Eval("x7") %></td>

                                            <td><%# Eval("x8") %></td>
                                            <td><%# Eval("x9") %></td>
                                            <td><%# Eval("x10") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="GetEmployeeStatisticsData" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                <tr>
                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <tr style="color: black; font-weight: bold; font-size: 10pt">

                                                <td>الاجمالي</td>
                                                <td><%# Eval("T11") %></td>
                                                <td><%# Eval("T12") %></td>
                                                <td><%# Eval("T13") %></td>
                                                <td><%# Eval("T14") %></td>

                                                <td><%# Eval("T2222") %></td>

                                                <td><%# Eval("T21") %></td>
                                                <td><%# Eval("T22") %></td>
                                                <td><%# Eval("T23") %></td>

                                                <td><%# Eval("T31") %></td>
                                                <td><%# Eval("T32") %></td>
                                                <td><%# Eval("T33") %></td>
                                                <td><%# Eval("T34") %></td>

                                                <td><%# Eval("T4") %></td>
                                                <td><%# Eval("T5") %></td>
                                                <td><%# Eval("T6") %></td>
                                                <td><%# Eval("T7") %></td>

                                                <td><%# Eval("T8") %></td>
                                                <td><%# Eval("T9") %></td>
                                                <td><%# Eval("T10") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tr>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="GetEmployeeTotalStatisticsData" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

