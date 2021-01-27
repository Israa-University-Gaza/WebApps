<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentCourseDetails.aspx.cs" Inherits="Admission_StudentCourseDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="background-color: ghostwhite">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label ID="Label1" CssClass="bold" Style="font-size: medium;" runat="server" Text="المساق:"></asp:Label>
                        <asp:Label ID="title" class="modal-title bold" runat="server" Style="color: #b94a48; font-size: medium;"></asp:Label>
                    </div>
                    <div class="modal-body modal-form" style="background-color: white;">
                        <div class="portlet-body form">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="tableshow" visible="False" runat="server">
                                            <table class="table table-condensed table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">رقم الطالب</th>
                                                        <th style="text-align: center; width: 20%; border-top: none!important; font-size: 12px;">اسم الطالب</th>
                                                        <th style="text-align: center; width: 15%; border-top: none!important; font-size: 12px;">رصيد الطالب</th>
                                                        <th style="text-align: center; width: 15%; border-top: none!important; font-size: 12px;">حالة المادة </th>
                                                        <th style="text-align: center; width: 5%; border-top: none!important; font-size: 12px;"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:ListView ID="ListView1" runat="server">
                                                        <ItemTemplate>
                                                            <asp:Label ID="StudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td style="text-align: center"><span><%# Eval("StudentNO") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("StudentBalance") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseStatus") %></span></td>
                                                                <td style="text-align: center">
                                                                    <a href="StudentSemesterRegistration.aspx?id=<%# Eval("StudentID") %>" target="_blank" class="btn green btn-xs">تسجيل</a>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                </tbody>
                                            </table>
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                                    <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                                    <asp:NumericPagerField ButtonType="Link" ButtonCount="1" />
                                                    <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                                    <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                                </Fields>
                                            </asp:DataPager>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div id="msg" visible="False" runat="server">
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center">
                                                    <strong>لا يوجد مساقات مطروحة يمكن عرضها</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

