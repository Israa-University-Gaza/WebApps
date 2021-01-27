<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Advance_AddEdit.aspx.cs" Inherits="Finanical_Emp_Advance_AddEdit" %>

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
        <li><a href="Emp_Advance_AddEdit.aspx" class="font-ha">السلفيات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("AdvanceAdd") || Permissions.Contains("AdvanceEdit"))
           { %>
        <div class="col-md-12">
            <div class="portlet box blue">
                <asp:TextBox ID="AdvanceID" runat="server" Text="" Visible="false"></asp:TextBox>

                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>ادخال السلفيات  </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-horizontal">
                        <div class="form-body">
                            <% if (Permissions.Contains("AdvanceAdd"))
                               { %>
                            <div class="form-group">
                                <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="EmpName" AutoPostBack="true" class="form-control" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource4" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  ' "></asp:SqlDataSource>
                                </div>
                            </div>
                            <%} %>
                            <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">قيمة السلفة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtValue" runat="server" Rows="3" class="form-control" placeholder="ادخل قيمة السلفة"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">نوع العملة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="CurrType" class="form-control" placeholder="ادخل نوع العملة " runat="server" DataSourceID="SqlDataSource2" CssClass="select2_category form-control" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select 0,N'  ' "></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">الدفعة الأولى</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtFirst" runat="server" Rows="3" class="form-control" placeholder="ادخل الدفعة الأولى"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">عدد الدفعات</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="TxtNo" runat="server" Rows="3" class="form-control" placeholder="ادخل عدد الدفعات"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">تاريخ بداية الاستحقاق    </label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="txtSDate" runat="server" placeholder="ادخل تاريخ بداية الاستحقاق " CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <label class="col-md-2 control-label">تاريخ صرف  السلفة    </label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="txtFDate" runat="server" placeholder="ادخل تاريخ صرف السلفة " CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">ملاحظات</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtNotes" runat="server" placeholder="ادخل ملاحظات" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-actions fluid">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button ID="Button12" runat="server" Text="حفظ" class="btn green" OnClick="Button12_Click" />
                                    <asp:Button ID="Button13" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel_Click2" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
        <% if (Permissions.Contains("AdvanceView"))
           { %>
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>بيانات سلفيات الموظف</div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 30%">اسم الموظف </th>
                                <th style="width: 10%; text-align: center">قيمة السلفة </th>
                                <th style="width: 10%; text-align: center">الدفعة الاولى </th>
                                <th style="width: 15%; text-align: center">عدد الدفعات </th>
                                <th style="width: 15%; text-align: center">نوع العملة </th>
                                <th style="width: 20%; text-align: left"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="AdvanceID" runat="server" Text='<%# Eval("Advance_ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("Ar_F_Name") %>  <%# Eval("Ar_Family_Name") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Advance_Value") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Advance_first_installment") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Advance_PaymentNo") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Cur_Ar_Name") %></span></td>
                                        <td style="text-align: left">
                                            <% if (Permissions.Contains("AdvanceEdit"))
                                               { %>
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                            <%} %>   <% if (Permissions.Contains("AdvanceDelete"))
                                                        { %>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            <%} %> </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                SelectCommand="AdvanceEmpGet" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="EmpName" PropertyName="SelectedValue" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%} %>
    </div>
</asp:Content>

