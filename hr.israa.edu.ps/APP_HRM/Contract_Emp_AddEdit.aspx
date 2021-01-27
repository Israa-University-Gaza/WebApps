<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Contract_Emp_AddEdit.aspx.cs" Inherits="APP_HRM_Contract_Emp" %>

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
        <li><a href="Contract_Emp_AddEdit.aspx" class="font-ha">عقود الموظفين</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("ContractEmpView"))
           { %>
        <asp:Label ID="lblIsRenew" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="PID" runat="server" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>عقود الموظفين  </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>

                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-horizontal">
                        <div class="form-body">
                            <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                            <div class="form-group row">
                                <label class="col-md-2 control-label">القسم </label>
                                <div class="col-md-1" style="display:none">
                                    <asp:DropDownList ID="ddlPresident" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Unite_SelectedIndexChanged" class="form-control" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Department_ID,Ar_Name from Department_TB where Department_ID=2"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-2" >
                                    <asp:DropDownList ID="Unite" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Unite_SelectedIndexChanged" class="form-control" placeholder="اختر الوحدة " CssClass="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDepartmentDepartments" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="-1" Name="pid" Type="Int32"></asp:Parameter>
                                            <asp:Parameter DefaultValue="1" Name="type" Type="Int32"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                  <div class="col-md-2">
                                    <asp:DropDownList ID="DDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_SelectedIndexChanged" class="form-control" placeholder="اختر الدائرة" CssClass="select2_category form-control" DataSourceID="SqlDataSource9" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDepartmentDepartments" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Unite" PropertyName="SelectedValue" Name="pid" Type="Int32"></asp:ControlParameter>
                                            <asp:Parameter DefaultValue="2" Name="type" Type="Int32"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                                   <div class="col-md-2">
                                    <asp:DropDownList ID="Department" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Department_SelectedIndexChanged" class="form-control" placeholder="اختر القسم" CssClass="select2_category form-control" DataSourceID="SqlDataSource10" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource10" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDepartmentDepartments" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DDL" PropertyName="SelectedValue" Name="pid" Type="Int32"></asp:ControlParameter>
                                            <asp:Parameter DefaultValue="3" Name="type" Type="Int32"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="section" runat="server" AutoPostBack="true" OnSelectedIndexChanged="section_SelectedIndexChanged" class="form-control" placeholder="اختر الشعبةاو التركيز" CssClass="select2_category form-control" DataSourceID="SqlDataSource11" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource11" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDepartmentDepartments" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Department" PropertyName="SelectedValue" Name="pid" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                            <asp:Parameter DefaultValue="4" Name="type" Type="Int32"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                </div>
                            <div class="form-group">

                                <label class="col-md-2 control-label">اسم الموظف </label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="Employee" CssClass="select2_category form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="Employee_SelectedIndexChanged" DataSourceID="SqlDataSource12" DataTextField="Name" DataValueField="emp_id"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDepartmentEmployees" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Unite" PropertyName="SelectedValue" Name="Type1" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="DDL" PropertyName="SelectedValue" Name="Type2" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="Department" PropertyName="SelectedValue" Name="Type3" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="section" PropertyName="SelectedValue" Name="Type4" Type="Int32"></asp:ControlParameter>
                                            <asp:Parameter DefaultValue="-1" Name="MangerID" Type="Int32"></asp:Parameter>

                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label" style="text-align: right">المسمى الوظيفي</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="JobTitle" runat="server" DataSourceID="SqlDataSource2" DataTextField="Ar_Job_Name" DataValueField="Job_Title_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDepartmentJobTitle" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Unite" PropertyName="SelectedValue" Name="Type1" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="DDL" PropertyName="SelectedValue" Name="Type2" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="Department" PropertyName="SelectedValue" Name="Type3" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="section" PropertyName="SelectedValue" Name="Type4" Type="Int32"></asp:ControlParameter>
                                            <asp:Parameter DefaultValue="-1" Name="MangerID" Type="Int32"></asp:Parameter>

                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-2 control-label" style="text-align: right">نوع العقد</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="Con_Type_ID" placeholder="ادخل نوع العقد" runat="server" DataSourceID="SqlDataSource1" DataTextField="Contract_Type" DataValueField="Contract_Type_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" AutoPostBack="true" OnSelectedIndexChanged="Con_Type_ID_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Contract_Type_ID,Contract_Type FROM [Contract_Type_TB] where Contract_Type_ID not in (6,15) union select -1,N'اختر نوع العقد'"></asp:SqlDataSource>
                                </div>
                                <div id="subtype" runat="server" visible="false">
                                    <label class="col-md-2 control-label" style="text-align: right">النوع </label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlSubContractType" placeholder="ادخل نوع العقد مخصص" runat="server" DataSourceID="SqlDataSource13" DataTextField="ContractSubName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,ContractSubName FROM [ContractSubType] where Contract_Type_ID=@Type union select -1,N'اختر نوع العقد'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Con_Type_ID" PropertyName="SelectedValue" DefaultValue="7" Name="Type"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                    </div>
                            </div>
                            <div class="form-group ">
                                <label class="col-md-2 control-label" style="text-align: right">الراتب الاساسي</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="MainSalary" runat="server" class="form-control" type="text" value=""></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label" style="text-align: right">العملة </label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCurrencyID" AutoPostBack="true" OnTextChanged="AttType_TextChanged" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource7" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="select [Cur_ID] ,[Cur_Ar_Name] from [dbo].[Currency_TB] union select 0,N'  '"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group ">
                                <label class="col-md-2 control-label" style="text-align: right">نوع الدوام</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="AttType" AutoPostBack="true" OnTextChanged="AttType_TextChanged" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Ar_Name], [Sub_Constant_ID] FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select N'  ',0">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="16" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div id="Div1" runat="server" visible="false">
                                    <label class="col-md-2 control-label" style="text-align: right">نسق الداوم الثابت</label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="AttendanceFormat" DataValueField="Constant_ID"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT AttendanceFormat,Constant_ID FROM [Attendance_Constant_TB] union select N'  ',0 ">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="16" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <asp:Label ID="Label2" runat="server" class="col-md-2 control-label" Style="text-align: right">فترة التجربة من   </asp:Label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="TestFrom" runat="server" placeholder="ادخل تاريخ بدء فترة التجربة" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label class="col-md-2 control-label" Style="text-align: right" ID="Label3" runat="server">فترة التجربة إلى</asp:Label>
                                <div class="col-md-4" runat="server" id="Div3">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="TestTo" placeholder="ادخل تاريخ نهاية فترة التجربة" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group last" id="specail" runat="server">
                                <asp:Label ID="Lbdate" runat="server" class="col-md-2 control-label" Style="text-align: right">تاريخ بدء  العقد</asp:Label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="SDate" runat="server" placeholder="ادخل تاريخ بدء  العقد" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label class="col-md-2 control-label" Style="text-align: right" ID="LbEndDate" runat="server">تاريخ انتهاء  العقد</asp:Label>
                                <div class="col-md-4" runat="server" id="FEnd">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="FDate" placeholder="ادخل تاريخ انتهاء  العقد" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="Button3" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />

                                <asp:Button ID="Button4" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                    <!-- END FORM-->
                </div>
            </div>
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>عقود الموظفين </div>
                    <div class="tools">
                    </div>
                </div>

               <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                 
                        <div class="form-body">
                   
                        <div class="form-group">
                        <div class="Form-group row">
                               <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <label class="col-md-1 control-label" style="text-align: right">رقم </label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtNum" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                         
                    
                    <label class="control-label col-md-1">نوع العقد: </label>
                    <div class="col-md-2">
                        <asp:DropDownList ID="ddlContractTypeID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource15" DataTextField="Contract_Type" DataValueField="Contract_Type_ID" OnSelectedIndexChanged="ddlEmpCategoryID_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource15" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Contract_Type_ID], [Contract_Type] FROM Contract_Type_TB union select-1,N'الكل' "></asp:SqlDataSource>
                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList ID="DropDownList2" placeholder="ادخل نوع العقد مخصص" runat="server" DataSourceID="SqlDataSource16" DataTextField="ContractSubName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" OnSelectedIndexChanged="ddlEmpCategoryID_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource16" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,ContractSubName FROM [ContractSubType] where Contract_Type_ID=@Type union select -1,N'الكل'">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="7" Name="Type"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    </div>
                      <div class="clearfix"></div>
                    <div class="form-group row">
                        <label class="control-label col-md-2">تصنيف دوام الموظف  : </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlEmpCategoryID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpCategoryID_SelectedIndexChanged" DataSourceID="SqlDataSource17" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource17" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [CategoryName] FROM EmpCategory union select-1,N'الكل' order by ID "></asp:SqlDataSource>

                        </div>
                        <label class="control-label col-md-1">الحالة </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="Empstatus" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource18" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="Empstatus_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource18" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select -1,N' الكل'">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="7" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                           <div class="col-md-2">
                                <span class="input-group-btn">
                                    <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btnFilter_Click" class="btn btn-primary" /></span>
                            </div>
                    </div>
                            </div>
                     <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                     <th style="width: 10%">اسم الموظف</th>
                                    <th style="width: 10%">رقم الموظف</th>
                                   <th style="width: 10%; text-align: center">نوع العقد </th>
                                    <th style="width: 10%; text-align: center">القسم</th>
                                    <th style="width: 10%; text-align: center">المسمى الوظيفي</th>
                                     <th style="width: 5%; text-align: center">فعال </th>
                                     <th style="width: 5%; text-align: center"> وهمي</th>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <tr>
                                      
                                            <td>
                                                <asp:Label ID="ContractID" runat="server" Text='<%# Eval("Contract_ID") %>' Visible="false"></asp:Label>
                                              <span><%# Eval("DisplayName") %> </span></td>
                                               <td>   <span><%# Eval("EmployeeNo") %> </span></td>
                                            <td style="text-align: center"><span><%# Eval("Contract_Type") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Ar_Name") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Ar_Job_Name") %></span></td>
                                                 <td style="text-align: center"> 
                                             <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("IsActive") %>' AutoPostBack="true" OnCheckedChanged="Deactivate_Click" />
                                              </td>
                                             <td style="text-align: center"> 
                                             <asp:CheckBox ID="IsIllusory" runat="server" Checked='<%# Eval("IsIllusory") %>' AutoPostBack="true" OnCheckedChanged="IsIllusory_CheckedChanged" />
                                              </td>
                                            <td style="text-align: center">
                                                <% if (Permissions.Contains("ContractEmpEdit"))
                                                   { %>
                                                <asp:LinkButton ID="lbEdit2" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbRenew" runat="server" class="btn default btn-xs yellow" OnClick="lbRenew_Click"><i class="fa fa-edit"></i>تمديد العقد </a></asp:LinkButton>

                                                <%} %>
                                                <% if (Permissions.Contains("ContractEmpDelete"))
                                                   { %>
                                                <asp:LinkButton ID="lbDelete2" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                               <%} %>  </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="ContractEmpGetAll" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtNum" PropertyName="Text" DefaultValue="-1" Name="EmpNo" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="txtName" PropertyName="Text" DefaultValue="%" Name="EmpName" Type="String"></asp:ControlParameter>
                                 <asp:ControlParameter ControlID="ddlEmpCategoryID" Name="EmpCategoryID" PropertyName="SelectedValue" Type="Int16" DefaultValue="-1" />
                               <asp:ControlParameter ControlID="Empstatus" Name="EmpstatusID" PropertyName="SelectedValue" Type="Int16" />
                                <asp:ControlParameter ControlID="ddlContractTypeID" Name="ContractTypeID" PropertyName="SelectedValue" DefaultValue="-1" Type="Int16" />
                                  <asp:ControlParameter ControlID="ddlSubContractType" Name="SubContractTypeID" PropertyName="SelectedValue" DefaultValue="-1" Type="Int16" />

                                         </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
        </div>
                      
            
                   </div>
            </div>
        <%} %>
    </div>
        </div>
</asp:Content>

