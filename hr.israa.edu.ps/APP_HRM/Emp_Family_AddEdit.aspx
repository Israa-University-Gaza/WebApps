<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Family_AddEdit.aspx.cs" Inherits="APP_HRM_Emp_Family" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />

    <style>
        .input-xsmall {
            width:100%!important;
        }

    </style>
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Emp_Family_AddEdit.aspx" class="font-ha">بيانات العائلة</a></li>
    </ul>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <div class="tabbable tabbable-custom boxless">
                <ul class="nav nav-tabs">
                    <% if (Permissions.Contains("FamilyView"))
                       { %>
                    <li class="active"><a href="#tab_1" data-toggle="tab">بيانات المعالين</a></li>
                    <%} %>
                    <% if (Permissions.Contains("EmergencyView"))
                       { %>
                    <li><a href="#tab_2" data-toggle="tab">بيانات الطوارئ  </a></li>
                    <%} %>
                    <% if (Permissions.Contains("ReferencesView"))
                       { %>
                    <li><a href="#tab_3" data-toggle="tab">بيانات المعرفين </a></li>
                    <%} %>
                </ul>
                <div class="tab-content">
                    <% if (Permissions.Contains("FamilyView"))
                       { %>
                    <div class="tab-pane active" id="tab_1">
                        <% if (Permissions.Contains("FamilyAdd") || Permissions.Contains("FamilyEdit"))
                           { %>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>ادخال بيانات العائلة للموظف</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <%--   <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>--%>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="horizontal-form">
                                    <div class="form-body">
                                        <div class="form-group row">


                                            <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                            <div class="col-md-5">
                                                <asp:DropDownList ID="DropDownList8" AutoPostBack="true"  placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>

                                            </div>



                                        </div>
                                        <div class="clearfix"></div>

                                        <%--<div class="form-group row" runat="server" id="check">
                                            <label class="col-md-3 control-label">رقم الموظف </label>
                                            <div class="col-md-5">
                                                <div class="input-group" style="text-align: left">
                                                    <asp:TextBox ID="txtEmp" runat="server" class="form-control" placeholder="Enter text"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button ID="Button7" runat="server" Text="فحص" class="btn green" OnClick="Username_Checker_Click1" />

                                                    </span>
                                                </div>

                                                <asp:Label ID="Label5" runat="server" class="help-block" Text="اسم الموظف"></asp:Label>
                                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                            </div>
                                        </div>--%>
                                        <div class="clearfix"></div>

                                        <div class="form-group row">
                                            <label class="control-label col-md-3">الاسم بالكامل<span class="required">*</span></label>
                                            <div class="col-md-5"style="padding:0px;">
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="F_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="S_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="Th_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="Family_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox></div>
                                            </div>
                                        </div>


                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">صلة القرابة</label>
                                            <div class="col-md-5">
                                                <asp:DropDownList ID="RelativeID" AutoPostBack="true" runat="server"   CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" OnSelectedIndexChanged="RelativeID_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID], [Ar_Name] FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select 0,N'  '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="11" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                             
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <asp:Label ID="lbldate" runat="server" class="col-md-3 control-label" Text="تاريخ الميلاد"></asp:Label>
                                            <div class="col-md-5">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="DOB" runat="server" placeholder="ادخل التاريخ" class="form-control form-control-inline input-large date-picker" type="text" value=""></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row" runat="server" id="BPlace">
                                            <asp:Label ID="Label1" runat="server" class="col-md-3 control-label" Text="مكان الميلاد"></asp:Label>
                                            <div class="col-md-5">
                                                <asp:TextBox ID="birth_Place" placeholder="مكان الميلاد " runat="server" class="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row ">
                                            <label class="col-md-3 control-label">نوع الوظيفة</label>
                                            <div class="col-md-5">
                                                <asp:DropDownList ID="JobType" runat="server" CssClass="select2_category form-control"  DataSourceID="SqlDataSource2" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT  Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select 0,N'  '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="19" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">فعال     </label>
                                            <div class="col-md-5">
                                                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="Check_Changed" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="form-group row" runat="server" id="Active" visible="false">
                                            <label class="col-md-3 control-label">سبب اعتباره غير فعال </label>
                                            <div class="col-md-5">
                                                <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" DataSourceID="SqlDataSource4" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT  Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select 0,N'  '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="21" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="form-group row" runat="server" id="Active2" visible="false">
                                            <label class="col-md-3 control-label">تاريخ اعتباره غير فعال     </label>
                                            <div class="col-md-5">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="NotActive_Date" runat="server" placeholder="ادخل التاريخ" class="form-control form-control-inline input-large date-picker" type="text" value=""></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="form-actions fluid">
                                        <div class="col-md-offset-3 col-md-9">
                                            <asp:Button ID="Button1" runat="server" Text="حفظ" class="btn green" OnClick="Button1_Click" />

                                            <asp:Button ID="Button2" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button2_Click" />
                                        </div>
                                    </div>
                                </div>
                                <!-- END FORM-->
                            </div>
                        </div>
                        <%} %>



                        <div class="portlet box red">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>بيانات العائلة</div>
                                <div class="tools">
                                    <%--    <a class="remove" href="javascript:;"></a>--%>
                                    <a href="javascript:;" class="collapse"></a>

                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%">الاسم </th>

                                                <th style="width: 10%; text-align: center">صلة القرابة</th>
                                                <th style="width: 10%; text-align: center">تاريخ الميلاد</th>
                                                <th style="width: 10%; text-align: center">الوظيفة</th>
                                                <%--     <th style="width: 5%; text-align: center">فعال</th>--%>
                                                <th style="width: 15%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource5">
                                                <ItemTemplate>
                                                    <asp:Label ID="EmpFamilyID" runat="server" Text='<%# Eval("Emp_Family_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("F_Name") %> <%# Eval("S_Name") %> <span><%# Eval("Th_Name") %> <%# Eval("Family_Name") %></span></td>

                                                        <td style="text-align: center"><span><%# Eval("Ar_Name") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Date_Of_Birth","{0:yyyy/MM/dd}")  %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("name") %></span></td>
                                                        <%--   <td style="text-align: center">
                                           <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' />
                                            </td>--%>
                                                        <td style="text-align: center">
                                                            <% if (Permissions.Contains("FamilyEdit"))
                                                               { %>
                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                            <%} %>
                                                            <% if (Permissions.Contains("FamilyDelete"))
                                                               { %>
                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                            <%} %>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand=" SELECT Emp_Family.*,Emp_Sub_Constant.Ar_Name,h.Ar_Name as name
       
                                    
                                     FROM [Emp_Family] 
                                    inner join [Emp_Sub_Constant] ON Emp_Family.Relative_Type_ID=Emp_Sub_Constant.Sub_Constant_ID
								inner join [Emp_Sub_Constant] as h ON Emp_Family.Job=h.Sub_Constant_ID
                                     where IsDelete=0 and Emp_Family.Emp_ID=@Emp_ID order by Emp_Family_ID DESC">
                                                
                                      <SelectParameters>
                                           <asp:ControlParameter ControlID="DropDownList8" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" />
                                          </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%} %>
                    <% if (Permissions.Contains("EmergencyView"))
                       { %>
                    <div class="tab-pane " id="tab_2">
                        <% if (Permissions.Contains("EmergencyAdd") || Permissions.Contains("EmergencyEdit"))
                           { %>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>بيانات الطوارئ للموظف</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <%--     <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>--%>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="horizontal-form">
                                    <div class="form-body">
                                        <div class="form-group">


                                            <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="DropDownList3" AutoPostBack="true" class="form-control" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource8" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>

                                            </div>



                                        </div>
                                    <%--    <div class="clearfix"></div>

                                        <div class="form-group" runat="server" id="Div1">
                                            <label class="col-md-3 control-label">رقم الموظف </label>
                                            <div class="col-md-4">
                                                <div class="input-group" style="text-align: left">
                                                    <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Enter text"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button ID="Button8" runat="server" Text="فحص" class="btn green" OnClick="Username_Checker_Click2" />

                                                    </span>
                                                </div>
                                                <asp:Label ID="Label2" runat="server" class="help-block" Text="اسم الموظف"></asp:Label>
                                                <asp:HiddenField ID="HiddenField2" runat="server" />
                                            </div>
                                        </div>--%>

                                        <div class="clearfix"></div>
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">الاسم بالكامل<span class="required">*</span></label>
                                              
                                                     <div class="col-md-5"style="padding:0px;">
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control input-xsmall"></asp:TextBox></div>
                                             </div>
                                                </div>
                                            </div>

                                            <div class="clearfix"></div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">صلة القرابة</label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select2_category form-control"
                                                        DataSourceID="SqlDataSource1" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID">
                                                    </asp:DropDownList>
        
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">رقم الهاتف    </label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="phone" runat="server" numeric="integer" MaxLength="7" placeholder="ادخل رقم الهاتف " class="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">رقم الجوال     </label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="mobile" runat="server" numeric="integer" MaxLength="10" placeholder="ادخل رقم الجوال" class="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">البريد الالكتروني    </label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>

                                                        <asp:TextBox ID="email" runat="server" class="form-control"  placeholder="ادخل البريد الالكتروني" TextMode="Email"></asp:TextBox>
                                                    </div>
                               <%--                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="صيغة الايميل غير صحيحة" ControlToValidate="email"  ValidationExpression="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i"></asp:RegularExpressionValidator>--%>

                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group ">
                                                <label class="col-md-3 control-label">المدينة </label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="CityID" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>

                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT * FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID)">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="2" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <%--  <div class="form-group ">
                                            <label class="col-md-3 control-label">المنطقة </label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="RegionID" runat="server"></asp:DropDownList>

                                                <span class="help-block">ادخل  المنطقة ( الحي او المخيم)</span>
                                            </div>
                                        </div>--%>
                                            <div class="clearfix"></div>
                                            <div class="form-group last ">
                                                <label class="col-md-3 control-label">تفاصيل العنوان </label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="Address" runat="server" class="form-control" placeholder="ادخل  اسم الشارع او اقرب مسجد"></asp:TextBox>


                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="form-actions fluid">
                                        <div class="col-md-offset-3 col-md-9">
                                            <asp:Button ID="Button3" runat="server" Text="حفظ" class="btn green" OnClick="Button3_Click" />

                                            <asp:Button ID="Button4" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button4_Click" />

                                        </div>
                                    </div>
                                </div>
                                <!-- END FORM-->
                            </div>
                     
                       <%} %>   
                        <div class="portlet box purple">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>بيانات الطوارئ</div>
                                <div class="tools">
                                    <%--                        <a class="remove" href="javascript:;"></a>--%>
                                    <a href="javascript:;" class="collapse"></a>

                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%">الاسم </th>

                                                <th style="width: 10%; text-align: center">صلة القرابة</th>
                                                <th style="width: 10%; text-align: center">رقم الهاتف </th>
                                                <th style="width: 10%; text-align: center">رقم الجوال</th>
                                                <%--   <th style="width: 5%; text-align: center">فعال</th>--%>
                                                <th style="width: 15%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource6">
                                                <ItemTemplate>
                                                    <asp:Label ID="EmergancyID" runat="server" Text='<%# Eval("Emergancy_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <span><%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>

                                                        <td style="text-align: center"><span><%# Eval("Emergancy_Relative_ID") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Emergancy_Phone") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Emergancy_Mobile") %></span></td>

                                                        </td>
                                            <td style="text-align: center">
                                                <% if (Permissions.Contains("EmergencyEdit"))
                                                   { %>
                                                <asp:LinkButton ID="lbEdit2" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <%} %>    <% if (Permissions.Contains("EmergencyDelete"))
                                                             { %>
                                                <asp:LinkButton ID="lbDelete2" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                <%} %>
                                            </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="SELECT Emergancy_TB.*,Emp_Sub_Constant.Ar_Name
                                    
                                     FROM Emergancy_TB  inner join Emp_Sub_Constant on Emergancy_TB.Emergancy_Relative_ID=Emp_Sub_Constant.Sub_Constant_ID
                                    
                                     where IsDelete=0 and Emergancy_TB.Emp_ID=@Emp_ID  order by Emergancy_ID DESC">
                                                 <SelectParameters>
                                           <asp:ControlParameter ControlID="DropDownList3" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" />
                                          </SelectParameters>
                                            </asp:SqlDataSource>
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                      </div>

                    <%} %>
                
                  <% if (Permissions.Contains("ReferencesView"))
                                 { %>
                    <div class="tab-pane " id="tab_3">
                        <% if (Permissions.Contains("ReferencesAdd") || Permissions.Contains("ReferencesEdit"))
                           { %>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>بيانات المعرفين  </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <%--  <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>--%>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="horizontal-form">
                                    <div class="form-body">
                                        <div class="form-group">


                                            <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="DropDownList4" AutoPostBack="true"  placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource9" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>

                                            </div>



                                        </div>
                                     <%--   <div class="clearfix"></div>

                                        <div class="form-group" runat="server" id="Div2">
                                            <label class="col-md-3 control-label">رقم الموظف </label>
                                            <div class="col-md-4">
                                                <div class="input-group" style="text-align: left">
                                                    <asp:TextBox ID="TextBox6" runat="server" class="form-control" placeholder="Enter text"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button ID="Button9" runat="server" Text="فحص" class="btn green" OnClick="Username_Checker_Click3" />

                                                    </span>
                                                </div>
                                                <asp:Label ID="Label3" runat="server" class="help-block" Text="اسم الموظف"></asp:Label>
                                                <asp:HiddenField ID="HiddenField3" runat="server" />
                                            </div>
                                        </div>--%>

                                        <div class="clearfix"></div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3">الاسم بالكامل<span class="required">*</span></label>
                                           
                                                     <div class="col-md-5"style="padding:0px;">
                                                <div class="col-md-3">
                                                <asp:TextBox ID="Ar_F_Name" runat="server"  CssClass="form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                <asp:TextBox ID="Ar_S_Name"  runat="server"  CssClass="form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                <asp:TextBox ID="Ar_Th_Name"  runat="server"  CssClass="form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                <asp:TextBox ID="Ar_Family"  runat="server"  CssClass="form-control input-xsmall"></asp:TextBox></div>
                                            
                                        
                                            </div>
                                        </div>
                                      
                                        <div class="clearfix"></div>
                                        
<%--                                        <div class="form-group">
                                            <label class="control-label col-md-3">full name <span class="required">*</span></label>
                                           
                                                 <div class="col-md-5"style="padding:0px;">
                                                <div class="col-md-3">
                                                <asp:TextBox ID="En_F_Name"  runat="server"  CssClass="form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                <asp:TextBox ID="En_S_Name"  runat="server"  CssClass="form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                <asp:TextBox ID="En_Th_Name"  runat="server" CssClass="form-control input-xsmall"></asp:TextBox></div>
                                                <div class="col-md-3">
                                                <asp:TextBox ID="En_Family"  runat="server"  CssClass="form-control input-xsmall"></asp:TextBox></div>
                                              

 </div>
                                            </div>--%>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">الوظيفة     </label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtJob" runat="server" class="form-control" placeholder="ادخل وظيفة المرجع"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">رقم الهاتف    </label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtPhone" runat="server" class="form-control" placeholder="ادخل رقم الهاتف"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">رقم الجوال     </label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="ادخل رقم الجوال"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                    <div class="form-group">
                                                <label class="col-md-3 control-label">البريد الالكتروني    </label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>

                                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="ادخل البريد الالكتروني"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>


                                       
                                        <div class="clearfix"></div>
                                        <div class="form-group last ">
                                            <label class="col-md-3 control-label">تفاصيل العنوان </label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" class="form-control" placeholder="ادخل  العنوان بالكامل"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="form-actions fluid">
                                        <div class="col-md-offset-3 col-md-9">
                                            <asp:Button ID="Button5" runat="server" Text="حفظ" class="btn green" OnClick="Button5_Click" />

                                            <asp:Button ID="Button6" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button6_Click" />

                                        </div>
                                    </div>
                                </div>
                                <!-- END FORM-->
                            </div>
                      
                        <%} %>

                        <div class="portlet box purple">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>بيانات المعرفين</div>
                                <div class="tools">
                                    <%--                        <a class="remove" href="javascript:;"></a>--%>
                                    <a href="javascript:;" class="collapse"></a>

                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%">الاسم </th>

                                                <th style="width: 10%; text-align: center">الوظيفة </th>
                                                <th style="width: 10%; text-align: center">رقم الهاتف </th>
                                                <th style="width: 10%; text-align: center">رقم الجوال</th>
                                                <%--                                    <th style="width: 5%; text-align: center">فعال</th>--%>
                                                <th style="width: 15%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource7">
                                                <ItemTemplate>
                                                    <asp:Label ID="RefID" runat="server" Text='<%# Eval("Ref_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>

                                                        <td style="text-align: center"><span><%# Eval("Ref_Job") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Ref_Phone") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Ref_Mobile") %></span></td>
                                                        </td>
                                            <td style="text-align: center">
                                                <% if (Permissions.Contains("ReferencesEdit"))
                                                   { %>
                                                <asp:LinkButton ID="lbEdit3" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click3"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <%} %>
                                                <% if (Permissions.Contains("ReferencesDelete"))
                                                   { %>
                                                <asp:LinkButton ID="lbDelete3" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click3" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                <%} %>
                                            </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource7" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="SELECT * FROM [References] WHERE IsDelete=0 and Emp_ID=@Emp_ID order by Ref_ID DESC">

                                                 <SelectParameters>
                                           <asp:ControlParameter ControlID="DropDownList4" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" />
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
            </div>
        </div>
</asp:Content>
