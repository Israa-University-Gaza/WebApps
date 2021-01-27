<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="DepartmentWishes.aspx.cs" Inherits="Academic_DepartmentWishes" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("DepartmentWishes"))
           { %>
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>احصائية رغبات الطلاب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <% if (ListView1.Items.Count > 0)
                       { %>

                    <div class="col-md-12" style="padding: 12px; text-align: left; vertical-align: middle;">
                        <asp:LinkButton ID="lbPDF" runat="server" OnClick="lbPDF_Click">تصديرالى pdf</asp:LinkButton>
                    </div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 20%; text-align: center">الكلية</th>
                                <th style="width: 10%; text-align: center">القسم</th>
                                <th style="width: 10%; text-align: center">رغبة أولي</th>
                                <th style="width: 10%; text-align: center">رغبة ثانية</th>
                                <th style="width: 10%; text-align: center">رغبة ثالثة</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <td style="text-align: center"><span><%# Eval("CollegeArName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ArName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("x1") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("x2") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("x3") %></span></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetDepartmentWishesCount" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                    <% }
                       else
                       {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجود بيانات</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</asp:Content>

