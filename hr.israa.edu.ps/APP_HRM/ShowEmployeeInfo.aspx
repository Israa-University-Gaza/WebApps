<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="ShowEmployeeInfo.aspx.cs" Inherits="APP_HRM_ShowEmployeeInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu2').addClass("active");
        });
        $(document).ready(function () {
            $('#chkAll').click(
             function () {
                 $("INPUT[type='checkbox']").attr('checked', $('#chkAll').is(':checked'));
             });
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
        <li><a href="#" class="font-ha"></a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>

        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i></div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="control-label col-md-2">إسم الموظف : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtSecoundName" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            <asp:TextBox ID="txtArFamilyName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <label class="control-label col-md-2">رقم الموظف : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtEmployeeNo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-2">تصنيف الموظف  : </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlEmployeeCat" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource12" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [Name] FROM TypeCategory where TypeID=1 union select-1,N'الكل' order by ID "></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label">القسم </label>
                        <div class="col-md-1" style="display: none">
                            <asp:DropDownList ID="ddlPresident" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Unite_SelectedIndexChanged" class="form-control" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Department_ID,Ar_Name from Department_TB where Department_ID=2"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-2">
                            <asp:DropDownList ID="Unite" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Unite_SelectedIndexChanged" class="form-control" placeholder="اختر الوحدة " CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDepartmentDepartments" SelectCommandType="StoredProcedure">
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
                    <div class="form-group row">

                        <label class="col-md-2 control-label">اسم الموظف </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="Employee" CssClass="select2_category form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="Employee_SelectedIndexChanged" DataSourceID="SqlDataSource14" DataTextField="Name" DataValueField="emp_id"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource14" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDepartmentEmployees" SelectCommandType="StoredProcedure">
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
                            <asp:DropDownList ID="ddlJobTitle" runat="server" DataSourceID="SqlDataSource15" DataTextField="Ar_Job_Name" DataValueField="Job_Title_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource15" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDepartmentJobTitle" SelectCommandType="StoredProcedure">
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

                    <div class="form-group row">
                        <label class="control-label col-md-2">نوع العقد: </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlContractTypeID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource6" DataTextField="Contract_Type" DataValueField="Contract_Type_ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Contract_Type_ID], [Contract_Type] FROM Contract_Type_TB Where IsDelete=0 union select-1,N'الكل' "></asp:SqlDataSource>

                        </div>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlSubContractType" placeholder="ادخل نوع العقد مخصص" runat="server" DataSourceID="SqlDataSource13" DataTextField="ContractSubName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,ContractSubName FROM [ContractSubType] where Contract_Type_ID=@Type union select -1,N'الكل'">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="7" Name="Type"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
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
                                                <asp:DropDownList ID="ddlEmpSubStatus" Enabled="true" CssClass="select2_category form-control" runat="server" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                              
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource22" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1034 Union Select -1,N'الكل'"></asp:SqlDataSource>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource34" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1030 Union Select -1,N'الكل'"></asp:SqlDataSource>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1033 Union Select -1,N'الكل'"></asp:SqlDataSource>

                                            </div>
                   
                    </div>

                    <div class="form-group row">
                        <label class="control-label col-md-2">تصنيف دوام الموظف  : </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlEmpCategoryID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource4" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [CategoryName] FROM EmpCategory where ID=4 union select-1,N'الكل' order by ID "></asp:SqlDataSource>

                        </div>
                        <label class="col-md-2 control-label">نوع الموظف</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlEmpTypeID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource36" DataTextField="EmployeeType" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpTypeID_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource36" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,EmployeeType FROM [EmployeeTypes] union select -1,N'الكل'"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlEmpSubTypeID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource37" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource37" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [EmployeeSubTypes] where EmployeeTypesID=@EmpTypeID union select -1,N'الكل'">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlEmpTypeID" PropertyName="SelectedValue" Type="String" Name="EmpTypeID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group row">

                        <label class="control-label col-md-2">تصنيف بيانات اكاديمية </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlAcademicData" runat="server" CssClass="select2_category form-control">
                                <asp:ListItem Value="-1">الكل</asp:ListItem>
                                <asp:ListItem Value="0">غير خاضع للبيانات الاكاديمية</asp:ListItem>
                                <asp:ListItem Value="1">خاضع للبيانات الاكاديمية</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="btnEmpView" runat="server" Text="اظهار قائمة الموظفين" OnClick="btnEmpView_Click" />
                        </div>

                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label">حالة التقاعد </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlRetirementStatus" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource33" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource33" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] where Constant_ID=1032 union select -1,N'الكل'"></asp:SqlDataSource>
                        </div>
                        <label class="col-md-2 control-label" style="text-align: right">عملة الراتب </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlCurrencyID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource16" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource16" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="select [Cur_ID] ,[Cur_Ar_Name] from [dbo].[Currency_TB] union select -1,N' الكل'"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group row">
                              <label class="col-md-2 control-label"> درجة الموظف</label>
                                             <div class="col-md-3">
                                                  <asp:DropDownList ID="ddlCader" runat="server" DataSourceID="SqlDataSource17" DataTextField="Name" DataValueField="ID" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCader_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource17" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Cader] union select -1,N'الكل'"></asp:SqlDataSource>
                                         </div>
                                             <div class="col-md-3">
                                                  <asp:DropDownList ID="ddlGrade" runat="server" DataSourceID="SqlDataSource28" DataTextField="Name" DataValueField="ID" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource28" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Grade] where CaderID=@CaderID union select -1,N'الكل'">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlCader" Name="CaderID" DbType="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                                 </div>
                                             <div class="col-md-3">
                                               <asp:DropDownList ID="ddlDegree" runat="server" DataSourceID="SqlDataSource29" DataTextField="Name" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource29" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Degree] where GradeID=@GradeID union select -1,N'الكل'">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlGrade" Name="GradeID" DbType="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                       </div>
                       <%-- <label class="control-label col-md-2">بريد الموظف : </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtEmployeeEmail" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <label class="control-label col-md-2">جوال الموظف : </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtEmployeeMobile" runat="server" class="form-control"></asp:TextBox>
                        </div>--%>
                    </div>


                    <div class="clearfix"></div>

                </div>
            </div>
            <div id="EmployeeList" runat="server" visible="false">
                <div class="portlet box red">
                    <div class="portlet-title">
                        <div class="caption"><i class="fa fa-cogs"></i>قائمة الموظفين</div>
                        <div class="tools">
                            <a class="remove" href="javascript:;"></a>
                            <a class="collapse" href="javascript:;"></a>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div class="form-body">
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:CheckBoxList ID="cblEmployees" CssClass="checkboxlist" Width="100%" RepeatColumns="5" DataTextField="EmployeeName" DataValueField="Emp_ID" runat="server" DataSourceID="SqlDataSource8">
                                    </asp:CheckBoxList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeesList" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlEmployeeCat" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeCatID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="Unite" PropertyName="SelectedValue" Name="Type1" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="DDL" PropertyName="SelectedValue" Name="Type2" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="Department" PropertyName="SelectedValue" Name="Type3" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="section" PropertyName="SelectedValue" Name="Type4" Type="Int32"></asp:ControlParameter>
                                            <asp:Parameter DefaultValue="-1" Name="MangerID" Type="Int32"></asp:Parameter>
                                            <asp:ControlParameter ControlID="ddlJobTitle" PropertyName="SelectedValue" DefaultValue="-1" Name="JobTitle" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlEmpTypeID" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeTypeID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlEmpCategoryID" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpCategoryID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="-1" Name="Contract_Type_ID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlSubContractType" PropertyName="SelectedValue" DefaultValue="-1" Name="SubContractTypeID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="Empstatus" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpStatusID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlAcademicData" PropertyName="SelectedValue" DefaultValue="-1" Name="AcademicData" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlRetirementStatus" PropertyName="SelectedValue" DefaultValue="-1" Name="RetirementStatusID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlCurrencyID" PropertyName="SelectedValue" DefaultValue="-1" Name="CurrencyID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>

                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i></div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-body">
                        <div class="form-group row">
                            <label class="col-md-2 control-label">بيانات الموظف :</label>
                            <div class="col-md-10">
                                <input id="chkAll" type="checkbox" />
                                الكل
                                <asp:CheckBoxList ID="chkEmployeeInfo" CssClass="checkboxlist" Width="100%" RepeatColumns="4" DataTextField="Column_name" DataValueField="Column_name" runat="server">
                                </asp:CheckBoxList>

                                <div class="form-group">
                                    <div class="col-md-4 col-lg-offset-2">

                                        <asp:Button ID="btnGenrateReport" runat="server" Text=" بناء التقرير " class="btn green" OnClick="btnGenrateReport_Click" />

                                        <asp:Button ID="btExcel" runat="server" Text="تصدير الي Excel" class="btn green" OnClick="btExcel_Click" />
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="table-scrollable">
                        <asp:GridView ID="GridView1" runat="server" EnableViewState="False" AutoGenerateColumns="False" AllowSorting="True" EditRowStyle-HorizontalAlign="Right" DataKeyNames="Emp_ID">
                            <Columns>
                            </Columns>

                            <Columns>
                            </Columns>
                            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeesInfo" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtEmployeeNo" PropertyName="Text" Name="EmployeeNo" Type="String" DefaultValue="%"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="txtArFirstName" PropertyName="Text" Name="ArFirstName" Type="String" DefaultValue="%"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="txtSecoundName" PropertyName="Text" Name="ArSecoundName" Type="String" DefaultValue="%"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="txtArFamilyName" PropertyName="Text" Name="ArFamilyName" Type="String" DefaultValue="%"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="Department" PropertyName="SelectedValue" DefaultValue="-1" Name="Department" Type="Int32"></asp:ControlParameter>
                               <asp:ControlParameter ControlID="ddlJobTitle" PropertyName="SelectedValue" DefaultValue="-1" Name="JobTitle" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlEmpTypeID" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeTypeID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlEmpCategoryID" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpCategoryID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="-1" Name="Contract_Type_ID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="Empstatus" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpStatusID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlAcademicData" PropertyName="SelectedValue" DefaultValue="-1" Name="AcademicData" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlEmployeeCat" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeCatID" Type="Int32"></asp:ControlParameter>
                                <asp:Parameter Name="EmployeeList"></asp:Parameter>
                                <asp:ControlParameter ControlID="ddlCurrencyID" PropertyName="SelectedValue" DefaultValue="-1" Name="RetirementStatusID" Type="Int32"></asp:ControlParameter>

                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

