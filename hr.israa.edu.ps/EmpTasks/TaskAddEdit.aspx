<%@ Page Title="" Language="C#" MasterPageFile="~/EmpTasks/MasterPage.master" AutoEventWireup="true" CodeFile="TaskAddEdit.aspx.cs" Inherits="EmpTasks_TaskAddEdit" %>

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
            $('#menu4').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">ملف المهمات</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>اضافة مهمة</span>
            </button>

        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="EmpID" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblTaskID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>اضافة مهمة
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>

                    <a href="" class="remove"></a>
                </div>
            </div>


            <div class="portlet-body form">
                <div class="form-body">




                    <div class="form-group">

                        <asp:Label ID="Label2" runat="server" Text="ادخل المهمة" CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TaskName" runat="server" placeholder="ادخل المهمة" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                    <div class="form-group">
                    </div>
                    <div class="clearfix"></div>


                    <div class="form-group">
                        <asp:Label ID="Date1" runat="server" Text="اختر التاريخ" CssClass="col-md-2 cotrol-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox ID="Date" runat="server" data-date-format="yyyy/mm/dd"  CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                        </div>
                        <asp:Label ID="Label3" runat="server" Text="اختر حالة المهمة" CssClass="col-md-2 cotrol-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="TaskStatus" CssClass="select2_category form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID">
                            </asp:DropDownList>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:EmployeeTasks %>' SelectCommand="SELECT ID,Name FROM [TaskStatus] "></asp:SqlDataSource>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group">
                    </div>
                    <div class="clearfix"></div>

                </div>
                <div class="form-actions fluid">
                <div class="col-md-12" style="text-align: center;">
                       
                         <asp:Button ID="btnAdd" runat="server" Text="حفظ" OnClick="btnAdd_Click" CssClass="btn green" />
                        <asp:Button ID="btnclear" runat="server" Text="تفريغ الحقول" OnClick="btnclear_Click" CssClass="btn default" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12 ">
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض  مهمات الموظف
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>

                    <a href="" class="remove"></a>
                </div>
            </div>



            <div class="portlet-body form">

                <div class="form-body">
                    <% if (ListView1.Items.Count > 0)
                       { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                               
                                <th style="width: 8%">اليوم</th>
                                <th style="width: 8%; text-align: center;">التاريخ </th>
                                <th style="width: 55%">المهمة</th>
                                <th style="width: 10%; text-align: center;">حالة المهمة  </th>
                                <th style="width: 5%; text-align: center;">معتمد</th>
                                <th style="width: 5%; text-align: center;">مرفوض</th>
                                <th style="width: 5%; text-align: center;"></th>
                                <th style="width: 5%; text-align: center;"></th>
                            </tr>

                        </thead>
                        <tbody>

                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                      
                                            <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <td><%# Eval("DayNameARABIC") %></td>
                                        <td style="text-align: center;"><%# Eval("Date","{0:yyyy/MM/dd}") %></td>
                                        <td><%# Eval("TaskText") %></td>
                                        <td style="text-align: center;"><%# Eval("status") %></td>
                                        <td>
                                            <label class="radio-inline">
											<asp:RadioButton ID="Accept" Enabled="false"  runat="server" class="radio-inline"  AutoPostBack="true"  GroupName="status"
                                                 Checked=' <%# Convert.ToBoolean(Eval("Accreditation")) %>'    /> 
											</label>
                                        </td>

                                           <td>
                                            <label class="radio-inline">
											<asp:RadioButton ID="RadioButton1" Enabled="false"  runat="server" class="radio-inline"  AutoPostBack="true"  GroupName="status"
                                                 Checked=' <%# Convert.ToBoolean(Eval("Reject")) %>'    /> 
											</label>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="Edit" runat="server" class="btn default btn-xs black"  OnClick="Edit_Click">تحرير</asp:LinkButton></td>
                                        <td>
                                            <asp:LinkButton ID="Delete" runat="server" class="btn default btn-xs purple"   OnClick="Delete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>

                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>




                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:EmployeeTasks %>' SelectCommand="GetTasks" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeId" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>




                    </table>


                    <div class="clearfix"></div>

                      <div class="col-md-12">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="30" PagedControlID="ListView1" class="pager">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link"
                                    PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false"
                                    ShowPreviousPageButton="true" />
                                <asp:NumericPagerField ButtonType="Link" />
                                <asp:NextPreviousPagerField ButtonType="Link" NextPageText=" التالي" ShowFirstPageButton="false"
                                    ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                            </Fields>

                        </asp:DataPager>
                    </div>
                    <div class="clearfix"></div>
                    <% } %>
                    <%  else
                       { %>

                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لم يتم إضافة مهمات منجزة وغير منجزة بعد</strong>
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

