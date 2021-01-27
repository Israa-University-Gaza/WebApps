<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="SemesterIncomeStatistics_old.aspx.cs" Inherits="Financial_SemesterIncomeStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#SemesterIncomeStatistics').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">إحصائيات الواردات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
<%--    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الفصل الدراسي</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body" style="width: 65%; margin: 0 auto;">
                            <div class="form-group row">
                                <label class="col-md-2 control-label">الفصل الدراسي</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="Select ID, ArName From Semester Where ID<>1 and IsDelete=0"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إحصائيات الإيرادات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body" style="width: 65%; margin: 0 auto;">
                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 70%; text-align: center">البيان</th>
                                            <th scope="col" style="width: 30%; text-align: center">الإجمالي بالدينار</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><span><%# Eval("ActionArName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("SumOfAmount") %></span></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetSemesterIncomeStatistics" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center">
                                        <strong>لا يوجد احصائيات كتب في هذا الفصل الدراسي</strong>
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
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إحصائيات الإرجاعات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body" style="width: 65%; margin: 0 auto;">
                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 70%; text-align: center">البيان</th>
                                            <th scope="col" style="width: 30%; text-align: center">الإجمالي بالدينار</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><span><%# Eval("ActionArName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("SumOfAmount") %></span></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetSemesterReturnStatistics" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>

                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center">
                                        <strong>لا يوجد احصائيات كتب في هذا الفصل الدراسي</strong>
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
    </div>--%>

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">

                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-1 control-label">الفصل </label>
                                <div class="col-md-5">
                                    <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>


                                <asp:Button ID="Search" runat="server" Text="بحث" OnClick="Search_Click" CssClass="btn btn-success" />
                            </div>

                            <hr />
                            <% if (ListView3.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col" style="width: 15%;">عدد الطلبة الملتحقين</th>
                                        <th scope="col" style="width: 15%; text-align: center">المبلغ المستحق</th>
                                        <th scope="col" style="width: 15%; text-align: center">المبلغ المدفوع</th>
                                        <th scope="col" style="width: 15%; text-align: center">المبلغ المرجع</th>
                                        <th scope="col" style="width: 15%; text-align: center">المبلغ المتبقي</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="text-align: center"><span><%# Eval("TotalStudent") %></span></td>
                                                <td style="text-align: center"><span>
                                                    <asp:LinkButton ID="LinkButton_TotalAmount" runat="server" OnClick="LinkButton_TotalAmount_Click"><%# Eval("TotalAmount") %></asp:LinkButton>

                                                </span></td>
                                                <td style="text-align: center">

                                                    <asp:LinkButton ID="LinkButton_TotalIncomeAmount" runat="server" OnClick="LinkButton_TotalIncomeAmount_Click"><%# Eval("TotalIncomeAmount") %></asp:LinkButton>

                                                </td>
                                                <td style="text-align: center">

                                                    <asp:LinkButton ID="LinkButton_TotalReterunAmount" runat="server" OnClick="LinkButton_TotalReterunAmount_Click"><%# Eval("TotalReterunAmount") %></asp:LinkButton>

                                                </td>
                                                <td style="text-align: center"><span><%# Eval("RemainAmount") %></span></td>

                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                        SelectCommand="GetSemesterStatistics" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />

                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>

                            <hr />




                            <div class="row">

                                <div class="col-md-6">
                                    <!-- BEGIN SAMPLE TABLE PORTLET-->
                                    <div class="portlet box green">
                                        <div class="portlet-title">
                                            <div class="caption">
                                                <i class="icon-social-dribbble font-green"></i>
                                                <span class="caption-subject font-green bold uppercase">تفاصيل الرسوم المستحقة</span>
                                            </div>
                                            <div class="actions">
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <div class="">
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" style="width: 70%; text-align: center">البيان</th>
                                                            <th scope="col" style="width: 30%; text-align: center">الإجمالي بالدينار</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView4" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td><span><%# Eval("ActionArName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("SumOfAmount") %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>

                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- END SAMPLE TABLE PORTLET-->
                                </div>

                                <div class="col-md-6">

                                    <!-- BEGIN SAMPLE TABLE PORTLET-->
                                    <div class="portlet box green">
                                        <div class="portlet-title">
                                            <div class="caption">
                                                <i class="icon-social-dribbble font-green"></i>
                                                <span class="caption-subject font-green bold uppercase">تفاصيل الرسوم المسددة</span>
                                            </div>
                                            <div class="actions">
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <div class="">
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" style="width: 70%; text-align: center">البيان</th>
                                                            <th scope="col" style="width: 30%; text-align: center">الإجمالي بالدينار</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView5" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td><span><%# Eval("ActionArName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("SumOfAmount") %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>

                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- END SAMPLE TABLE PORTLET-->




                                    <!-- BEGIN SAMPLE TABLE PORTLET-->
                                    <div class="portlet box green">
                                        <div class="portlet-title">
                                            <div class="caption">
                                                <i class="icon-social-dribbble font-green"></i>
                                                <span class="caption-subject font-green bold uppercase">تفاصيل الرسوم المرجعة</span>
                                            </div>
                                            <div class="actions">
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <div class="">
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" style="width: 70%; text-align: center">البيان</th>
                                                            <th scope="col" style="width: 30%; text-align: center">الإجمالي بالدينار</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView6" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td><span><%# Eval("ActionArName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("SumOfAmount") %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- END SAMPLE TABLE PORTLET-->






                                </div>

                            </div>


                            <div class="clearfix"></div>
                            <% }
                                else
                                {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد بيانات للعرض</strong>
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
