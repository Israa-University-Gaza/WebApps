<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="StudentFromMinistryFinanceAccountAdd.aspx.cs" Inherits="Financial_StudentFromMinistryFinanceAccountAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentFromMinistryFinanceAccount').addClass("active open");
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
        <li><a href="#" class="font-ha">تحويل مالي للطالب من استقطاع رواتب موظفي غزة</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>تحويل مالي للطالب من استقطاع رواتب موظفي غزة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-2 control-label">الفصل الدراسي</label>
                                <div class="col-md-5">
                                    <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>
                            </div>
                            <hr />
                            <div class="row table-responsive">
                                <% if (ListView2.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 5%; text-align: center">#</th>
                                            <th scope="col" style="width: 10%; text-align: center">رقم الطالب</th>
                                            <th scope="col" style="width: 15%; text-align: center">اسم الطالب</th>
                                            <th scope="col" style="width: 25%; text-align: center">الحساب</th>
                                            <th scope="col" style="width: 12%; text-align: center">المبلغ بالدينار</th>
                                            <th scope="col" style="width: 12%; text-align: center">المبلغ بالشيكل</th>
                                            <th scope="col" style="width: 10%; text-align: center">سعر العملة</th>
                                            <th scope="col" style="width: 10%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="lblStudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblValueJOD" runat="server" Text='<%# Eval("ValueJOD") %>' Visible="false"></asp:Label>
<asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                    <td style="text-align: center"><a href="Student.aspx?id=<%# Eval("StudentID") %>" target="_blank"><%# Eval("StudentName") %></a></td>
                                                    <td style="text-align: center"><span><%# Eval("AccountName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("ValueJOD") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("ValueNIS") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("CurrencyPrice") %></span></td>
                                                    <td style="text-align: center;">
                                                        <asp:LinkButton ID="btnAddAccountToStdTransFromMinisFinance" runat="server" class="btn btn-group-xs green" OnClick="btnAddAccountToStdTransFromMinisFinance_Click" Visible='<%# (!Convert.ToBoolean(Eval("IsTransition").ToString())) %>'><i title="إضافة على حساب الطالب" class="fa  fa-check-square-o"style="margin-left:10px;padding:5px;"></i>اضافة </asp:LinkButton>
                                                        <span runat="server" visible='<%# (Convert.ToBoolean(Eval("IsTransition").ToString())) %>' style="color: red">تمت عملية الاضافة على حساب الطالب </span>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetSemesterStudentsFromAccountAPI" SelectCommandType="StoredProcedure">
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
                                        <strong>لا يوجد طلاب مستقطعين في هذا الفصل الدراسي</strong>
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

