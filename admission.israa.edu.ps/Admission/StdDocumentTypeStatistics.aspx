<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StdDocumentTypeStatistics.aspx.cs" Inherits="Admission_StdDocumentTypeStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" type="text/css" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/clockface.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Statistics').addClass("active open");
            $('#StdDocumentTypeStatistics a').css("background-color", "#575757");
            $('#Statistics a span.arrow').addClass("open");
            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
            $('.clockface_1').clockface();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Infraction.aspx" class="font-ha">احصائية أعداد مستندات الطلبة
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>احصائية أعداد مستندات الطلبة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">

                    <div class="form-group row">
                    </div>
                    <div class="form-group row">
                        <label class="col-md-1 control-label">المستند :</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlStdDocumentType" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlStdDocumentTypes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                        <label class="control-label col-md-1">التاريخ : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control date-picker text-center " placeholder="من تاريخ" OnTextChanged="DataBind_Click"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control date-picker text-center" placeholder="الى تاريخ" OnTextChanged="DataBind_Click"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="Button1" runat="server" Text="بحث" class="btn blue" OnClick="DataBind_Click" />
                        </div>
                    </div>
                    <div class="form-group row">
                    </div>
                    <div class="table table-hover table-bordered">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-hover">
                            <thead>
                                <tr style="border-top: 1px solid #ddd!important; background-color: #eee !important">
                                    <th style="width: 80%; border-top: none!important; font-size: 15px;">البيان</th>
                                    <th style="text-align: center; width: 20%; border-top: none!important; font-size: 15px;">العدد</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <tr>
                                            <td><span><%# Eval("ActionName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("ActionNum") %></span></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetStdDocumentTypeStatistics" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlStdDocumentType" PropertyName="SelectedValue" Name="ActionID" Type="Int32" DefaultValue="-1" />
                                        <asp:ControlParameter ControlID="txtDateFrom" PropertyName="Text" Name="DateFrom" Type="String" DefaultValue="1900/01/01"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="txtDateTo" PropertyName="Text" Name="DateTo" Type="String" DefaultValue="1900/01/01"></asp:ControlParameter>
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
                                <strong>لا يوجد بيانات للعرض</strong>
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

