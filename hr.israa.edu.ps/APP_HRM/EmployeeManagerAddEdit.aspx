<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeManagerAddEdit.aspx.cs" Inherits="APP_HRM_MainSalaryAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu3').addClass("active");
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
        <li><a href="MainSalaryAddEdit.aspx" class="font-ha"></a>المسؤول المباشر </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <% if (Permissions.Contains("JobTitleView"))
       { %>
    <div class="row">

        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>المسؤول المباشر  </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <div class="input-group input-medium">
                            <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btnFilter_Click" class="btn btn-primary" />

                            </span>
                        </div>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 20%">اسم الموظف </th>
                                    <th style="width: 20%">رقم الموظف </th>
                                    <th style="width: 20%">المسؤول المباشر</th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("DisplayName") %></span></td>
                                            <td><span><%# Eval("EmployeeNO") %></span></td>
                                            <td>
                                                <asp:DropDownList ID="ddlManager" runat="server" DataSourceID="SqlDataSource2" CssClass="select2_category form-control" DataTextField="DisplayName" DataValueField="Emp_ID" SelectedValue=' <%# (Eval("ManagerID").ToString() !="" ||Eval("ManagerID") !=DBNull.Value )?Eval("ManagerID"):"-1" %>'></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,([dbo].[GetEmployeeName](Emp_ID,3)) as DisplayName  FROM [Employee_TB] where  Emp_ID not in (1,2,3,4,5)  union select -1,N'  اختر المسؤول المباشر' "></asp:SqlDataSource>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> حفظ</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="SELECT Emp_ID,([dbo].[GetEmployeeName](Emp_ID,3)) as DisplayName ,ManagerID,EmployeeNO FROM [Employee_TB] where isDelete=0 and Emp_Status_ID=1041 and Emp_ID not in (1,2,3,4,5)  and ([dbo].[GetEmployeeName](Emp_ID,3)) like '%'+@txtNameFilter +'%' order by EmployeeNo">

                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtNameFilter" PropertyName="Text" Name="txtNameFilter" DefaultValue="%"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <div style="text-align: center;">
                            <asp:Button ID="Button1" runat="server" Text="حفظ الكل" OnClick="Button1_Click" class="btn green" />
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div>
    <%} %>
</asp:Content>

