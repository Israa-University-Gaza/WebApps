<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="Differances_AddEdit.aspx.cs" Inherits="Finanical_Differances_AddEdit" %>

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
            $('#menu5').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Differances_AddEdit.aspx" class="font-ha">طلب احتساب الفروقات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلب احتساب الفروقات </div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="DropDownList8" AutoPostBack="true" OnSelectedIndexChanged="DropDownList8_SelectedIndexChanged" class="form-control" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-4">
                                        <asp:RadioButton ID="RadioButton1" class="radio-inline" runat="server" Text="استحقاق" AutoPostBack="true" GroupName="Radio" OnCheckedChanged="RadioButton1_CheckedChanged" />
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:RadioButton ID="RadioButton2" class="radio-inline" runat="server" Text="استقطاع" AutoPostBack="true" GroupName="Radio" OnCheckedChanged="RadioButton2_CheckedChanged" />
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group" id="Plus" runat="server" visible="false">
                                <label class="col-md-2 control-label">نوع الاستحقاق </label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="DD_Plus_Type" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DD_Plus_Type_SelectedIndexChanged" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1">
                                        <asp:ListItem Value="1" Text="Allownace">بدلات</asp:ListItem>
                                        <asp:ListItem Value="2" Text="Bounses">علاوات</asp:ListItem>
                                        <asp:ListItem Value="3" Text="Motivation">مكافآت</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="Type" runat="server" AutoPostBack="true" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1" DataSourceID="SqlDataSource1" DataTextField="Allowance_Type" DataValueField="Allowance_Type_ID">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Allowance_Type_ID], [Allowance_Type] FROM [Allowance_Type_TB]"></asp:SqlDataSource>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Bouns_Type_ID], [Bouns_Type] FROM [Bouns_Type_TB]"></asp:SqlDataSource>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Motivation_Type_ID], [Motivation_Type] FROM [Motivation_Type_TB]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group" id="Discount" runat="server" visible="false">
                                <label class="col-md-2 control-label">نوع الاستقطاع </label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="DD_Discount" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DD_Discount_SelectedIndexChanged" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1">
                                        <asp:ListItem Value="1" Text="Deduction">جزاءات</asp:ListItem>
                                        <asp:ListItem Value="2" Text="Tax">ضريبة</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="DD_Discount_Type" runat="server" AutoPostBack="true" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1" DataSourceID="SqlDataSource4" DataTextField="Deduction_Type" DataValueField="Deduction_Type_ID">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Deduction_Type_ID], [Deduction_Type] FROM [Deduction_Type_TB]"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">المبلغ بالدينار </label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="Value" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">احتساب عن شهر </label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" class="form-control" placeholder="اختر الشهر" CssClass="select2_category form-control">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem Value="1">يناير</asp:ListItem>
                                        <asp:ListItem Value="2">فبراير</asp:ListItem>
                                        <asp:ListItem Value="3">مارس</asp:ListItem>
                                        <asp:ListItem Value="4">ابريل</asp:ListItem>
                                        <asp:ListItem Value="5">مايو</asp:ListItem>
                                        <asp:ListItem Value="6">يونيو</asp:ListItem>
                                        <asp:ListItem Value="7">يوليو</asp:ListItem>
                                        <asp:ListItem Value="8">أغسطس</asp:ListItem>
                                        <asp:ListItem Value="9">سبتمبر</asp:ListItem>
                                        <asp:ListItem Value="10">أكتوبر</asp:ListItem>
                                        <asp:ListItem Value="11">نوفمبر</asp:ListItem>
                                        <asp:ListItem Value="12">ديسمبر</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <label class="col-md-2 control-label">السنة </label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="Button3" runat="server" Text=" حفظ " class="btn green" OnClick="Button3_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>عرض الفروقات </div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 20%">اسم الموظف  </th>
                                <th style="width: 17%;">فروقات</th>
                                <th style="width: 17%;">النوع</th>
                                <th style="width: 20%;">القيمة</th>
                                <th style="width: 20%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource5">
                                <ItemTemplate>
                                    <asp:Label ID="Diff_ID" runat="server" Text='<%# Eval("Diff_ID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("DisplayName") %> </span></td>
                                        <td><%# Eval("Type") %>
                                            <td><%# Eval("Diff_Type_ID") %>
                                                
                                            </td>
                                            <td><%# Eval("Diff_Value") %>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                SelectCommand="SELECT Differences_TB.* ,Employee_TB.DisplayName
                                    FROM [Differences_TB]  
                                    Inner Join Employee_TB ON Differences_TB.Emp_ID=Employee_TB.Emp_ID
                                  WHERE  Differences_TB.Emp_ID=@Emp_ID 
                                    ">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList8" PropertyName="SelectedValue" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>

