<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="Semester.aspx.cs" Inherits="Admission_Semester" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu3').addClass("active open");
            $('#menu3_1 a').css("background-color", "#575757");
            $('#menu3 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>الفصول الدراسية</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="Semester.aspx">عرض الفصول الدراسية</a></li>
                <li class="font-ha"><a href="SemesterAddEdit.aspx">إضافة فصل دراسي جديد</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("SemesterView"))
           { %>
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الفصول الدراسية</div>
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
                                <th style="width: 20%">الفصل الدراسي</th>
                                <th style="width: 9%">البرنامج</th>
                                <th style="width: 12%; text-align: center">بداية التسجيل</th>
                                <th style="width: 12%; text-align: center">نهاية التسجيل</th>
                                <th style="width: 12%; text-align: center">بداية الدراسـة</th>
                                <th style="width: 12%; text-align: center">بداية الإمتحانات</th>
                                <th style="width: 12%; text-align: center">نهاية الإمتحانات</th>
                                <th style="width: 5%; text-align: center">فعال</th>
                                <th style="width: 6%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="SemesterID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("ArName") %></span></td>
                                        <td><span><%# Eval("Program") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("RegisterBeginning", "{0:yyyy/MM/dd}") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("RegisterEnd", "{0:yyyy/MM/dd}") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("StudyBeginning", "{0:yyyy/MM/dd}") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("StartFinalExams", "{0:yyyy/MM/dd}") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("EndFinalExams", "{0:yyyy/MM/dd}") %></span></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' Enabled='<%# (Permissions.Contains("SemesterActivate"))? true:false %>' />
                                        </td>
                                        <td style="text-align: center">
                                            <% if (Permissions.Contains("SemesterEdit"))
                                               { %>
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <% } %>
                                            <% if (Permissions.Contains("SemesterDelete"))
                                               { %>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                            <% } %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="SELECT *,(Select ArName From [Program] Where ID=ProgramID)as Program FROM [Semester] where [IsDelete]=0 and code <> '111111111' order by [ID] DESC"></asp:SqlDataSource>
                        </tbody>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
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
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لم يتم إضافة فصول دراسية بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</asp:Content>

