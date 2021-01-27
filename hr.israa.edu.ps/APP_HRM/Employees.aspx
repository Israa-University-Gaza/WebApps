<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Employees.aspx.cs" Inherits="APP_HRM_Employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>موظفو الجامعة</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="control-label col-md-2">رقم الموظف : </label>
                        <div class="col-md-5">
                            <asp:TextBox ID="txtEmployeeNo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-2">إسم الموظف : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArFirstName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtSecoundName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArThirdName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArFamilyName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-offset-4 col-md-4"></label>
                        <div class="col-lg-offset-2 col-md-8">
                            <asp:Button ID="btnFilter" runat="server" Text="بحث" class="btn green" OnClick="btnFilter_Click" />
                        </div>
                    </div>
                    <div class="clearfix"></div>


                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                               { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; width: 10%">رقم الموظف</th>
                                        <th style="text-align: center; width: 18%">إسم الموظف</th>
                                      <%--  <th style="text-align: center; width: 12%">تصنيف الموظف</th>--%>
                                        <th style="text-align: center; width: 20%">القسم</th>
                                        <th style="text-align: center; width: 20%">المسمى الوظيفي</th>
                                        <th style="text-align: center; width: 20%"></th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <tr>
                                                <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                                <td style="text-align: center;"><%# Eval("EmployeeNo") %></td>
                                                <td style="text-align: center;"><%# Eval("EmployeeName") %></td>
                                             <%--   <td style="text-align: center;"><%# Eval("EmployeeCategory") %></td>--%>
                                               <td style="text-align: center;"><%# Eval("Department") %></td>
                                                <td style="text-align: center;"><%# Eval("JobTitle") %></td>
                                                <td style="text-align: center;">
                                                    <asp:LinkButton ID="lbOpenEmployee" runat="server" class="btn default btn-xs black" OnClick="lbOpenEmployee_Click">فتح الملف</asp:LinkButton>
                                                   <%-- <asp:LinkButton ID="lbEmployeeCategories" runat="server" class="btn default btn-xs black" OnClick="lbEmployeeCategories_Click">تغيير تصنيفات الموظف </asp:LinkButton>--%>
                                               
                                                     </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                        SelectCommand="GetEmployees" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtEmployeeNo" DefaultValue="%" PropertyName="Text" Name="EmployeeNo" Type="String" />
                                            <asp:ControlParameter ControlID="txtArFirstName" DefaultValue="%" PropertyName="Text" Name="ArFirstName" Type="String" />
                                            <asp:ControlParameter ControlID="txtSecoundName" DefaultValue="%" PropertyName="Text" Name="ArSecoundName" Type="String" />
                                            <asp:ControlParameter ControlID="txtArThirdName" DefaultValue="%" PropertyName="Text" Name="ArThirdName" Type="String" />
                                            <asp:ControlParameter ControlID="txtArFamilyName" DefaultValue="%" PropertyName="Text" Name="ArFamilyName" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>
                            <div class="col-md-10" style="float: left!important; direction: ltr!important;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="500" PagedControlID="ListView1" class="pager col-md-12">
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
                            <% }
                               else
                               {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد نتائج للبحث</strong>
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
        </div>
    </div>
</asp:Content>

