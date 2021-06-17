<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="FinancialProfile.aspx.cs" Inherits="Student_FinancialProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu10').addClass("active");
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
        <li><a href="#" class="font-ha">الملف المالي
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الملف المالي</div>
                </div>
                <div class="portlet-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="row">
                        <ContentTemplate>
                            <div class="col-md-12">
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                    <ProgressTemplate>
                                        <div class="divWaiting">
                                            <div class="alert alert-warning loading">
                                                <span class="glyphicon glyphicon-refresh glyphicon-spin"></span>
                                                <strong>جاري جلب البيانات ...</strong>
                                            </div>
                                        </div>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                <% if (ListView1.Items.Count > 0)
                                   { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center; width: 15%">الفصل الدراسي</th>
                                            <th style="text-align: center; width: 10%">مدين</th>
                                            <th style="text-align: center; width: 10%">دائن</th>
                                            <th style="text-align: center; width: 15%">الرصيد</th>
                                            <th style="text-align: center; width: 30%">البيان</th>
                                            <th style="text-align: center; width: 20%">التاريخ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="text-align: center;"><%# Eval("SemesterCode") %></td>
                                                    <td style="text-align: center;"><%# Eval("Amount1") %></td>
                                                    <td style="text-align: center;"><%# Eval("Amount2") %></td>
                                                    <td style="text-align: center;"><%# Eval("Balance") %></td>
                                                    <td style="text-align: center;"><%# Eval("ActionArName") %></td>
                                                    <td style="text-align: center;"><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                            SelectCommand="GetSpecialStdTransaction" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
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
                                        <strong>لا يوجد بيانات مالية</strong>
                                        <div style="clear: both"></div>
                                    </div>
                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                    <div style="clear: both"></div>
                                </div>
                                <% } %>
                            </div>


                               <%-- Student Loans --%>
                            
                                    <div class="col-md-12">
                                        <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                            <ProgressTemplate>
                                                <div class="divWaiting">
                                                    <div class="alert alert-warning loading">
                                                        <span class="glyphicon glyphicon-refresh glyphicon-spin"></span>
                                                        <strong>جاري جلب البيانات ...</strong>
                                                    </div>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        <% if (ListView2.Items.Count > 0)
                                            { %>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center; width: 20%">الفصل الدراسي</th>
                                                    <th style="text-align: center; width: 20%">نوع القرض</th>
                                                    <th style="text-align: center; width: 10%">مبلغ القرض</th>
                                                    <th style="text-align: center; width: 15%">تاريخ الاستحقاق</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: center;"><%# Eval("SemesterName") %></td>
                                                            <td style="text-align: center;"><%# Eval("ActionArName") %></td>
                                                            <td style="text-align: center;"><%# Eval("LoanValue") %></td>
                                                            <td style="text-align: center;"><%# Eval("RepayDate","{0:yyyy/MM/dd HH:mm tt}") %></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                   
                                                </asp:ListView>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                                    SelectCommand="GetStudentLoans" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </tbody>
                                        </table>
                                       <%-- <asp:DataPager ID="DataPager2" runat="server" PageSize="200" PagedControlID="ListView2" class="pager">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                                <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                                <asp:NumericPagerField ButtonType="Link" />
                                                <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                                <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                            </Fields>
                                        </asp:DataPager>--%>

                                        <table class="table table-striped table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td style="text-align: center; width: 40%; font-weight: bold;"><span style="font-weight: bold;">إجمالي القروض : </span>
                                                        <span>
                                                            <asp:Label ID="lblTotalLoans" runat="server" Text=""></asp:Label></span></td>
                                                     <td style="text-align: center; width: 15%;"><span style="font-weight: bold;">مبلغ الرصيد السابق : </span>
                                                        <span>
                                                            <asp:Label ID="lblBalance" runat="server" Text=""></asp:Label></span>
                                                    </td>
                                                    <td style="text-align: center; width: 15%;"><span style="font-weight: bold;">صافي الرصيد : </span>
                                                        <span>
                                                            <asp:Label ID="lblFinalBalance" runat="server" Text=""></asp:Label></span>
                                                    </td>
                                                </tr>
                                             </tbody>
                                        </table>
                                        <div class="clearfix"></div>
                                        <% }
                                             %>
                                    </div>
                              
                        </div>

                        <%-- End Loan --%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

