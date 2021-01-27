<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="SalaryDeductionView.aspx.cs" Inherits="Finanical_SalaryDeductionView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />


    <script type="text/javascript" src="../assets/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/clockface.js"></script>
    <script type="text/javascript" src="../assets/datepicker/moment.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-datetimepicker.min.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script src="../assets/datepicker/quick-sidebar.js" type="text/javascript"></script>
    <script src="../assets/datepicker/demo.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js"></script>
    <script>
        jQuery(document).ready(function () {

            QuickSidebar.init(); // init quick sidebar
            Demo.init(); // init demo features
            ComponentsPickers.init();
        });
    </script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu6').addClass("active open");
            $('#menu6_4 a').css("background-color", "#575757");
            $('#menu6 a span.arrow').addClass("open");
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
        <li><a href="SalaryDeductionAddEdit.aspx" class="font-ha">عرض خصميات الراتب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> خصميات الراتب</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <div class="form-group row">
                              <label class="col-md-2 control-label"> اسم/رقم الموظف</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"  AutoPostBack="true" OnTextChanged="txtNameFilter_TextChanged"></asp:TextBox>
                                    </div>
                                 <label class="col-md-2 control-label">السنة</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlFilterYear" runat="server" CssClass="form-control" DataSourceID="SqlDataSource4" DataTextField="YearName" DataValueField="YearID"  AutoPostBack="true" OnSelectedIndexChanged="ddlFilterYear_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [YearID], [YearName] FROM [Year] union select -1,N'اختر السنة'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">الشهر</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlFilterMonth" runat="server" CssClass="form-control" placeholder="اختر الشهر"  AutoPostBack="true" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                                          <asp:ListItem Value="-1">اختر الشهر</asp:ListItem>
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
                                    </asp:DropDownList>
                                    </div>
                            </div>
                          <% if (ListView1.Items.Count > 0)
                               { %>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 20%">اسم الموظف</th>
                                    <th style="width: 3%">رقم </th>
                                    <th style="width: 10%">راتب البنك </th>
                                    <th style="width: 12%">صندوق جامعة </th>
                                    <th style="width: 12%">صندوق  محول </th>
                                    <th style="width: 5%; text-align: center">الشهر</th>
                                    <th style="width: 3%;  text-align: center">السنة</th>
                                    <th style="width: 15%; text-align: center">خصم شئون موظفين </th>
                                    <th style="width: 10%; text-align: center">خصم محول </th>
                                    <th style="width: 12%; text-align: center">العملة  </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource22">
                                    <ItemTemplate>
                                        <tr>
                                            <td><span><%# Eval("EmployeeName") %></span></td>
                                            <td><span><%# Eval("EmployeeNo") %></span></td>
                                             <td><span><%# Eval("BankSalaryValue") %></span></td>
                                             <td><span><%# Eval("UnivSalaryValue") %></span></td>
                                             <td><span><%# Eval("ExternalSalaryValue") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("monthName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Year") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("TotalHRSalaryDeduction") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("TotalExternalSalaryDeduction") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Currency") %></span></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource22" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="GetTotalSalaryDeduction1" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                       <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
                                       <asp:ControlParameter ControlID="ddlFilterYear" PropertyName="SelectedValue"  Name="Year" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlFilterMonth" PropertyName="SelectedValue" Name="Month" Type="Int32"></asp:ControlParameter>
                                   
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
                            <% }
                               else
                               {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد نتائج للبحث</strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                            <% } %>
                    </div>
                </div>
            </div>
</asp:Content>

