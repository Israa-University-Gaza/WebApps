<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="StudentVoucher.aspx.cs" Inherits="Financial_StudentVoucher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Students').addClass("active open");

            $('.row-details').click(function () {
                if ($(this).hasClass('row-details-close')) {
                    $('.voucher_details').hide();
                    $('.row-details').removeClass('row-details-open').addClass('row-details-close');
                    $(this).parent().parent().next().show();
                    $(this).removeClass('row-details-close').addClass('row-details-open');
                } else {
                    $(this).removeClass('row-details-open').addClass('row-details-close');
                    $(this).parent().parent().next().hide();
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ChangePassword.aspx" class="font-ha">الطالب
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>

    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
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
                                    <asp:TextBox ID="txtStudentNo" runat="server" class="form-control" placeholder="الرجاء ادخال رقم الطالب" Style="font-family: Tahoma; font-size: 12px !important;"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button ID="btnChechStudent" runat="server" Text="بحث" class="btn green" OnClick="btnChechStudent_Click" Style="height: 34px;" />
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource10">
                                    <ItemTemplate>
                                        <h5 style="text-align: center;"><%# Eval("DisplayName") %> (<%# Eval("StudentNo") %>)</h5>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStudentData" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </li>
                            <li><a href="Student.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-home"></i>الصفحة الرئيسية<span class="after"></span></a></li>
                            <li><a href="StudentFinancialProfile.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>الملف المالي</a></li>
                            <li><a href="StudentScholarship.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>منح الطالب</a></li>
                            <li><a href="StudentApplyScholarship.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>إضافة منحة مالية للطالب</a></li>
                            <li><a href="StudentInstallment.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>أقساط الطالب</a></li>
                            <li><a href="StudentBook.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-book"></i>الكتب الدراسية</a></li>
                            <li class="active"><a href="StudentVoucher.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-book"></i>السندات المالية</a></li>
                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">
                                    <h4>سندات القبض</h4>
                                </div>
                                <div class="col-md-9 isra-pl-0">
                                    <div id="divMsg1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                        <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="margin: 10px 0 15px 0" />
                            <div class="row">
                                <div class="row">
                                    <% if (ListView1.Items.Count > 0)
                                        { %>
                                    <table class="table table-striped table-bordered table-hover dataTable">
                                        <thead>
                                            <tr>
                                                <th style="width: 5%; text-align: center"></th>
                                                <th style="width: 20%; text-align: center">رقم السند</th>
                                                <th style="width: 30%; text-align: center">البيان</th>
                                                <th style="width: 20%; text-align: center">المبلغ بالدينار</th>
                                                <th style="width: 15%; text-align: center">التاريخ</th>
                                                <th style="width: 10%; text-align: center"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <asp:Label ID="VoucherID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="StudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span class="row-details row-details-close"></span></td>
                                                        <td style="text-align: center"><span><%# Eval("VoucherNum") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("ActionArName") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("TotalAmount") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>
                                                        <td style="text-align: center">
                                                            <asp:Button ID="btnPdf" runat="server" CssClass="btn btn-success btn-xs" Text="pdf" OnClick="btnPdf_Click" />
                                                            <asp:Button ID="btnDeleteVoucherType1" runat="server" CssClass="btn btn-danger btn-xs" Text="حذف" OnClientClick="return confirm('هل انت متاكد من أنك تود حذف السند؟')" OnClick="btnDeleteVoucherType1_Click" />
                                                            <asp:Button ID="btnNote" runat="server" CssClass="btn btn-green btn-xs" Text="ملاحظات" OnClick="btnNote_Click"/>
                                                        </td>
                                                    </tr>
                                                    <tr class="voucher_details" style="display: none;">
                                                        <td colspan="6">
                                                            <table class="table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 30%; text-align: center">المبلغ</th>
                                                                        <th style="width: 30%; text-align: center">العملة</th>
                                                                        <th style="width: 40%; text-align: center"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <asp:ListView ID="ListView11" runat="server" DataSourceID="SqlDataSource11">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="VoucherDetailsID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                            <tr>
                                                                                <td style="text-align: center"><span><%# Eval("Amount") %></span></td>
                                                                                <td style="text-align: center"><span><%# Eval("Currency") %></span></td>
                                                                                <td style="text-align: center">
                                                                                    <asp:Button ID="btnDeleteVoucherDetailsType1" runat="server" CssClass="btn btn-danger btn-xs" Text="حذف" OnClientClick="return confirm('هل انت متاكد من أنك تود حذف المبلغ من السند؟')" OnClick="btnDeleteVoucherDetailsType1_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:ListView>
                                                                    <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                                                        SelectCommand="GetReceiptVoucherDetails" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="VoucherID" PropertyName="Text" Name="VoucherID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                                SelectCommand="GetStudentVouchers" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                    <asp:Parameter Name="VoucherTypeID" DefaultValue="1" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>
                                    <% }
                                        else
                                        {%>
                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                        <div class="col-xs-11" style="text-align: center;">
                                            <strong>لا يوجد سندات قبض</strong>
                                            <div style="clear: both"></div>
                                        </div>
                                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">
                                    <h4>سندات الصرف</h4>
                                </div>
                                <div class="col-md-9 isra-pl-0">
                                    <div id="divMsg2" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                        <asp:Label ID="lblMsg2" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="margin: 10px 0 15px 0" />
                            <div class="row">
                                <div class="row">
                                    <% if (ListView2.Items.Count > 0)
                                        { %>
                                    <table class="table table-striped table-bordered table-hover dataTable collapsed">
                                        <thead>
                                            <tr>
                                                <th style="width: 5%; text-align: center"></th>
                                                <th style="width: 20%; text-align: center">رقم السند</th>
                                                <th style="width: 30%; text-align: center">البيان</th>
                                                <th style="width: 20%; text-align: center">المبلغ بالدينار</th>
                                                <th style="width: 15%; text-align: center">التاريخ</th>
                                                <th style="width: 10%; text-align: center"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                                <ItemTemplate>
                                                    <asp:Label ID="VoucherID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span class="row-details row-details-close"></span></td>
                                                        <td style="text-align: center"><span><%# Eval("VoucherNum") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("ActionArName") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("TotalAmount") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>
                                                        <td style="text-align: center">
                                                            <asp:Button ID="btnDeleteVoucherType2" runat="server" CssClass="btn btn-danger btn-xs" Text="حذف" OnClientClick="return confirm('هل انت متاكد من أنك تود حذف السند؟')" OnClick="btnDeleteVoucherType2_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr class="voucher_details" style="display: none;">
                                                        <td colspan="6">
                                                            <table class="table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 30%; text-align: center">المبلغ</th>
                                                                        <th style="width: 30%; text-align: center">العملة</th>
                                                                        <th style="width: 40%; text-align: center"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <asp:ListView ID="ListView21" runat="server" DataSourceID="SqlDataSource21">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="VoucherDetailsID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                            <tr>
                                                                                <td style="text-align: center"><span><%# Eval("Amount") %></span></td>
                                                                                <td style="text-align: center"><span><%# Eval("Currency") %></span></td>
                                                                                <td style="text-align: center">
                                                                                    <asp:Button ID="btnDeleteVoucherDetailsType2" runat="server" CssClass="btn btn-danger btn-xs" Text="حذف" OnClientClick="return confirm('هل انت متاكد من أنك تود حذف المبلغ من السند؟')" OnClick="btnDeleteVoucherDetailsType2_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:ListView>
                                                                    <asp:SqlDataSource ID="SqlDataSource21" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                                                        SelectCommand="GetReceiptVoucherDetails" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="VoucherID" PropertyName="Text" Name="VoucherID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                                SelectCommand="GetStudentVouchers" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                    <asp:Parameter Name="VoucherTypeID" DefaultValue="2" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>
                                    <% }
                                        else
                                        {%>
                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                        <div class="col-xs-11" style="text-align: center;">
                                            <strong>لا يوجد سندات صرف</strong>
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
    </div>
</asp:Content>

