<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="ManagePermissions.aspx.cs" Inherits="APP_HRM_ManagePermissions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu3').addClass("active");
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
        <li><a href="#" class="font-ha">إدارة الصلاحيات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="lbEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">

        <div class="col-md-12">
            <div class="portlet box blue">

                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إدارة صلاحيات الموظفين</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>

                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                            <div class="col-md-offset-10 col-md-2">
                                <asp:LinkButton ID="btnAddNew" runat="server" Text="إضافة جديد" CssClass="btn green" PostBackUrl="~/APP_HRM/PermissionAdd.aspx" />
                            <br />
                            </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-2 control-label isra-text-aling-right">إسم أو رقم الموظف</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtEmployeeName" CssClass="form-control date-picker" runat="server"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label isra-text-aling-right">إسم الصلاحية</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtRoleName" CssClass="form-control date-picker" runat="server"></asp:TextBox>
                                </div>

                            </div>


                            <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="btnSave" runat="server" Text="تصفية" CssClass="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>


        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الصلاحيات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">

                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 2%">#</th>
                                <th style="text-align: center; width: 10%">رقم الموظف</th>
                                <th style="text-align: center; width: 30%">إسم الموظف</th>
                                <th style="text-align: center; width: 30%">إسم الصلاحية </th>
                                <th style="text-align: center; width: 10%">فعال</th>

                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" DataSourceID="SqlDataSource3" runat="server" >
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <td><span><%# Eval("RowNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("EmployeeNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("EmployeeName") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("RoleCode") %></span></td>
                                    <td style="text-align: center"><span>
                                        <asp:CheckBox ID="rbtnIsActive" Checked='<%# Eval("IsActive").ToString()=="True" ?true :false %>' runat="server" /> </span></td>
                                      <td style="text-align: center">
                                        <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click" ><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                        <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple"  OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i>  حذف</a></asp:LinkButton>
                                    </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:isra3 %>" SelectCommand="EmployeesRolesGet" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                   <asp:ControlParameter ControlID="txtEmployeeName"  PropertyName="Text" DefaultValue="%" Name="EmployeeName" Type="String"></asp:ControlParameter>
                                   <asp:ControlParameter ControlID="txtRoleName" PropertyName="Text" DefaultValue="%" Name="RoleName" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>

                    <asp:DataPager ID="DataPager1" runat="server" PageSize="20" PagedControlID="ListView1"  class="pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                            <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                            <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                    <div class="clearfix"></div>
                    <% }
                        else
                        {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center;">
                            <strong>لا يوجد بيانات لعرضها</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        </div>


</asp:Content>

