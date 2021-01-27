<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudentIssueShow.aspx.cs" Inherits="Student_StudentIssueShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu20').addClass("active open");
            $('#menu20_2 a').css("background-color", "#575757");
            $('#menu20 a span.arrow').addClass("open");
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
        <li><a href="StudentIssueShow.aspx" class="font-ha">عرض قضايا الطالب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblIssueID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض القضايا
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>

                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 10%;">التاريخ </th>
                                <th style="width: 15%;">القضية</th>
                                <th style="width: 30%;">وصف القضية  </th>
                                <th style="width: 10%; text-align: center;">حالة القضية  </th>
                                <th style="width: 20%; text-align: center;">رأي المسؤول </th>
                                <%--<th style="width: 20%; text-align: center;" runat="server"  Visible='<%# ( (Eval("IsRejectIssue").ToString() == "1")) ? true:false %>'> رأي المسؤول </th>--%>
                                <th style="width: 15%; text-align: center;"></th>
                            </tr>

                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">

                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>

                                        <td><%# Eval("RequestDate","{0:yyyy/MM/dd}") %></td>
                                        <td><%# Eval("IsuueName") %></td>
                                        <td><%# Eval("Describtion") %></td>
                                        <td style="text-align: center"><%# Eval("IsuueStatus") %></td>
                                           <%--<td style="text-align: center" runat="server" visible='<%# ( (Eval("IsRejectIssue").ToString() == "1")) ? true:false %>'><%# Eval("AccreditedAcademicOpinion") %>  </td>--%>
                                        <td style="text-align: center"><%# Eval("AccreditedAcademicOpinion") %>  </td>
                                        <td>
                                            <asp:LinkButton ID="BtnEdit" runat="server" class="btn default btn-xs black" OnClick="BtnEdit_Click" Visible='<%# ((!Convert.ToBoolean(Eval("IsuueStatus").ToString() == "طلب مقدم"))) ? false:true %>'> <i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                            <asp:LinkButton ID="BtnDelete" runat="server" class="btn default btn-xs purple" OnClick="BtnDelete_Click" Visible='<%# ((!Convert.ToBoolean(Eval("IsuueStatus").ToString() == "طلب مقدم"))) ? false:true %>' OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i>  حذف</a></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaStudentIssue %>' SelectCommand="GetStudentIssue" SelectCommandType="StoredProcedure">
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
                            <strong>لا يوجد قضايا للعرض  </strong>
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

