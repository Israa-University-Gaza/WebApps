<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsPasswordNotupdated.aspx.cs" Inherits="Admission_StudentsPasswordNotupdated" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_5 a').css("background-color", "#575757");
            $('#Student a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("StudentsView"))
            { %>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلاب الجامعة اللذين لم يحدث كلمة المرور</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; width: 3%">رقم</th>
                                        <th style="text-align: center; width: 10%">رقم الطالب</th>
                                        <th style="text-align: center; width: 15%">إسم الطالب</th>
                                        <th style="text-align: center; width: 10%">حالة الطالب</th>
                                        <th style="text-align: center; width: 5%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                            <tr>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblStudentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <td style="text-align: center;"><%# Eval("No") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentNo") %></td>
                                                <td style="text-align: center;"><a href="Student.aspx?id=<%# Eval("ID") %>&tab=1" target="_blank"><%# Eval("StudentName") %></a></td>
                                                <td style="text-align: center;"><%# Eval("StudentStatus") %></td>
                                                <td style="text-align: center;">
                                                    <asp:LinkButton ID="LinkButtonTest" runat="server" class="btn success btn-xs green" OnClick="LinkButtonTest_Click">اعادة تعيين كلمة المرور</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetStudentsPasswordNotupdated" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>
                            <div style="float: left!important; direction: ltr!important;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="20" PagedControlID="ListView1" class="pager col-md-12">
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
        <% } %>
    </div>
</asp:Content>

