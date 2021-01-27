<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeDepartment.aspx.cs" Inherits="APP_HRM_EmployeeDepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
         $('document').ready(function () {
             $('.page-sidebar-menu li').removeClass("active");
             $('#menu7').addClass("active");
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
        <li><a href="DepSection.aspx" class="font-ha"></a>الموظفين والدوائر</li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>  اسماء الموظفين </div>
                    <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                     <%--   <div class="input-group input-medium">
                            <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btnFilter_Click" class="btn btn-primary" />

                            </span>
                        </div>--%>

                             

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width:20%">اسم الموظف </th>
                                      <th style="width: 20%"> رقم الموظف </th>
                                  
                                    <th style="width: 20%"> الدائرة التابع لها</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("DisplayName") %></span></td>
                                              <td><span> <%# Eval("EmployeeNO") %></span></td>
                                                 <td>
                                                     <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" DataSourceID="SqlDataSource2" selectedValue=' <%# Eval("Department_ID") %>' DataTextField="Ar_Name" DataValueField="Department_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Department_ID], [Ar_Name] FROM [Department_TB] union select 0,N''">
                                    </asp:SqlDataSource></td>
                                           
                                            <td style="text-align: center">
                                              
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> حفظ</asp:LinkButton>
                                              
                                      
                                                 </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="SELECT * FROM [Employee_TB] where isDelete=0 and EmpCategoryID in (1,4)">
                                    
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                         <div style="text-align: center;">
                            
                       
                                <asp:Button ID="Button1" runat="server" Text="حفظ الكل"  OnClick="Button1_Click" class="btn green" />

                      
                        </div>
                    </div>
                </div>
            </div>
        </div>
     
      
     
    </div>
</asp:Content>

