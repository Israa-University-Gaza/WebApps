<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="BookBorrow.aspx.cs" Inherits="NewLibrary_BookBorrow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#').addClass("active open");
            $('#').css("background-color", "#575757");
            $('#').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-book"></i>
        <a href="BookBorrow.aspx" class="font-ha">إعارة كتاب</a>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblContainerID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblBookID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">

                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>معلومات الكتاب
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">رقم الكتاب العام</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblContainerNo" runat="server" CssClass="form-control"></asp:Label>
                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">رقم نسخة الكتاب</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblBookNo" runat="server" CssClass="form-control"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group row">

                                <label class="col-md-2 control-label isra-text-aling-right">عنوان الموضوع</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblContainerTitle" runat="server" CssClass="form-control"></asp:Label>
                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">عنوان الكتاب الرئيسي</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblBookTitle" runat="server" CssClass="form-control"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">نوع الكتاب </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblBookType" runat="server" CssClass="form-control"></asp:Label>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>اعارة الكتاب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">رقم المشترك </label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtClientNo" runat="server" CssClass="form-control" placeholder="بحث برقم المشترك " AutoPostBack="true" OnTextChanged="txtClientNo_TextChanged"></asp:TextBox>
                        </div>

                        <label class="col-md-2 control-label isra-text-aling-right">اسم المشترك </label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtClientName" runat="server" CssClass="form-control" placeholder="بحث باسم المشترك " AutoPostBack="true" OnTextChanged="txtClientNo_TextChanged"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn green" OnClick="btnSearch_Click" />

                        </div>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 10%">رقم</th>
                                <th style="text-align: center; width: 15%">رقم المشترك</th>
                                <th style="text-align: center; width: 35%">إسم المشترك</th>
                                <th style="text-align: center; width: 20%">رقم الهاتف</th>
                                <th style="text-align: center; width: 10%">النوع</th>
                                <th style="text-align: center; width: 5%"></th>
                                <th style="text-align: center; width: 5%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="BorrowCategoryID" runat="server" Text='<%# Eval("BorrowCategoryID") %>' Visible="false"></asp:Label>
                                        <td><%# Eval("RowNo") %></td>
                                        <td style="text-align: center;"><%# Eval("ClientNo") %></td>
                                        <td style="text-align: center;"><%# Eval("ClientName") %></td>
                                        <td style="text-align: center;"><%# Eval("Mobile") %></td>
                                        <td style="text-align: center;"><%# Eval("BorrowCategory") %></td>
                                        <td style="text-align: center;">
                                            <asp:LinkButton ID="lbOpenFile" runat="server" class="btn default btn-xs black" OnClick="lbOpenFile_Click">فتح الملف</asp:LinkButton>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbBorrowBook" runat="server" class="btn default btn-xs black" OnClick="lbBorrowBook_Click" Visible='<%# ((Eval("IsBookBorrowed").ToString() == "0")) ? true:false %>'><i class="fa fa-beer"></i> إعارة الكتاب</asp:LinkButton>
                                            <%-- <span id="td2" style="text-align: center; color: red" runat="server" visible='<%# ((Eval("IsBookBorrowed").ToString() == "1")) ? true:false %>'>تم اعارة الكتاب</span>--%>
                                        </td>

                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="GetClientsByClientNo" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtClientNo" PropertyName="Text" Name="ClientNo" Type="String" DefaultValue="%"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtClientName" PropertyName="Text" Name="ClientName" Type="String" DefaultValue="%"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="lblBookID" PropertyName="Text" Name="BookID" Type="String"></asp:ControlParameter>
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
                            <strong>لا يوجد بيانات للعرض </strong>
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

