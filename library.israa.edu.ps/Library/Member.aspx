<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="Member.aspx.cs" Inherits="Library_Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-user"></i>الاعضاء</div>

                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 30%">إسم المستخدم</th>
                                <th style="width: 30%">رقم الجوال</th>
                                <th style="width: 20%">النوع</th>
                                <th style="width: 10%; text-align: center">فعال</th>
                                <th style="width: 10%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><span></span></td>
                                <td><span></span></td>
                                <td><span></span></td>
                                <td style="text-align: center">
                                    <asp:CheckBox ID="cbIsActive" runat="server" />
                                </td>
                                <td style="text-align: center">
                                    <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black"> <i class="fa fa-edit"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                </td>
                            </tr>
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
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل الاعضاء</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-4 control-label">اسم المستخدم</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtName1" runat="server" CssClass="form-control " placeholder="اسم المستخدم"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">كلمة المرور</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control " TextMode="Password" placeholder="كلمة المرور"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">تاكيد كلمة المرور</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password" placeholder="تاكيد كلمة المرور"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">رقم الجوال</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control " placeholder="رقم الجوال"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">البريد الالكتروني</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control " placeholder="البريد الالكتروني"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">النوع</label>
                                <div class="col-md-8">
                                    <asp:DropDownList class="select2_category form-control" ID="DropDownList2" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-8">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

