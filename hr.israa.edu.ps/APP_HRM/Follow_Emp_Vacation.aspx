<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Follow_Emp_Vacation.aspx.cs" Inherits="APP_HRM_Follow_Emp_Vacation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
        <li><a href="#" class="font-ha">متابعة طلبات اجازات الموظفين</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <asp:Label ID="EmployeeID" runat="server" Visible="false"></asp:Label>
      <div class="row">
    <div class="col-md-12">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>متابعة طلبات اجازات الموظفين</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                    <a href="javascript:;" class="collapse"></a>

                </div>
            </div>
             <div class="portlet-body">
            <div class="table-responsive">
                <div class="input-group input-large">
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=20 union select -1,N'اختر الحالة'"></asp:SqlDataSource>
                    <span class="input-group-btn">
                        <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btnFilter_Click" class="btn btn-primary" /></span>
                </div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="width: 17%">اسم الموظف  </th>
                            <th style="width: 8%">نوع الاجازة </th>
                            <th style="width: 10%">تاريخ البدء </th>
                            <th style="width: 10%; text-align: center">تاريخ العودة </th>
                            <th style="width: 10%; text-align: center">ع.ايام الاجازة</th>
                            <th style="width: 10%; text-align: center">تاريخ الطلب</th>
                            <th style="width: 9%; text-align: center">حالةالطلب</th>
                            <th style="width: 12%; text-align: center">قبول     رفض</th>
                            <th style="width: 12%; text-align: center">يعمل مكانه  </th>
                            <th style="width: 5%; text-align: center"></th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <asp:Label ID="VacationID" runat="server" Text='<%# Eval("Vacation_ID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="RequestStatusID" runat="server" Text='<%# Eval("Request_Status") %>' Visible="false"></asp:Label>
                                 <tr>
                                    <td><span><%# Eval("DisplayName") %></span></td>
                                    <td><span><%# Eval("VacationType") %></span></td>
                                    <td><span><%# Eval("Vacation_Start_Date","{0:yyyy/MM/dd}") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("Vacation_End_Date","{0:yyyy/MM/dd}") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("Vacation_Day_Count") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("Vacation_Request_Date","{0:yyyy/MM/dd}") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("VacationStatus") %></span></td>
                                    <td style="text-align: center">
                                
                                      <div class="radio-list">
                                            <label class="radio-inline">
                                                <asp:RadioButton ID="Accept" runat="server" Visible='<%# (Eval("Request_Status").ToString()=="18")?true :false %>' class="radio-inline" GroupName="status" AutoPostBack="true" OnCheckedChanged="Accept_CheckedChanged" />
                                            </label>
                                            <label class="radio-inline">
                                                <asp:RadioButton ID="Refused" runat="server" Visible='<%# (Eval("Request_Status").ToString()=="18")?true :false %>' class="radio-inline" GroupName="status" AutoPostBack="true" OnCheckedChanged="Refused_CheckedChanged" />
                                            </label>
                                        </div>
                                    </td>
                                
                                        
                                    <td style="text-align: center">
                                        <span><%# (Eval("Request_Status").ToString()=="2104")? Eval("OtherEmployeeName"):"" %></span>
                                        <asp:DropDownList ID="ddlOtherEmployee" runat="server" Enabled="false" Visible='<%# (Eval("Request_Status").ToString()=="18")?true :false %>' SelectedValue='<%# (Eval("OtherEmployee").ToString()!="")?Eval("OtherEmployee") : "-1" %>' CssClass="select2_category form-control input-xsmall" DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="Emp_ID"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="select Emp_ID,[dbo].[GetEmployeeName](Emp_ID,3) as DisplayName From Employee_TB where emp_ID not in (1,2,3,4,5) union select -1,N'اختر الموظف البديل'"> </asp:SqlDataSource>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:Button ID="btnSave" runat="server" class="btn default btn-xs green" Visible='<%# (Eval("Request_Status").ToString()=="18")?true :false %>' Text="حفظ" OnClick="btnSave_Click" />
                                    </td>

                                </tr>

                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                            SelectCommand="FollowEmpVacation" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="EmployeeID" PropertyName="Text" DefaultValue="" Name="MangerID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlStatus" PropertyName="selectedValue" Name="StatusFilter" DefaultValue="-1"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </tbody>
                </table>
                <div class="clearfix"></div>

                <div class="col-md-10" style="float: left!important; direction: ltr!important;">
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
            </div>
        </div>
</div>
</div>
    </div>

</asp:Content>

