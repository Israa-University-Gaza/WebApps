﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StudentScholarshipLoanInstallment.aspx.cs" Inherits="Academic_StudentScholarshipLoanInstallment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentScholarshipAccreditation').addClass("active open");
            $('#StudentScholarshipAccreditation_5 a').css("background-color", "#575757");
            $('#StudentScholarshipAccreditation a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>صندوق الإقراض</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>صندوق الإقراض</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">

                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center">
                                        <span>إجمالي المبلغ بالدينار :</span> <strong><%# Eval("TotalValue") %></strong>
                                        <div style="clear: both"></div>
                                    </div>
                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                    <div style="clear: both"></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                            SelectCommand="GetStudentScholarshipLoanInstallmentTotal" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr><th style="text-align: center; width: 3%; padding: 8px 0px;">#</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">رقم الطالب</th>
                                    <th style="text-align: center; width: 17%; padding: 8px 0px;">اسم الطالب</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">القيمة</th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <tr>
                                            <td style="text-align: center;"><%# Eval("RowNo") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentNo") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentName") %></td>
                                            <td style="text-align: center;"><%# Eval("ActionValue") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                    SelectCommand="GetStudentScholarshipLoanInstallment" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </tbody>
                        </table>
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="100" PagedControlID="ListView1" class="pager">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
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
                                <strong>لا يوجد بيانات في صندوق الإقراض</strong>
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
</asp:Content>