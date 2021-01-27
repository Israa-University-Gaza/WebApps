<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsTodayAccreditation.aspx.cs" Inherits="Academic_StudentsTodayAccreditation" %>

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
        <li><a href="AcceptAdmissionApplication.aspx" class="font-ha">طلاب تم اعتمادهم </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>طلاب تم اعتمادهم </div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                                 <div class="row">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">نوع طلب الالتحاق </label>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="ddlProgram" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="SELECT ID, ArName FROM [Program] WHERE ([IsActive] = 1) AND ([IsDelete] = 0)"></asp:SqlDataSource>
                                    </div>

                                    <label class="control-label col-md-2">الفصل الدراسي </label>
                                    <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCSemesterID" runat="server" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (Code<>'111111111')) order by ID DESC"></asp:SqlDataSource>
                                </div>
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
                                                SelectCommand="GetStudentsTodayAccreditation" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                                    <asp:ControlParameter ControlID="ddlCSemesterID" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="30" PagedControlID="ListView1" class="pager">
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
    </div>
</asp:Content>

