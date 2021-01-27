<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="LoadHoursContractAddEdit.aspx.cs" Inherits="APP_HRM_LoadHoursContractAddEdit" %>

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
            $('#menu2').addClass("active");
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
        <li><a href="LoadHoursContractAddEdit.aspx" class="font-ha">عقود نظام الساعة</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-reorder"></i>عقود نظام الساعة  </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a>
                </div>
            </div>
            <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblJobTitleID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblDepartmentID" runat="server" Text="" Visible="false"></asp:Label>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <div class="form-horizontal">
                    <div class="form-body">
                        <%--                        <div class="form-group">
                            <label class="col-md-2 control-label" style="text-align: right">نوع العقد  </label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlContractType" runat="server" CssClass="form-control" DataSourceID="SqlDataSource5" DataTextField="Contract_Type" DataValueField="Contract_Type_ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Contract_Type_ID,Contract_Type FROM [Contract_Type_TB] where Contract_Type_ID in (6,15) union select -1,N'اختر نوع العقد' order by Contract_Type_ID"></asp:SqlDataSource>
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <label class="col-md-2 control-label" style="text-align: right">نوع العقد</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlContractType" placeholder="ادخل نوع العقد" runat="server" DataSourceID="SqlDataSource6" DataTextField="Contract_Type" DataValueField="Contract_Type_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Contract_Type_ID,Contract_Type FROM [Contract_Type_TB] where Contract_Type_ID=6 union select -1,N'اختر نوع العقد'"></asp:SqlDataSource>
                            </div>
                            <div id="subtype" runat="server">
                                <label class="col-md-2 control-label" style="text-align: right">النوع </label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlSubContractType" placeholder="ادخل نوع العقد مخصص" runat="server" DataSourceID="SqlDataSource13" DataTextField="ContractSubName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,ContractSubName FROM [ContractSubType] where Contract_Type_ID=6 union select -1,N'اختر نوع العقد'"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="form-group">
                            <label class="col-md-2 control-label" style="text-align: right">الفصل الدراسي </label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlSemester" runat="server" DataSourceID="SqlDataSource1" DataTextField="ArName" AutoPostBack="true" OnSelectedIndexChanged="EmpName_SelectedIndexChanged" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT ID,[ArName] FROM [Semester] where IsDelete=0  and IsActive=1 and ID<>1  union select -1 , N'اختر الفصل الدراسي'"></asp:SqlDataSource>
                            </div>
                            <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="EmpName" placeholder="ادخل اسم الموظف" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource19" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" OnSelectedIndexChanged="EmpName_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource19" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetAllEmployeesName" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group" style="text-align: right">

                            <label class="col-md-2 control-label" style="text-align: right">المسمى الوظيفي</label>
                            <div class="col-md-4">
                                <asp:Label ID="JobTitle" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                            <label class="col-md-2 control-label" style="text-align: right">العبءالدراسي الأسبوعي</label>
                            <div class="col-md-4">
                                <asp:Label ID="LoadHours" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group" style="text-align: right">
                            <label class="col-md-2 control-label" style="text-align: right">العبء الدراسي الكلي </label>
                            <div class="col-md-4">
                                <asp:Label ID="TotalLoad" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                            <label class="col-md-2 control-label" style="text-align: right">العبء الدراسي الفعلي</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="ActualLoadHours" runat="server" AutoPostBack="true" OnTextChanged="HourPrice_TextChanged" CssClass="form-control" Placeholder="أدخل العبء الكلي الفعلي"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group" style="text-align: right">
                            <label class="col-md-2 control-label" style="text-align: right">سعر الساعة</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="HourPrice" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="HourPrice_TextChanged" Placeholder="أدخل سعر الساعة "></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label" style="text-align: right">العملة</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlCurrencyID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource7" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="select [Cur_ID] ,[Cur_Ar_Name] from [dbo].[Currency_TB] union select -1,N'اختر العملة '"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group" style="text-align: right">
                            <label class="col-md-2 control-label" style="text-align: right">المبلغ المدفوع </label>
                            <div class="col-md-4">
                                <asp:Label ID="PaidAmount" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                            <label class="col-md-2 control-label" style="text-align: right">تاريخ العقد  </label>
                            <div class="col-md-4">
                                <div class="input-icon">
                                    <i class="fa fa-calendar"></i>
                                    <asp:TextBox ID="ContractDate" placeholder="ادخل تاريخ العقد  " runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-actions fluid">
                <div class="col-md-offset-3 col-md-9">
                    <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />

                    <asp:Button ID="btnCancel" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>عرض عقود نظام الساعة </div>
                <div class="tools">
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-responsive">

                    <div class="form-group row">
                        <label class="col-md-2 control-label" style="text-align: right">الفصل الدراسي </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlFilterSemester" runat="server" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                        </div>
                        <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlFilterEmployee" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource19" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label" style="text-align: right">نوع العقد  </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlFilterContractType" placeholder="ادخل نوع العقد مخصص" runat="server" DataSourceID="SqlDataSource9" DataTextField="ContractSubName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,ContractSubName FROM [ContractSubType] where Contract_Type_ID=6 union select -1,N'اختر نوع العقد'"></asp:SqlDataSource>
                        </div>
                        <label class="col-md-2 control-label" style="text-align: right">القسم   </label>
                        <div class="col-md-2">

                            <asp:DropDownList ID="ddlFilterDepartment" placeholder="ادخل القسم " runat="server" DataSourceID="SqlDataSource2" DataTextField="Ar_Name" DataValueField="Department_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Department_ID], [Ar_Name] FROM [Department_TB] union select -1,N'اختر القسم'"></asp:SqlDataSource>
                        </div>
                        
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-2">حالة الموظف: </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="Empstatus" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource8" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="Empstatus_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select -1,N' الكل'">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="7" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlEmpSubStatus" Enabled="true" CssClass="select2_category form-control" runat="server" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource22" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1034 Union Select -1,N'الكل'"></asp:SqlDataSource>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource34" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1030 Union Select -1,N'الكل'"></asp:SqlDataSource>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1033 Union Select -1,N'الكل'"></asp:SqlDataSource>

                        </div>
                        <div class="col-md-2">
                            <span class="input-group-btn">
                                <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btnFilter_Click" class="btn btn-primary" />
                                <asp:Button ID="btnExcel" runat="server" Text="تصدير اكسل" OnClick="btnExcel_Click" class="btn green" />

                            </span>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <br />
                    <br />
                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                        <ItemTemplate>
                            <span>إجمالي المبلغ الفصلي : </span>
                            <%# Eval("TotalLoadPrice") %>
                            <br />
                            <span>إجمالي المبلغ الفعلي : </span>
                            <%# Eval("TotalActualPrice") %>
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                        ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                        SelectCommand="GetTotalPrice" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlFilterSemester" PropertyName="SelectedValue" DefaultValue="-1" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="ddlFilterDepartment" PropertyName="SelectedValue" DefaultValue="-1" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <div class="col-md-2">
                        <asp:Button ID="btnCreate" runat="server" Text="توليد عقود الفصل المحدد" CssClass="btn green" OnClick="btnCreate_Click" />
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnUpdate" runat="server" Text="تحديث العقد بإجمالي الساعات" CssClass="btn green" OnClick="btnUpdate_Click" />
                    </div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 15%">الفصل الدراسي  </th>
                                <th style="width: 5%; text-align: center">رقم</th>
                                <th style="width: 15%; text-align: center">اسم الموظف</th>
                                <th style="width: 15%; text-align: center">المسمى الوظيفي</th>
                                <th style="width: 15%; text-align: center">العبء الدراسي الفعلي</th>
                                <th style="width: 15%; text-align: center">العبء الدراسي</th>
                                <th style="width: 10%; text-align: center">العبء الفصلي </th>
                                <th style="width: 10%; text-align: center">سعر الساعة </th>
                                <th style="width: 10%; text-align: center">المبلغ </th>
                                <th style="width: 15%; text-align: center">العبء الدراسي الفعلي</th>
                                <th style="width: 15%; text-align: center">المبلغ المدفوع </th>
                                <th style="width: 10%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="SemesterID" runat="server" Text='<%# Eval("SemesterID") %>' Visible="false"></asp:Label>
                                        <td><span><%# Eval("SemesterName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("employeeNo") %></span></td>

                                        <td style="text-align: center"><span><%# Eval("DisplayName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("JobTitle") %></span></td>
                                        <td style="text-align: center">
                                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource5">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalHours" runat="server" Text='<%# Eval("TotalHours") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="GetInstructorAttendanceTotalHours" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="EmpID" Name="EmployeeID" PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="SemesterID" Name="SemesterID" PropertyName="Text" Type="string" DefaultValue="5" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td style="text-align: center"><span><%# Eval("LoadHours") %></span></td>
                                        <td style="text-align: center"><span><%# Convert.ToDouble(Eval("LoadHours").ToString()) * 14 %></span></td>
                                        <td style="text-align: center"><span><%# Eval("HourPrice") %></span></td>
                                        <td style="text-align: center"><span><%# Convert.ToDouble(Eval("LoadHours").ToString()) * 14 * Convert.ToDouble(Eval("HourPrice").ToString()) %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ActualHours") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("PaidAmount") %></span></td>
                                        <td style="text-align: center">
                                            <% if (Permissions.Contains("ContractEmpEdit"))
                                                { %>
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                            <%} %>
                                            <% if (Permissions.Contains("ContractEmpDelete"))
                                                { %>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            <asp:LinkButton ID="lbPrint" runat="server" class="btn default btn-xs blue" OnClick="lbPrint_Click"><i class="fa fa-print"></i> طباعة</asp:LinkButton>

                                            <%} %>  </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                SelectCommand="LoadHourContractGetAll" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlFilterSemester" PropertyName="SelectedValue" DefaultValue="-1" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlFilterEmployee" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlFilterContractType" PropertyName="SelectedValue" DefaultValue="-1" Name="ContractTypeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlFilterDepartment" PropertyName="SelectedValue" DefaultValue="-1" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="Empstatus" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpStatusID" Type="Int32"></asp:ControlParameter>

                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
