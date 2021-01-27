<%@ Page Title="" Language="C#" MasterPageFile="~/EmpTasks/MasterPage.master" AutoEventWireup="true" CodeFile="TasksAllEmp.aspx.cs" Inherits="EmpTasks_TasksAllEmpView" %>

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
    <script type="text/javascript" src="../assets/datepicke
        r/bootstrap-datetimepicker.min.js"></script>
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
            $('#Task').addClass("active");
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
                <span>عرض مهمات الموظفين</span>
            </button>

        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="EmpID" runat="server" Text="Label" Visible="false"></asp:Label>
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض المهمات حسب 
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>

                    <a href="" class="remove"></a>
                </div>
            </div>


            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group row">

                        <label class="col-md-2 control-label">الوحدة </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="Unite" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Unite_SelectedIndexChanged" class="form-control" placeholder="اختر الوحدة " CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeeDepartmentType" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    <asp:Parameter DefaultValue="-1" Name="pid" Type="Int32"></asp:Parameter>
                                    <asp:Parameter DefaultValue="1" Name="type" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <label class="col-md-2 control-label">الدوائر</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="DDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_SelectedIndexChanged" class="form-control" placeholder="اختر الدائرة" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeeDepartmentType" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="Unite" PropertyName="SelectedValue" DefaultValue="-1" Name="pid" Type="Int32"></asp:ControlParameter>
                                    <asp:Parameter DefaultValue="2" Name="type" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                        <label class="col-md-2 control-label">الاقسام</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="Department" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Department_SelectedIndexChanged" class="form-control" placeholder="اختر القسم" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeeDepartmentType" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="DDL" PropertyName="SelectedValue" Name="pid" Type="Int32"></asp:ControlParameter>
                                    <asp:Parameter DefaultValue="3" Name="type" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group row">

                        <label class="col-md-2 control-label">الشعب والتراكيز</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="section" runat="server" AutoPostBack="true" OnSelectedIndexChanged="section_SelectedIndexChanged" class="form-control" placeholder="اختر الشعبةاو التركيز" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeeDepartmentType" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="Department" PropertyName="SelectedValue" Name="pid" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                    <asp:Parameter DefaultValue="4" Name="type" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>


                        <label class="col-md-2 control-label">اسم الموظف </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="Employee" CssClass="select2_category form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="Employee_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="emp_id"></asp:DropDownList>


                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetDepartmentEmployees" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Unite" PropertyName="SelectedValue" Name="Type1" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="DDL" PropertyName="SelectedValue" Name="Type2" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="Department" PropertyName="SelectedValue" Name="Type3" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="section" PropertyName="SelectedValue" Name="Type4" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="MangerID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>


                    </div>

                    <div class="form-group row ">
                        <label class="col-md-2 control-label">من تاريخ </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="FromDate" runat="server" OnTextChanged="FromDate_TextChanged" AutoPostBack="true" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>

                        </div>
                        <label class="col-md-2 control-label">الى تاريخ </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="ToDate" runat="server" OnTextChanged="ToDate_TextChanged" AutoPostBack="true" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>




                    <div class="clearfix"></div>
                    <div class="form-group">
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12 ">
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض  مهمات الوحدة /الدائرة/القسم/الشعبة-التركيز/الموظف
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
                                <th></th>
                                   <th style="width: 15%">اسم الموظف</th>
                                <th style="width: 10%">اليوم</th>
                                <th style="width: 15%; text-align: center;">التاريخ </th>
                                <th style="width: 40%">المهمة</th>
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

                                        <td>
                                            <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label></td>
                                         <td><%# Eval("DisplayName") %></td>
                                        <td><%# Eval("DayNameARABIC") %></td>
                                        <td style="text-align: center"><%# Eval("Date","{0:yyyy/MM/dd}") %></td>
                                        <td><%# Eval("TaskText") %></td>
                                        <td style="text-align: center"><%# Eval("status") %></td>
                                        <td>
                                            <label class="radio-inline">
                                                <asp:RadioButton ID="RadioButton1" Enabled="false" runat="server" class="radio-inline" AutoPostBack="true" GroupName="status"
                                                    Checked=' <%# Convert.ToBoolean(Eval("Accreditation")) %>' />
                                            </label>
                                        </td>
                                        <td>
                                            <label class="radio-inline">
                                                <asp:RadioButton ID="Accept" Enabled="false" runat="server" class="radio-inline" AutoPostBack="true" GroupName="status"
                                                    Checked=' <%# Convert.ToBoolean(Eval("Reject")) %>' />
                                            </label>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="Accreditation" runat="server" CssClass="btn green" Style="font-size: 11px; padding: 4px 10px;" OnClick="Accreditation_Click" Visible='<%# ((!Convert.ToBoolean(Eval("Accreditation").ToString())) && (!Convert.ToBoolean(Eval("Reject").ToString())) && (Eval("DM").ToString() == "1")) ? true:false %>'>اعتماد</asp:LinkButton></td>
                                        <td>
                                         
                                             <asp:LinkButton ID="Reject" runat="server" CssClass="btn red" Style="font-size: 11px; padding: 4px 10px;" OnClick="Reject_Click" Visible='<%# ((!Convert.ToBoolean(Eval("Accreditation").ToString())) && (!Convert.ToBoolean(Eval("Reject").ToString())) && (Eval("DM").ToString() == "1")) ? true:false %>'>رفض</asp:LinkButton></td>
                                        <td></td>
                                         <td></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:EmployeeTasks %>' SelectCommand="DepartmentTasksView" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Employee" PropertyName="SelectedValue" DefaultValue="" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="EmpID" PropertyName="Text" DefaultValue="" Name="MangerID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="Unite" PropertyName="SelectedValue" Name="type1" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="DDL" PropertyName="SelectedValue" Name="type2" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="Department" PropertyName="SelectedValue" Name="type3" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="section" PropertyName="SelectedValue" Name="type4" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="FromDate" PropertyName="Text" DbType="Date" Name="FromDate"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ToDate" PropertyName="Text" DbType="Date" Name="ToDate"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>




                    </table>
                    <div class="form-actions fluid">
                        <div class="col-md-12" style="text-align: center;">
                            <asp:Button ID="CompletePrintTasks" runat="server" Text="طباعة المهمات المنجزة " OnClick="CompletePrintTasks_Click" CssClass="btn green" />
                            <asp:Button ID="InCompletePrintTasks" runat="server" Text="طباعة المهمات غير المنجزة  " OnClick="InCompletePrintTasks_Click" CssClass="btn green" />
                         <asp:Button ID="NoTasks" runat="server" Text="موظفين غير مدرجة مهامهم اليومية " Visible="false" OnClick="NoTasks_Click" CssClass="btn green" />
                            
                             </div>
                    </div>
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
                            <strong>لا يوجد مهمات للعرض  </strong>
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

