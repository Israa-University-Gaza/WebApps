<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Profile_Veiw.aspx.cs" Inherits="APP_HRM_Emp_Profile_Veiw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
         $('document').ready(function () {
             $('.page-sidebar-menu li').removeClass("active");
             $('#menu2').addClass("active");
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
          <li><a href="Emp_Profile_Veiw.aspx" class="font-ha">عرض صفحات الموظفين</a></li>
       
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <% if (Permissions.Contains("ProfileView"))
        { %>
      <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>عرض صفحات الموظفين</div>
                    <div class="tools">
                         <a href="javascript:;" class="collapse"></a>
                                  
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <div class="input-group input-medium">
                            <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btn1Filter_Click" class="btn btn-primary" />

                            </span>

                            
                        </div >
                        <div class="form-group">
                         <asp:Button ID="Button1" runat="server" Width="240px" Text="طباعة اسماء الموظفين" OnClick="Button1_Click" class="btn green" />
                        </div>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 30%">اسم الموظف</th>
                                    
                                    <th style="width: 10%; text-align: center">الرقم الوظيفي </th>
                                    <th style="width: 30%; text-align: center">الانتقال الى الصفحة الشخصية للموظف  </th>
                                <th style="width: 30%; text-align: center">السيرة الذاتية للموظف  </th>
<%--                                     <th style="width: 30%; text-align: center">  تغيير الرقم الوظيفي  </th>--%>
                                </tr>
                            </thead>

                            <tbody>

                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span> <%# Eval("DisplayName") %></span></td>
                                   
                                            <td style="text-align: center"><span><%# Eval("EmployeeNO") %></span></td>
                                               <td style="text-align: center"> <asp:LinkButton ID="LinkButton1" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> الانتقال الى الصفحة الشخصية</asp:LinkButton></td>
                                              <td style="text-align: center"> <asp:LinkButton ID="LinkButton2" runat="server" class="btn default btn-xs black" OnClick="LinkButton2_Click"><i class="fa fa-edit"></i> السيرة الذاتية للموظف</asp:LinkButton></td>
                                         <%--      <td style="text-align: center"> <asp:LinkButton ID="LinkButton3" runat="server" class="btn default btn-xs black" OnClick="LinkButton3_Click"><i class="fa fa-edit"></i>   تغيير رقم الموظف</asp:LinkButton></td>--%>

                                           
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT [dbo].[GetEmployeeName](Emp_ID,4) as DisplayName,[dbo].[GetEmployeeNo](Emp_ID) as EmployeeNO, Emp_ID FROM [Employee_TB] WHERE ([dbo].[GetEmployeeName](Emp_ID,4) like '%' + @Name + '%') and IsDelete=0 and Emp_ID not in (1,2,3,5)  order by EmployeeNo ">

                                     <SelectParameters>
                                        <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
                                    </SelectParameters>


                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
     
      <%} %>  
</asp:Content>

