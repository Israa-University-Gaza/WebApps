<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudentInfraction.aspx.cs" Inherits="Student_StudentInfraction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu-5').addClass("active");
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
        <li><a href="StudentIssueShow.aspx" class="font-ha">عرض مخالفات الطالب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <asp:Label ID="lbStudentID" runat="server" Text="Label" Visible="false"></asp:Label>
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض المخالفات
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>

                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 5%;">م</th>
                                <th style="width: 20%; text-align: center;">الفصل الدراسي</th>
                                <th style="width: 15%; text-align: center;">المخالفة</th>
                                <th style="width: 15%; text-align: center;">نوع المخالفة</th>
                                <th style="width: 20%; text-align: center;">تفاصيل المخالفة </th>
                                <th style="width: 20%; text-align: center;">تفاصيل العقوبة</th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <td><%# Eval("RowNo") %></td>
                                        <td style="text-align: center"><%# Eval("SemesterName") %></td>
                                        <td style="text-align: center"><%# Eval("Infraction") %></td>
                                        <td style="text-align: center"><%# Eval("InfractionType") %></td>
                                        <td style="text-align: center"><%# Eval("InfractionDetails") %></td>
                                        <td style="text-align: center"><%# Eval("PenaltyDetails") %></td>

                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetStdInfraction" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>

                    <div class="clearfix"></div>

                    <div class="clearfix"></div>
                    <% } %>
                    <%  else
                        { %>

                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجد مخالفات عليك للعرض  </strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <%  } %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

