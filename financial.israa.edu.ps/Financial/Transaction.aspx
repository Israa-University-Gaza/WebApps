<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="Transaction.aspx.cs" Inherits="Financial_Transaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">حركات الطالب المالية</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>حركات الطالب المالية</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="alert alert-success alert-dismissable" id="divMsg" runat="server" visible="false">
                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button"></button>
                    </div>
                    <div class="row">
                        <asp:Label ID="lblStudentID" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="lblStudentName" runat="server" Text=""></asp:Label>

                        <div class="form-group">
                            <label class="col-md-2 control-label">رقم الطالب</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <asp:TextBox ID="txtStudentNo" runat="server" class="form-control" placeholder="الرجاء ادخال رقم الطالب"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button ID="btnChechStudent" runat="server" Text="فحص" class="btn green" OnClick="btnCkeckStudent_Click" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row" id="divFinancial" runat="server" visible="false">
                        <div class="col-md-12">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; width: 15%">الفصل الدراسي</th>
                                        <th style="text-align: center; width: 10%">مدين</th>
                                        <th style="text-align: center; width: 10%">دائن</th>
                                        <th style="text-align: center; width: 30%">الحركة المالية</th>
                                        <th style="text-align: center; width: 15%">الرصيد</th>
                                        <th style="text-align: center; width: 20%">تاريخ الحركة</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="text-align: center;"><%# Eval("SemesterCode") %></td>
                                                <td style="text-align: center;"><%# Eval("Amount1") %></td>
                                                <td style="text-align: center;"><%# Eval("Amount2") %></td>
                                                <td style="text-align: center;"><%# Eval("ActionArName") %></td>
                                                <td style="text-align: center;"><%# Eval("Balance") %></td>
                                                <td style="text-align: center;"><%# Eval("InsertDate","{0:yyyy/MM/dd hh:mm tt}") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetStdTransaction" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

