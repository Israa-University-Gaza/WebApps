<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StudentLoanAccreditation.aspx.cs" Inherits="Academic_StudentLoanAccreditation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentScholarshipAccreditation').addClass("active open");
            $('#StudentScholarshipAccreditation_2 a').css("background-color", "#575757");
            $('#StudentScholarshipAccreditation a span.arrow').addClass("open");
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
                <span>إعتماد قروض الطلاب</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إعتماد قروض الطلاب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">

                    <div class=" form groub row">
                        <label class="col-md-2 control-label">الفصل الدراسي : </label>
                        <div class="col-md-5">
                            <asp:DropDownList ID="ddlSemesterID" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                            SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                    <br />
                    <div class="table-responsive">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th style="text-align: right; width: 3%; padding: 8px;">#</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">رقم الطالب</th>
                                    <th style="text-align: center; width: 17%; padding: 8px 0px;">اسم الطالب</th>
                                    <th style="text-align: center; width: 28%; padding: 8px 0px;">قيمة القرض</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">تاريخ الطلب</th>
                                    <th style="text-align: center; width: 20%; padding: 8px 0px;">تاريخ السداد</th>
                                    <th style="text-align: center; width: 12%; padding: 8px 0px;"></th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="StudentLoanID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td style="text-align: center;"><%# Eval("RowNo") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentNo") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentName") %></td>
                                            <td style="text-align: center;"><%# Eval("LoanValue") %></td>
                                            <td style="text-align: center;"><%# Eval("RequestDate") %></td>
                                            <td style="text-align: center;"><%# Eval("RepayDate") %></td>
                                            <td style="text-align: center;">
                                                <asp:LinkButton ID="lbAccrediteStudentLoan" runat="server" class="btn default btn-xs green" OnClick="lbAccrediteStudentLoan_Click" Enabled='<%# (!Convert.ToBoolean(Eval("AcademicAccreditation").ToString())) %>'><i title="اعتماد القرض" class="fa  fa-check-square-o"style="margin-left:10px;padding:5px;"></i><%# (!Convert.ToBoolean(Eval("AcademicAccreditation").ToString())) ? "إعتماد القرض" : "تم إعتماد القرض" %></asp:LinkButton>
                                            </td>   
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                    SelectCommand="GetSemesterStudentLoan" SelectCommandType="StoredProcedure">
                                    <SelectParameters>

                                        <asp:ControlParameter ControlID="ddlSemesterID" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                    </SelectParameters>



                                </asp:SqlDataSource>
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
                                <strong>لا يوجد قروض للإعتماد</strong>
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
</asp:Content>
