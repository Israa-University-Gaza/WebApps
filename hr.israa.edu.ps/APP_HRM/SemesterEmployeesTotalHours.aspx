<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="SemesterEmployeesTotalHours.aspx.cs" Inherits="APP_HRM_SemesterEmployeesTotalHours" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#Academic').addClass("active");
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-reorder"></i>العبء الأكاديمي</div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a>
                </div>
            </div>
           
            <div class="portlet-body">
                <!-- BEGIN FORM-->
                
            <div class="table-responsive">

                <div class="form-group">
                    <label class="col-md-2 control-label" style="text-align: right">الفصل الدراسي </label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlFilterSemester" runat="server" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterSemester_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT ID,[ArName] FROM [Semester] where IsDelete=0  and IsActive=1 and ID<>1  union select -1 , N'اختر الفصل الدراسي'"></asp:SqlDataSource>
</div>
                    <div class="col-md-4">
                         <asp:Button ID="BtnPrint" runat="server" Text=" طباعة التقرير" class="btn blue" OnClick="BtnPrint_Click" />
                        </div>

                </div>
                <div class="clearfix"></div>
                  <% if (ListView1.Items.Count > 0)
                       { %>
                <div class="form-group">
                </div>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="width: 15%;text-align: center"># </th>
                            <th style="width: 15%;text-align: center">رقم الموظف</th>
                            <th style="width: 15%; text-align: center">اسم الموظف</th>
                            <th style="width: 20%; text-align: center">العبء الاكاديمي الأسبوعي</th>
                             <th style="width: 20%; text-align: center">العبء الاجمالي(14 أسبوع)</th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                            <ItemTemplate>
                                <tr>
                                    <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("EmployeeNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("EmployeeName") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("SemesterEmployeeTotalHours") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("AllSemesterEmployeeTotalHours") %></span></td>

                                </tr>
                            </ItemTemplate>
                        </asp:ListView>

                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                            ConnectionString='<%$ ConnectionStrings:isra %>'
                            SelectCommand="GetSemesterEmployeesTotalHours" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlFilterSemester" PropertyName="SelectedValue" DefaultValue="-1" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
                     <div class="clearfix"></div>

<%--                        <div class="col-md-10" style="float: left!important; direction: ltr!important;">
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
                        <div class="clearfix"></div>--%>
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

