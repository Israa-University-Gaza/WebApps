<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="VisitorAddEdit.aspx.cs" Inherits="NewLibrary_VisitorAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library7 a').css("background-color", "#575757");
            $('#new-library a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-book"></i>
        <a href="VisitorAddEdit.aspx" class="font-ha">إضافة/تعديل معلومات الزائر</a>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblVisitorID" runat="server" Text="" Visible="false"></asp:Label>

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل بيانات الزائر</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">

                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">الاسم كاملاً</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                                <label class="col-md-2 control-label isra-text-aling-right">رقم الهوية</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtSSN" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">رقم الهاتف</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>

                                <label class="col-md-2 control-label isra-text-aling-right">رقم الجوال</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">

                                <label class="control-label col-md-2">البريد الالكتروني : </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">العنوان كاملاً</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">ملاحظات</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn blue" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>زوار الجامعة</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="control-label col-md-2">رقم الهوية : </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtSSN1" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <label class="control-label col-md-2">رقم الجوال : </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtMobile1" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-2">إسم الزائر : </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtFullName1" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <label class="control-label col-md-2">البريد الالكتروني : </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtEmail1" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-offset-4 col-md-4"></label>
                        <div class="col-md-8 col-lg-offset-2">
                            <asp:Button ID="btnFilter" runat="server" Text="بحث" class="btn green" OnClick="btnFilter_Click" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; width: 5%">رقم</th>
                                        <th style="text-align: center; width: 15%">هوية الزائر</th>
                                        <th style="text-align: center; width: 20%">إسم الزائر</th>
                                        <th style="text-align: center; width: 20%">العنوان</th>
                                        <th style="text-align: center; width: 10%">الجوال</th>
                                        <th style="text-align: center; width: 20%">الايميل</th>
                                        <th style="text-align: center; width: 5%"></th>
                                        <th style="text-align: center; width: 5%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                            <tr>
                                                <asp:Label ID="VisitorID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <td style="text-align: center;"><%# Eval("No") %></td>
                                                <td style="text-align: center;"><%# Eval("SSN") %></td>
                                                <td style="text-align: center;"><%# Eval("FullName") %></td>
                                                <td style="text-align: center;"><%# Eval("Address") %></td>
                                                <td style="text-align: center;"><%# Eval("Mobile") %></td>
                                                <td style="text-align: center;"><%# Eval("Email") %></td>
                                                <td style="text-align: center;">
                                                    <asp:LinkButton ID="lbOpenStudent" runat="server" class="btn default btn-xs black" OnClick="lbOpenStudent_Click">فتح الملف</asp:LinkButton>
                                                </td>
                                                <td style="text-align: center;">
                                                    <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                    <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" Visible='<%#( (Eval("CanDeleteVisitor").ToString() == "1")) ? true:false %>' OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i>  حذف</a></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:IsraaLibrary %>' SelectCommand="GetVisitors" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtSSN1" PropertyName="Text" DefaultValue="%" Name="SSN" Type="String"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="txtFullName1" PropertyName="Text" DefaultValue="%" Name="FullName" Type="String"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="txtMobile1" PropertyName="Text" DefaultValue="%" Name="Mobile" Type="String"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="txtEmail1" PropertyName="Text" DefaultValue="%" Name="Email" Type="String"></asp:ControlParameter>

                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>
                            <div style="float: left!important; direction: ltr!important;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager col-md-12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                        <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                        <asp:NumericPagerField ButtonType="Link" />
                                        <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                            <div class="clearfix"></div>
                            <% }
                                else
                                {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
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
        </div>

    </div>

</asp:Content>

