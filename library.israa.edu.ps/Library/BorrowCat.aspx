<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="BorrowCat.aspx.cs" Inherits="Library_BorrowCat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                     <div class="caption"><i class="fa fa-bookmark"></i>فئات المستعيرين</div>
                    
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 25%">إسم الفئة</th>
                                <th style="width: 30%">الحد الأقصى للكتب المعارة</th>
                                <th style="width: 15%">مدة الاعارة بالايام</th>
                          
                                <th style="width: 15%"></th>
                            </tr>
                        </thead>
                        <tbody>
                              <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                            <tr>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <td><span><%# Eval("BorrowCatType") %></span></td>
                                <td><span><%# Eval("BorrowMaxBookCount") %></span></td>
                                <td><span><%# Eval("BorrowMaxDayCount") %></span></td>
                               
                                <td style="text-align: center">
                                    <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"> <i class="fa fa-edit"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" ><i class="fa fa-trash-o"></i></asp:LinkButton>
                                </td>
                            </tr>
                                                 </ItemTemplate>
                                        </asp:Repeater>


                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT * FROM [BorrowCat] where IsDelete=0">
                                        </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:Label ID="lblBlockID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل فئات المستعيرين</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <asp:Label ID="ID" runat="server" Visible="false" Text=""></asp:Label>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-6 control-label">اسم الفئة</label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control " placeholder="الرجاء ادخال إسم الفئة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-6 control-label">الحد الاقصى للكتب المعارة</label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="MaxBooks" runat="server" CssClass="form-control " placeholder="الرجاء ادخال الحد الأقصى "></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-6 control-label">مدة الاعارة بالايام</label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="MaxDays" runat="server" CssClass="form-control " placeholder="الرجاء ادخال مدة الاعارة "></asp:TextBox>
                                </div>
                            </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

