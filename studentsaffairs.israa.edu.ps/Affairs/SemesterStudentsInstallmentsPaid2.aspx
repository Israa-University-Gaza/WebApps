<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="SemesterStudentsInstallmentsPaid2.aspx.cs" Inherits="Affairs_SemesterStudentsInstallmentsPaid2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#SemesterStudentsInstallmentsPaid').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">كشف أقساط الطلاب المسددة</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>كشف أقساط الطلاب المسددة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body" style="width: 65%; margin: 0 auto;">
                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 10%; text-align: center">#</th>
                                            <th scope="col" style="width: 20%; text-align: center">رقم الطالب</th>
                                            <th scope="col" style="width: 20%; text-align: center">اسم الطالب</th>
                                            <th scope="col" style="width: 20%; text-align: center">عدد الأقساط</th>
                                            <th scope="col" style="width: 20%; text-align: center">قيمة الأقساط</th>
                                            <th scope="col" style="width: 20%; text-align: center">الرصيد</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="StudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                                    <%--<td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                    <td style="text-align: center">
                                                        <asp:LinkButton ID="lbStudentName" runat="server" OnClick="lbStudentName_Click"><%# Eval("StudentName") %></asp:LinkButton>
                                                    </td>
                                                    <td style="text-align: center"><span><%# Eval("CountOfInstallments") %></span></td>
                                                    <td style="text-align: center">
                                                        <asp:LinkButton ID="lbStudentInstallments" runat="server" OnClick="lbStudentInstallments_Click"><%# Eval("SumOfInstallments") %></asp:LinkButton>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:LinkButton ID="lbBalance" runat="server" OnClick="lbBalance_Click"><%# Eval("Balance") %></asp:LinkButton>
                                                    </td>--%>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetSemesterStudentsInstallments" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter Name="SemesterID" DefaultValue="5" Type="Int32" />
                                                <asp:Parameter Name="IsPaid" DefaultValue="1" Type="Int32" />
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
                                        <strong>لا يوجد أقساط مسددة في هذا الفصل الدراسي</strong>
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

