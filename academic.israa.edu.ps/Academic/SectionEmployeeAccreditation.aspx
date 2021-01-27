<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="SectionEmployeeAccreditation.aspx.cs" Inherits="Academic_SectionEmployeeAccreditation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#SectionEmployeeAccreditation').addClass("active open");
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
                <span>إعتماد جدول المحاضر الأسبوعي</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إعتماد جدول المحاضر الأسبوعي</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <% if (ListView1.Items.Count > 0)
                           { %>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th style="text-align: center; width: 3%; padding: 8px;">#</th>
                                    <th style="text-align: center; width: 7%; padding: 8px 0px;">رقم المحاضر</th>
                                    <th style="text-align: center; width: 15%; padding: 8px 0px;">اسم المحاضر</th>
                                    <th style="text-align: center; width: 14%; padding: 8px 0px;">القسم</th>
                                    <th style="text-align: center; width: 12%; padding: 8px 0px;">ساعات نظري معتمدة</th>
                                    <th style="text-align: center; width: 12%; padding: 8px 0px;">ساعات مناقشة معتمدة</th>
                                    <th style="text-align: center; width: 12%; padding: 8px 0px;">ساعات عملي معتمدة</th>
                                    <th style="text-align: center; width: 14%; padding: 8px 0px;">مجموع الساعات المعتمدة</th>
                                    <th style="text-align: center; width: 6%; padding: 8px 0px;"></th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="EmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="PTEmployeeID" runat="server" Text='<%# Eval("PTEmployeeID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td style="text-align: center;"><%# Eval("RowNo") %></td>
                                            <td style="text-align: center;"><%# Eval("EmployeeNo") %></td>
                                            <td style="text-align: center;"><%# Eval("EmployeeName") %></td>
                                            <td style="text-align: center;"><%# Eval("DepartmentName") %></td>
                                            <td style="text-align: center;"><%# Eval("SumOfHours1") %></td>
                                            <td style="text-align: center;"><%# Eval("SumOfHours2") %></td>
                                            <td style="text-align: center;"><%# Eval("SumOfHours3") %></td>
                                            <td style="text-align: center;"><%# double.Parse(Eval("SumOfHours1").ToString()) + double.Parse(Eval("SumOfHours2").ToString()) + double.Parse(Eval("SumOfHours3").ToString())   %></td>
                                            <td style="text-align: center;">
                                                <asp:LinkButton ID="lbStudyTablePdf" runat="server" class="btn blue btn-xs black" OnClick="lbStudyTablePdf_Click">pdf</asp:LinkButton>
                                                <asp:LinkButton ID="lbAccrediteTeacherStudyTable" runat="server" class="btn default btn-xs green" OnClick="lbAccrediteTeacherStudyTable_Click" Visible='<%# (Eval("Accreditation").ToString() == "0") %>'><i title="اعتماد جدول المحاضر" class="fa  fa-check-square-o"></i></a></asp:LinkButton>
                                                <asp:Label runat="server" Text="تم إعتماد جدول المحاضر" Visible='<%# (Eval("Accreditation").ToString() == "1") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetUnaccrediteTeacherStudyTable" SelectCommandType="StoredProcedure">
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
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
                                <strong>لا يوجد جداول محاضرين للإعتماد</strong>
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
