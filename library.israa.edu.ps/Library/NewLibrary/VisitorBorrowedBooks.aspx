<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="VisitorBorrowedBooks.aspx.cs" Inherits="NewLibrary_VisitorBorrowedBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/css/pages/profile-rtl.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/custom-rtl.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library6 a').css("background-color", "#575757");
            $('#new-library a span.arrow').addClass("open");

            $("#fuDocument").change(function () {
                $('#txtDocumentLink').val($(this).val());
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-book"></i>
        <a href="VisitorBorrowedBooks.aspx" class="font-ha">الكتب المستعارة للزائر</a>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblVisitorID" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الزائر</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div style="width: 19%; float: right;">
                        <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                            <li style="margin-bottom: 0;">
                                <div class="input-group">
                                    <asp:TextBox ID="txtSSN" runat="server" class="form-control" placeholder="الرجاء ادخال هوية الزائر" Style="font-family: Tahoma; font-size: 12px !important;"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button ID="btnChechVisitor" runat="server" Text="بحث" class="btn green" OnClick="btnChechVisitor_Click" Style="height: 34px;" />
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource10">
                                    <ItemTemplate>
                                        <h5 style="text-align: center;"><%# Eval("FullName") %> (<%# Eval("SSN") %>)</h5>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:IsraaLibrary %>"
                                    SelectCommand="GetVisitor" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblVisitorID" PropertyName="Text" Name="ID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </li>
                            <li><a href="Visitor.aspx"><i class="fa fa-home"></i>الصفحة الرئيسية</a></li>
                            <li class="active"><a href="VisitorBorrowedBooks.aspx"><i class="fa fa-edit"></i>الكتب المستعارة</a></li>
                            <%--<li><a href="#"><i class="fa fa-edit"></i>استعارة كتاب</a></li>--%>
                            <li><a href="VisitorSMS.aspx"><i class="fa fa-edit"></i>ارسال SMS</a></li>
                            <li>
                                <asp:LinkButton ID="lbEditVisitor" runat="server" OnClick="lbEditVisitor_Click"><i class="fa fa-edit"></i>تعديل بيانات الزائر</asp:LinkButton></li>

                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div id="tab2" class="tab-pane" runat="server" clientidmode="Static">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-10">
                                            <h4>الكتب المستعارة</h4>
                                        </div>
                                    </div>
                                    <hr style="margin: 10px 0 15px 0" />

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
                                            <asp:Button ID="btnPDF" runat="server" Text="طباعة كشف معاملة المشترك" CssClass="btn blue" OnClick="btnPDF_Click" />
                                        </div>
                                    </div>
                                    <% if (ListView1.Items.Count > 0)
                                        { %>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 2%;">م </th>
                                                <th style="width: 10%; text-align: center; font-size: 12px">الرقم العام </th>
                                                <th style="width: 10%; text-align: center; font-size: 12px">رقم النسخة</th>
                                                <th style="width: 22%; text-align: center; font-size: 12px">عنوان الكتاب</th>
                                                <th style="width: 10%; text-align: center; font-size: 12px">ت. الاستعارة</th>
                                                <th style="width: 10%; text-align: center; font-size: 12px">ت. ن. الارجاع</th>
                                                <th style="width: 10%; text-align: center; font-size: 12px">ت. التجديد</th>
                                                <th style="width: 10%; text-align: center; font-size: 12px">ت. الارجاع</th>
                                                <th style="width: 16%; text-align: center; font-size: 10px"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <tr>
                                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                        <td><%# Eval("RowNo") %></td>
                                                        <td style="text-align: center"><%# Eval("ContainerNo") %></td>
                                                        <td style="text-align: center"><%# Eval("BookNo") %></td>
                                                        <td style="text-align: center"><%# Eval("BookTitle") %></td>
                                                        <td style="text-align: center"><%# Eval("BorrowDate","{0:yyyy/MM/dd}") %></td>
                                                        <td style="text-align: center"><%# Eval("LastReturnDate","{0:yyyy/MM/dd}") %></td>
                                                        <td style="text-align: center"><%# Eval("RenewDate","{0:yyyy/MM/dd}") %></td>
                                                        <td style="text-align: center"><%# Eval("ReturnDate","{0:yyyy/MM/dd}") %></td>
                                                        <td style="text-align: center">
                                                            <asp:LinkButton ID="lbReturned" runat="server" CssClass="btn default btn-xs blue" OnClick="lbReturned_Click" Enabled='<%#((Eval("IsReturned").ToString() == "0")) ? true:false %>'><i class="fa fa-arrow-circle-o-up"></i> <%#((Eval("IsReturned").ToString() == "0")) ? "إرجاع" : "تم الإرجاع"%></asp:LinkButton>
                                                            <asp:LinkButton ID="lbRenewed" runat="server" CssClass="btn default btn-xs red" OnClick="lbRenewed_Click" Enabled='<%#((Eval("IsReturned").ToString() == "0") && (Eval("IsRenewed").ToString() == "0")) ? true:false %>'><i class="fa fa-asterisk"></i> تجديد </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="GetClientBorrowedBooks" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblVisitorID" PropertyName="Text" Name="ClientID" Type="Int32"></asp:ControlParameter>
                                                    <asp:Parameter DefaultValue="3" Name="BorrowCategoryID" Type="Int32"></asp:Parameter>
                                                    <asp:ControlParameter ControlID="txtDateFrom" PropertyName="Text" DbType="Date" Name="DateFrom" DefaultValue="1900/01/01"></asp:ControlParameter>
                                                    <asp:ControlParameter ControlID="txtDateTo" PropertyName="Text" DbType="Date" Name="DateTo" DefaultValue="1900/01/01"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>
                                    <div class="col-md-12">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                                <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                                <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                                                <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                                <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                            </Fields>
                                        </asp:DataPager>
                                    </div>
                                    <div class="clearfix"></div>
                                    <% } %>
                                    <%  else
                                        { %>
                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                        <div class="col-xs-11" style="text-align: center">
                                            <strong>لا يوجد كتب مستعارة للعرض  </strong>
                                            <div style="clear: both"></div>
                                        </div>
                                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                    <%  } %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

