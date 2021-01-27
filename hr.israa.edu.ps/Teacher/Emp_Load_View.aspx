<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Load_View.aspx.cs" Inherits="Teacher_Emp_Load_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">عرض  العبء الدراسي للموظفين</a></li>

        
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>عرض العبء الدراسي</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                   
                                </div>
                            </div>
                            <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 20%">اسم الموظف </th>
                               
                                    <th style="width: 10%; text-align: center">الحد الأقصى للعبء الدراسي </th>
                                    <th style="width: 12%; text-align: center">سعر الساعة </th>
                                    <th style="width: 10%; text-align: center">العبء الدراسي الفعلي</th>
                                    <th style="width: 10%; text-align: center">العبء الاضافي </th>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="LoadID" runat="server" Text='<%# Eval("Load_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>
                                        
                                            <td style="text-align: center"><span><%# Eval("Max_Load") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Hour_Price","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Actual_Load") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Extra_Load") %></span></td>
                                            <td style="text-align: center">
<%--                                                <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' />--%>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT Employee_TB.*,[Emp_Load_TB].* FROM Emp_Load_TB
                                     Inner Join [Employee_TB] on Emp_Load_TB.Emp_ID =Employee_TB.Emp_ID
                                  
                                      where Emp_Load_TB.IsDelete=0 order by Emp_Load_TB.Load_ID DESC"></asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>


          </div>
</asp:Content>

