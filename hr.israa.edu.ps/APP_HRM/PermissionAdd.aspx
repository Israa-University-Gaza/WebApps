<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="PermissionAdd.aspx.cs" Inherits="APP_HRM_PermissionAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu3').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">إضافة الصلاحيات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

     <asp:Label ID="lbEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">

        <div class="col-md-12">
            <div class="portlet box blue">

                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة صلاحية موظف</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">


                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">إسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="select2_category form-control"  DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaHumanResource %>" SelectCommand="ddlEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">إسم الصلاحية</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlRole" runat="server" CssClass="select2_category form-control"  DataSourceID="SqlDataSource2" DataTextField="Code" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra3 %>" SelectCommand="SELECT ID,Code  FROM [dbo].[Role] where IsDelete=0 AND IsActive=1 union select -1,N'إختر نوع الصلاحية'" ></asp:SqlDataSource>

                                </div>

                            </div>

                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">فعال</label>
                                <div class="col-md-6">
                                    <asp:CheckBox ID="cbIsActive" runat="server" />
                                </div>
                            </div>

                            <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</asp:Content>

