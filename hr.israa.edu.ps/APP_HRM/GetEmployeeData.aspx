﻿<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="GetEmployeeData.aspx.cs" Inherits="APP_HRM_GetEmployeeData" %>

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
            $('#menu2').addClass("active");
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
        <li><a href="Contract_Emp_AddEdit.aspx" class="font-ha">تصنيف الموظفين</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

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
                            <label class="col-md-2 control-label">اسم الموظف</label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlEmpName" placeholder="ادخل اسم الموظف" runat="server" CssClass="select2_category form-control" data-placeholder="Choose a Category" DataSourceID="SqlDataSource1" DataTextField="DisplayName" DataValueField="Emp_ID" AutoPostBack="true"  OnSelectedIndexChanged="ddlEmpName_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Emp_ID], [DisplayName] FROM [Employee_TB]  where IsDelete=0 and Emp_ID not in (1,2,3,5) union select -1,N'الكل'"></asp:SqlDataSource>
                            </div>
                            <label class="col-md-2 control-label">تصنيف الموظف</label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlEmpType" placeholder="ادخل تصنيف الموظف" runat="server" CssClass="select2_category form-control"  AutoPostBack="true" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="ID" OnSelectedIndexChanged="ddlEmpType_SelectedIndexChanged"></asp:DropDownList>

                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [CategoryName] FROM [EmpCategory] union select -1,N'الكل'"></asp:SqlDataSource>
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
                    <i class="fa fa-reorder"></i>عرض  بيانات الموظفبن
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
                                <th style="width: 25%">اسم الموظف</th>
                                <th style="width: 25%; text-align: center">المسمى الوظيفي</th>
                                <th style="width: 20%; text-align: center">القسم</th>
                                <th style="width: 10%; text-align: center">تصنيف الموظف </th>
                                <th style="width: 20%"></th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <tr>

                                        <asp:Label ID="Contract_ID" runat="server" Text='<%# Eval("EmpCategoryID") %>' Visible="false"></asp:Label>
                                         <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                        <td><span><%# Eval("EmployeeName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("JobTitle") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("DepartmentName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("EmpCategoryName") %></span></td>
                                        <td>
                                            <asp:LinkButton ID="PageVolunteerREquest" runat="server" Text="استكمال بيانات المتطوع " Visible='<%# Convert.ToBoolean((Eval("EmpCategoryID").ToString()=="6")) %>' OnClick="PageVolunteerREquest_Click" CssClass="btn default btn-xs green" />

                                            <asp:LinkButton ID="PDFVolunteerREquest" runat="server" class="btn default btn-xs blue"  Visible='<%# Convert.ToBoolean((Eval("EmpCategoryID").ToString()=="6")) %>'  OnClick="PDFVolunteerREquest_Click"> طباعة طلب بيانات المتطوع </a></asp:LinkButton>

                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeeData" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlEmpName" PropertyName="SelectedValue" DefaultValue="-1" Name="Emp_ID" Type="Int32"></asp:ControlParameter>

                                    <asp:ControlParameter ControlID="ddlEmpType" PropertyName="SelectedValue" DefaultValue="-1" Name="EmpCategoryID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>

                    </table>


                    <div class="clearfix"></div>

                    <div class="col-md-6" style="float: left!important; direction: ltr!important;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager col-md-6">
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
                            <strong>لا يوجد بيانات للعرض  </strong>
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
