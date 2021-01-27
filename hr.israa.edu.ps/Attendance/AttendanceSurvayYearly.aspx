<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="AttendanceSurvayYearly.aspx.cs" Inherits="Attendance_AttendanceSurvayYearly" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha"> حصر الاجازات السنوية</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i> حصر الاجازات السنوية </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>
            </div>
        </div>
        <div class="portlet-body">
            <div class="clearfix"></div>
            <div class="form-group row">
                
                           <label class="col-md-1 control-label">السنة </label>
                <div class="col-md-2">
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                </div></div>

                <asp:Button ID="vac" runat="server" Text=" حصر الاجازات السنوية" OnClick="Button1_Click" class="btn green" />
             <asp:Button ID="printAll" runat="server" Visible="false" Text=" طباعة كشوفات الموظفين" OnClick="printAll_Click" class="btn green" />
        </div>
              
            <div class="clearfix"></div></div>

            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>كشوفات الموظفين </div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 20%">اسم الموظف  </th>
                                 <th style="width: 20%">رقم الموظف  </th>
                                    <th style="width: 17%;text-align:left"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" Visible="false" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("DisplayName") %></span></td>
                                            <td><%# Eval("EmployeeNO") %></td>
                                         
                                                <td style="text-align:left">
                                                
                                                    <asp:LinkButton ID="printReport" runat="server" class="btn default btn-xs green" OnClick="printReport_Click"><i class="fa fa-edit"></i>    طباعة الكشف</asp:LinkButton>
                                   
                                                   </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="Employee_TB_GetAll2" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="EmpCategory" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="Button2" runat="server" Text="طباعة تقرير"  class="btn black" />
            </div>
        

</asp:Content>

