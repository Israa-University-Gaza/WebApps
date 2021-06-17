﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="AccountFinancialProfile.aspx.cs" Inherits="Financial_AccountFinancialProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Students').addClass("active open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ChangePassword.aspx" class="font-ha">الطالب
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblAccountID" runat="server" Visible="false"></asp:Label>

    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="row">
                        <ContentTemplate>
                            <div class="col-md-12">
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                    <ProgressTemplate>
                                        <div class="divWaiting">
                                            <div class="alert alert-warning loading">
                                                <span class="glyphicon glyphicon-refresh glyphicon-spin"></span>
                                                <strong>جاري جلب البيانات ...</strong>
                                            </div>
                                        </div>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center; width: 15%">الفصل الدراسي</th>
                                            <th style="text-align: center; width: 10%">مدين</th>
                                            <th style="text-align: center; width: 10%">دائن</th>
                                            <th style="text-align: center; width: 15%">الرصيد</th>
                                            <th style="text-align: center; width: 30%">البيان</th>
                                            <th style="text-align: center; width: 20%">التاريخ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="text-align: center;"><%# Eval("SemesterCode") %></td>
                                                    <td style="text-align: center;"><%# Eval("Amount1") %></td>
                                                    <td style="text-align: center;"><%# Eval("Amount2") %></td>
                                                    <td style="text-align: center;"><%# Eval("Balance") %></td>
                                                    <td style="text-align: center;"><%# Eval("ActionArName") %></td>
                                                    <td style="text-align: center;"><%# Eval("InsertDate","{0:yyyy/MM/dd HH:mm tt}") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetStdTransaction" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="100" PagedControlID="ListView1" class="pager">
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
                                    <div class="col-xs-11" style="text-align: center">
                                        <strong>لا يوجد بيانات مالية</strong>
                                        <div style="clear: both"></div>
                                    </div>
                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                    <div style="clear: both"></div>
                                </div>
                                <% } %>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

