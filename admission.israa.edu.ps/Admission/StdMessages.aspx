<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StdMessages.aspx.cs" Inherits="Admission_StdMessages" %>

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
            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });

            QuickSidebar.init(); // init quick sidebar
            Demo.init(); // init demo features
            ComponentsPickers.init();

        });
    </script>
    <script type="text/javascript">
        $('document').ready(function () {

            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu_5').addClass("active open");
            $('#StdMessages').css("background-color", "#575757");
            $('#menu_5 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="StdMessages.aspx" class="font-ha">رسائل الطلاب
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض الرسائل
                </div>
                <div class="tools">
                    <a href="#" class="collapse"></a>
                    <a href="#" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group row">

                        <label class="control-label col-md-2">من تاريخ : </label>

                        <div class="col-md-4">
                            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                        </div>

                        <label class="control-label col-md-2">حتى تاريخ :</label>

                        <div class="col-md-4">
                            <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">الفصل الدراسي :</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="Select ID, ArName From Semester Where Code<>'111111111' and IsDelete=0 and IsActive=1 ORDER BY ID DESC"></asp:SqlDataSource>
                        </div>
                        <label class="control-label col-md-2">نص الرسالة  : </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtMessageBody" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-actions ">
                    <div class="col-md-8 col-lg-offset-2">
                        <asp:Button ID="Search" runat="server" Text="بحث" OnClick="Search_Click" CssClass="btn green" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12 ">
        <div id="loginResponse1" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg1" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض رسائل الطلاب 
                </div>
                <div class="tools">
                    <a href="#" class="collapse"></a>
                    <a href="#" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 3%;">#</th>
                                <th style="width: 10%; text-align: center;">رقم الطالب</th>
                                <th style="width: 15%; text-align: center;">اسم الطالب</th>
                                <th style="width: 10%; text-align: center;">جوال الطالب</th>
                                <th style="width: 30%; text-align: center;">نص الرسالة</th>
                                <th style="width: 5%; text-align: center;">الحالة</th>
                                <th style="width: 15%; text-align: center;">المرسل</th>
                                <th style="width: 20%; text-align: center;">وقت الإرسال</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("RowNo")%></td>
                                        <td style="text-align: center"><%# Eval("StudentNo")%></td>
                                        <td style="text-align: center"><%# Eval("StudentName")%></td>
                                        <td style="text-align: center"><%# Eval("Jawwal")%></td>
                                        <td style="text-align: center"><%# Eval("MessageBody") %></td>
                                        <td style="text-align: center"><%# Eval("MsgStatus") %></td>
                                        <td style="text-align: center"><%# Eval("EmployeeName") %></td>
                                        <td style="text-align: center"><%# Eval("SendDate","{0:yyyy/MM/dd HH:mm tt}")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetStdMessages" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtDateFrom" PropertyName="Text" Name="DateFrom" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtDateTo" PropertyName="Text" Name="DateTo" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtMessageBody" PropertyName="Text" DefaultValue="%" Name="MessageBody" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                    <div class="col-md-12">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                                <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                    <div class="clearfix"></div>
                    <% } %>
                    <%  else
                        { %>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجد رسائل للعرض  </strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <%  } %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

