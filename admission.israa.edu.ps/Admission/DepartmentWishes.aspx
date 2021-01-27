<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="DepartmentWishes.aspx.cs" Inherits="Admission_DepartmentWishes" %>

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
                                <th rowspan="2" style="width: 15%; text-align: center; vertical-align: middle;">الكلية</th>
                                <th rowspan="2" style="width: 15%; text-align: center; vertical-align: middle;">القسم</th>
                                <th colspan="3" style="width: 23.3%; text-align: center">رغبة أولي</th>
                                <th colspan="3" style="width: 23.3%; text-align: center">رغبة ثانية</th>
                                <th colspan="3" style="width: 23.3%; text-align: center">رغبة ثالثة</th>
                            </tr>
                            <tr>
                                <th style="width: 7.76%; text-align: center">طلاب</th>
                                <th style="width: 7.76%; text-align: center">طالبات</th>
                                <th style="width: 7.76%; text-align: center">المجموع</th>
                                <th style="width: 7.76%; text-align: center">طلاب</th>
                                <th style="width: 7.76%; text-align: center">طالبات</th>
                                <th style="width: 7.76%; text-align: center">المجموع</th>
                                <th style="width: 7.76%; text-align: center">طلاب</th>
                                <th style="width: 7.76%; text-align: center">طالبات</th>
                                <th style="width: 7.76%; text-align: center">المجموع</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <td style="text-align: center"><span><%# Eval("CollegeArName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ArName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("MaleWishes1") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("FemaleWishes1") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Wishes1") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("MaleWishes2") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("FemaleWishes2") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Wishes2") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("MaleWishes3") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("FemaleWishes3") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Wishes3") %></span></td>
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
    </div>
</asp:Content>

