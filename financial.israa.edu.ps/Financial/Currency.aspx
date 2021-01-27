﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="Currency.aspx.cs" Inherits="Financial_Currency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">العملات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>العملات</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 40%">اسم العملة</th>
                                <th style="width: 15%; text-align: center">عدد الخانات العشرية</th>
                                <th style="width: 15%; text-align: center">العملة الكسرية</th>
                                <th style="width: 15%; text-align: center">فعال</th>
                                <th style="width: 15%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("ArName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("FractionsNo") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("FractionName") %></span></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>'  /></td><%--Enabled='<%# (Permissions.Contains("CurrencyActivate"))? true:false %>'--%>
                                        <td style="text-align: center">
                             <%--               <% if (Permissions.Contains("CurrencyEdit"))
                                               { %>--%>
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                       <%--     <% } %>
                                            <% if (Permissions.Contains("CurrencyDelete"))
                                               { %>--%>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                           <%-- <% } %>--%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="SELECT * From [Currency] where [IsDelete]=0 order by ID"></asp:SqlDataSource>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    <%--    <% if (Permissions.Contains("CurrencyAdd") || Permissions.Contains("CurrencyEdit"))
           { %>--%>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:TextBox ID="lblID" runat="server" Text="" Visible="false"></asp:TextBox>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل عملة</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">المسمى بالعربية</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtArName" runat="server" class="form-control" placeholder="الرجاء ادخال اسم الحركة بالعربي"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">المسمى بالإنجليزية</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtEnName" runat="server" class="form-control" placeholder="الرجاء ادخال اسم الحركة بالإنجليزي"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">عدد الخانات العشرية</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtFractionsNo" runat="server" class="form-control" placeholder="الرجاء ادخال قيمة عدد الخانات العشرية"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">العملة الكسرية</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtFractionName" runat="server" class="form-control" placeholder="الرجاء ادخال قيمة العملة الكسرية"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-8">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%--        <% } %>--%>
    </div>
</asp:Content>

