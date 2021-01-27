<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Library_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                     <div class="caption"><i class="fa fa-bookmark"></i>التصنيفات</div>
                    
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 25%">إسم التصنيف</th>
                                <th style="width: 25%">الرقم</th>
                                <th style="width: 15%">تاريخ الإصافة</th>
                                <th style="width: 10%; text-align: center">فعال</th>
                                <th style="width: 15%"></th>
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
                                    <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" ><i class="fa fa-trash-o"></i></asp:LinkButton>
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
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل التصنيفات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label">التصنيف</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control " placeholder="الرجاء ادخال إسم التصنيف"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">الرقم</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtName1" runat="server" CssClass="form-control " placeholder="الرجاء ادخال رقم التصنيف"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-9">
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

