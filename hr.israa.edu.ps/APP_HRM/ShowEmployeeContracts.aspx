<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="ShowEmployeeContracts.aspx.cs" Inherits="APP_HRM_ShowEmployeeContracts" %>

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
            $('#menu2').addClass("active");
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
        <li><a href="Contract_Emp_AddEdit.aspx" class="font-ha">عقود الموظفين</a></li>
    </ul>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    
    <div class="col-md-12 ">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-reorder"></i>تصفية حسب </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a>
                </div>
            </div>

            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <div class="form-horizontal">
                    <div class="form-body">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <div class="form-group" style="text-align: right">
                            <label class="col-md-1 control-label">اسم الموظف</label>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlEmpName" placeholder="ادخل اسم الموظف" runat="server" CssClass="select2_category form-control" data-placeholder="Choose a Category" DataSourceID="SqlDataSource1" DataTextField="DisplayName" DataValueField="Emp_ID" AutoPostBack="true" ></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1"  ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetAllEmployeesName" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>
                            <label class="col-md-1 control-label">نوع العقد</label>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlContractType" placeholder="ادخل نوع العقد" runat="server" CssClass="select2_category form-control" data-placeholder="Choose a Category" DataSourceID="SqlDataSource2" DataTextField="Contract_Type" DataValueField="Contract_Type_ID" OnSelectedIndexChanged="Con_Type_ID_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Contract_Type_ID], [Contract_Type] FROM [Contract_Type_TB] union select -1,N'الكل'"></asp:SqlDataSource>
                            </div>
                             <label class="col-md-1 control-label">حالة العقد</label>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlContractStatus" placeholder="ادخل حالة العقد" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlContractStatus_SelectedIndexChanged">
                                     <asp:ListItem Value="-1">اختر حالة العقد</asp:ListItem>
                                    <asp:ListItem Value="1">عقود سارية</asp:ListItem>
                                    <asp:ListItem Value="2">عقود منتهية</asp:ListItem>
                                </asp:DropDownList>
</div>
                            <div class="col-md-2">
                                <asp:Button ID="btnEmpNoContract" runat="server" Text="موظفين بلا عقود" CssClass="btn blue" OnClick="btnEmpNoContract_Click" />
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-12 ">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض  عقود الموظفبن
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
                                <th style="width: 8%">رقم الموظف</th>
                                <th style="width: 15%">اسم الموظف</th>
                                <th style="width: 18%; text-align: center">المسمى الوظيفي</th>
                                <th style="width: 18%; text-align: center">القسم</th>
                                <th style="width: 10%; text-align: center">حالة الموظف  </th>
                                <th style="width: 10%; text-align: center">نوع العقد </th>
                                <th style="width: 5%; text-align: center">فعال  </th>
                                <th style="width: 5%; text-align: center">التمديد   </th>
                                <th style="width: 16%"></th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <tr>

                                        <asp:Label ID="Contract_ID" runat="server" Text='<%# Eval("Contract_ID") %>' Visible="false"></asp:Label>
                                         <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                         <asp:Label ID="ContractTypeID" runat="server" Text='<%# Eval("Contract_Type_ID") %>' Visible="false"></asp:Label>
                                        <td><span><%# Eval("EmployeeNo") %></span></td>
                                        <td><span><%# Eval("EmployeeName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("JobTitle") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("DepartmentName") %></span></td>
                                         <td style="text-align: center"><span><%# Eval("EmpStatus") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ContractType") %></span></td>
                                        <td style="text-align: center"> 
                                             <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("IsActive") %>' Enabled="false" />
                                              </td>
                                        <td>
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
                                                <ItemTemplate>
                                                    <asp:Label ID="Contract_ID1" runat="server" Text='<%# Eval("Contract_ID") %>' Visible="false"></asp:Label>
                                                     <asp:Label ID="EmpID1" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                                     <asp:Label ID="ContractTypeID" runat="server" Text='<%# Eval("Contract_Type_ID") %>' Visible="false"></asp:Label>
                                                     <asp:LinkButton ID="PrintRenewContract" runat="server" class="btn default btn-xs yellow"  OnClick="PrintRenewContract_Click"><%# (Eval("Contract_Type_ID").ToString() =="10"? "طباعة تمديد عقد تطوع": "طباعة تمديد عقد العمل") %>  </a></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeeRenewContracts" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Contract_ID" PropertyName="Text" Name="Contract_ID" Type="Int32"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="PDFEmployeeContract" runat="server" Text=" طباعة عقد الموظف 1 " OnClick="PDFEmployeeContract_Click" CssClass="btn default btn-xs green"  />
                                            <asp:LinkButton ID="PDFEmployeeContract2" runat="server" Text=" طباعة عقد الموظف 2"  CssClass="btn default btn-xs green"  OnClick="PDFEmployeeContract2_Click" />

                                            <asp:LinkButton ID="PrintAppointment" runat="server" class="btn default btn-xs blue" Visible='<%# Convert.ToBoolean((Eval("Contract_Type_ID").ToString()!="10")) %>' OnClick="PrintAppointment_Click"> طباعة قرار التعيين </a></asp:LinkButton>
                                           <%--  <asp:LinkButton ID="PrintRenewContract" runat="server" class="btn default btn-xs yellow" Visible='<%# Convert.ToBoolean((Eval("Contract_Type_ID").ToString()!="10")) %>' OnClick="PrintRenewContract_Click"> طباعة تمديد عقد العمل </a></asp:LinkButton>
                                           --%> <asp:LinkButton ID="LinkButton1" runat="server" class="btn default btn-xs blue" Visible='<%# Convert.ToBoolean((Eval("Contract_Type_ID").ToString()=="10")) %>' OnClick="PDFVolunteerREquest_Click"> طلب بيانات التطوع   </a></asp:LinkButton>

                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="EmployeeContractsGet" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlEmpName" PropertyName="SelectedValue" DefaultValue="-1" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlContractType" PropertyName="SelectedValue" DefaultValue="-1" Name="Contract_Type_ID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlContractStatus" PropertyName="SelectedValue" DefaultValue="-1" Name="ContractStatus" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>

                    </table>


                    <div class="clearfix"></div>

                    <div class="col-md-10" style="float: left!important; direction: ltr!important;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="100" PagedControlID="ListView1" class="pager col-md-6">
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
                            <strong>لا يوجدعقود للعرض  </strong>
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

