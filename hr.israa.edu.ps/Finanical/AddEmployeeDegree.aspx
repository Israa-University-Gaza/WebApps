<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="AddEmployeeDegree.aspx.cs" Inherits="Finanical_EmployeeDegreeAddEdit" %>

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
        <li><a href="Contract_Emp_AddEdit.aspx" class="font-ha">درجات وأقدميات الموظفين</a></li>
    </ul>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="col-md-12 ">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>

                    <a href="" class="remove"></a>
                </div>
            </div>



            <div class="portlet-body form">
                
                <div class="form-body">
                     <div class="input-group input-medium">
                                <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"></asp:TextBox>
                                <span class="input-group-btn">
                                    <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btnFilter_Click" class="btn btn-primary" />

                                </span>
                            </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 20%">اسم الموظف</th>
                                <th style="width: 15%; text-align: center">نوع العقد</th>
                                <th style="width: 15%; text-align: center">الكادر</th>
                                <th style="width: 15%; text-align: center">الفئة</th>
                                <th style="width: 15%; text-align: center">الدرجة</th>
                               <th style="width: 5%"></th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="ListView1_ItemDataBound">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="CaderID" runat="server" Text='<%# Eval("CaderID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="GradeID" runat="server" Text='<%# Eval("GradeID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="DegreeID" runat="server" Text='<%# Eval("DegreeID") %>' Visible="false"></asp:Label>
                                        <td><span><%# Eval("DisplayName") %></span>
                                        </td>
                                        <td style="text-align: center"><span><%# Eval("Contract_Type") %></span></td>
                                        <td style="text-align: center">
                                            <asp:DropDownList ID="ddlCader" runat="server" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCader_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Cader] union select 0,N'اختر الكادر'"></asp:SqlDataSource>
                                        </td>


                                        <td style="text-align: center">

                                            <asp:DropDownList ID="ddlGrade" runat="server" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="ID" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Grade] where CaderID=@CaderID union select 0,N'اختر الفئة'">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlCader" Name="CaderID" DbType="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>


                                        <td style="text-align: center">
                                            <asp:DropDownList ID="ddlDegree" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Degree] where GradeID=@GradeID union select 0,N'اختر الدرجة '">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlGrade" Name="GradeID" DbType="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    <td style="text-align: center">
                                            <asp:LinkButton ID="Save" runat="server" Text="حفظ" OnClick="Save_Click" CssClass="btn default btn-xs green" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>


                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeeDegree" SelectCommandType="StoredProcedure">
                                 <SelectParameters>
                                       <asp:ControlParameter ControlID="txtNameFilter" PropertyName="Text" Name="Name" Type="String" DefaultValue="%"></asp:ControlParameter>
                                 </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>

                    </table>


                    <div class="clearfix"></div>

                    <div class="col-md-10" style="float: right!important; direction: ltr!important;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="50" PagedControlID="ListView1" class="pager col-md-6">
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
                            <strong></strong>
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

