<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Accept_Vacation_Request.aspx.cs" Inherits="APP_HRM_Accept_Vacation_Request" %>

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
        <li><a href="#" class="font-ha">اعتماد طلبات اجازات الموظفين</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <% if (Permissions.Contains("VacationManagerFollowView"))
        { %>
    <asp:Label ID="EmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>اعتماد طلبات اجازات الموظفين</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                        <a href="javascript:;" class="collapse"></a>

                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        <div class="form-group row">
                            <label class="control-label col-md-2">تصنيف الموظف  : </label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlEmployeeCat" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource12" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [Name] FROM TypeCategory where TypeID=1 union select-1,N'الكل' order by ID "></asp:SqlDataSource>
                            </div>
                            <label class="control-label col-md-2">نوع العقد: </label>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlContractTypeID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource6" DataTextField="Contract_Type" DataValueField="Contract_Type_ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Contract_Type_ID], [Contract_Type] FROM Contract_Type_TB union select-1,N'الكل' "></asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlSubContractType" placeholder="ادخل نوع العقد مخصص" runat="server" DataSourceID="SqlDataSource13" DataTextField="ContractSubName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,ContractSubName FROM [ContractSubType] where Contract_Type_ID=@Type union select -1,N'الكل'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlContractTypeID" PropertyName="SelectedValue" DefaultValue="7" Name="Type"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-2">تصنيف دوام الموظف  : </label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlEmpCategoryID" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpCategoryID_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [CategoryName] FROM EmpCategory  where ID=4 union select-1,N'الكل' order by ID "></asp:SqlDataSource>

                            </div>
                            <label class="control-label col-md-2">حالة الموظف: </label>
                            <div class="col-md-2">
                                <asp:DropDownList ID="Empstatus" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" AutoPostBack="true" OnSelectedIndexChanged="Empstatus_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select -1,N' الكل'">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="7" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlEmpCategoryID2" runat="server" CssClass="select2_category form-control" AutoPostBack="true">
                                    <asp:ListItem Value="-1">الكل</asp:ListItem>
                                    <asp:ListItem Value="1">معفي من التوقيع</asp:ListItem>
                                    <asp:ListItem Value="2">غير معفي من التوقيع</asp:ListItem>
                                    <asp:ListItem Value="3">داوم خارج الجامعة</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlEmpTermenateReason" runat="server" CssClass="select2_category form-control" AutoPostBack="true" Visible="false" DataSourceID="SqlDataSource17" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource17" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1030 Union Select -1,N'الكل'"></asp:SqlDataSource>
                            </div>

                        </div>



                        <div class="form-group row">
                            <label class="col-md-2 control-label">من تاريخ </label>
                            <div class="col-md-4">
                                <div class="input-icon">
                                    <i class="fa fa-calendar"></i>
                                    <asp:TextBox ID="DateFrom" runat="server" AutoPostBack="true" OnTextChanged="date_TextChanged" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">الى تاريخ </label>
                            <div class="col-md-4">
                                <div class="input-icon">
                                    <i class="fa fa-calendar"></i>
                                    <asp:TextBox ID="DateTo" runat="server" AutoPostBack="true" OnTextChanged="date_TextChanged" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label">حالة الطلب  </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" DataSourceID="SqlDataSource4" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=20 union select -1,N'اختر الحالة'"></asp:SqlDataSource>

                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="portlet-body">
                        <div class="table-responsive">
                             <div class="form-group row">
                               <label class="col-md-2 control-label">بحث باسم الموظف </label>
                              <div class="col-md-4">
                            <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"></asp:TextBox>
                                  </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btnFilter_Click1" class="btn btn-primary" />
                          

                            </div>
                        </div>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 15%">اسم الموظف  </th>
                                        <th style="width: 7%">نوع الاجازة </th>
                                        <th style="width: 8%">تاريخ البدء</th>
                                        <th style="width: 10%; text-align: center">تاريخ العودة</th>
                                        <th style="width: 10%; text-align: center">ع.ايام الاجازة</th>
                                        <th style="width: 10%; text-align: center">تاريخ الطلب</th>
                                        <th style="width: 9%; text-align: center">حالةالطلب</th>
                                        <th style="width: 10%; text-align: center">( شئون الموظفين)<br />
                                            قبول     رفض</th>
                                        <% if (Permissions.Contains("HRMAdoptVacation"))
                                            { %>
                                        <th style="width: 10%; text-align: center">(الشئون الادارية)<br />
                                            قبول     رفض</th>
                                        <%} %>
                                        <th style="width: 5%; text-align: center"></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <asp:Label ID="VacationID" runat="server" Text='<%# Eval("Vacation_ID") %>' Visible="false"></asp:Label>
                                            <tr>
                                                <td><span><%# Eval("DisplayName")%></span></td>
                                                <td><span><%# Eval("VacationType") %></span></td>
                                                <td><span><%# Eval("Vacation_Start_Date","{0:yyyy/MM/dd}") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("Vacation_End_Date","{0:yyyy/MM/dd}") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("Vacation_Day_Count") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("Vacation_Request_Date","{0:yyyy/MM/dd}") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("VacationStatus") %></span></td>

                                                <% if (Permissions.Contains("VacationManagerAdoptFollow"))
                                                    { %>
                                                <td style="text-align: center">
                                                    <div class="radio-list">
                                                        <label class="radio-inline">
                                                            <asp:RadioButton ID="AcceptHR" Enabled='<%# (Permissions.Contains("HRMAdoptVacation"))? false:true %>' runat="server" class="radio-inline" GroupName="AdoptHR"
                                                                Visible='<%# Convert.ToBoolean(Eval("AdoptHR")== DBNull.Value /*&& Eval("Request_Status").ToString()=="2104"*/)?true :false %>' />
                                                            <%--Checked=' <%# Convert.ToBoolean(Eval("AdoptHR")!= DBNull.Value) ? Convert.ToBoolean(Eval("AdoptHR")) : false %>'--%>
                                                            <asp:RadioButton ID="RefusedHR" Enabled='<%# (Permissions.Contains("HRMAdoptVacation"))?false:true %>' runat="server" class="radio-inline" GroupName="AdoptHR"
                                                                Visible='<%# Convert.ToBoolean(Eval("AdoptHR")== DBNull.Value  /*&& Eval("Request_Status").ToString()=="2104"*/)?true :false %>' />
                                                            <%--Checked=' <%# Convert.ToBoolean(Eval("AdoptHR")!= DBNull.Value) ? !Convert.ToBoolean(Eval("AdoptHR")) : false %>'--%>
                                                        </label>

                                                    </div>
                                                </td>
                                                <%} %>

                                                <%-- <% if (Permissions.Contains("HRMAdoptVacation"))
                                                { %>
                                            <td style="width: 10%; text-align: center">
                                                <div class="radio-list">

                                                    <label class="radio-inline">
                                                        <asp:RadioButton ID="RadioButton1" runat="server" Visible='<%# Convert.ToBoolean(Eval("AdoptHRM")== DBNull.Value)?true :false %>' class="radio-inline" GroupName="Adopt" />
                                                        <asp:RadioButton ID="RadioButton2" runat="server" Visible='<%# Convert.ToBoolean(Eval("AdoptHRM")== DBNull.Value)?true :false %>' class="radio-inline" GroupName="Adopt" />
                                                    </label>

                                                </div>
                                            </td>
                                            <%} %>--%>
                                                <td style="text-align: center">
                                                    <% if (Permissions.Contains("VacationManagerAdoptFollow"))
                                                        { %>
                                                    <asp:Button ID="btnHRAdopt" runat="server" Visible='<%# (Convert.ToBoolean(Eval("AdoptHR")== DBNull.Value  /*&& Eval("Request_Status").ToString()=="2104"*/) && !Permissions.Contains("HRMAdoptVacation"))?true :false %>'
                                                        class="btn default btn-xs green" Text="حفظ" OnClick="btnHRAdopt_Click" />

                                                    <%} %>
                                                    <%-- <% if (Permissions.Contains("HRMAdoptVacation"))
                                                    { %>
                                                <asp:Button ID="AdoptHRM" runat="server" Visible='<%# Convert.ToBoolean(Eval("AdoptHRM")== DBNull.Value)?true :false %>' class="btn default btn-xs green" Text="اعتماد" OnClick="AdoptHRM_Click" />
                                                <%} %>--%>
                                                    <asp:Button ID="PrintRequest" runat="server" Visible='<%# Convert.ToBoolean(Eval("AdoptHR")!= DBNull.Value)?true :false %>' class="btn default btn-xs blue" Text="طباعة الطلب" OnClick="PrintRequest_Click" />
                                                    <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black"   Visible='<%# Convert.ToBoolean(Eval("AdoptHR")== DBNull.Value || Eval("Request_Status").ToString()=="2104")?true :false %>' OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                        SelectCommand="AcceptEmpVacation" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="EmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlStatus" PropertyName="SelectedValue" DefaultValue="-1" Name="StatusFilter" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="DateFrom" Name="DateFrom" PropertyName="Text" Type="string" />
                                            <asp:ControlParameter ControlID="DateTo" Name="DateTo" PropertyName="Text" Type="string" />
                                            <asp:ControlParameter ControlID="ddlEmpCategoryID" Name="EmpCategoryID" PropertyName="SelectedValue" Type="Int16" />
                                            <asp:ControlParameter ControlID="ddlEmpCategoryID2" Name="EmpCategoryID2" PropertyName="SelectedValue" Type="Int16" />
                                            <asp:ControlParameter ControlID="Empstatus" Name="EmpstatusID" PropertyName="SelectedValue" Type="Int16" />
                                            <asp:ControlParameter ControlID="ddlEmpTermenateReason" Name="CTermenateReasonID " PropertyName="SelectedValue" Type="Int16" DefaultValue="-1" />
                                            <asp:ControlParameter ControlID="ddlEmployeeCat" Name="EmployeeCatID" PropertyName="SelectedValue" Type="Int16" />
                                            <asp:ControlParameter ControlID="ddlContractTypeID" Name="ContractTypeID" PropertyName="SelectedValue" Type="Int16" />
                                            <asp:ControlParameter ControlID="ddlSubContractType" Name="SubContractTypeID" PropertyName="SelectedValue" Type="Int16" />
                                              <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>

