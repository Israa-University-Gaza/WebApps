<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsTodayAccreditation.aspx.cs" Inherits="Admission_StudentsTodayAccreditation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentsTodayAccreditation').addClass("active open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="AcceptAdmissionApplication.aspx" class="font-ha">طلاب تم اعتمادهم اليوم</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>طلاب تم اعتمادهم اليوم</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">

                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                   { %>
                                <div class="table-scrollable">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="width: 7%; text-align: center">رقم الطالب</th>
                                                <th scope="col" style="width: 7%; text-align: center">اسم الطالب</th>
                                                <th scope="col" style="width: 7%; text-align: center">الكلية</th>
                                                <th scope="col" style="width: 7%; text-align: center">نوع الطلب</th>
                                                <th scope="col" style="width: 7%; text-align: center">الثانوية</th>
                                                <th scope="col" style="width: 5%; text-align: center">معدل الثانوية</th>
                                                <th scope="col" style="width: 7%; text-align: center">اسم الكلية(للحاصلين علي الدبلوم</th>
                                                <th scope="col" style="width: 7%; text-align: center">التخصص</th>
                                                <th scope="col" style="width: 5%; text-align: center">معدل</th>
                                                <th scope="col" style="width: 5%; text-align: center">تقدير الشامل</th>
                                                <th scope="col" style="width: 5%; text-align: center">سنوات الخبرة</th>
                                                <th scope="col" style="width: 50%; text-align: center"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                                <ItemTemplate>
                                                    <asp:Label ID="StudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("DepartmentName") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("StudentType") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("TawjehyType") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("TawjehyGPA") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("OldUniversity") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("OldDepartment") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("OldUniversityGPA") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("ShamelRate") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("ExpertYears") %></span></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStudentsTodayAccreditation" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                        <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                        <asp:NumericPagerField ButtonType="Link" />
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
                                        <strong>لا يوجد طلاب تم إعتمادهم اليوم</strong>
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
