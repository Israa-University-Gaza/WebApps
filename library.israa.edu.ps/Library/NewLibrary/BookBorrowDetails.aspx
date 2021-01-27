<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="BookBorrowDetails.aspx.cs" Inherits="NewLibrary_BookBorrowDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/css/pages/profile-rtl.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/custom-rtl.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library2 a').css("background-color", "#575757");
            $('#new-library a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-book"></i>
        <a href="BookBorrowDetails.aspx" class="font-ha">تفاصيل استعارة كتاب</a>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="row">
        <asp:Label ID="lblContainerID" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lblBookID" runat="server" Text="" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>تفاصيل استعارة كتاب -
                    <asp:Label ID="lblBookTitle" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">

                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">عنوان الموضوع</label>
                        <div class="col-md-4">
                            <asp:Label ID="lblContainerTitle" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                        <label class="col-md-2 control-label isra-text-aling-right">الرقم العام</label>
                        <div class="col-md-4">
                            <asp:Label ID="lblContainerNo" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">رقم نسخة الكتاب</label>
                        <div class="col-md-4">
                            <asp:Label ID="lblBookNo" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                        <label class="col-md-2 control-label isra-text-aling-right">عنوان الكتاب</label>
                        <div class="col-md-4">
                            <asp:Label ID="lblBookTitle1" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">من تاريخ </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDateFrom" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker"></asp:TextBox>
                        </div>
                        <label class="col-md-2 control-label isra-text-aling-right">الى تاريخ</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDateTo" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker"></asp:TextBox>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right"></label>
                        <div class="col-md-10">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn green" OnClick="btnSearch_Click" />
                            <asp:Button ID="btnPDF" runat="server" Text="طباعة كشف معاملة الكتاب" CssClass="btn blue" OnClick="btnPDF_Click" />
                        </div>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 10%">رقم </th>
                                <th style="text-align: center; width: 20%;">رقم المستعير</th>
                                <th style="text-align: center; width: 30%;">اسم المستعير</th>
                                <th style="text-align: center; width: 20%;">تاريخ الاستعارة </th>
                                <th style="text-align: center; width: 20%;">تاريخ الارجاع</th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <td><span><%# Eval("RowNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("ClientNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("ClientName") %></span></td>
                                    <td style="text-align: center"><%# Eval("BorrowDate","{0:yyyy/MM/dd}") %></td>
                                    <td style="text-align: center"><%# Eval("ReturnDate","{0:yyyy/MM/dd}") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="GetBookBorrow" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblBookID" PropertyName="Text" Name="BookID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtDateFrom" PropertyName="Text" DbType="Date" Name="DateFrom" DefaultValue="1900/01/01"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtDateTo" PropertyName="Text" DbType="Date" Name="DateTo" DefaultValue="1900/01/01"></asp:ControlParameter>
                                </SelectParameters>
                                <SelectParameters>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>

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
                        <div class="col-xs-11" style="text-align: center;">
                            <strong>لا توجد حركات اعارة للكتاب </strong>
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

