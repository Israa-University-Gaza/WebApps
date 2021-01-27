<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="VacationBalanceTrans.aspx.cs" Inherits="APP_HRM_VacationBalanceTrans" %>

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
        <li><a href="VacationBalanceTrans.aspx" class="font-ha"></a>حركة رصيد الاجازات  </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>حركة رصيد الاجازات  </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                        <div class="form-group row">
                            <label class="control-label col-md-2">تصنيف الموظف  : </label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlEmployeeCat" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource12" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [Name] FROM TypeCategory where TypeID=1 union select-1,N'الكل' order by ID "></asp:SqlDataSource>
                            </div>
                            <label class="control-label col-md-2">نوع العقد: </label>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlContractTypeID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource6" DataTextField="Contract_Type" DataValueField="Contract_Type_ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Contract_Type_ID], [Contract_Type] FROM Contract_Type_TB union select-1,N'الكل' "></asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlSubContractType" placeholder="ادخل نوع العقد مخصص" runat="server" DataSourceID="SqlDataSource13" DataTextField="ContractSubName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,ContractSubName FROM [ContractSubType] where Contract_Type_ID=@Type union select -1,N'الكل'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="7" Name="Type"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-2">تصنيف دوام الموظف  : </label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlEmpCategoryID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpCategoryID_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [CategoryName] FROM EmpCategory where ID=4 union select-1,N'الكل' order by ID "></asp:SqlDataSource>

                            </div>
                            <label class="control-label col-md-2">حالة الموظف: </label>
                            <div class="col-md-2">
                                <asp:DropDownList ID="Empstatus" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="Empstatus_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select -1,N' الكل'">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="7" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlEmpCategoryID2" runat="server" CssClass="select2_category form-control" AutoPostBack="true">
                                    <asp:ListItem Value="-1">الكل</asp:ListItem>
                                    <asp:ListItem Value="1">معفي من التوقيع</asp:ListItem>
                                    <asp:ListItem Value="2">غير معفي من التوقيع</asp:ListItem>
                                    <asp:ListItem Value="3">داوم خارج الجامعة</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlEmpTermenateReason" runat="server" CssClass="select2_category form-control" AutoPostBack="true" Visible="false" DataSourceID="SqlDataSource17" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource17" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1030 Union Select -1,N'الكل'"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">من تاريخ </label>
                            <div class="col-md-4">
                                <div class="input-icon">
                                    <i class="fa fa-calendar"></i>
                                    <asp:TextBox ID="DateFrom" runat="server" AutoPostBack="true" OnTextChanged="date_TextChanged" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">الى تاريخ </label>
                            <div class="col-md-4">
                                <div class="input-icon">
                                    <i class="fa fa-calendar"></i>
                                    <asp:TextBox ID="DateTo" runat="server" AutoPostBack="true" OnTextChanged="date_TextChanged" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">


                            <label class="col-md-2 control-label">اسم الموظف </label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlEmployeeName" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployeeName_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSource3" DataTextField="DisplayName" DataValueField="Emp_ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetAllEmployeesName" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlEmpCategoryID" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpCategoryID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlEmpCategoryID2" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpCategoryID2" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="Empstatus" PropertyName="SelectedValue" DefaultValue="" Name="EmpStatusID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlEmpTermenateReason" Name="CTermenateReasonID " PropertyName="SelectedValue" Type="Int16" DefaultValue="-1" />
                                        <asp:ControlParameter ControlID="ddlEmployeeCat" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeCatID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="-1" Name="ContractTypeID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlSubContractType" PropertyName="SelectedValue" DefaultValue="-1" Name="SubContractTypeID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-actions fluid">
                    <div class="col-md-offset-3 col-md-9">
                        <asp:Button ID="BtnSave" runat="server" Text="حركة رصيد الاجازات" class="btn green" OnClick="BtnSave_Click" />
                        <%--<asp:Button ID="BtnPrint" runat="server" Text="تقرير حركة رصيد الموظف " class="btn blue" OnClick="BtnPrint_Click" />
                        <asp:Button ID="BtnAllBalanceReport" runat="server" Text="  تقرير أرصدة الأجازات للموظفين" class="btn yellow" OnClick="BtnAllBalanceReport_Click" />--%>
                    </div>
                </div>
            </div>
        </div>
        <% if (ListView1.Items.Count > 0)
            { %>
        <div class="col-md-7">
            <%}
                else
                { %>
            <div class="col-md-12">
                <%} %>
                <div class="portlet box red">
                    <div class="portlet-title">
                        <div class="caption"><i class="fa fa-cogs"></i>أرصدة الاجازات للموظف</div>
                        <div class="tools">
                            <a href="javascript:;" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <div class="table-responsive">

                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 20%">اسم الموظف</th>
                                        <th style="width: 20%; text-align: center">نوع الحركة </th>
                                        <th style="width: 20%; text-align: center">عدد الأيام</th>
                                        <th style="width: 20%; text-align: center">تاريخ الاضافة</th>
                                         <th style="width: 15%; text-align: center">تاريخ الغياب</th>
                                        <th style="width: 5%; text-align: center"></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource22">
                                        <ItemTemplate>
                                            <tr>
                                                <td><span><%# Eval("EmployeeName") %></span>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label></td>

                                                <td style="text-align: center"><span><%# Eval("DecreaseVacBalanceType") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("DaysCount") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>
                                                 <td style="text-align: center"><span><%# Eval("AbsentDate","{0:yyyy/MM/dd}") %></span></td>
                                                <td style="text-align: center">
                                                    
                                                    <asp:LinkButton ID="lbDetails" runat="server" Visible='<%# (Eval("DecreaseVacBalanceTypeID").ToString()=="2112")%>' class="btn default btn-xs black" OnClick="lbDetails_Click"><i class="fa fa-edit"></i> تفاصيل</asp:LinkButton>

                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>

                                    <asp:SqlDataSource ID="SqlDataSource22" runat="server"
                                        ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                        SelectCommand="GetEmployeeVacationTransaction" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlEmployeeName" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="DateFrom" Name="DateFrom" PropertyName="Text" Type="string" />
                                            <asp:ControlParameter ControlID="DateTo" Name="DateTo" PropertyName="Text" Type="string" />
                                            <asp:ControlParameter ControlID="ddlEmpCategoryID" Name="EmpCategoryID" PropertyName="SelectedValue" Type="Int16" />
                                            <asp:ControlParameter ControlID="ddlEmpCategoryID2" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpCategoryID2" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="Empstatus" Name="EmpstatusID" PropertyName="SelectedValue" Type="Int16" />
                                            <asp:ControlParameter ControlID="ddlEmpTermenateReason" Name="CTermenateReasonID " PropertyName="SelectedValue" Type="Int16" DefaultValue="-1" />
                                            <asp:ControlParameter ControlID="ddlEmployeeCat" Name="EmployeeCatID" PropertyName="SelectedValue" Type="Int16" />
                                            <asp:ControlParameter ControlID="ddlContractTypeID" Name="ContractTypeID" PropertyName="SelectedValue" Type="Int16" />
                                            <asp:ControlParameter ControlID="ddlSubContractType" Name="SubContractTypeID" PropertyName="SelectedValue" Type="Int16" />

                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>

                            <div class="col-md-10" style="float: left!important; direction: ltr!important;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager col-md-6">
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
                                    <strong>لا يوجد بيانات للعرض  </strong>
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
            <div id="details" runat="server" visible="false">
                <div class="col-md-5">
                    <div class="portlet box yellow">
                        <div class="portlet-title">
                            <div class="caption"><i class="fa fa-cogs"></i>تفاصيل الحركة</div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"></a>
                            </div>
                        </div>
                        <div class="portlet-body">

                            <div class="table-responsive">
                                <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 25%">نوع الاجازة</th>
                                            <th style="width: 35%; text-align: center">تاربخ بدء الاجازة</th>
                                            <th style="width: 40%; text-align: center">تاريخ انتهاء الاجازة</th>


                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2111">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><span><%# Eval("VacationType") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("VacationStartDate","{0:yyyy/MM/dd}") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("VacationEndDate","{0:yyyy/MM/dd}") %></span></td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>

                                        <asp:SqlDataSource ID="SqlDataSource2111" runat="server"
                                            ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="GetEmployeeVacationTransactionDetails" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblID" Name="ID" PropertyName="Text" Type="Int16" DefaultValue="2" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <div class="clearfix"></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

