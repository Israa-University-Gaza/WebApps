<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="GetEmployeeDefualtAttendance.aspx.cs" Inherits="Attendance_GetEmployeeDefualtAttendance" %>

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
            $('#menu4').addClass("active open");
            $('#menu4_4 a').css("background-color", "#575757");
            $('#menu4 a span.arrow').addClass("open");
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
        <li><a href="#" class="font-ha">عرض نسق دوام الموظفين</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">


    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>بحث حسب </div>
            <div class="tools">
                <a href="javascript:;" class="collapse"></a>
            </div>
        </div>
        <div class="portlet-body">
            <div class="form-group">
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
                    <label class="control-label col-md-2">تصنيف دوام الموظف :</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlEmpCategoryID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpCategoryID_SelectedIndexChanged" DataSourceID="SqlDataSource3" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [CategoryName] FROM EmpCategory Where ID=4 union select-1,N'الكل' order by ID "></asp:SqlDataSource>
                    </div>

                    <label class="control-label col-md-2">حالة الموظف:</label>
                    <div class="col-md-2">
                        <asp:DropDownList ID="Empstatus" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="Empstatus_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select -1,N' الكل'">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="7" Name="Constant_ID" Type="Int32"></asp:Parameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                           <div class="col-md-2">
                        <asp:DropDownList ID="ddlEmpSubStatus" Enabled="true" CssClass="select2_category form-control" runat="server" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpSubStatus_SelectedIndexChanged"></asp:DropDownList>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource22" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1034 Union Select -1,N'الكل'"></asp:SqlDataSource>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource34" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1030 Union Select -1,N'الكل'"></asp:SqlDataSource>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1033 Union Select -1,N'الكل'"></asp:SqlDataSource>

                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-md-2">نوع دوام الموظف :</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlDefualtAttendanceType" CssClass="select2_category form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDefualtAttendanceType_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Ar_Name" DataValueField="Sub_constant_ID"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="select Sub_constant_ID, Ar_Name from Emp_sub_constant where Constant_ID = 16 union Select -1 , N'اختر نوع الدوم'"></asp:SqlDataSource>
                    </div>
                    <label class="control-label col-md-2">نسق دوام الموظف :</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlDefualtAttendance" CssClass="select2_category form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDefualtAttendance_SelectedIndexChanged" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDefaultAttendanceTypeFormat" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlDefualtAttendanceType" PropertyName="SelectedValue" Name="DefualtAttendanceTypeID"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="form-group row">

                    <label class="col-md-2 control-label">اسم الموظف </label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlEmployee" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="Emp_ID">
                            
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetAllEmployeesName" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlEmpCategoryID" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpCategoryID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="Empstatus" PropertyName="SelectedValue" DefaultValue="" Name="EmpStatusID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlEmpSubStatus" Name="EmpSubStatusID " PropertyName="SelectedValue" Type="Int16" DefaultValue="-1" />
                                <asp:ControlParameter ControlID="ddlEmployeeCat" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeCatID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="-1" Name="ContractTypeID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlSubContractType" PropertyName="SelectedValue" DefaultValue="-1" Name="SubContractTypeID" Type="Int32"></asp:ControlParameter>
                               

                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>

                </div>


                <div class="form-actions fluid">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button ID="btnSearch" runat="server" Text="بحث" OnClick="btnSearch_Click" CssClass="btn green" />

                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>نسق دوام الموظفين</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <% if (ListView1.Items.Count > 0)
                    { %>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="width: 30%">رقم الموظف</th>
                            <th style="width: 30%; text-align: center">اسم الموظف</th>
                            <th style="width: 30%; text-align: center">نسق دوام الموظف</th>
                           <%-- <th style="width: 10%"></th>--%>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("AttendanceID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="EmployeeID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>


                                <td><span><%# Eval("EmployeeNo") %></span></td>
                                <td style="text-align: center"><span><%# Eval("DisplayName") %></span></td>
                                <td style="text-align: center"><span><%# Eval("EmployeeAttendanceFormat") %></span></td>
                               <%-- <td>
                                    <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                </td>--%>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeeDefualtAttendance" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlEmployee" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlEmpCategoryID" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpCategoryID" Type="Int32"></asp:ControlParameter>
                               <asp:ControlParameter ControlID="Empstatus" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpStatusID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlEmpSubStatus" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpSubStatusID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlEmployeeCat" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeCatID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="-1" Name="ContractTypeID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlDefualtAttendance" PropertyName="SelectedValue" DefaultValue="-1" Name="DefualtAttendanceID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlSubContractType" PropertyName="SelectedValue" DefaultValue="-1" Name="SubContractTypeID" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="ddlDefualtAttendanceType" PropertyName="SelectedValue" Name="DefualtAttendanceTypeID" Type="Int32"></asp:ControlParameter>
                                 </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
                <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                        <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                        <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                        <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                    </Fields>
                </asp:DataPager>
                <div class="clearfix"></div>
                <% }
                    else
                    {%>
                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                    <div class="col-xs-11" style="text-align: center">
                        <strong>لا يوجد بيانات للعرض</strong>
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

