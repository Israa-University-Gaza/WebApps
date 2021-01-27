<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Allownace_AddEdit.aspx.cs" Inherits="APP_HRM_Emp_Allownace_AddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />
    <style>
        .input-xsmall {
            width: 100% !important;
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
       <script type="text/javascript">
           $('document').ready(function () {
               $('.page-sidebar-menu li').removeClass("active");
               $('#menu5').addClass("active");
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
        <li><a href="Emp_Allownace_AddEdit.aspx" class="font-ha">مستحقات وخصميات الموظفين</a></li>
    </ul>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <div class="tabbable tabbable-custom boxless">
                <ul class="nav nav-tabs">
                    <% if (Permissions.Contains("AllowanceView"))
                       { %>
                    <li id="t1" runat="server" class="active"><a href="#tab_1" data-toggle="tab">ادخال البدلات للموظف</a></li>
                    <%} %>
                    <% if (Permissions.Contains("BonusesView"))
                       { %>
                    <li id="t2" runat="server"><a href="#tab_2" data-toggle="tab">ادخال العلاوات للموظف</a></li>
                    <%} %>
                    <% if (Permissions.Contains("DeductionView"))
                       { %>
                    <li id="t3" runat="server"><a href="#tab_3" data-toggle="tab">ادخال الجزاءات للموظف</a></li>
                    <%} %>
                    <% if (Permissions.Contains("MotivationView"))
                       { %>
                    <li id="t4" runat="server"><a href="#tab_4" data-toggle="tab">ادخال المكافآت للموظف</a></li>
                    <%} %>
                    <% if (Permissions.Contains("PenaltiesView"))
                       { %>
                    <li id="t5" runat="server"><a href="#tab_5" data-toggle="tab">ادخال العقوبات للموظف</a></li>
                    <%} %>
                </ul>
                <div class="tab-content">
                    <% if (Permissions.Contains("AllowanceView"))
                       { %>
                    <div class="tab-pane active" id="tab_1" runat="server" ClientIDMode="Static">
                        <% if (Permissions.Contains("AllowanceAdd") || Permissions.Contains("AllowanceEdit"))
                           { %>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>ادخال البدلات</div>
                                <div class="tools">
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-body">
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="EmpName" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource19" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" placeholder="ادخل اسم الموظف"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource19" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,[dbo].[GetEmployeeName](Emp_ID,3) as DisplayName  FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-3 control-label">نوع البدل</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="AllowancyTypeID" runat="server" CssClass="select2_category form-control" placeholder="اختر نوع البدل" DataSourceID="SqlDataSource1" DataTextField="Allowance_Type" DataValueField="Allowance_Type_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="SELECT Allowance_Type_ID,Allowance_Type FROM [Allowance_Type_TB] union select 0,N'  '"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">نوع الاحتساب</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="EvaluateType" runat="server" CssClass="select2_category form-control" placeholder="اختر نوع الاحتساب" DataSourceID="SqlDataSource6" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select 0,N' '">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="1024" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-3 control-label">الوصف</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList3" CssClass="select2_category form-control" placeholder="اختر الوصف" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="1">نسبة</asp:ListItem>
                                                <asp:ListItem Value="2">قيمة</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">نسبة البدل</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="AllownaceRate" AutoPostBack="true" placeholder="ادخل نسبة البدل" runat="server" class="form-control" Text="" OnTextChanged="AllownaceRate_TextChanged"></asp:TextBox>
                                        </div>
                                        <label class="col-md-3 control-label">قيمة البدل</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="AllowanceValue" AutoPostBack="true" runat="server" placeholder="ادخل قيمة البدل" class="form-control" Text="" OnTextChanged="AllowanceValue_TextChanged" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">نوع العملة</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="CurrType" class="form-control" CssClass="select2_category form-control" placeholder="ادخل نوع العملة " runat="server" DataSourceID="SqlDataSource12" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select 0,N'  '"></asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-3 control-label">تاريخ بدء احتساب البدل  </label>
                                        <div class="col-md-3">
                                            <div class="input-icon">
                                                <i class="fa fa-calendar"></i>
                                                <asp:TextBox ID="AllowanceSDate" placeholder="ادخل تاريخ بدء البدل" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row last">
                                        <label class="col-md-3 control-label">تاريخ انتهاء احتساب البدل</label>
                                        <div class="col-md-3">
                                            <div class="input-icon">
                                                <i class="fa fa-calendar"></i>
                                                <asp:TextBox ID="AllowanceFDate" placeholder="ادخل تاريخ انتهاء احتساب البدل" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
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
                        <%} %>
                        <div class="portlet box red">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>بدلات الموظف </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%">اسم الموظف </th>
                                                <th style="width: 10%; text-align: center">نوع البدل</th>
                                                <th style="width: 15%; text-align: center">تاريخ بدءالاحتساب</th>
                                                <th style="width: 15%; text-align: center">تاريخ نهايةالاحتساب</th>
                                                <th style="width: 10%; text-align: center">قيمة البدل</th>
                                                <th style="width: 10%; text-align: center">نسبة البدل</th>
                                                <th style="width: 25%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource14">
                                                <ItemTemplate>
                                                    <asp:Label ID="AllowanceID" runat="server" Text='<%# Eval("Allowance_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Allowance_Type") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Allowance_Start_Date","{0:yyyy/MM/dd}") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Allowance_End_Date","{0:yyyy/MM/dd}") %></span></td>

                                                        <td style="text-align: center"><span><%# Eval("Allowance_Value") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Allowance_Rate") %></span></td>
                                                        <td style="text-align: center"></td>
                                                        <td style="text-align: center">
                                                            <% if (Permissions.Contains("AllowanceEdit"))
                                                               { %>
                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                            <% } %>
                                                            <% if (Permissions.Contains("AllowanceDelete"))
                                                               { %><asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                            <% } %>  </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource14" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="AllowanceEmpGet" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="EmpName" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <%} %>

                    <div class="tab-pane " runat="server" id="tab_2" ClientIDMode="Static">
                        <% if (Permissions.Contains("BonusesAdd") || Permissions.Contains("BonusesEdit"))
                           { %>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>ادخال العلاوات</div>
                                <div class="tools">
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-body">
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="BounsEmp" OnSelectedIndexChanged="BounsEmp_SelectedIndexChanged" AutoPostBack="true" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,[dbo].[GetEmployeeName](Emp_ID,3) as DisplayName FROM [Employee_TB] where Emp_ID not in (1,2,3,5) union select -1,N'  اختر الموظف'"></asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-3 control-label">نوع العلاوة</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList1" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="Bouns_Type" DataValueField="Bouns_Type_ID" runat="server"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="SELECT Bouns_Type_ID,Bouns_Type FROM [Bouns_Type_TB] where isdelete=0 union select -1,N'  اختر نوع العلاوة'"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                   <div class="form-group row">
                                        <div runat="server" id="son1" visible="false">
                                            <label class="col-md-3 control-label">اسم الابن</label>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="DropDownList7" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource11" DataTextField="F_Name" DataValueField="Emp_Family_ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource11"
                                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                    SelectCommand="select 	*  from Emp_Family where [Relative_Type_ID]=8 and Emp_ID=@Emp_ID">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="BounsEmp" PropertyName="SelectedValue" Name="Emp_ID"></asp:ControlParameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                        <%--<label class="col-md-3 control-label">نوع الاحتساب</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="EvaluateType1" runat="server"  CssClass="select2_category form-control" DataSourceID="SqlDataSource7" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select 0,N' '">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="1024" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>--%>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">الوصف</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList6" CssClass="select2_category form-control" placeholder="اختر الوصف" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="1">نسبة</asp:ListItem>
                                                <asp:ListItem Value="2">قيمة</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <label class="col-md-3 control-label">نسبة العلاوة</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="BounsRate" AutoPostBack="true" placeholder="ادخل نسبة العلاوة" runat="server" OnTextChanged="BounsRate_TextChanged" class="form-control" Text=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">قيمة العلاوة</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="BounsValue" AutoPostBack="true" placeholder="ادخل قيمة العلاوة" runat="server" Enabled="false" OnTextChanged="BounsValue_TextChanged" class="form-control" Text=""></asp:TextBox>
                                        </div>
                                        <label class="col-md-3 control-label">نوع العملة</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="CurrBou" class="form-control" CssClass="select2_category form-control" placeholder="ادخل نوع العملة " runat="server" DataSourceID="SqlDataSource3" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select 0,N'  '"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">تاريخ بدء احتساب العلاوة  </label>
                                        <div class="col-md-3">
                                            <div class="input-icon">
                                                <i class="fa fa-calendar"></i>
                                                <asp:TextBox ID="BounsSDate" placeholder="ادخل تاريخ بدء العلاوة" Text="2016/11/29" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                            </div>
                                        </div>
                                        <label class="col-md-3 control-label">تاريخ انتهاء احتساب العلاوة</label>
                                        <div class="col-md-3">
                                            <div class="input-icon">
                                                <i class="fa fa-calendar"></i>
                                                <asp:TextBox ID="BounsFDate" placeholder="ادخل تاريخ انتهاء احتساب العلاوة" Text="2016/11/29" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
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
                        <% if (Permissions.Contains("BonusesView"))
                           { %>
                        <div class="portlet box yellow">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>علاوات الموظف </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%">اسم الموظف </th>
                                                <th style="width: 10%; text-align: center">نوع العلاوة</th>
                                                <th style="width: 12%; text-align: center">تاريخ الاحتساب</th>
                                                <th style="width: 10%; text-align: center">قيمة العلاوة</th>
                                                <th style="width: 10%; text-align: center">نسبة العلاوة</th>
                                                <th style="width: 15%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource15">
                                                <ItemTemplate>
                                                    <asp:Label ID="BounsID" runat="server" Text='<%# Eval("Bouns_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("DisplayName") %>  </span></td>
                                                        <td style="text-align: center"><span><%# Eval("Bouns_Type") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Bouns_Start_Date","{0:yyyy/MM/dd}") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Bouns_Value") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Bouns_Rate") %></span></td>
                                                        <td style="text-align: center"></td>
                                                        <td style="text-align: center">
                                                            <% if (Permissions.Contains("BonusesEdit"))
                                                               { %>
                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                            <% } %>
                                                            <% if (Permissions.Contains("BonusesDelete"))
                                                               { %>
                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                            <% } %></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource15" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="BounsEmpGet" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="BounsEmp" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <%} %>
                    </div>
                    <% if (Permissions.Contains("DeductionView"))
                       { %>
                    <div class="tab-pane" id="tab_3" runat="server" ClientIDMode="Static">
                        <% if (Permissions.Contains("DeductionAdd") || Permissions.Contains("DeductionEdit"))
                           { %>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>ادخال الجزاءات</div>
                                <div class="tools">
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-body">
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DedEmp" OnSelectedIndexChanged="DedEmp_SelectedIndexChanged" AutoPostBack="true" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource21" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource21" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-3 control-label">نوع الجزاء</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource13" DataTextField="Deduction_Type" DataValueField="Deduction_Type_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource13"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="SELECT Deduction_Type_ID,Deduction_Type FROM [Deduction_Type_TB] union select 0,N'  '"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">نوع الاحتساب</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="EvaluateType2" runat="server" class="form-control" CssClass="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select 0,N'  '">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="1024" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-3 control-label">الوصف</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList4" CssClass="select2_category form-control" placeholder="اختر الوصف" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="1">نسبة</asp:ListItem>
                                                <asp:ListItem Value="2">قيمة</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">نسبة الجزاء</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="DedRate" runat="server" AutoPostBack="true" placeholder="ادخل نسبة الجزاء" class="form-control" Text="" OnTextChanged="DedRate_TextChanged"></asp:TextBox>
                                        </div>
                                        <label class="col-md-3 control-label">قيمة الجزاء</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="DedValue" AutoPostBack="true" Enabled="false" placeholder="ادخل قيمة الجزاء" runat="server" class="form-control" Text="" OnTextChanged="DedValue_TextChanged"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-body">
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">نوع العملة</label>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="CurrDed" class="form-control" CssClass="select2_category form-control" placeholder="ادخل نوع العملة " runat="server" DataSourceID="SqlDataSource74" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource74" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select 0,N'  '"></asp:SqlDataSource>
                                            </div>

                                            <label class="col-md-3 control-label">تاريخ بدء احتساب الجزاء  </label>
                                            <div class="col-md-3">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="DedSDate" placeholder="ادخل تاريخ بدء الجزاء" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row last">
                                        <label class="col-md-3 control-label">تاريخ انتهاء احتساب الجزاء</label>
                                        <div class="col-md-3">
                                            <div class="input-icon">
                                                <i class="fa fa-calendar"></i>
                                                <asp:TextBox ID="DedFDate" placeholder="ادخل تاريخ انتهاء احتساب الجزاء" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-actions fluid">
                                    <div class="col-md-offset-3 col-md-9">
                                        <asp:Button ID="Button5" runat="server" Text="حفظ" class="btn green" OnClick="Deduction_Click" />
                                        <asp:Button ID="Button6" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button6_Click" />
                                    </div>
                                </div>
                            </div>
                            <!-- END FORM-->
                        </div>
                        <%} %>
                        <div class="portlet box purple">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>جزاءات الموظف </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%">اسم الموظف </th>
                                                <th style="width: 10%; text-align: center">نوع الجزاء</th>
                                                <th style="width: 12%; text-align: center">تاريخ الاحتساب</th>
                                                <th style="width: 10%; text-align: center">قيمة الجزاء</th>
                                                <th style="width: 10%; text-align: center">نسبة الجزاء</th>
                                                <th style="width: 15%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource16">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeductionID" runat="server" Text='<%# Eval("Deduction_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Deduction_Type") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Deduction_Start_Date","{0:yyyy/MM/dd}") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Deduction_Value") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Deduction_Rate") %></span></td>
                                                        <td style="text-align: center"></td>
                                                        <td style="text-align: center">
                                                            <% if (Permissions.Contains("DeductionEdit"))
                                                               { %>
                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click3"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                            <% } %>
                                                            <% if (Permissions.Contains("DeductionDelete"))
                                                               { %>
                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click3" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                            <% } %> </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource16" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="DeductionEmpGet" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DedEmp" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%} %>  <% if (Permissions.Contains("MotivationView"))
                               { %>
                    <div class="tab-pane" id="tab_4" runat="server" ClientIDMode="Static">
                        <% if (Permissions.Contains("MotivationAdd") || Permissions.Contains("MotivationEdit"))
                           { %>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>ادخال المكافآت للموظف</div>
                                <div class="tools">
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <div class="form-body">
                                    <!-- BEGIN FORM-->
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="MotivatEmp" OnSelectedIndexChanged="MotivatEmp_SelectedIndexChanged" AutoPostBack="true" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource22" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource22" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-3 control-label">نوع المكافأة</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DDMotivate" runat="server" class="form-control" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="Motivation_Type" DataValueField="Motivation_Type_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource4"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="SELECT Motivation_Type_ID, Motivation_Type FROM [Motivation_Type_TB]  union select 0,N'  '"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">الوصف</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList5" CssClass="select2_category form-control" placeholder="اختر الوصف" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="1">نسبة</asp:ListItem>
                                                <asp:ListItem Value="2">قيمة</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <label class="col-md-3 control-label">نسبة المكافأة</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="MotivateRate" AutoPostBack="true" placeholder="ادخل نسبة المكافأة" runat="server" class="form-control" Text="" OnTextChanged="MotivateRate_TextChanged"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">قيمة المكافأة</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="MotivateValue" AutoPostBack="true" placeholder="ادخل قيمة المكافأة" runat="server" class="form-control" Text="" OnTextChanged="MotivateValue_TextChanged" Enabled="false"></asp:TextBox>
                                        </div>
                                        <label class="col-md-3 control-label">نوع العملة</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="CurrMot" class="form-control" CssClass="select2_category form-control" placeholder="ادخل نوع العملة " runat="server" DataSourceID="SqlDataSource5" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select 0,N'  '"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">تاريخ بدء احتساب المكافأة  </label>
                                        <div class="col-md-3">
                                            <div class="input-icon">
                                                <i class="fa fa-calendar"></i>
                                                <asp:TextBox ID="MotivateSDate" placeholder="ادخل تاريخ بدء المكافأة" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-actions fluid">
                                    <div class="col-md-offset-3 col-md-9">
                                        <asp:Button ID="Button11" runat="server" Text="حفظ" class="btn green" OnClick="Motivation_Click" />
                                        <asp:Button ID="Button12" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button12_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END FORM-->
                        <%} %>
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>مكافآت الموظف </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%">اسم الموظف </th>
                                                <th style="width: 10%; text-align: center">نوع المكافأة</th>
                                                <th style="width: 12%; text-align: center">تاريخ الاحتساب</th>
                                                <th style="width: 10%; text-align: center">قيمة المكافأة</th>
                                                <th style="width: 10%; text-align: center">نسبة المكافأة</th>
                                                <th style="width: 15%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource17">
                                                <ItemTemplate>
                                                    <asp:Label ID="MotivationID" runat="server" Text='<%# Eval("Motivation_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Motivation_Type") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Motivation_S_Date","{0:yyyy/MM/dd}") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Motivation_Value") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Motivation_Rate") %></span></td>
                                                        <td style="text-align: center"></td>
                                                        <td style="text-align: center"><% if (Permissions.Contains("MotivationEdit"))
                                                                                          { %>
                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click4"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                            <% } %>
                                                            <% if (Permissions.Contains("MotivationDelete"))
                                                               { %>
                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click4" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                            <% } %> </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource17" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="MotivationEmpGet" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="MotivatEmp" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%} %>
                      <% if (Permissions.Contains("PenaltiesView"))
                       { %>
                    <div class="tab-pane" id="tab_5" runat="server" ClientIDMode="Static">
                        <% if (Permissions.Contains("PenaltiesAdd") || Permissions.Contains("PenaltiesEdit"))
                           { %>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>ادخال العقوبات للموظف</div>
                                <div class="tools">
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-body">
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="PenaltyEmp" OnSelectedIndexChanged="PenaltyEmp_SelectedIndexChanged" AutoPostBack="true" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource23" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource23" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">نوع العقوبة</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DDPanelty" runat="server" class="form-control" CssClass="select2_category form-control" DataSourceID="SqlDataSource45" DataTextField="Penalty_Type" DataValueField="Penalty_Type_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource45"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="SELECT Penalty_Type_ID,Penalty_Type FROM [Penalty_Type_TB] union select 0,N'  '"></asp:SqlDataSource>
                                        </div>

                                        <label class="col-md-3 control-label">تاريخ  تحرير العقوبة  </label>
                                        <div class="col-md-3">
                                            <div class="input-icon">
                                                <i class="fa fa-calendar"></i>
                                                <asp:TextBox ID="PaneltySDate" placeholder="ادخل تاريخ تحرير العقوبة" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-actions fluid">
                                    <div class="col-md-offset-3 col-md-9">
                                        <asp:Button ID="Button14" runat="server" Text="حفظ" class="btn green" OnClick="Panelty_Click" />
                                        <asp:Button ID="Button15" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button15_Click" />
                                    </div>
                                </div>
                            </div>
                            <!-- END FORM-->
                        </div>
                        <%} %>
                        <% if (Permissions.Contains("PenaltiesView"))
                           { %>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>عقوبات الموظف </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%">اسم الموظف </th>
                                                <th style="width: 10%; text-align: center">نوع العقوبة</th>
                                                <th style="width: 12%; text-align: center">تاريخ الاحتساب</th>
                                                <th style="width: 15%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource18">
                                                <ItemTemplate>
                                                    <asp:Label ID="PenatlyID" runat="server" Text='<%# Eval("Penalty_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Penalty_Type") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Penalty_Date","{0:yyyy/MM/dd}") %></span></td>
                                                        <td style="text-align: center"></td>
                                                        <td style="text-align: center">
                                                            <% if (Permissions.Contains("PenaltiesEdit"))
                                                               { %>
                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click5"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                            <% } %>
                                                            <% if (Permissions.Contains("PenaltiesDelete"))
                                                               { %><asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click5" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                            <% } %> </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource18" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="PenaltyEmpGet" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="PenaltyEmp" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <%} %>
                    </div>
                     <%} %>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
