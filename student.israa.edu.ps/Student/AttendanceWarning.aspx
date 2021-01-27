<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="AttendanceWarning.aspx.cs" Inherits="Student_AttendanceWarning" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu13').addClass("active");
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
        <li><a href="#" class="font-ha">إنذارات الحضور والغياب</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إنذارات الحضور والغياب</div>
                </div>
                <div class="portlet-body">
                    <div class="row" style="padding-top: 15px;">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                               { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 50%;">الإنذار</th>
                                        <th style="width: 30%; text-align: center">المساق</th>
                                        <th style="width: 20%; text-align: center">تاريخ الإنذار</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <asp:Label ID="AttendanceWarningID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="WarningTypeID" runat="server" Text='<%# Eval("WarningTypeID") %>' Visible="false"></asp:Label>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="lblAttendanceWarning" runat="server" OnClick="lblAttendanceWarning_Click"><%# Eval("AttendanceWarningType") %></asp:LinkButton>
                                                </td>
                                                <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>"
                                        SelectCommand="GetStudentAttendanceWarning" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <asp:DataPager ID="DataPager2" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                    <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                    <asp:NumericPagerField ButtonType="Link" />
                                    <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                    <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                </Fields>
                            </asp:DataPager>
                            <div class="clearfix"></div>
                            <% }
                               else
                               {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center;">
                                    <strong>لا يوجد إنذارات حضور وغياب علي الطالب</strong>
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
</asp:Content>

