<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="ChangeEmployeeNumber.aspx.cs" Inherits="APP_HRM_ChangeEmployeeNumber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
                $('.page-sidebar-menu li').removeClass("active").removeClass("open");
                $('.page-sidebar-menu li ul li').css("background-color", "");
                $('#menu2').addClass("active open");
                $('#menu2_2 a').css("background-color", "#575757");
                $('#menu2 a span.arrow').addClass("open");
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
        <li><a href="ChangeEmployeeNumber.aspx" class="font-ha">تغييرالرقم الوظيفي</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
         <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>تغييرالرقم الوظيفي</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlEmployee" runat="server" DataSourceID="SqlDataSource5" DataTextField="displayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetAllEmployeesName2"></asp:SqlDataSource>
                                </div>
                               </div>
                             <div class="form-group row">
                                <label class="col-md-2 control-label" style="text-align: right">الرقم الوظيفي الجديد </label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtNewEmployeeNo" runat="server" cssClass="form-control"></asp:TextBox>
                                </div>
                               </div>

                        </div>

                         <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click"  />
                               
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
         </div>
</asp:Content>

