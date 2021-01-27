<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="StudentBook.aspx.cs" Inherits="Financial_StudentBook" %>

<%@ Register Src="~/Financial/UserControl/StudentMenu.ascx" TagPrefix="uc1" TagName="StudentMenu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Students').addClass("active open");

            $('#checkall').click(function (event) {
                var x = this.checked;
                $(':checkbox').each(function () {
                    this.checked = x;
                });
            });

            $('.buyBook input[type=checkbox]').click(function (event) {
                var totalprice = parseInt($('#total').html());
                var x = $(this).parent().parent().parent().children('.tdprice').children('.price');
                var price = parseInt(x.html());
                totalprice = this.checked ? totalprice + price : totalprice - price;
                $('#total').html(totalprice);
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
    <asp:Label ID="lblEmployeeName" runat="server" Visible="false"></asp:Label>

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
                        <uc1:StudentMenu runat="server" ID="StudentMenu" />
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">
                                    <h4>كتب الطالب المتاحة</h4>
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
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 10%; text-align: center">
                                                    <input type="checkbox" id="checkall" /></th>
                                                <th style="width: 35%; text-align: center">الكتاب</th>
                                                <th style="width: 30%; text-align: center">سعر الكتاب</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <asp:Label ID="BookID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td style="text-align: center">
                                                            <asp:CheckBox ID="cbBuyBook" runat="server" CssClass="buyBook" />
                                                        </td>
                                                        <td style="text-align: center">
                                                            <asp:Label ID="lblBookName" runat="server" Text='<%# Eval("ArName") %>'></asp:Label></td>
                                                        <td style="text-align: center" class="tdprice">
                                                            <asp:Label ID="lblBookPrice" runat="server" Text='<%# Eval("Price") %>' CssClass="price"></asp:Label></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <tr>
                                                <td style="text-align: center"></td>
                                                <td style="text-align: center">مجموع المحدد</td>
                                                <td style="text-align: center"><span id="total">0</span></td>
                                            </tr>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetAvailableStudentBooks" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
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
                                            <strong>لا يوجد كتب متاحة للطالب</strong>
                                            <div style="clear: both"></div>
                                        </div>
                                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                    <% } %>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnBuyBook" runat="server" class="btn green" Text="شراء الكتب المحددة" OnClick="btnBuyBook_Click" Width="100%" />
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnBookReport" runat="server" class="btn green" Text="طباعة الكتب المحددة بدون شراء" OnClick="btnBookReport_Click" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>الكتب المحجوزة</h4>
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
                                    <% if (ListView2.Items.Count > 0)
                                        { %>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 35%; text-align: center">الكتاب</th>
                                                <th style="width: 30%; text-align: center">سعر الكتاب</th>
                                                <th style="width: 35%; text-align: center"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                                <ItemTemplate>
                                                    <asp:Label ID="StudentBookID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td style="text-align: center">
                                                            <asp:Label ID="lblBookName" runat="server" Text='<%# Eval("BookName") %>'></asp:Label></td>
                                                        <td style="text-align: center">
                                                            <asp:Label ID="lblBookPrice" runat="server" Text='<%# Eval("BookPrice") %>'></asp:Label></td>
                                                        <td style="text-align: center">
                                                            <asp:Button ID="btnDeleteStudentBook" runat="server" CssClass="btn btn-danger btn-xs" Text="إلغاء الشراء" OnClick="btnDeleteStudentBook_Click" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStudentBooks" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
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
                                            <strong>لا يوجد كتب محجوزة</strong>
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

