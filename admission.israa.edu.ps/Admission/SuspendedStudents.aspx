﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="SuspendedStudents.aspx.cs" Inherits="Admission_SuspendStudentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
               <script type="text/javascript">
                   $('document').ready(function () {
                       $('.page-sidebar-menu li').removeClass("active").removeClass("open");
                       $('.page-sidebar-menu li ul li').css("background-color", "");
                       $('#menu2').addClass("active open");
                       $('#menu2_4 a').css("background-color", "#575757");
                       $('#menu2 a span.arrow').addClass("open");
                   });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
            </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلاب تم ايقاف صفحاتهم</div>
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
                                        <th style="text-align: center; width: 2%">رقم</th>
                                        <th style="text-align: center; width: 5%">رقم الطالب</th>
                                        <th style="text-align: center; width: 15%">إسم الطالب</th>
                                        <th style="text-align: center; width: 18%">شرط الايقاف</th>
                                        <th style="text-align: center; width: 13%">القسم</th>
                                        <th style="text-align: center; width: 15%"> اسم الموظف</th>
                                        <th style="text-align: center; width: 15%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                            <tr>
                                                <asp:Label ID="StudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                                <td style="text-align: center;"><%# Eval("No") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentNo") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentName") %></td>
                                                <td style="text-align: center;"><%# Eval("Condition") %><%# Eval("OtherCondition") %></td>
                                                <td style="text-align: center;"><%# Eval("Department") %></td>
                                                <td style="text-align: center;"><%# Eval("Employee") %></td>
                                                <td style="text-align: center;"><%# Eval("status") %></td>
                                                <td style="text-align: center;">
                                                    <asp:LinkButton ID="lbOpenStudent" runat="server" OnClick="lbOpenStudent_Click" class="btn default btn-xs black" >فتح الملف</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetSuspendedStudents" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter Name="DepartmentID" DefaultValue="11" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>
                            <div class="col-md-4" style="float: left!important; direction: ltr!important;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager col-md-12">
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
                                    <strong>لا يوجد طلاب تم حظرهم</strong>
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
</asp:Content>

