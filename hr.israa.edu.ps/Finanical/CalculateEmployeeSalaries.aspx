<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="CalculateEmployeeSalaries.aspx.cs" Inherits="Finanical_CalculateEmployeeSalaries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu6').addClass("active open");
            $('#menu6_6 a').css("background-color", "#575757");
            $('#menu6 a span.arrow').addClass("open");
        });

        $(document).ready(function () {
            $('#chkAll').click(
             function () {
                 $("INPUT[type='checkbox']").attr('checked', $('#chkAll').is(':checked'));
             });
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
        <li><a href="#" class="font-ha">احتساب رواتب الكادر</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <% if (Permissions.Contains("SalaryCalculate"))
        { %>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>احتساب رواتب الكادر  </div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
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
                    <div class="form-group row">
                        <label class="col-md-1 control-label">البنك</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlBank" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM Emp_Sub_Constant WHERE Constant_ID=10 UNION SELECT -1,N'الكل '"></asp:SqlDataSource>
                        </div>
                        <label class="col-md-1 control-label">خاضع للكادر</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlCaderEmployee" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCaderEmployee_SelectedIndexChanged">
                                <asp:ListItem Value="-1">الكل</asp:ListItem>
                                <asp:ListItem Value="1">فعال</asp:ListItem>
                                <asp:ListItem Value="0">غير فعال</asp:ListItem>

                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="btnshikel" runat="server" Text=" كشف الرواتب" class="btn blue" OnClick="btnshikel_Click" />
                             <asp:Button ID="Button1" runat="server" Text=" اكسل الرواتب" class="btn purple" OnClick="btnExcelShikel_Click" />
                             <asp:Button ID="btnPrint" runat="server" Text="طباعة صرف رواتب" class="btn yellow" OnClick="btnPrint_Click" />
                        </div>
                    </div>
                </div>
                <div class="form-actions fluid">
                    <div class=" col-md-12">
                        <asp:Button ID="btnReCalculateAll" runat="server" Text="اعادة احتساب الرواتب" class="btn default" OnClick="btnReCalculateAll_Click" />
                        <asp:Button ID="BtnSave" runat="server" Text="احتساب رواتب الموظفين" class="btn green" OnClick="BtnSave_Click" />
                        <%--    
                        <asp:Button ID="btnPrint" runat="server" Text="طباعة صرف رواتب" class="btn yellow" OnClick="btnPrint_Click" />
                      --%>
                        <asp:Button ID="btnExcel" runat="server" Text=" اكسل رواتب الكادر" class="btn purple" OnClick="btnExcel_Click" />
                        <asp:Button ID="btnPrintAllSalaryForms" runat="server" Text=" طباعة استمارات الراتب المحددة" class="btn blue" OnClick="btnPrintAllSalaryForms_Click" />
                    </div>
                </div>

            </div>
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الرواتب المحتسبة</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <div class="form-group row">

                        <input id="chkAll" type="checkbox" style="margin-right: 17px" />
                        اختر الكل
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>

                                    <th style="width: 25%">اسم الموظف</th>
                                    <th style="width: 5%; text-align: center">الراتب الاساسي  </th>
                                    <th style="width: 5%; text-align: center">%علاوة طبيعة العمل </th>
                                    <th style="width: 5%; text-align: center">علاوة مؤهل </th>
                                    <th style="width: 5%; text-align: center">علاوة اجتماعية  </th>
                                    <th style="width: 5%; text-align: center">علاوة اضافية  </th>
                                    <th style="width: 5%; text-align: center">علاوة ادارية  </th>
                                    <th style="width: 5%; text-align: center">علاوات اخرى  </th>
                                    <th style="width: 5%; text-align: center">خصم شئون موظفين </th>
                                    <%--      <th style="width: 5%; text-align: center"> الراتب الخاضع للتقاعد  </th>--%>
                                    <th style="width: 5%; text-align: center">قسط التقاعد  </th>
                                    <th style="width: 5%; text-align: center">قسط التأمين الصحي  </th>
                                    <th style="width: 5%; text-align: center">اجمالي الراتب الخاضع للضريبة  </th>
                                    <th style="width: 5%; text-align: center">ضريبة الدخل</th>
                                    <th style="width: 5%; text-align: center">خصم سلفة </th>
                                    <th style="width: 5%; text-align: center">صافي الراتب</th>
                                    <th style="width: 5%; text-align: center"></th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource22">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>' Visible="false"></asp:Label>

                                            <td>
                                                <asp:CheckBox ID="CheckBox1" runat="server" /><span><%# Eval("EmployeeNo") %> <%# Eval("EmployeeName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("BasicSalary") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("WorkBouns") %>%</span></td>
                                            <td style="text-align: center"><span><%# Eval("QualificationBouns") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("SocialBouns") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("ExtraBouns") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("ManagmentBouns") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("OtherBouns") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("HRTotalDeduction") %></span></td>
                                            <%--                                        <td style="text-align: center"><span><%# Eval("UnderRetirementTotalSalary") %></span></td>--%>
                                            <td style="text-align: center"><span><%# Eval("RetirementInstallment") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("HealthInsuranceInstallment") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("UnderTaxTotalSalary") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("TaxValue") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("LoanDeduction") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("NetSalary") %></span></td>
                                            <td>
                                                <asp:LinkButton ID="lbReCalculate" runat="server" class="btn default btn-xs black" OnClick="lbReCalculate_Click"><i class="fa fa-edit"></i> اعادة الاحتساب</asp:LinkButton>
                                                <asp:LinkButton ID="lbSalaryForm" runat="server" class="btn default btn-xs blue" OnClick="lbSalaryForm_Click"><i class="fa fa-print"></i>  استمارة الراتب</asp:LinkButton>
                                            </td>

                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource22" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="GetEmployeeSalary" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlYear" PropertyName="SelectedValue" DefaultValue="-1" Name="Year" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlMonth" PropertyName="SelectedValue" DefaultValue="-1" Name="Month" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlCaderEmployee" PropertyName="SelectedValue" DefaultValue="-1" Name="IsCaderEmployee" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <div class="clearfix"></div>

                        <div class="col-md-10" style="float: left!important; direction: ltr!important;">
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
                    </div>
                    <% }
                        else
                        {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجد بيانات لعرضها</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>

        </div>
    </div>
    <%} %>
</asp:Content>

