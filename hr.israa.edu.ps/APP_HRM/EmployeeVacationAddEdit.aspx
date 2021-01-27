<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeVacationAddEdit.aspx.cs" Inherits="APP_HRM_EmployeeVacationAddEdit" %>

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
            $('#menu3').addClass("active");
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
        <li><a href="#" class="font-ha">الاجازات</a></li>
    </ul>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lbEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">

        <div class="col-md-12">
            <div class="portlet box blue">

                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل طلب اجازة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">


                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">نوع الإجازة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlVacationType" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaHumanResource %>" SelectCommand="SELECT ID, ArName FROM [VacationType] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر نوع الإجازة'"></asp:SqlDataSource>

                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">مكان قضاء الإجازة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlPlace" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaHumanResource %>" SelectCommand="SELECT ID,Name FROM [VacationPlace] union select -1,N'إختر مكان قضاء الإجازة'"></asp:SqlDataSource>
                                </div>

                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">تاريخ بدء الإجازة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control date-picker"  OnTextChanged="txtDateFrom_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </div>

                                <label class="col-md-2 control-label isra-text-aling-right">تاريخ نهاية الاجازة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDateTo" runat="server"  CssClass="form-control date-picker"  OnTextChanged="txtDateTo_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </div>
                            </div>
                               <div class="form-group row">

                                <label class="col-md-2 control-label isra-text-aling-right">عدد أيام الإجازة</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtVacationCount" runat="server" CssClass="form-control" enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">

                                <label class="col-md-2 control-label isra-text-aling-right">سبب الإجازة</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلبات الإجازة</div>
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
                                <th style="width: 2%">#</th>
                                <th style="text-align: center; width: 10%">نوع الإجازة</th>
                                <th style="text-align: center; width: 10%">تاريخ البدء </th>
                                <th style="text-align: center; width: 10%">تاريخ النهاية </th>
                                <th style="text-align: center; width: 10%">عدد الأيام</th>
                                <th style="text-align: center; width: 13%">رصيد اساسي</th>
                                <th style="text-align: center; width: 10%">رصيد مرحل</th>
                                <th style="text-align: center; width: 10%">رصيد مستنفذ</th>
                                <th style="text-align: center; width: 10%">رصيد متبقي</th>
                                <th style="text-align: center; width: 10%">حالة الاجازة</th>

                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <td><span><%# Eval("RowNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("VacationType") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("VacationStartDate") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("VacationEndDate") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("VacationDays") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("DefualtDays") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("PostponeDays") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("ConsumedDays") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("RemainingDays") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("VacationStatus") %></span></td>
                                    <td style="text-align: center">
                                        <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click" Visible='<%# ( (Eval("IsAccredit").ToString() == "0")) ? true:false %>'><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                        <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" Visible='<%# ( (Eval("IsDMAccredit").ToString() == "0")) ? true:false %>' OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i>  حذف</a></asp:LinkButton>
                                    </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:IsraaHumanResource %>' SelectCommand="GetFilterdEmployeeVacations" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lbEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>

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
                        <div class="col-xs-11" style="text-align: center;">
                            <strong>لا يوجد بيانات لعرضها</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

