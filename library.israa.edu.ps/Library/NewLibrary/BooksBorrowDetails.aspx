<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="BooksBorrowDetails.aspx.cs" Inherits="Library_NewLibrary_BooksBorrowDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/css/pages/profile-rtl.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/custom-rtl.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library8 a').css("background-color", "#575757");
            $('#new-library a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-book"></i>
        <a href="BooksBorrowDetails.aspx" class="font-ha">الكتب المستعارة</a>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <asp:Label ID="lblBookID" runat="server" Text="" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الكتب المستعارة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">من تاريخ </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtBorrowDateFrom" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker"></asp:TextBox>
                        </div>
                        <label class="col-md-2 control-label isra-text-aling-right">الى تاريخ</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtBorrowDateTo" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">من تاريخ </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtReturnDateFrom" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker"></asp:TextBox>
                        </div>
                        <label class="col-md-2 control-label isra-text-aling-right">الى تاريخ</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtReturnDateTo" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label">حالة الإستعارة</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlBorrowStatus" runat="server" CssClass="form-control">
                                <asp:ListItem Value="-1" Text="جميع الحالات"></asp:ListItem>
                                <asp:ListItem Value="1" Text="مرجع"></asp:ListItem>
                                <asp:ListItem Value="3" Text="مرجع بدون تأخير"></asp:ListItem>
                                <asp:ListItem Value="4" Text="مرجع بتأخير"></asp:ListItem>
                                <asp:ListItem Value="2" Text="غير مرجع"></asp:ListItem>
                                <asp:ListItem Value="5" Text="غير مرجع وغير متأخر"></asp:ListItem>
                                <asp:ListItem Value="6" Text="غير مرجع ومتأخر"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right"></label>
                        <div class="col-md-10">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn green" OnClick="btnSearch_Click" />
                            <asp:Button ID="btnPDF" runat="server" Text="طباعة كشف اعارة الكتب" CssClass="btn blue" OnClick="btnPDF_Click" />
                        </div>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 5%">رقم </th>
                                <th style="text-align: center; width: 15%;">رقم الكتاب </th>
                                <th style="text-align: center; width: 15%;">اسم الكتاب </th>
                                <th style="text-align: center; width: 15%;">رقم المستعير</th>
                                <th style="text-align: center; width: 20%;">اسم المستعير</th>
                                <th style="text-align: center; width: 15%;">تاريخ الاستعارة </th>
                                <th style="text-align: center; width: 15%;">تاريخ الارجاع</th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <td><span><%# Eval("RowNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("BookNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("BookTitle") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("ClientNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("ClientName") %></span></td>
                                    <td style="text-align: center"><%# Eval("BorrowDate","{0:yyyy/MM/dd}") %></td>
                                    <td style="text-align: center"><%# Eval("ReturnDate","{0:yyyy/MM/dd}") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="GetBookBorrow" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtBorrowDateFrom" PropertyName="Text" DbType="Date" Name="BorrowDateFrom" DefaultValue="1900/01/01"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtBorrowDateTo" PropertyName="Text" DbType="Date" Name="BorrowDateTo" DefaultValue="1900/01/01"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtReturnDateFrom" PropertyName="Text" DbType="Date" Name="ReturnDateFrom" DefaultValue="1900/01/01"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtReturnDateTo" PropertyName="Text" DbType="Date" Name="ReturnDateTo" DefaultValue="1900/01/01"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlBorrowStatus" PropertyName="SelectedValue" Name="BorrowStatusID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                                <SelectParameters>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>

                    <asp:DataPager ID="DataPager1" runat="server" PageSize="50" PagedControlID="ListView1" class="pager">
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
                            <strong>لا يوجد كتب مستعارة خلال الفترة المحددة</strong>
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

