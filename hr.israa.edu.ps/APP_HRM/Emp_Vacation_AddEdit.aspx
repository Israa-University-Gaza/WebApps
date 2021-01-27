<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Vacation_AddEdit.aspx.cs" Inherits="APP_HRM_Emp_Vacation_Exit_AddEdit" %>

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
    <% if (Permissions.Contains("VacationEmpRequestView"))
       { %>
    <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="EmployeeID" runat="server" Text="" Visible="false"></asp:Label>
            <div id="balance" runat="server" visible="false">

                <div class="portlet box red">
                    <div class="portlet-title">
                        <div class="caption"><i class="fa fa-cogs"></i>رصيد الاجازات للموظف</div>
                        <div class="tools">
                      <a href="javascript:;" class="collapse"></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 40%" class="sale-num">نوع الاجازة  </th>
                                                        <th style="width: 7%; text-align: center">مرحل</th>
                                                        <th style="width: 5%; text-align: center">الرصيد السنوي</th>
                                                        <th style="width: 5%; text-align: center">الرصيد الكلي</th>
                                                        <th style="width: 7%; text-align: center">اجازات مستنفذ</th>
                                                        <th style="width: 7%; text-align: center">غياب مستنفذ</th>
                                                        <th style="width: 7%; text-align: center">تاخير مستنفذ</th>
                                                        <th style="width: 7%; text-align: center">مستنفذ</th>
                                                        <th style="width: 7%; text-align: center">متبقى</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                                                        <ItemTemplate>
                                                            <asp:Label ID="VacationBalanceID" runat="server" Text='<%# Eval("Vacation_Balance_ID") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td><span><%# Eval("Vacation_Type") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("PostPoneBalance") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Total_Balance") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Total") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("VacationDays") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("AbsDays") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("DelayHours") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Consumer_Balance") %></span></td>
                                                                <td style="text-align: center"><span><%# Subtract(Convert.ToInt16(Eval("Total_Balance"))+ Convert.ToInt16(Eval("PostPoneBalance")) , Convert.ToInt16(Eval("Consumer_Balance"))) %> </span></td>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="EmpVacationBalance" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                                <asp:ControlParameter ControlID="EmployeeID" Name="Emp_ID" PropertyName="Text" Type="Int16" />
                                       
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                            <%--<table class="table table-hover">
                                <thead>
                                    <tr>
                                          <th style="width: 25%; text-align: center;">الرصيد المرحل </th>
                                        <th style="width: 25%; text-align: center;">الرصيد الكلي </th>
                                        <th style="width: 25%; text-align: center;">المستنفذ </th>
                                        <th style="width: 25%; text-align: center;">المتبقي</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                        <ItemTemplate>
                                            <asp:Label ID="VacationBalanceID" runat="server" Text='<%# Eval("Vacation_Balance_ID") %>' Visible="false"></asp:Label>
                                            <tr>
                                                 <td style="text-align: center;"><span><%# Eval("PostponeBalance") %></span></td>
                                                <td style="text-align: center;"><span><%# Eval("Total_Balance") %></span></td>
                                                <td style="text-align: center;"><span><%# Eval("Consumer_Balance") %></span></td>
                                                <td style="text-align: center;"><span><%# Subtract(Convert.ToInt16(Eval("Total_Balance")) + Convert.ToInt16(Eval("PostponeBalance")) , Convert.ToInt16(Eval("Consumer_Balance"))) %> </span></td>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                        ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                        SelectCommand="select Top(1)* from Vacation_Balance where Emp_ID=@Emp_ID and Vacation_Type_ID=@Vacation_Type_ID">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="VacationTypeID" Name="Vacation_Type_ID" PropertyName="SelectedValue" Type="Int16" />
                                            <asp:ControlParameter ControlID="EmployeeID" Name="Emp_ID" PropertyName="Text" Type="Int16" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>--%>
                        </div>
                    </div>
                </div>
            </div>
            <% if (Permissions.Contains("VacationEmpRequestAdd"))
               { %>
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>طلب اجازة</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                            
                                <label class="col-md-2 control-label">نوع الاجازة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="VacationTypeID" runat="server" CssClass="select2_category form-control" DataTextField="Vacation_Type" DataValueField="Vacation_Type_ID" AutoPostBack="true" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="VacationTypeID_TextChanged"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Vacation_Type_ID,Vacation_Type FROM [Vacation_Type_TB] where IsDelete=0 union select -1,N' ادخل نوع الاجازة ' "></asp:SqlDataSource>
 </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">تاريخ بدء الاجازة </label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="SDate" runat="server" placeholder="ادخل تاريخ بدء الاجازة" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                    </div>
                                </div>
                                <label class="col-md-2 control-label">تاريخ العودة للعمل </label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="FDate" runat="server" OnTextChanged="FDate_TextChanged" AutoPostBack="true" placeholder="ادخل العودة للعمل" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">عدد ايام الاجازة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="VacationCount" placeholder="ادخل عدد ايام الاجازة" OnTextChanged="VacationCount_TextChanged" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                                 <label class="col-md-2 control-label">مكان قضاء الاجازة  </label>
                                <div class="col-md-4">
                                    <asp:RadioButtonList ID="rblPlace" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">داخل البلاد</asp:ListItem>
                                        <asp:ListItem Value="2">خارج البلاد</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                </div>
                                <div class="form-group">
                                <label class="col-md-2 control-label">سبب  الاجازة</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="Reason" runat="server" placeholder="ادخل سبب  الاجازة" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="Button13" runat="server" Text="حفظ" class="btn green" OnClick="Button1_Click" />
                                <asp:Button ID="Button2" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END FORM-->
            </div>
            <%} %>
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>حركة الاجازات للموظف</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 0.1%"></th>
                                    <th style="width: 10%">نوع الاجازة </th>
                                    <th style="width: 15%">تاريخ بدء الاجازة</th>
                                    <th style="width: 15%; text-align: center">تاريخ انتهاء الاجازة</th>
                                    <th style="width: 15%; text-align: center">عدد ايام الاجازة</th>
                                    <th style="width: 15%; text-align: center">تاريخ تقديم الطلب</th>
                                    <th style="width: 18%; text-align: center">حالة الطلب</th>
                                    <th style="width: 12%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource22">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="VacationID" runat="server" Text='<%# Eval("Vacation_ID") %>' Visible="false"></asp:Label></td>
                                            <td><span><%# Eval("Vacation_Type") %></span></td>
                                            <td><span><%# Eval("Vacation_Start_Date","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Vacation_End_Date","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Vacation_Day_Count") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Vacation_Request_Date","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Ar_Name") %></span></td>
                                            <td style="text-align: center">
                                               
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click" Visible='<%# (Eval("Request_Status").ToString()=="18")?true :false %>'><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                             
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click"  Visible='<%# (Eval("Request_Status").ToString()=="18")?true :false %>' OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            
                                            </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                          
                                <asp:SqlDataSource ID="SqlDataSource22" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="VacationRequestGet" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                   <asp:ControlParameter ControlID="EmployeeID" Name="Emp_ID" DbType="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
