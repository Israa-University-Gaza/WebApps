<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeTaxValueAddEdit.aspx.cs" Inherits="Finanical_EmployeeTaxValueAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
                $('.page-sidebar-menu li').removeClass("active").removeClass("open");
                $('.page-sidebar-menu li ul li').css("background-color", "");
                $('#menu6').addClass("active open");
                $('#menu6_7 a').css("background-color", "#575757");
                $('#menu6 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">ادخال ضريبة الدخل للموظف</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12 ">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                </div>
            </div>
            <div class="portlet-body form">

                <div class="form-body">
                    <div class="form-group row">
                        <label class="col-md-1 control-label">السنة</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" DataSourceID="SqlDataSource4" DataTextField="YearName" DataValueField="YearID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [YearID], [YearName] FROM [Year] union select -1,N'اختر السنة'"></asp:SqlDataSource>
                        </div>
                        <label class="col-md-1 control-label">الشهر</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" CssClass="form-control" placeholder="اختر الشهر">
                                <asp:ListItem Value="-1">اختر الشهر</asp:ListItem>
                                <asp:ListItem Value="1">يناير</asp:ListItem>
                                <asp:ListItem Value="2">فبراير</asp:ListItem>
                                <asp:ListItem Value="3">مارس</asp:ListItem>
                                <asp:ListItem Value="4">ابريل</asp:ListItem>
                                <asp:ListItem Value="5">مايو</asp:ListItem>
                                <asp:ListItem Value="6">يوليو</asp:ListItem>
                                <asp:ListItem Value="7">يونيو</asp:ListItem>
                                <asp:ListItem Value="8">أغسطس</asp:ListItem>
                                <asp:ListItem Value="9">سبتمبر</asp:ListItem>
                                <asp:ListItem Value="10">أكتوبر</asp:ListItem>
                                <asp:ListItem Value="11">نوفمبر</asp:ListItem>
                                <asp:ListItem Value="12">ديسمبر</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlEmployeeName" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,( [dbo].[GetEmployeeNo](Emp_ID)+' '+[dbo].[GetEmployeeName](Emp_ID,4)) as DisplayName FROM [Employee_TB] where IsDelete=0 and Emp_ID not in (1,2,3,5) union select -1,N' اختر الموظف '"></asp:SqlDataSource>
                        </div>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 20%">اسم الموظف</th>
                                <th style="width: 15%; text-align: center">الراتب الخاضع للضريبة</th>
                                <th style="width: 15%; text-align: center">قيمة الضريبة</th>

                                <th style="width: 5%"></th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("EmployeeTaxValueID") %>' Visible="false"></asp:Label>
                                         <asp:Label ID="EmpID" runat="server" Text='<%# Eval("EmployeeID") %>' Visible="false"></asp:Label>
                                        <td><span><%# Eval("EmployeeName") %></span> </td>
                                        <td><span><%# Eval("UnderTaxTotalSalary") %></span> </td>
                                        <td>
                                            <asp:TextBox ID="TaxValue" runat="server" CssClass="form-control" Text='<%# Eval("EmployeeTaxValue") %>'></asp:TextBox></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="Save" runat="server" Text="حفظ" OnClick="Save_Click" CssClass="btn default btn-xs green" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeeUnderTaxTotalSalaryValue" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlYear" PropertyName="SelectedValue" DefaultValue="-1" Name="Year" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlMonth" PropertyName="SelectedValue" DefaultValue="-1" Name="Month" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlEmployeeName" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>

                    </table>
                    <div class="clearfix"></div>

                    <div class="col-md-10" style="float: right!important; direction: ltr!important;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="50" PagedControlID="ListView1" class="pager col-md-6">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link"
                                    PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false"
                                    ShowPreviousPageButton="true" />
                                <asp:NumericPagerField ButtonType="Link" />
                                <asp:NextPreviousPagerField ButtonType="Link" NextPageText=" التالي" ShowFirstPageButton="false"
                                    ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                            </Fields>

                        </asp:DataPager>
                    </div>
                    <div class="clearfix"></div>
                    <% } %>
                    <%  else
                        { %>

                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لايوجد بيانات لعرضها</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>

                    <%  } %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

