<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="AddEmployeeBouns.aspx.cs" Inherits="Finanical_AddEmployeeBouns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
        $('document').ready(function () {
                $('.page-sidebar-menu li').removeClass("active").removeClass("open");
                $('.page-sidebar-menu li ul li').css("background-color", "");
                $('#menu6').addClass("active open");
                $('#menu6_8 a').css("background-color", "#575757");
                $('#menu6 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة علاوة لموظف</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
                            <div class="form-group row">
                                <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlEmployee" runat="server" DataSourceID="SqlDataSource5" DataTextField="displayName" DataValueField="Emp_ID" CssClass="form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,([dbo].[GetEmployeeNo](Emp_ID)+ ' ' +[dbo].[GetEmployeeName](Emp_ID,3)) as DisplayName  FROM [Employee_TB] where IsDelete=0 and [dbo].[getEmployeeStatus](Emp_ID)=1041 and  Emp_ID not in (1,2,3,4,5) union select -1,N'  اختر الموظف'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label" style="text-align: right">نوع العلاوة </label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlBounsType" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" CssClass="form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [BounsType] union select -1,N' اختر نوع العلاوة '"></asp:SqlDataSource>
                                </div>


                                <label class="col-md-2 control-label" style="text-align: right">العلاوة </label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlBouns" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" CssClass="form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Bouns] where BounsTypeID=@BounsTypeID  union select -1,N' اختر  العلاوة '">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlBounsType" PropertyName="SelectedValue" Name="BounsTypeID"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>



                        </div>

                         <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn blue" OnClick="btnSave_Click" />
                               
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
         </div>
    
    <div class="col-md-12 ">
        <div class="portlet box green">

            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>علاوات الموظفين</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">

                <div class="form-body">
                    <div class="input-group input-medium">
                        <asp:TextBox ID="txtNameFilter" runat="server" class="form-control" placholder="ابحث باسم الموظف"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btnFilter_Click"  class="btn btn-primary" />
                        </span>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 30%">الموظف</th>
                                <th style="width: 30%">نوع العلاوة</th>
                                <th style="width: 30%">العلاوة</th>
                                <th style="width: 10%">فعال</th>


                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <td><span><%# Eval("DisplayName") %></span></td>
                                        <td><span><%# Eval("BounsTypeName") %></span></td>
                                        <td><span><%# Eval("BounsName") %></span></td>


                                        <td><span>
                                            <asp:CheckBox ID="IsActive" runat="server" AutoPostBack="true"  Checked=' <%# Convert.ToBoolean(Eval("IsActive")) %>' OnCheckedChanged="IsActive_CheckedChanged" /></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeeBouns" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtNameFilter" PropertyName="Text" Name="Name" Type="String" DefaultValue="%"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>

                    </table>
                    <div class="clearfix"></div>
                    <div class="col-md-6" style="float: left!important; direction: ltr!important;">
                      <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                            <asp:NumericPagerField ButtonType="Link" />
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

