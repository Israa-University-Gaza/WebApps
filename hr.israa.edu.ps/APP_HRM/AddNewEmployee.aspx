<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewEmployee.aspx.cs" Inherits="APP_HRM_AddNewEmployee" %>

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
    <style>
        .input-xsmall {
            width: 100% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">اضافة موظف جديد</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <%--  <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يمكنك إضافة موظف بالرجاء مراجعة قسم البرمجة</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>--%>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>تسجيل موظف جديد </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="horizontal-form">
                        <div class="form-body">
                            <div class="form-group row">

                                <label class="control-label col-md-2">الاسم بالكامل</label>

                                <div class="col-md-2">
                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtSecondName" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtThirdName" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtFamilyName" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="control-label col-md-2">تصنيف الموظف  </label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlEmployeeCat" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployeeCat_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select ID,Name From TypeCategory Where TypeID=1 union select -1,N'اختر  تصنيف الموظف'"></asp:SqlDataSource>
                                </div>
                                <div id="ContractType" runat="server" visible="false">
                                    <label class="control-label col-md-2">نوع العقد  </label>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="ddlContractType" runat="server" CssClass="form-control" DataSourceID="SqlDataSource5" DataTextField="Contract_Type" DataValueField="Contract_Type_ID" AutoPostBack="true" OnSelectedIndexChanged="ddlContractType_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Contract_Type_ID,Contract_Type FROM [Contract_Type_TB] union select -1,N'اختر نوع العقد'"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-md-2" id="subcontract" runat="server" visible="false">
                                        <asp:DropDownList ID="ddlContractSubType" runat="server" CssClass="form-control" DataSourceID="SqlDataSource7" DataTextField="ContractSubName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlContractType_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,ContractSubName FROM [ContractSubType] where Contract_Type_ID=@Type union select -1,N'اختر نوع العقد'">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlContractType" PropertyName="SelectedValue" DefaultValue="7" Name="Type"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div id="AppointmentDate" runat="server" visible="false">
                                    <label class="control-label col-md-2">تاريخ التعيين   </label>
                                    <div class="col-md-4">
                                        <div class="input-icon">
                                            <i class="fa fa-calendar"></i>
                                            <asp:TextBox ID="txtAppointmentDate" runat="server" placeholder="ادخل تاريخ التعيين" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="control-label col-md-2">الرقم الوظيفي </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtEmployeeNo" Enabled="false" runat="server" CssClass="form-control" numeric="integer" placeholder="ادخل الرقم الوظيفي"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-2">رقم الهوية</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtSSN" runat="server" CssClass="form-control" numeric="integer" placeholder="ادخل رقم الهوية "></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label">القسم </label>
                                <div class="col-md-1" style="display: none">
                                    <asp:DropDownList ID="ddlPresident" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Unite_SelectedIndexChanged" class="form-control" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Department_ID,Ar_Name from Department_TB where Department_ID=2"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-2">
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
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" style="text-align: right">المسمى الوظيفي</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="JobTitle" runat="server" DataSourceID="SqlDataSource4" DataTextField="Ar_Job_Name" DataValueField="Job_Title_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDepartmentJobTitle" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Unite" PropertyName="SelectedValue" Name="Type1" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="DDL" PropertyName="SelectedValue" Name="Type2" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="Department" PropertyName="SelectedValue" Name="Type3" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="section" PropertyName="SelectedValue" Name="Type4" Type="Int32"></asp:ControlParameter>
                                            <asp:Parameter DefaultValue="-1" Name="MangerID" Type="Int32"></asp:Parameter>

                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="control-label col-md-2">نوع الموظف  </label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlEmpType" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="EmployeeType" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,EmployeeType FROM [EmployeeTypes] union select -1,N'اختر نوع الموظف'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div id="Div2" runat="server" visible="false">
                                <h3 class="inlineh"><i class="fa fa-book" style="margin: 0 20px!important"></i>بيانات العقد  </h3>
                                <div class="clearfix"></div>
                                <div class="form-group row">
                                    <label class="col-md-2 control-label">فترة التجربة من  </label>
                                    <div class="col-md-4">
                                        <div class="input-icon">
                                            <i class="fa fa-calendar"></i>
                                            <asp:TextBox ID="txtTestFrom" runat="server" placeholder="ادخل تاريخ بدء فترة التجربة" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <label class="col-md-2 control-label">فترة التجربة الى  </label>
                                    <div class="col-md-4">
                                        <div class="input-icon">
                                            <i class="fa fa-calendar"></i>
                                            <asp:TextBox ID="txtTestTo" placeholder="ادخل تاريخ نهاية فترة التجربة" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2 control-label">تاريخ بدء  العقد</label>
                                    <div class="col-md-4">
                                        <div class="input-icon">
                                            <i class="fa fa-calendar"></i>
                                            <asp:TextBox ID="txtSDate" runat="server" placeholder="ادخل تاريخ بدء  العقد" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <label class="col-md-2 control-label">تاريخ انتهاء  العقد</label>
                                    <div class="col-md-4" runat="server" id="FEnd">
                                        <div class="input-icon">
                                            <i class="fa fa-calendar"></i>
                                            <asp:TextBox ID="txtFDate" placeholder="ادخل تاريخ انتهاء  العقد" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div id="Div1" runat="server" visible="false">
                                <div class="form-group row">
                                    <label class="col-md-2 control-label">الراتب المقطوع  </label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="ادخل الراتب المقطوع"></asp:TextBox>
                                    </div>
                                    <label class="col-md-2 control-label">العملة</label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlCurrency" runat="server" DataSourceID="SqlDataSource13" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Cur_ID],[Cur_Ar_Name]  FROM [Currency_TB]  union select -1, N'اختر العملة'"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-2">المحافظة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="CityID" CssClass="select2_category form-control" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource12" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:HumanResources  %>' SelectCommand="SELECT  [ID], [ArName] FROM [Governorates] WHERE  ((CountryID=1) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر المحافظة'"></asp:SqlDataSource>
                                </div>

                                <label class="control-label col-md-2">المدينة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="Region" runat="server" DataSourceID="SqlDataSource19" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:HumanResources %>" SelectCommand="SELECT  [ID], [ArName] FROM [City] WHERE  ((GovernoratesID=@GovernoratesID) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر المدينة'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="CityID" Name="GovernoratesID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="control-label col-md-2">تصنيف بيانات اكاديمية  </label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlAcademicData" runat="server" CssClass="select2_category form-control">
                                        <asp:ListItem Value="-1">اختر تصنيف بيانات اكاديمية</asp:ListItem>
                                        <asp:ListItem Value="0">غير خاضع للبيانات الاكاديمية</asp:ListItem>
                                        <asp:ListItem Value="1">خاضع للبيانات الاكاديمية</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                                <label class="control-label col-md-2">تصنيف دوام الموظف  </label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlEmpAttCategory" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,CategoryName FROM [EmpCategory] union select -1,N'اختر تصنيف الدوام'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="control-label col-md-2">فعال </label>
                                <div class="col-md-4">
                                    <asp:CheckBox ID="IsActive" runat="server" />
                                </div>
                                <label class="control-label col-md-2">الجنس </label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="-1">اختر الجنس</asp:ListItem>
                                        <asp:ListItem Value="1">ذكر</asp:ListItem>
                                        <asp:ListItem Value="2">أنثى</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label">رقم الجوال </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9" style="padding: 0 5px">
                            <asp:Button ID="Button1" runat="server" Text="حفظ" class="btn green" OnClick="ButtonReg_Click" />
                            <asp:Button ID="Button2" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="ButtonCancel_Click" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

