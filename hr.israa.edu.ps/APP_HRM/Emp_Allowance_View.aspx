<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Allowance_View.aspx.cs" Inherits="APP_HRM_Emp_Allowance_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">عرض مستحقات وخصميات للموظف </a></li>
    </ul>
 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> بدلات الموظف </div>
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
                               
                                    <th style="width: 10%; text-align: center">نوع البدل</th>
                                    <th style="width: 12%; text-align: center">تاريخ الاحتساب</th>
                                    <th style="width: 10%; text-align: center">قيمة البدل</th>
                                    <th style="width: 10%; text-align: center">نسبة البدل</th>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="AllowanceID" runat="server" Text='<%# Eval("Allowance_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>
                                        
                                            <td style="text-align: center"><span><%# Eval("Allowance_Type") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Allowance_Start_Date","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Allowance_Value") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Allowance_Rate") %></span></td>
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
                                    SelectCommand="SELECT Employee_TB.*,Allowance_TB.*,Allowance_Type_TB.*  FROM [Allowance_TB]
                                     Inner Join [Employee_TB] on Allowance_TB.Emp_ID =Employee_TB.Emp_ID
                                    Inner join [Allowance_Type_TB] on Allowance_Type_TB.Allowance_Type_ID=Allowance_TB.Allowance_Type_ID
                                      where Allowance_TB.IsDelete=0 AND Employee_TB.Emp_ID=@Emp_ID  order by Allowance_TB.Allowance_ID DESC">

                                     <SelectParameters>
   <asp:SessionParameter SessionField="Emp_ID"  Name="Emp_ID"  Type="Int16" />                                            </SelectParameters>
                                        </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

 <div class="row">
        <div class="col-md-12">
            <div class="portlet box yellow">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> علاوات الموظف </div>
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
                               
                                    <th style="width: 10%; text-align: center">نوع العلاوة</th>
                                    <th style="width: 12%; text-align: center">تاريخ الاحتساب</th>
                                    <th style="width: 10%; text-align: center">قيمة العلاوة</th>
                                    <th style="width: 10%; text-align: center">نسبة العلاوة</th>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <asp:Label ID="BounsID" runat="server" Text='<%# Eval("Bouns_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>
                                        
                                            <td style="text-align: center"><span><%# Eval("Bouns_Type") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Bouns_Start_Date","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Bouns_Value") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Bouns_Rate") %></span></td>
                                            <td style="text-align: center">
<%--                                                <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' />--%>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT Employee_TB.*,Bouns_TB.*,Bouns_Type_TB.*  FROM [Bouns_TB]
                                     Inner Join [Employee_TB] on Bouns_TB.Emp_ID =Employee_TB.Emp_ID
                                    Inner join [Bouns_Type_TB] on Bouns_Type_TB.Bouns_Type_ID=Bouns_TB.Bouns_Type_ID
                                      where Bouns_TB.IsDelete=0  and Employee_TB.Emp_ID=@Emp_ID order by Bouns_TB.Bouns_ID DESC">
                                      <SelectParameters>
                                          <asp:SessionParameter SessionField="Emp_ID"  Name="Emp_ID"  Type="Int16" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box purple">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> جزاءات الموظف </div>
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
                               
                                    <th style="width: 10%; text-align: center">نوع الجزاء</th>
                                    <th style="width: 12%; text-align: center">تاريخ الاحتساب</th>
                                    <th style="width: 10%; text-align: center">قيمة الجزاء</th>
                                    <th style="width: 10%; text-align: center">نسبة الجزاء</th>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <asp:Label ID="DeductionID" runat="server" Text='<%# Eval("Deduction_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>
                                        
                                            <td style="text-align: center"><span><%# Eval("Deduction_Type") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Deduction_Start_Date","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Deduction_Value") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Deduction_Rate") %></span></td>
                                            <td style="text-align: center">
                                            </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click3"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click3" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT Employee_TB.*,Deduction_TB.*,Deduction_Type_TB.*  FROM [Deduction_TB]
                                     Inner Join [Employee_TB] on Deduction_TB.Emp_ID =Employee_TB.Emp_ID
                                    Inner join [Deduction_Type_TB] on Deduction_Type_TB.Deduction_Type_ID=Deduction_TB.Deduction_Type_ID
                                      where Deduction_TB.IsDelete=0 AND Employee_TB.Emp_ID=@Emp_ID order by Deduction_TB.Deduction_ID DESC">
                                  <SelectParameters>
   <asp:SessionParameter SessionField="Emp_ID"  Name="Emp_ID"  Type="Int16" />                                            </SelectParameters>
                                        </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> مكافآت الموظف </div>
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
                               
                                    <th style="width: 10%; text-align: center">نوع المكافأة</th>
                                    <th style="width: 12%; text-align: center">تاريخ الاحتساب</th>
                                    <th style="width: 10%; text-align: center">قيمة المكافأة</th>
                                    <th style="width: 10%; text-align: center">نسبة المكافأة</th>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <asp:Label ID="MotivationID" runat="server" Text='<%# Eval("Motivation_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>
                                        
                                            <td style="text-align: center"><span><%# Eval("Motivation_Type") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Motivation_S_Date","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Motivation_Value") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Motivation_Rate") %></span></td>
                                            <td style="text-align: center">
                                            </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click4"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click4" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT Employee_TB.*,Motivation_TB.*,Motivation_Type_TB.*  FROM [Motivation_TB]
                                     Inner Join [Employee_TB] on Motivation_TB.Emp_ID =Employee_TB.Emp_ID
                                    Inner join [Motivation_Type_TB] on Motivation_Type_TB.Motivation_Type_ID=Motivation_TB.Motivation_Type_ID
                                      where Motivation_TB.IsDelete=0 AND Employee_TB.Emp_ID=@Emp_ID order by Motivation_TB.Motivation_ID DESC">
                                  <SelectParameters>
   <asp:SessionParameter SessionField="Emp_ID"  Name="Emp_ID"  Type="Int16" />                                            </SelectParameters>
                                        </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> عقوبات الموظف </div>
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
                               
                                    <th style="width: 10%; text-align: center">نوع العقوبة</th>
                                    <th style="width: 12%; text-align: center">تاريخ الاحتساب</th>
                                  
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
                                    <ItemTemplate>
                                        <asp:Label ID="PenatlyID" runat="server" Text='<%# Eval("Penalty_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>
                                        
                                            <td style="text-align: center"><span><%# Eval("Penalty_Type") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Penalty_Date","{0:yyyy/MM/dd}") %></span></td>
                                           
                                            <td style="text-align: center">
                                            </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click5"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click5" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT Employee_TB.*,Penalty_TB.*,Penalty_Type_TB.*  FROM [Penalty_TB]
                                     Inner Join [Employee_TB] on Penalty_TB.Emp_ID =Employee_TB.Emp_ID
                                    Inner join [Penalty_Type_TB] on Penalty_Type_TB.Penalty_Type_ID=Penalty_TB.Penalty_Type_ID
                                      where Penalty_TB.IsDelete=0  AND Employee_TB.Emp_ID=@Emp_ID order by Penalty_TB.Penalty_ID DESC">
                                      <SelectParameters>
   <asp:SessionParameter SessionField="Emp_ID"  Name="Emp_ID"  Type="Int16" />                                            </SelectParameters>
                                        </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

