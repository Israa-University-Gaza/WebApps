<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentFinancialDedection.aspx.cs" Inherits="Admission_StudentFinancialDedection" %>

<%@ Register Src="~/Admission/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .dropdown-menu li > a {
            clear: both;
            color: #333;
            display: block;
            font-weight: normal;
            line-height: 18px;
            padding: 0;
            text-decoration: none;
            white-space: nowrap;
        }

        .dropdown.open .dropdown-toggle {
            background: #e0eaf0 !important;
            color: #121212;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ChangePassword.aspx" class="font-ha">الطالب
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


                    <uc1:StudentSideBar runat="server" ID="StudentSideBar" ActiveTab="litab_2" />

                    <div style="width: 81%; float: right;">
                        <div class="col-md-12" style="text-align: left; font-size: 16px;">
                            <asp:LinkButton ID="lbStudentFinancialProfileExcel" runat="server" OnClick="lbStudentFinancialProfileExcel_Click">كشف Excel</asp:LinkButton>
                        </div>
                        <div class="col-md-12">
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
                                                    <th style="text-align: center; width: 30%">البيان</th>
                                                    <th style="text-align: center; width: 30%">القيمة</th>
                                                    <th style="text-align: center; width: 20%">التاريخ</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: center;"><%# Eval("SemesterCode") %></td>
                                                            <td style="text-align: center;"><%# Eval("ActionArName") %></td>
                                                            <td style="text-align: center;"><%# Eval("Amount") %></td>

                                                            <td style="text-align: center;"><%# Eval("InsertDate","{0:yyyy/MM/dd HH:mm tt}") %></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>

                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                                    SelectCommand="GetSpecialStdDedection" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </tbody>
                                        </table>
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="200" PagedControlID="ListView1" class="pager">
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
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

