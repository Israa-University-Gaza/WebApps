<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="SemesterScholarshipStatistics.aspx.cs" Inherits="Financial_SemesterScholarshipStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#SemesterScholarshipStatistics').addClass("active open");
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
        <li><a href="#" class="font-ha">إحصائيات المنح</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إحصائيات المنح</div>
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
                            <hr />
                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                   { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 60%; text-align: center">المنحة</th>
                                            <th scope="col" style="width: 20%; text-align: center">الإجمالي بالدينار</th>
                                            <th scope="col" style="width: 20%; text-align: center">عدد الطلاب</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="SemesterStudentsScholarship.aspx?SemesterID=<%= ddlSemester.SelectedValue %>&ActionID=<%# Eval("ActionID") %>"><%# Eval("ActionArName") %></a></td>
                                                    <td style="text-align: center"><span><%# Eval("SumOfAmount") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("CountOfStudent") %></span></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetSemesterScholarshipStatistics" SelectCommandType="StoredProcedure">
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
                                        <strong>لا يوجد منح في هذا الفصل الدراسي</strong>
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
    </div>
</asp:Content>

