<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="StudentVoucherNote.aspx.cs" Inherits="Financial_StudentVoucherNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStudentVoucherID" runat="server" Visible="false"></asp:Label>
    <div class="row">

        <div class="col-md-12 ">
            <div id="Div1" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                <button class="close" data-close="alert"></button>
            </div>
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>عرض تفاصيل سند الطالب
                    </div>
                    <div class="tools">
                        <a href="" class="collapse"></a>

                        <a href="" class="remove"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-body">
                        <% if (ListView1.Items.Count > 0)
                        { %>
                        <table class="table table-striped table-bordered table-hover dataTable">
                            <thead>
                                <tr>
                                    <th style="width: 20%;">اسم الطالب</th>
                                    <th style="width: 10%; text-align: center">رقم السند</th>
                                    <th style="width: 20%; text-align: center">البيان</th>
                                    <th style="width: 15%; text-align: center">المبلغ بالدينار</th>
                                    <th style="width: 15%; text-align: center">التاريخ</th>
                                    <th style="width: 20%; text-align: center">الملاحظات</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="VoucherID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        
                                        <tr>
                                            <td><span><%# Eval("StudentName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("VoucherNum") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("ActionArName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("TotalAmount") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Note") %></span></td>

                                        </tr>

                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                    SelectCommand="GetStudentVouchers" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                        <asp:ControlParameter ControlID="lblStudentVoucherID" PropertyName="Text" Name="ID" Type="Int32" />
                                        <asp:Parameter Name="VoucherTypeID" DefaultValue="1" Type="Int32" />

                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>

                        <div class="clearfix"></div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">

            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل ملاحظة للسند المالي</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">

                            <div class="form-group row">
                                <asp:Label ID="Label3" runat="server" Text="الملاحظة" CssClass="col-md-2 control-label"></asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtNote" runat="server" placeholder="" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" OnClick="btnSave_Click" CssClass="btn green" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

