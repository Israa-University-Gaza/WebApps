<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="SalaryDetailsAdd.aspx.cs" Inherits="Finanical_SalaryDetailsAdd" %>

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
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu6').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
                    <div class="col-md-7">
            <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>اضافة تفاصيل الراتب</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlEmployeeName" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,( [dbo].[GetEmployeeNo](Emp_ID)+ ' ' +[dbo].[GetEmployeeName](Emp_ID,3)) as DisplayName FROM [Employee_TB] where IsDelete=0 and Emp_ID not in (1,2,3,5) and [dbo].[GetEmployeeStatus](Emp_ID)=1041 union select -1,N' اختر الموظف '"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">نوع المصدر</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlSalaySourceType" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [SalarySourceType] union select -1,N'اختر المصدر' "></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label">قيمة المبلغ </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtSalaryValue" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">نوع العملة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCurrencyType" class="form-control" runat="server" DataSourceID="SqlDataSource2" CssClass="select2_category form-control" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select -1,N'اختر نوع العملة' "></asp:SqlDataSource>
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
            </div>
            <div class="col-md-5">
                <div class="portlet box purple">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الغاء تفعيل راتب الموظف</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                       <div class="form-group row">
                              <div class="col-md-6">
                                    <asp:DropDownList ID="ddlFilter2Employee" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,( [dbo].[GetEmployeeNo](Emp_ID)+ ' ' +[dbo].[GetEmployeeName](Emp_ID,3)) as DisplayName FROM [Employee_TB] where IsDelete=0 and Emp_ID not in (1,2,3,5) and [dbo].[GetEmployeeStatus](Emp_ID)=1041 union select -1,N' اختر الموظف '"></asp:SqlDataSource>
                                </div>
                             <div class="col-md-2">
                                <asp:Button ID="btnFilter2" runat="server" Text="تصفية" OnClick="btnFilter2_Click" class="btn btn-primary" />

                           </div>
                        </div>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 30%">اسم الموظف</th>
                                    <th style="width: 5%">رقم </th>
                                    <th style="width: 15%; text-align: center">المصدر</th>
                                    <th style="width: 15%; text-align: center">المبلغ</th>
                                  <th style="width: 15%; text-align: center">العملة</th>
                                    <th style="width: 20%; text-align: center">فعال</th>
                                  
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="lblDetailsID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <td><span><%# Eval("EmployeeName") %></span></td>
                                            <td><span><%# Eval("EmployeeNo") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("SalarySourceType") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("SalaryValue") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("CurrencyName") %></span></td>
                                             <td style="text-align: center"><span>
                                                 <asp:CheckBox ID="CBDeactivate" runat="server" Checked='<%# Eval("IsActive") %>' AutoPostBack="true" OnCheckedChanged="CBDeactivate_CheckedChanged" /></td>
                                     
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="GetEmployeeSalaryDetails" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlFilter2Employee"  Name="EmployeeID" PropertyName="Text" Type="String" />

                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        </div>
                    </div>
                    </div>
                
                </div>
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>تفاصيل راتب الموظف</div>
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
                                    <th style="width: 30%">اسم الموظف</th>
                                    <th style="width: 5%">رقم </th>
                                    <th style="width: 15%; text-align: center">البنك</th>
                                    <th style="width: 15%; text-align: center">صندوق - جامعة</th>
                                  <th style="width: 15%; text-align: center">صندوق - محول</th>
                                    <th style="width: 20%; text-align: center">صندوق - مكافأة</th>
                                  
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource22">
                                    <ItemTemplate>
                                        <tr>
                                            <td><span><%# Eval("EmployeeName") %></span></td>
                                            <td><span><%# Eval("EmployeeNo") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("BankSalaryValue") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("UnivSalaryValue") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("ExternalSalaryValue") %></span></td>
                                             <td style="text-align: center"><span><%# Eval("MotivationSalaryValue") %></span></td>
                                     
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                                <asp:SqlDataSource ID="SqlDataSource22" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="GetSalaryDetails" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlEmployeeName" Name="EmployeeID" PropertyName="SelectedValue" Type="Int16" DefaultValue="-1" />
                                        <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />

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

