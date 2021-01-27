<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="Salary_MonthOld.aspx.cs" Inherits="Finanical_Salary_MonthOld" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu6').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Salary_Month.aspx" class="font-ha">استمارة راتب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <% if (Permissions.Contains("SalaryCalculate"))
       { %>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>احتساب رواتب الموظفين  </div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="col-md-1 control-label">الشهر </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" CssClass="select2_category form-control" placeholder="اختر الشهر " OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
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
                        <label class="col-md-1 control-label">السنة </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control " AutoPostBack="true" OnTextChanged="DropDownList1_SelectedIndexChanged"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="Button1" runat="server" Text="احتساب رواتب الموظفين" OnClick="Salary_Eval" class="btn green" />
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="Button3" runat="server" Text=" طباعة استمارات الموظفين" class="btn green" OnClick="Button3_Click" Visible="false" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="col-md-12" runat="server" id="row">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>رواتب الموظفين </div>
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
                                    <th style="width: 10%;text-align:center">الراتب الاساسي</th>
                                    <th style="width: 12%;text-align:center">مجموع الاضافات</th>
                                    <th style="width: 12%;text-align:center">مجموع الخصومات</th>
                                    <th style="width: 12%;text-align:center">مجموع الفروقات</th>
                                    <th style="width: 12%;text-align:center">اجمالي الدخل  </th>
                                    <th style="width: 5%;text-align:center">ضريبة </th>
                                    <th style="width: 17%;text-align:left"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="SalaryID" runat="server" Text='<%# Eval("Salary_ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("DisplayName") %></span></td>
                                            <td style="text-align:center"><%# Eval("Main_Salary") %></td>
                                                <td style="text-align:center"><%# Eval("Plus_Total") %></td>
                                                <td style="text-align:center"><%# Eval("Discount_Total") %>  </td>
                                                <td style="text-align:center"><%# Eval("Differences_Total") %>  </td>
                                                <td style="text-align:center"><%# Eval("Salary_Total") %>  </td>
                                                <td style="text-align:center"><%# Eval("TaxValue") %>  </td>
                                                <td style="text-align:left">
                                                    <% if (Permissions.Contains("SalaryFormView"))
                                                       { %>
                                                    <asp:LinkButton ID="printReport" runat="server" class="btn default btn-xs green" OnClick="printReport_Click"><i class="fa fa-edit"></i>    استمارة الراتب</asp:LinkButton>
                                                   <%-- <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i>   تعديل</asp:LinkButton>--%>
                                                    <%} %> </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="EmpSalaryGetAll" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Month" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="Year" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="Button2" runat="server" Text="طباعة كشف الرواتب" OnClick="Button2_Click" class="btn black" />
                   <asp:Button ID="Button4" runat="server" Text="طباعة كشف الخصميات" OnClick="Button4_Click" class="btn black" />
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>

