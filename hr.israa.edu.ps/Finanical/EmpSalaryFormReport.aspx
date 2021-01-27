<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="EmpSalaryFormReport.aspx.cs" Inherits="Finanical_EmpSalaryFormReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu6').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="EmpSalaryFormReport.aspx" class="font-ha"> استمارة راتب الموظف</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>  استمارة راتب الموظف  </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                            
                                </div>
                            </div>
                          <div class="portlet-body">
                        
                                 <div class="form-group">
                                <label class="col-md-3 control-label">الشهر </label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" class="form-control"  CssClass="select2_category form-control" placeholder="اختر الشهر "  >
                                       <asp:ListItem></asp:ListItem>
                                        <asp:ListItem Value="1">يناير</asp:ListItem>
                                        <asp:ListItem Value="2">فبراير</asp:ListItem>
                                        <asp:ListItem Value="3">مارس</asp:ListItem>
                                        <asp:ListItem Value="4">ابريل</asp:ListItem>
                                         <asp:ListItem Value="5">مايو</asp:ListItem>
                                        <asp:ListItem Value="6">يونيو</asp:ListItem>
                                        <asp:ListItem Value="7">يوليو</asp:ListItem>
                                        <asp:ListItem Value="8">أغسطس</asp:ListItem>
                                           <asp:ListItem Value="9">سبتمبر</asp:ListItem>
                                        <asp:ListItem Value="10">أكتوبر</asp:ListItem>
                                        <asp:ListItem Value="11">نوفمبر</asp:ListItem>
                                        <asp:ListItem Value="12">ديسمبر</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                              
                             </div>
                          </div>
                         
                               <div class="clearfix"></div>
                                <div class="form-group">
                               
                                <label class="col-md-3 control-label">السنة </label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            
                              <div class="clearfix"></div>

                               <div class="form-group">
    <asp:Button ID="Button1" runat="server" Text="عرض  استمارة راتب الموظف" OnClick="Button1_Click"  class="btn green"  />
                           </div>
                    </div>
          </div>
</asp:Content>

