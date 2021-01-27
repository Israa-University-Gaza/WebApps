<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="SemesterIncomeStatisticsDate.aspx.cs" Inherits="Financial_SemesterIncomeStatisticsDate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

     <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#DateIncomeStatistics').addClass("active open");

            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
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
        <li><a href="#" class="font-ha">إحصائيات الواردات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
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
                                <label class="col-md-2 control-label">من تاريخ</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">الى تاريخ</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnFilter" runat="server" Text="بحث" class="btn green" OnClick="btnFilter_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إحصائيات الإيرادات</div>
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
                                            <th scope="col" style="width: 70%; text-align: center">البيان</th>
                                            <th scope="col" style="width: 30%; text-align: center">الإجمالي بالدينار</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><span><%# Eval("ActionArName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("SumOfAmount") %></span></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetDateIncomeStatistics" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txtDateFrom" PropertyName="Text" Name="DateFrom" Type="String" />
                                                <asp:ControlParameter ControlID="txtDateTo" PropertyName="Text" Name="DateTo" Type="String" />
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
                                        <strong>لا يوجد احصائيات كتب في هذا الفصل الدراسي</strong>
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
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إحصائيات الإرجاعات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body" style="width: 65%; margin: 0 auto;">
                            <div class="row table-responsive">
                                <% if (ListView2.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 70%; text-align: center">البيان</th>
                                            <th scope="col" style="width: 30%; text-align: center">الإجمالي بالدينار</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><span><%# Eval("ActionArName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("SumOfAmount") %></span></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetDateReturnStatistics" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txtDateFrom" PropertyName="Text" Name="DateFrom" Type="String" />
                                                <asp:ControlParameter ControlID="txtDateTo" PropertyName="Text" Name="DateTo" Type="String" />
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
                                        <strong>لا يوجد احصائيات كتب في هذا الفصل الدراسي</strong>
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
