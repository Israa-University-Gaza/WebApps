<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="Periodicals.aspx.cs" Inherits="NewLibrary_Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library11 a').css("background-color", "#575757");
            $('#new-library a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-book"></i>
        <a href="Periodicals.aspx" class="font-ha">عرض الدوريات</a>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <asp:Label ID="lblContainerID" runat="server" Text="" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div id="DivFilter" runat="server" visible="false">
                <div class="portlet box blue">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-reorder"></i>بحث حسب
                        </div>
                        <div class="tools">
                            <a class="collapse" href="javascript:;"></a>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-horizontal">
                            <div class="form-body">
                                <div class="form-group row">
                                    <label class="col-md-2 control-label isra-text-aling-right">الرقم العام</label>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtContainerNo" runat="server" CssClass="form-control" placeholder="بحث برقم الموضوع العام" AutoPostBack="true" OnTextChanged="txtContainerNo1_TextChanged"></asp:TextBox>
                                    </div>
                                    <label class="col-md-2 control-label isra-text-aling-right">رقم النسخة </label>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtBookNo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <label class="col-md-2 control-label isra-text-aling-right">رقم ISBN</label>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtISBN" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 control-label isra-text-aling-right">عنوان الموضوع</label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtContainerTitle" runat="server" CssClass="form-control" placeholder="بحث بعنوان الموضوع" AutoPostBack="true" OnTextChanged="txtContainerTitle_TextChanged"></asp:TextBox>
                                    </div>
                                    <label class="col-md-2 control-label isra-text-aling-right">العنوان الرئيسي</label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtBookTitle" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 control-label isra-text-aling-right">المؤلف</label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtPersonName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <label class="col-md-2 control-label isra-text-aling-right">سنة النشر</label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtPublisherYear" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions fluid">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn green" OnClick="btnSearch_Click" />
                                     <asp:Button ID="btnPrintQR" runat="server" Text="طباعة" CssClass="btn blue" OnClick="btnPrintQR_Click" />
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
                    <div class="caption"><i class="fa fa-cogs"></i>الدوريات </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">

                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 10%; font-size: 12px">الرقم العام </th>
                                <th style="text-align: center; width: 10%; font-size: 12px">رقم النسخة </th>
                                <th style="text-align: center; width: 10%; font-size: 12px">ISBN </th>
                                <th style="text-align: center; width: 20%; font-size: 12px">عنوان الموضوع</th>
                                <th style="text-align: center; width: 20%; font-size: 12px">العنوان الرئيسي</th>
                                <th style="text-align: center; width: 5%; font-size: 12px">النوع</th>
                                <th style="text-align: center; width: 5%; font-size: 12px">العدد</th>
                                <th style="text-align: center; width: 5%; font-size: 12px"></th>
                                <th style="text-align: center; width: 15%; font-size: 12px"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="ContainerID" runat="server" Text='<%# Eval("ContainerID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="BookID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("ContainerNo") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("BookNo") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ISBN") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ContainerTitel") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("BookTitle1") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("BookType") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("PeriodicalNumber") %></span></td>
                                        <td style="text-align: center">
                                            <span id="td2" style="text-align: center; color: red" runat="server" visible='<%# ((Eval("IsBookBorrowed").ToString() == "1")) ? true:false %>'>الكتاب مستعار</span>
                                        </td>
                                        <td style="text-align: center">
                                            <div class="actions">
                                                <div class="btn-group">
                                                    <a class="btn default btn-xs green" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">خيارات <i class="fa fa-angle-down"></i></a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li>
                                                            <asp:LinkButton ID="lbBorrowBook" runat="server" class="btn default btn-xs black" OnClick="lbBorrowBook_Click" Visible='<%# ((Eval("IsBookBorrowed").ToString() == "0")) ? true:false %>'><i class="fa fa-beer"></i> إعارة الكتاب</asp:LinkButton>
                                                        </li>
                                                        <li>
                                                            <asp:LinkButton ID="lbBookCopyAdd" runat="server" class="btn default btn-xs black" OnClick="lbBookCopyAdd_Click"><i class="fa fa-plus"></i>إضافة نسخ</asp:LinkButton>
                                                        </li>
                                                        <li>
                                                            <asp:LinkButton ID="lbBookReport" runat="server" class="btn default btn-xs black" OnClick="lbBookReport_Click"><i class="fa fa-archive"></i> كشف معاملة </asp:LinkButton>
                                                        </li>
                                                        <li>
                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                        </li>
                                                        <li>
                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs black" Visible='<%# ( (Eval("CanDelete").ToString() == "1")) ? true:false %>' OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</asp:LinkButton>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="GetFilterdPeriodicals" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="ID" Type="Int32" DefaultValue="-1"></asp:Parameter>
                                    <asp:ControlParameter ControlID="txtContainerNo" PropertyName="Text" DefaultValue="%" Name="ContainerNo" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtBookNo" PropertyName="Text" DefaultValue="%" Name="BookNo" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtISBN" PropertyName="Text" DefaultValue="%" Name="ISBN" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtContainerTitle" PropertyName="Text" DefaultValue="%" Name="ContainerTitel" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtBookTitle" PropertyName="Text" DefaultValue="%" Name="BookTitlel1" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="lblContainerID" PropertyName="Text" DefaultValue="-1" Name="ContainerID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtPersonName" PropertyName="Text" DefaultValue="%" Name="PersonName" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtPublisherYear" PropertyName="Text" DefaultValue="%" Name="PublisherYear" Type="String"></asp:ControlParameter>
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

