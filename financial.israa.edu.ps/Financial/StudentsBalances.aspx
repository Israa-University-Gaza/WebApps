<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsBalances.aspx.cs" Inherits="Financial_StudentsBalances" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentsBalances').addClass("active open");
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
        <li><a href="#" class="font-ha"></a>أرصدة الطلاب</li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>أرصدة الطلاب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body" style="width: 65%; margin: 0 auto;">
                            <div class="row table-responsive">

                                <div style="font-size: 18px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-7" style="text-align: center">

                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <strong>رصيد الجامعة :</strong>
                                                <strong><%# Convert.ToDecimal(Eval("Balance")).ToString("#,##0.00") %></strong>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetUniversityBalance" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                        <div style="clear: both"></div>
                                    </div>
                                    <div class="col-xs-4" style="text-align: center">
                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource4">
                                            <ItemTemplate>
                                                <span>رصيد الطلاب :</span>
                                                <span><%# Convert.ToDecimal(Eval("Balance")).ToString("#,##0.00") %></span>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetUniversityBalance" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlStudentStatus" PropertyName="SelectedValue" DefaultValue="-1" Name="StudentStatusID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <div style="clear: both"></div>
                                    </div>
                                    <div style="clear: both"></div>
                                </div>

                                <hr />

                                <div class="form-group row">
                                    <label class="col-md-2 control-label">نوع الطالب</label>
                                    <div class="col-md-9">
                                        <asp:DropDownList ID="ddlStudentStatus" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="Select ID, ArName From StudentStatus Where IsDelete=0"></asp:SqlDataSource>
                                    </div>
                                </div>

                                <hr />

                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover" style="font-size: 15px">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 10%; text-align: center">#</th>
                                            <th scope="col" style="width: 20%; text-align: center">رقم الطالب</th>
                                            <th scope="col" style="width: 25%; text-align: center">اسم الطالب</th>
                                            <th scope="col" style="width: 20%; text-align: center">القسم</th>
                                            <th scope="col" style="width: 25%; text-align: center">الرصيد</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <tr <%# (Convert.ToDouble(Eval("Balance").ToString())<= 0)? "style='color:green !important'":"style='color:#D91E18 !important'" %>>
                                                    <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                    <td style="text-align: center">
                                                        <a href="Student.aspx?id=<%# Eval("ID") %>" target="_blank" style='<%# (Convert.ToDouble(Eval("Balance").ToString())<= 0)? "color:green !important": "color:#D91E18 !important" %>'><%# Eval("StudentName") %></a>
                                                    </td>
                                                    <td style="text-align: center"><span><%# Eval("Department") %></span></td>
                                                    <td style="text-align: center">
                                                        <a href="StudentFinancialProfile.aspx?id=<%# Eval("ID") %>" target="_blank" style='<%# (Convert.ToDouble(Eval("Balance").ToString())<= 0)? "color:green !important": "color:#D91E18 !important" %>'><%# Eval("Balance") %></a>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetStudentsBalances" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlStudentStatus" PropertyName="SelectedValue" Name="StudentStatusID" Type="Int32" DefaultValue="-1" />
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
                                        <strong>لا يوجد قروض في هذا الفصل الدراسي</strong>
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

