<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_WExit_AddEdit.aspx.cs" Inherits="APP_HRM_Emp_WExit_AddEdit" %>

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
        <li><a href="Emp_WExit_AddEdit.aspx" class="font-ha">تحركات الموظفين </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <asp:Label ID="EmployeeID" runat="server" Text="" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div class="tabbable tabbable-custom boxless">
                <ul class="nav nav-tabs">
                       <% if (Permissions.Contains("ExitRequestAdd"))
                       { %>
                    <li id="li1" runat="server" class="active"><a href="#tab_1" data-toggle="tab">تسجيل الأذونات الخاصة </a></li>
                    <%} %>
                    <% if (Permissions.Contains("WExitRequestAdd"))
                       { %>
                    <li id="li2" runat="server"><a href="#tab_2" data-toggle="tab">تسجيل أذونات مهام العمل</a></li>
                    <%} %>
                 
                </ul>
                <div class="tab-content">
                         <div runat="server" id="tab_1" class="tab-pane active"  ClientIDMode="Static">
                        <% if (Permissions.Contains("ExitRequestAdd"))
                           { %>
                              <asp:Label ID="lblExit" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>ادخال الأذونات الخاصة</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <div class="horizontal-form">
                                    <div class="form-body">
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">وقت الخروج للمهمة  </label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="Exit_S_Date" runat="server" placeholder="ادخل وقت الخروج للمهمة" class="form-control clockface_1"  MaxLength="50"></asp:TextBox>
                                            </div>
                                            <label class="col-md-2 control-label">وقت العودة من المهمة</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="Exit_F_Date" runat="server" placeholder="ادخل وقت العودة من المهمة" class="form-control clockface_1"  MaxLength="50"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">تفاصيل المهمة</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="Details1" placeholder="ادخل تفاصيل المهمة" runat="server" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="form-actions fluid">
                                    <div class="col-md-offset-2 col-md-10">
                                        <asp:Button ID="Button2" runat="server" Text="حفظ" class="btn green" OnClick="Button2_Click" />
                                        <asp:Button ID="Button4" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel_Click1" />
                                    </div>
                                </div>
                            </div>
                            <!-- END FORM-->
                        </div>
                        <%} %>
                        <div class="portlet box red">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>حركة الاذونات للموظف الخاصة</div>
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
                                                <th style="width: 10%">وقت الخروج</th>
                                                <th style="width: 10%; text-align: center">وقت العودة </th>
                                                <th style="width: 35%; text-align: center">تفاصيل</th>
                                                <th style="width: 20%; text-align: center">تاريخ تقديم الطلب</th>
                                                <th style="width: 10%; text-align: center">حالة الطلب</th>
                                                <th style="width: 15%; text-align: left"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource4">
                                                <ItemTemplate>
                                                    <asp:Label ID="ExitID" runat="server" Text='<%# Eval("Exit_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("Exit_From") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Exit_To") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Exit_Details") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Exit_Date","{0:yyyy/MM/dd}") %></span></td>
                                                        <td style="text-align: center">
                                                            <span><%# Eval("Ar_Name","{0:yyyy/MM/dd}") %>
                                                        </td>
                                                        <td style="text-align: left">
                                                            <% if (Permissions.Contains("ExitManagerEdit"))
                                                               { %>
                                                            <asp:LinkButton ID="lbEdit2" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                            <%} %>

                                                            <% if (Permissions.Contains("ExitManagerDelete"))
                                                               { %>
                                                            <asp:LinkButton ID="lbDelete2" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                            <%} %>   </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <tr>
                                                <% if (Permissions.Contains("ExitRequestCancel"))
                                                   { %>
                                                <asp:Button ID="Button3" runat="server" Visible="false" class="btn default  green" Text="الغاء اخر طلب اذن" OnClick="Cancel_ERequest" />
                                            </tr>
                                            <%} %>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="ExitEmpGet" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="EmployeeID" Name="Emp_ID" PropertyName="Text" Type="Int16" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div runat="server" class="tab-pane" id="tab_2"  ClientIDMode="Static">
                        <% if (Permissions.Contains("WExitRequestAdd"))
                           { %>
                        <asp:Label ID="lblWExit" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>ادخال مهمات العمل</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <div class="form-body">
                                    <div class="form-group row">
                                     <label class="col-md-2 control-label">نوع مهمة العمل</label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ExitType" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID],  [Ar_Name] FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select -1,N' اختر نوع المهمة '">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="18" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">تفاصيل المهمة</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="Details" runat="server" placeholder="ادخل تفاصيل المهمة" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">وقت الخروج للمهمة  </label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="ConstantSTime" placeholder="ادخل وقت الخروج للمهمة" runat="server" class="form-control clockface_1"  MaxLength="50"></asp:TextBox>
                                        </div>
                                        <label class="col-md-2 control-label">تاريخ بدء الاذن   </label>
                                        <div class="col-md-4">
                                            <div class="input-icon">
                                                <i class="fa fa-calendar"></i>
                                                <asp:TextBox ID="WExit_S_Date" runat="server"  placeholder="ادخل تاريخ بدء الاذن"  CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd"  type="text" value=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">وقت العودة من المهمة</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="ConstantFTime" placeholder="ادخل وقت العودة من المهمة" runat="server" class="form-control clockface_1"  MaxLength="50"></asp:TextBox>
                                            <span class="help-block"></span>
                                        </div>
                                        <label class="col-md-2 control-label">تاريخ انتهاء الاذن </label>
                                        <div class="col-md-4">
                                            <div class="input-icon">
                                                <i class="fa fa-calendar"></i>
                                                <asp:TextBox ID="WExit_F_Date"  placeholder="ادخل تاريخ انتهاء الاذن"  runat="server"  CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd"  type="text" value=""></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="form-actions fluid">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button ID="Button12" runat="server" Text="حفظ" class="btn green" OnClick="Button12_Click" />
                                    <asp:Button ID="Button13" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel_Click2" />
                                </div>
                            </div>
                        </div>
                        <%} %>
                        <div class="portlet box red">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>عرض مهمات العمل</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 10%">وقت الخروج</th>
                                                <th style="width: 10%; text-align: center">وقت العودة </th>
                                                <th style="width: 35%; text-align: center">تفاصيل</th>
                                                <th style="width: 20%; text-align: center">تاريخ تقديم الطلب</th>
                                                <th style="width: 10%; text-align: center">حالة الطلب</th>
                                                <th style="width: 15%; text-align: center"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <asp:Label ID="WExitID" runat="server" Text='<%# Eval("Work_Exit_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("Exit_From_Hour") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Exit_To_Hour") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Work_Exit_Details") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Work_Exit_Date","{0:dd/MM/yyyy}") %></span></td>
                                                        <td style="text-align: center">
                                                            <span><%# Eval("Ar_Name") %>
                                                        </td>
                                                        <td style="text-align: left">
                                                            <% if (Permissions.Contains("WExitManagerEdit"))
                                                               { %>
                                                            <asp:LinkButton ID="lbEdit2" runat="server" class="btn default btn-xs black" OnClick="lbEdit2_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                            <%} %>

                                                            <% if (Permissions.Contains("WExitManagerDelete"))
                                                               { %>
                                                            <asp:LinkButton ID="lbDelete2" runat="server" class="btn default btn-xs purple" OnClick="lbDelete2_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                            <%} %>     </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <tr>
                                                <% if (Permissions.Contains("WExitRequestCancel"))
                                                   { %>
                                                <%} %>
                                                <asp:Button ID="ButtonG" runat="server" Visible="false" class="btn default  green" Text="الغاء اخر طلب اذن" OnClick="Cancel_WERequest" />
                                            </tr>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="WExitEmpGet" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="EmployeeID" Name="Emp_ID" PropertyName="Text" Type="Int16" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
               
                </div>
            </div>
        </div>
    </div>
</asp:Content>

