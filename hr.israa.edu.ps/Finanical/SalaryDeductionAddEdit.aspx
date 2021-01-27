<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="SalaryDeductionAddEdit.aspx.cs" Inherits="Finanical_SalaryDeductionAddEdit" %>

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
                $('#menu6_3 a').css("background-color", "#575757");
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
        <li><a href="SalaryDeductionAddEdit.aspx" class="font-ha">اضافة خصميات الراتب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>اضافة خصميات الراتب</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                 <label class="col-md-1 control-label">السنة</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="YearName" DataValueField="YearID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [YearID], [YearName] FROM [Year] union select -1,N'اختر السنة'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">الشهر</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control" placeholder="اختر الشهر ">
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
                                     <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlEmployeeName" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,( [dbo].[GetEmployeeNo](Emp_ID)+ ' ' +[dbo].[GetEmployeeName](Emp_ID,4)) as DisplayName FROM [Employee_TB] where IsDelete=0 and Emp_ID not in (1,2,3,5)  union select -1,N' اختر الموظف '"></asp:SqlDataSource>
                                </div>
                            </div>
                          <div class="form-group row">
                                      <label class="col-md-1 control-label">النوع </label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlDeductionType" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Deduction_Type" DataValueField="Deduction_Type_ID">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Deduction_Type_ID], [Deduction_Type] FROM [Deduction_Type_TB] union select -1,N' اختر نوع الخصم '"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label"> المبلغ </label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtSalaryValue" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">نوع العملة</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCurrencyType" class="form-control" runat="server" DataSourceID="SqlDataSource2" CssClass="select2_category form-control" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select -1,N'اختر نوع العملة' "></asp:SqlDataSource>
                                </div>
                            </div>
                                 <div class="form-group row">
                                     <label class="col-md-1 control-label">تفاصيل الخصم </label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtDetails" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                     </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="BtnSave" runat="server" Text="حفظ" class="btn green" OnClick="BtnSave_Click" />
                                <asp:Button ID="BtnCancel" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="BtnCancel_Click" />
                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>تفاصيل خصميات الراتب</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                       <div class="form-group row">
                           <asp:Label ID="lblDeductionID" runat="server" Text=""></asp:Label>
                              <label class="col-md-2 control-label"> اسم/رقم الموظف</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"  AutoPostBack="true" OnTextChanged="txtNameFilter_TextChanged"></asp:TextBox>
                                    </div>
                                 <label class="col-md-2 control-label">السنة</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlFilterYear" runat="server" CssClass="form-control" DataSourceID="SqlDataSource4" DataTextField="YearName" DataValueField="YearID"  AutoPostBack="true" OnSelectedIndexChanged="ddlFilterYear_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [YearID], [YearName] FROM [Year] union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">الشهر</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlFilterMonth" runat="server" CssClass="form-control" placeholder="اختر الشهر"  AutoPostBack="true" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                                          <asp:ListItem Value="-1">الكل</asp:ListItem>
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
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 20%">اسم الموظف</th>
                                    <th style="width: 5%">رقم الموظف</th>
                                    <th style="width: 5%; text-align: center">الشهر</th>
                                    <th style="width: 5%;  text-align: center">السنة</th>
                                    <th style="width: 15%; text-align: center">نوع الخصم</th>
                                    <th style="width: 5%; text-align: center">المبلغ </th>
                                    <th style="width: 20%; text-align: center">العملة </th>
                                     <th style="width: 15%; text-align: center"> عن تاريخ</th>
                                      <th style="width: 5%; text-align: center">ع. الايام </th>
                                       <th style="width: 5%; text-align: center">تفاصيل </th>
                                      <th style="width: 5%; text-align: center"> </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource22">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <td><span><%# Eval("EmployeeName") %></span></td>
                                            <td><span><%# Eval("EmployeeNo") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("monthName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Year") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("DeductionType") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("DeductionValue") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Currency") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Date") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("DayCount") %></span></td>
                                             <td style="text-align: center"><span><%# Eval("Details") %></span></td>
                                             <td style="text-align: center"><asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تعديل </asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click"><i class="fa fa-delete"></i> حذف </asp:LinkButton>
                                       </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource22" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="GetSalaryDeduction" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                       <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="ddlFilterYear" PropertyName="SelectedValue" DefaultValue="-1" Name="Year" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlFilterMonth" PropertyName="SelectedValue" DefaultValue="-1" Name="Month" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <div class="clearfix"></div>

                        <div class="col-md-10" style="float: left!important; direction: ltr!important;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="200" PagedControlID="ListView1" class="pager col-md-6">
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>

