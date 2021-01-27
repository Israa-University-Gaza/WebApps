<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="ExceptionStudentCourse.aspx.cs" Inherits="Admission_ExceptionStudentCourse" %>

<%@ Register Src="~/Admission/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_2 a').css("background-color", "#575757");
            $('#Student a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">استثناءات الطالب
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStdStatusID" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">

                    <uc1:StudentSideBar runat="server" ID="StudentSideBar" ActiveTab="ExceptionStudentCourse" />

                    <div style="width: 81%; float: right;">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">
                                    <h4>استثناءات الطالب</h4>
                                </div>
                            </div>
                            <hr style="margin: 10px 0 15px 0" />

                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-striped table-hover" id="sample_editable_1 ">
                                <thead>
                                    <tr>
                                        <th style="width: 40%; text-align: center;">الفصل الدراسي</th>
                                        <th style="width: 20%; text-align: center;">المساق</th>
                                        <th style="width: 15%; text-align: center;">نوع الاستثناء </th>
                                        <th style="width: 20%; text-align: center;">نهاية الاستنثاء</th>
                                        <th style="width: 5%; text-align: center;">فعال</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                            <tr>
                                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>

                                                <td style="text-align: center"><%# Eval("Semester") %></td>
                                                <td style="text-align: center"><%# Eval("CourseName") %></td>
                                                <td style="text-align: center"><%# Eval("ExceptionsTypeName") %></td>
                                                <td style="text-align: center"><%# Eval("DeadlineDateTime") %></td>
                                                <td style="text-align: center">
                                                    <asp:CheckBox ID="cbIsActive" runat="server" Checked='<%# Eval("IsActive") %>' Enabled="false" /></td>
                                                <td>
                                                    <td>
                                                        <asp:LinkButton ID="lbDelete" runat="server" CssClass="btn default btn-xs purple" Style="font-size: 11px; padding: 4px 10px;" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbDelete_Click">حذف</asp:LinkButton></td>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetExceptionStudentCourse" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>
                            <div class="col-md-12">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                        <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                        <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                                        <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                            <div class="clearfix"></div>
                            <% } %>
                            <%  else
                                { %>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد استثناءات للعرض  </strong>
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
        </div>
    </div>

</asp:Content>


