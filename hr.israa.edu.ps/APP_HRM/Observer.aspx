<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Observer.aspx.cs" Inherits="APP_HRM_Observer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#Academic').addClass("active");
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha"></a>مراقبي الامتحانات </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <% if (Permissions.Contains("AddObserver"))
      { %>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>المراقبين   </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 20%">رقم الموظف </th>
                                    <th style="width: 20%">اسم الموظف </th>
                                    <th style="width: 20%; text-align: center">مراقب</th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="EmpID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <tr>

                                            <td><span><%# Eval("EmployeeNo") %></span></td>
                                            <td><span><%# Eval("Name") %></span></td>

                                            <td style="width: 20%; text-align: center">
                                                <asp:CheckBox ID="IsObserver" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsObserver").ToString())==true && Eval("IsObserver")!= DBNull.Value ? true : false  %>' />
                                            </td>
                                          
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="Select ID,(Select [IsraaHumanResource].dbo.[GetEmployeeNo](ID)) as EmployeeNo ,(Select [IsraaHumanResource].dbo.[GetEmployeeNo](ID) + ' - ' +[IsraaHumanResource].dbo.[GetEmployeeName](ID,3,0)) as [Name],(Select IsObserver From Employee_tb Where Emp_ID=this.ID) as IsObserver ,(Select Gender From Employee_tb Where Emp_ID=this.ID) as Gender From [IsraPermissions].dbo.Employee as this  Where ID>4 and [IsraaHumanResource].[dbo].[GetEmployeeDateEmployeeStatusID](ID,Getdate()) in (1,7,8,9,19,23,25) order by CAST(dbo.[GetEmployeeNo](ID) as int);"></asp:SqlDataSource>
                            </tbody>
                        </table>
                        <div style="text-align: center;">
                            <asp:Button ID="Button1" runat="server" Text="حفظ الكل" class="btn green" OnClick="Button1_Click" />
                            <asp:Button ID="btnExcel" runat="server" Text="طباعة اسماء المراقبين" class="btn blue" OnClick="btnExcel_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div>
    <%} %>
</asp:Content>

