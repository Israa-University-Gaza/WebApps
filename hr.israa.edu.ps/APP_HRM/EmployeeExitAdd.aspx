<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeExitAdd.aspx.cs" Inherits="APP_HRM_EmployeeExitAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">طلب إذن خروج</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lbEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">

        <div class="col-md-12">
            <div class="portlet box blue">

                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة إذن خروج</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">


                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">نوع الإذن</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlAttendanceExitType" runat="server" CssClass="select2_category form-control"  DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaHumanResource %>" SelectCommand="SELECT ID, ArName FROM [AttendanceExitType] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر نوع الإذن'"></asp:SqlDataSource>

                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">تاريخ الإذن</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtExitDate" CssClass="form-control date-picker" runat="server"></asp:TextBox>
                                </div>

                            </div>

                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">سبب الخروج</label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtExitReason" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>


                             <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">ساعة الخروج المتوقعة</label>
                                <div class="col-md-4">
                                   <asp:TextBox ID="txtExpectedHourFrom" CssClass="form-control" placeholder="00:00" runat="server"></asp:TextBox>

                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">ساعة العودة المتوقعة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtExpectedHourTo" CssClass="form-control" placeholder="00:00" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">ساعة الخروج الفعلية</label>
                                <div class="col-md-4">
                                   <asp:TextBox ID="txtActualTimeFrom" CssClass="form-control " placeholder="00:00" runat="server"></asp:TextBox>

                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">ساعة العودة الفعلية</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtActualTimeTo" CssClass="form-control" placeholder="00:00" runat="server"></asp:TextBox>
                                </div>
                            </div>

                               <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">هاتف الاتصال أثناء الخروج</label>
                                <div class="col-md-4">
                                   <asp:TextBox ID="txtMobile" CssClass="form-control date-picker" runat="server"></asp:TextBox>
                                </div>
                                
                            </div>

                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">ملاحظات</label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtNote" CssClass="form-control date-picker" runat="server"></asp:TextBox>
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
            </div>


        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلبات الإذن</div>
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
                                <th style="text-align: center; width: 10%">نوع الإذن</th>
                                <th style="text-align: center; width: 10%">تاريخ الإذن </th>
                                <th style="text-align: center; width: 10%">وقت الخروج المتوقع</th>
                                <th style="text-align: center; width: 10%">وقت العودة المتوقع</th>
                                <th style="text-align: center; width: 13%">وقت الخروج الفعلي</th>
                                <th style="text-align: center; width: 10%">وقت العودة الفعلي</th>
                                <th style="text-align: center; width: 10%">حالة الإذن</th>

                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <td><span><%# Eval("RowNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("AttendanceExitType") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("ExitDate") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("ExpectedTimeFrom") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("ExpectedTimeTo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("ActualTimeFrom") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("ActualTimeTo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("AttendanceExitStatus") %></span></td>
                                    <td style="text-align: center">
                                        <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click" Visible='<%# ( (Eval("IsDMAccredit").ToString() == "0")) ? true:false %>'><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                        <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" Visible='<%# ( (Eval("IsDMAccredit").ToString() == "0")) ? true:false %>' OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i>  حذف</a></asp:LinkButton>
                                    </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:IsraaHumanResource %>' SelectCommand="GetEmployeeAttendanceExits" SelectCommandType="StoredProcedure">
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

