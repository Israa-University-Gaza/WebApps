<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="StudentInstallmentNotPaid.aspx.cs" Inherits="Financial_StudentInstallmentNotPaid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentInstallmentNotPaid').addClass("active open");

            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">كشف الأقساط المستحقة</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>كشف الأقساط المستحقة</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <label class="col-md-1 control-label">من تاريخ</label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control date-picker" Text="2016/02/15"></asp:TextBox>
                        </div>
                        <label class="col-md-1 control-label">الى تاريخ</label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control date-picker" Text="2016/06/15"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnFilter" runat="server" Text="بحث" class="btn green" OnClick="btnFilter_Click" />
                        </div>
                        <div class="col-md-offset-2 col-md-2" style="font-size:18px; text-align:center;">
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <span>إجمالي الأقساط المستحقة :</span><br />
                                    <strong><%# Convert.ToDecimal(Eval("SumOfInstallments")).ToString("#,##0.00") %></strong>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                SelectCommand="GetStudentInstallmentNotPaidTotal" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtDateFrom" PropertyName="Text" Name="DateFrom" Type="String" />
                                    <asp:ControlParameter ControlID="txtDateTo" PropertyName="Text" Name="DateTo" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <hr />
                    <br />
                    <% if (Repeater1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 5%; text-align: center">#</th>
                                <th style="width: 15%; text-align: center">رقم الطالب</th>
                                <th style="width: 20%; text-align: center">اسم الطالب</th>
                                <th style="width: 10%; text-align: center">رقم الهاتف</th>
                                <th style="width: 10%; text-align: center">الرصيد</th>
                                <th style="width: 10%; text-align: center">القسط</th>
                                <th style="width: 10%; text-align: center">قيمة القسط</th>
                                <th style="width: 10%; text-align: center">تاريخ الإستحقاق</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Mobile") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Balance") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("InstallmentName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("InstallmentValue") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("RepayDate", "{0:yyyy/MM/dd}") %></span></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                SelectCommand="GetStudentInstallmentNotPaid" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtDateFrom" PropertyName="Text" Name="DateFrom" Type="String" />
                                    <asp:ControlParameter ControlID="txtDateTo" PropertyName="Text" Name="DateTo" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <% }
                        else
                        {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجد أقساط غير مسددة خلال الفترة المحددة</strong>
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
</asp:Content>

