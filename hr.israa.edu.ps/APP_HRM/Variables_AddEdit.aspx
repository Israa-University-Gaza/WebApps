<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Variables_AddEdit.aspx.cs" Inherits="APP_HRM_Variables_AddEdit" %>

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
             $('#menu7').addClass("active");
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
        <li><a href="Variables_AddEdit.aspx" class="font-ha">متغيرات النظام</a></li>
    </ul>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <!-- BEGIN PAGE CONTENT-->


    <div class="row">
        <div class="col-md-12">
            <div class="tabbable tabbable-custom boxless">
                <ul class="nav nav-tabs">

                    <% if (Permissions.Contains("AllowanceTypeView"))
                       { %>
                    <li id="li2" runat="server" class="active"><a href="#tab_2" data-toggle="tab">أنواع البدلات</a></li>
                    <%} %>
                    <% if (Permissions.Contains("BonusesTypeView"))
                       { %>
                    <li id="li3" runat="server"><a href="#tab_3" data-toggle="tab">أنواع العلاوات</a></li>
                    <%} %>
                    <% if (Permissions.Contains("DeductionTypeView"))
                       { %>
                    <li id="li4" runat="server"><a href="#tab_4" data-toggle="tab">أنواع الجزاءات</a></li>
                    <%} %>
                    <% if (Permissions.Contains("PenaltiesTypeView"))
                       { %>
                    <li id="li5" runat="server"><a href="#tab_5" data-toggle="tab">أنواع العقوبات</a></li>
                    <%} %>
                    <% if (Permissions.Contains("MotivationTypeView"))
                       { %>
                    <li id="li6" runat="server"><a href="#tab_6" data-toggle="tab">أنواع المكافآت</a></li>
                    <%} %>
                </ul>
                <div class="tab-content">

                    <% if (Permissions.Contains("AllowanceTypeView")) { %>
                    <div runat="server" class="tab-pane active" id="tab_2" ClientIDMode="static">


                        <div class="col-md-6">
                            <div class="portlet box red">
                                <div class="portlet-title">
                                    <div class="caption"><i class="fa fa-cogs"></i>انواع البدلات </div>
                                    <div class="tools">
                                        <%--       <a class="remove" href="javascript:;"></a>
                       <a href="javascript:;" class="collapse"></a>--%>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width: 10%">نوع البدل </th>
                                                    <th style="width: 20%">رمز البدل</th>
                                                    <th style="width: 20%">شرط الحصول على البدل</th>


                                                    <th style="width: 25%"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="AllowanceTypeID" runat="server" Text='<%# Eval("Allowance_Type_ID") %>' Visible="false"></asp:Label>
                                                        <tr>
                                                            <td><span><%# Eval("Allowance_Type") %></span></td>
                                                            <td><span><%# Eval("Code") %></span></td>
                                                            <td><span><%# Eval("Allowance_Condition") %></span></td>


                                                            <td style="text-align: center">
                                                                <% if (Permissions.Contains("AllowanceTypeEdit"))
                                                                   { %>
                                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="AllowlbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                <%} %>
                                                                <% if (Permissions.Contains("AllowanceTypeDelete"))
                                                                   { %>
                                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="AllowlbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                <%} %>
                                                            </td>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                    SelectCommand="SELECT * FROM [Allowance_Type_TB] where IsDelete=0 ORDER BY [Allowance_Type_ID] DESC"></asp:SqlDataSource>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% if (Permissions.Contains("AllowanceTypeAdd") || Permissions.Contains("AllowanceTypeAdd"))
                           { %>
                        <div class="col-md-6">
                            <div class="portlet box blue">
                                <div class="portlet-title">
                                    <div class="caption"><i class="fa fa-reorder"></i>أنواع البدلات</div>
                                    <div class="tools">
                                        <%--<a href="javascript:;" class="collapse"></a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>--%>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <div class="form-horizontal">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">نوع البدل</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtAllowanceType" runat="server" class="form-control" placeholder="ادخل نوع البدل"></asp:TextBox>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label">رمز البدل</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="CodeAll" runat="server" class="form-control" placeholder="ادخل رمز البدل" ></asp:TextBox>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label">شرط الحصول على البدل</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtAllownaceCondition" runat="server" class="form-control" placeholder="ادخل شرط الحصول على البدل"></asp:TextBox>

                                                </div>
                                            </div>

                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="Button5" runat="server" Text="حفظ" class="btn green" OnClick="Button5_Click" />

                                                <asp:Button ID="Button6" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="AllowCancel_Click" />

                                            </div>
                                        </div>
                                    </div>
                                    <!-- END FORM-->
                                </div>
                            </div>
                        </div>
                        <%} %>
                    </div>
                    <%} %>
                    <% if (Permissions.Contains("BonusesTypeView"))
                       { %>
                    <div runat="server" class="tab-pane " id="tab_3" ClientIDMode="static">

                        <div class="col-md-6">
                            <div class="portlet box red">
                                <div class="portlet-title">
                                    <div class="caption"><i class="fa fa-cogs"></i>انواع العلاوات </div>
                                    <div class="tools">
                                        <a class="remove" href="javascript:;"></a>
                                        <a href="javascript:;" class="collapse"></a>

                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width: 20%">نوع العلاوة  </th>
                                                    <th style="width: 20%">رمز العلاوة  </th>
                                                    <th style="width: 20%">شروط العلاوة   </th>

                                                    <th style="width: 20%">قيمة العلاوة   </th>


                                                    <th style="width: 25%"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                    <ItemTemplate>
                                                        <asp:Label ID="BounsTypeID" runat="server" Text='<%# Eval("Bouns_Type_ID") %>' Visible="false"></asp:Label>
                                                        <tr>
                                                            <td><span><%# Eval("Bouns_Type") %></span></td>
                                                            <td><span><%# Eval("Code") %></span></td>
                                                            <td><span><%# Eval("Bouns_Condition") %></span></td>
                                                            <td><span><%# Eval("Bouns_Default_Value") %></span></td>

                                                            <td style="text-align: center">
                                                                <% if (Permissions.Contains("BonusesTypeEdit"))
                                                                   { %>
                                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="BounslbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                <%} %>
                                                                <% if (Permissions.Contains("BonusesTypeDelete"))
                                                                   { %>
                                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="BounslbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                <%} %>
                                                            </td>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                    SelectCommand="SELECT * FROM [Bouns_Type_TB] where IsDelete=0 ORDER BY [Bouns_Type_ID] DESC"></asp:SqlDataSource>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% if (Permissions.Contains("BonusesTypeAdd") || Permissions.Contains("BonusesTypeEdit"))
                           { %>
                        <div class="col-md-6">
                            <div class="portlet box blue">
                                <div class="portlet-title">
                                    <div class="caption"><i class="fa fa-reorder"></i>أنواع العلاوات</div>
                                    <div class="tools">
                                        <a href="javascript:;" class="collapse"></a>
                                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                        <a href="javascript:;" class="reload"></a>
                                        <a href="javascript:;" class="remove"></a>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <div class="form-horizontal">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">نوع العلاوة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtBounsType" runat="server" class="form-control" placeholder="ادخل نوع العلاوة"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label">رمز العلاوة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="CodeBouns" runat="server" class="form-control" placeholder="ادخل رمز العلاوة"></asp:TextBox>

                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-md-3 control-label">شرط الحصول على العلاوة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtBounsCondition" runat="server"  TextMode="MultiLine" class="form-control"  placeholder="ادخل شرط الحصول على العلاوة"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="clearfix"></div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">قيمة العلاوة الثابتة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="BounsValue" runat="server" class="form-control" placeholder="ادخل قيمة العلاوة الثابتة"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>


                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">نوع العملة</label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="CurrType" CssClass="select2_category form-control" placeholder="ادخل نوع العملة " runat="server" DataSourceID="SqlDataSource8" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select 0,N'  '"></asp:SqlDataSource>

                                                </div>
                                            </div>




                                            <div class="clearfix"></div>
                                            <div class="form-actions fluid">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <asp:Button ID="Button7" runat="server" Text="حفظ" class="btn green" OnClick="Button7_Click" />

                                                    <asp:Button ID="Button8" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="BounsCancel_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END FORM-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%} %>
                    </div>
                    <%} %>
                    <% if (Permissions.Contains("DeductionTypeView"))
                       { %>
                    <div class="tab-pane" id="tab_4" runat="server" ClientIDMode="static">

                        <div class="col-md-6">
                            <div class="portlet box red">
                                <div class="portlet-title">
                                    <div class="caption"><i class="fa fa-cogs"></i>انواع الجزاءات </div>
                                    <%--       <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                         <a href="javascript:;" class="collapse"></a>
                                  
                    </div>--%>
                                </div>
                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width: 20%">نوع الجزاء  </th>
                                                    <th style="width: 20%">رمز الجزاء  </th>
                                                    <th style="width: 20%">شروط الجزاء  </th>




                                                    <th style="width: 25%"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
                                                    <ItemTemplate>
                                                        <asp:Label ID="DeductionTypeID" runat="server" Text='<%# Eval("Deduction_Type_ID") %>' Visible="false"></asp:Label>
                                                        <tr>
                                                            <td><span><%# Eval("Deduction_Type") %></span></td>
                                                            <td><span><%# Eval("Code") %></span></td>
                                                            <td><span><%# Eval("Deduction_Condition") %></span></td>

                                                            <td style="text-align: center">
                                                                <% if (Permissions.Contains("DeductionTypeEdit"))
                                                                   { %>
                                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="DeductlbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                <%} %>
                                                                <% if (Permissions.Contains("DeductionTypeDelete"))
                                                                   { %>
                                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="DeductlbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                <%} %>
                                                            </td>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                    SelectCommand="SELECT * FROM [Deduction_Type_TB] where IsDelete=0 ORDER BY [Deduction_Type_ID] DESC"></asp:SqlDataSource>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% if (Permissions.Contains("DeductionTypeAdd") || Permissions.Contains("DeductionTypeAdd"))
                           { %>
                        <div class="col-md-6">
                            <div class="portlet box blue">
                                <div class="portlet-title">
                                    <div class="caption"><i class="fa fa-reorder"></i>أنواع الجزاءات</div>
                                    <%--        <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>--%>
                                </div>
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <div class="form-horizontal">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">نوع الجزاء</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtDeductionType" runat="server" class="form-control" placeholder="ادخل نوع الجزاء"></asp:TextBox>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label">رمز الجزاء</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="CodeDed" runat="server" class="form-control" placeholder="ادخل رمز الجزاء"></asp:TextBox>

                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-md-3 control-label">شرط تنفيذ الجزاء</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtDeductionCondition" runat="server" TextMode="MultiLine" class="form-control" placeholder="ادخل شرط تنفيذ  الجزاء"></asp:TextBox>

                                                </div>
                                            </div>

                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="Button9" runat="server" Text="حفظ" class="btn green" OnClick="Button9_Click" />

                                                <asp:Button ID="Button10" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="DeductCancel_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END FORM-->
                                </div>
                            </div>
                        </div>
                        <%} %>
                    </div>
                    <%} %>
                    <% if (Permissions.Contains("PenaltiesTypeView"))
                       { %>
                    <div class="tab-pane" id="tab_5" runat="server" ClientIDMode="static">
                        <div class="col-md-6">
                            <div class="portlet box red">
                                <div class="portlet-title">
                                    <div class="caption"><i class="fa fa-cogs"></i>انواع العقوبات </div>
                                    <%--      <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                         <a href="javascript:;" class="collapse"></a>
                                  
                    </div>--%>
                                </div>
                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width: 1%"></th>
                                                    <th style="width: 20%">نوع العقوبة  </th>
                                                    <th style="width: 20%">رمز العقوبة  </th>
                                                    <th style="width: 20%">شروط العقوبة  
                                                    </th>



                                                    <th style="width: 25%"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="PaneltyTypeID" runat="server" Text='<%# Eval("Penalty_Type_ID") %>' Visible="false"></asp:Label>
                                                            </td>
                                                            <td><span><%# Eval("Penalty_Type") %></span></td>
                                                            <td><span><%# Eval("Code") %></span></td>
                                                            <td><span><%# Eval("Penalty_Condition") %></span></td>

                                                            <td style="text-align: center">
                                                                <% if (Permissions.Contains("PenaltiesTypeEdit"))
                                                                   { %>
                                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="PaneltylbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                <%} %>  <% if (Permissions.Contains("PenaltiesTypeDelete"))
                                                                           { %>
                                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="PaneltylbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                <%} %>
                                                            </td>

                                                        </tr>

                                                    </ItemTemplate>
                                                </asp:Repeater>

                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                    SelectCommand="SELECT * FROM [Penalty_Type_TB] where IsDelete=0 ORDER BY [Penalty_Type_ID] DESC"></asp:SqlDataSource>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% if (Permissions.Contains("PenaltiesTypeAdd") || Permissions.Contains("PenaltiesTypeEdit"))
                           { %>
                        <div class="col-md-6">
                            <div class="portlet box blue">
                                <div class="portlet-title">
                                    <div class="caption"><i class="fa fa-reorder"></i>أنواع العقوبات</div>
                                    <%--     <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>--%>
                                </div>
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <div class="form-horizontal">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">نوع العقوبة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="PaneltyType" runat="server" class="form-control" placeholder="ادخل نوع العقوبة"></asp:TextBox>
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label">رمز العقوبة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="CodePen" runat="server" class="form-control" placeholder="ادخل رمز العقوبة"></asp:TextBox>

                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-md-3 control-label">شرط تنفيذ العقوبة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="PaneltyCond" runat="server" TextMode="MultiLine"  class="form-control" placeholder="ادخل شرط تنفيذ  العقوبة"></asp:TextBox>

                                                </div>
                                            </div>

                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="Button11" runat="server" Text="حفظ" class="btn green" OnClick="Panelty_Click" />

                                                <asp:Button ID="Button12" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="PaneltyCancel_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END FORM-->
                                </div>
                            </div>
                        </div>
                        <%} %>
                    </div>
                    <%} %>
                    <% if (Permissions.Contains("MotivationTypeView"))
                       { %>
                    <div class="tab-pane" id="tab_6" runat="server" ClientIDMode="static">
                        <div class="col-md-6">
                            <div class="portlet box red">
                                <div class="portlet-title">
                                    <div class="caption"><i class="fa fa-cogs"></i>انواع المكافآت </div>
                                    <%--    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                         <a href="javascript:;" class="collapse"></a>
                                  
                    </div>--%>
                                </div>
                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width: 20%">نوع المكافأة  </th>
                                                    <th style="width: 20%">رمز المكافأة  </th>
                                                    <th style="width: 20%">شروط المكافأة  
                                                    </th>



                                                    <th style="width: 25%"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource7">
                                                    <ItemTemplate>
                                                        <asp:Label ID="MotivationTypeID" runat="server" Text='<%# Eval("Motivation_Type_ID") %>' Visible="false"></asp:Label>
                                                        <tr>
                                                            <td><span><%# Eval("Motivation_Type") %></span></td>
                                                            <td><span><%# Eval("Code") %></span></td>
                                                            <td><span><%# Eval("Motivation_Condition") %></span></td>

                                                            <td style="text-align: center">
                                                                <% if (Permissions.Contains("MotivationTypeEdit"))
                                                                   { %>
                                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="MotivationlbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                <%} %>        <% if (Permissions.Contains("MotivationTypeDelete"))
                                                                                 { %>
                                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="MotivationlbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                <%} %>
                                                            </td>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource7" runat="server"
                                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                    SelectCommand="SELECT * FROM [Motivation_Type_TB]  where IsDelete=0 ORDER BY [Motivation_Type_ID] DESC"></asp:SqlDataSource>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% if (Permissions.Contains("MotivationTypeAdd") || Permissions.Contains("MotivationTypeAdd"))
                           { %>
                        <div class="col-md-6">
                            <div class="portlet box blue">
                                <div class="portlet-title">
                                    <div class="caption"><i class="fa fa-reorder"></i>أنواع المكافآت</div>
                                    <%--       <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>--%>
                                </div>
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <div class="form-horizontal">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">نوع المكافأة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="MotivatType" runat="server" class="form-control" placeholder="ادخل نوع المكافأة "></asp:TextBox>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label">رمز المكافأة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="CodeMot" runat="server" class="form-control" placeholder="ادخل رمز المكافئة"></asp:TextBox>

                                                </div>


                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">شرط الحصول على المكافأة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="MotivatCond" runat="server" class="form-control" placeholder="ادخل شرط الحصول على  المكافأة"></asp:TextBox>

                                                </div>
                                            </div>

                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="Button13" runat="server" Text="حفظ" class="btn green" OnClick="Motivate_Click" />

                                                <asp:Button ID="Button14" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="MotivateCancel_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END FORM-->
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
