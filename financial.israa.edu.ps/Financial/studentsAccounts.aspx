<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="studentsAccounts.aspx.cs" Inherits="Financial_studentsAccounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#SemesterIncomeStatistics').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">تقرير صندوق الطالب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الفصل الدراسي</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body" style="width: 65%; margin: 0 auto;">
                            <div class="form-group row">
                                <label class="col-md-2 control-label">نوع الصندوق</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlAccount" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="AccountName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                        SelectCommand="Select * From Account Where isActive=1 and IsDelete=0"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>صندوق الطالب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body" style="width: 65%; margin: 0 auto;">
                            <div class="row text-left">
                            <asp:LinkButton ID="btnExportToExcel" OnClick="btnExportToExcel_Click" runat="server">تصدير إلى إكسل</asp:LinkButton>
                            </div> 
                            <div class="row table-responsive">

                            <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 70%; text-align: center">إسم الطالب</th>
                                            <th scope="col" style="width: 30%; text-align: center">المبلغ</th>
                                            <th scope="col" style="width: 30%; text-align: center">تاريخ الإضافة</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><span><%# Eval("fullname") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("Amount") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("InsertDate") %></span></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetAccountTransactions" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlAccount" PropertyName="SelectedValue" Name="AccountID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>

                                <asp:DataPager ID="DataPager1" runat="server" PageSize="30" PagedControlID="ListView1" class="pager">
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
                                        <strong>لا يوجد بيانات</strong>
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

