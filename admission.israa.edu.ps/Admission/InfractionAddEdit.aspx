<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="InfractionAddEdit.aspx.cs" Inherits="Admission_InfractionAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu9').addClass("active open");
            $('#menu9_3 a').css("background-color", "#575757");
            $('#menu9 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="InfractionAddEdit.aspx" class="font-ha">إضافة المخالفات </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">


    <div class="row">

        <asp:Label ID="lblInfractionID" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
        <div class="col-md-7">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>عرض المخالفات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <% if (ListView2.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 10%">#</th>
                                <th style="text-align: center; width: 35%">المخالفة</th>
                                <th style="text-align: center; width: 35%">نوع المخالفة</th>
                                <th style="text-align: center; width: 20%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="InfractionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("RowNo") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Title") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("InfractionType") %></span></td>

                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تعديل </asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف </a></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetInfraction" SelectCommandType="StoredProcedure">

                                <SelectParameters>
                                    <asp:Parameter DefaultValue="-1" Name="InfractionTypeID" Type="Int32"></asp:Parameter>
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
                            <strong>لم يتم إضافة مخالفات بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="portlet box green">
                <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة مخالفة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">عنوان المخالفة</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtInfraction" runat="server" CssClass="form-control" placeholder="الرجاء ادخال عنوان المخالفة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">نوع المخالفة</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlInfractionTypeID" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, Name FROM [InfractionType] WHERE [IsDelete] = 0 union select -1,N'إختر نوع المخالفة'"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" OnClick="btnSave_Click" CssClass="btn green" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" OnClick="btnCancel_Click" CssClass="btn default" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

