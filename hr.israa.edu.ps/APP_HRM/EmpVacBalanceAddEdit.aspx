<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="EmpVacBalanceAddEdit.aspx.cs" Inherits="APP_HRM_EmpVacBalanceAddEdit" %>

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
            $('#menu3').addClass("active");
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
        <li><a href="#" class="font-ha">رصيد الاجازات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <% if (Permissions.Contains("AddEmpVacBalance"))
       { %>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>رصيد الاجازات للموظف</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlEmployeeName" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployeeName_SelectedIndexChanged" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:isra3 %>' SelectCommand="SELECT ID,([HumanResources].[dbo].[GetEmployeeNo](ID) +'	'+[HumanResources].[dbo].[GetEmployeeName](ID,4)) as DisplayName FROM [Employee]  where IsDelete=0 and ID not in (1,2,3,5) union select -1,N'  '"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">نوع الاجازة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="VacationTypeID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Vacation_Type" DataValueField="Vacation_Type_ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Vacation_Type_ID,Vacation_Type FROM [Vacation_Type_TB]   union select 0,N'  ' "></asp:SqlDataSource>

                                </div>
                               
                            </div>

                            <div class="clearfix"></div>
                                  <div class="form-group">
                               <label class="col-md-2 control-label">الرصيد </label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="balance" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                      <label class="col-md-2 control-label">  الرصيد المستنفذ </label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="Consumer" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                     <label class="col-md-2 control-label">  الرصيد المرحل </label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="PostPone" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                             <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">تاريخ بدء الرصيد </label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="SDate" runat="server" placeholder="ادخل تاريخ بدء الرصيد" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                    </div>
                                </div>
                                <label class="col-md-2 control-label">تاريخ انتهاء الرصيد </label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="FDate" runat="server" placeholder="ادخل  تاريخ انتهاء الرصيد" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="form-actions fluid">
                                <div class="col-md-offset-3 col-md-9">
                                    <asp:Button ID="BtnSave" runat="server" Text="حفظ" class="btn green" OnClick="BtnSave_Click" />
                                    <asp:Button ID="Button2" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button2_Click" />
                                </div>
                            </div>
                    
                    </div>
                </div>

            </div>





            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>أرصدة الاجازات للموظف</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                          <div class="form-group row">
                               <label class="col-md-2 control-label">بحث باسم/رقم الموظف </label>
                              <div class="col-md-4">
                            <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"></asp:TextBox>
                                  </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btnFilter_Click" class="btn btn-primary" />
                                <asp:Button ID="btnExcel" runat="server" Text="تصدير لملف اكسل" OnClick="btnExcel_Click" class="btn green" />

                            </div>
                        </div>
                        
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 300px">اسم الموظف</th>
                                    <th style="width: 3%; text-align: center">نوع الاجازة </th>
                                    <th style="width: 3%; text-align: center"> بدء الرصيد</th>
                                    <th style="width: 3%; text-align: center"> انتهاء الرصيد</th>
                                    <th style="width: 2%; text-align: center"> مرحل</th>
                                    <th style="width: 3%; text-align: center">الرصيد السنوي</th>
                                     <th style="width: 3%; text-align: center">الرصيد الكلي</th>
                                    <th style="width: 3%; text-align: center">اجازات مستنفذ</th>
                                     <th style="width: 3%; text-align: center">غياب مستنفذ</th>
                                     <th style="width: 5%; text-align: center">تاخير وتحركات مستنفذ</th>

                                    <th>خصم تاخير </th>
                                    <th>خصم غياب</th>
                                    <th>خصم اجازة </th>

                                     <th style="width: 2%; text-align: center"> مستنفذ</th>
                                    <th style="width: 2%; text-align: center"> متبقى</th>
                                <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource22">
                                    <ItemTemplate>
                                        <tr>
                                            <td><span><%# Eval("EmployeeNo") + " "+ Eval("displayName") %></span>
                                                <asp:Label ID="VacationBalanceID" runat="server" Text='<%# Eval("Vacation_Balance_ID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                            </td>
                                            <td style="text-align: center"><span><%# Eval("Vacation_Type") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Balance_Start_Date","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Balance_End_Date","{0:yyyy/MM/dd}") %></span></td>
                                             <td style="text-align: center"><span><%# Eval("PostPoneBalance") %></span></td>
                                             <td style="text-align: center"><span><%# Eval("Total_Balance") %></span></td>
                                             <td style="text-align: center"><span><%# Eval("Total") %></span></td>
                                          <td style="text-align: center"><span><%# Eval("VacationDays") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("AbsDays") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("DelayHours") %></span></td>

                                              <td style="text-align: center"><span><%# Eval("DeductionDelayHours") %></span></td>
                                              <td style="text-align: center"><span><%# Eval("DeductionAbsDays") %></span></td>
                                              <td style="text-align: center"><span><%# Eval("DeductionVacation") %></span></td>

                                              <td style="text-align: center"><span><%# Eval("Consumer_Balance") %></span></td>
                                            <td style="text-align: center"><span><%# Subtract(Convert.ToInt16(Eval("Total_Balance"))+ Convert.ToInt16(Eval("PostPoneBalance")) , Convert.ToInt16(Eval("Consumer_Balance"))) %> </span></td>
                                            <td>

                                <%--  <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                    <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbDelete_Click"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>--%>
                                                <asp:LinkButton ID="lbSurvay" runat="server" class="btn default btn-xs blue" OnClick="lbSurvay_Click"><i class="fa fa-book"></i> حصر</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                                <asp:SqlDataSource ID="SqlDataSource22" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="EmpVacationBalance" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlEmployeeName" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" DefaultValue="-1" />
                                         <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
                                   
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                 
                           <div class="clearfix"></div>

                    <div class="col-md-10" style="float: left!important; direction: ltr!important;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="30" PagedControlID="ListView1" class="pager col-md-6">
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
    <%} %>
</asp:Content>

