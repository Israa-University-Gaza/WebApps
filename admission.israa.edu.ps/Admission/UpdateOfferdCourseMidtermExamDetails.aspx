<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateOfferdCourseMidtermExamDetails.aspx.cs" Inherits="Admission_UpdateOfferdCourseMidtermExamDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicOffer').addClass("active open");
            $('#AcademicOffer_2 a').css("background-color", "#575757");
            $('#AcademicOffer a span.arrow').addClass("open");
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
                <span>بيانات المساق</span> <i class="fa fa-angle-down"></i>
            </button>

        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <asp:Label ID="lblSemesterID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblOfferCourseID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>عرض بيانات المساق
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-body">

                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-hover" id="sample_editable_1 ">
                            <thead>
                                <tr>
                                    <th style="width: 15%; text-align: center;">القسم </th>
                                    <th style="width: 15%; text-align: center;">المساق</th>
                                    <th style="width: 12%; text-align: center;">امتحان ورقي</th>
                                    <th style="width: 13%; text-align: center;">امتحان الكتروني  </th>
                                    <th style="width: 20%; text-align: center;">التاريخ</th>
                                    <th colspan="2" style="width: 20%; text-align: center;">وقت الامتحان</th>
                                    <th style="width: 15%;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <td style="text-align: center"><%# Eval("DepartmentName") %></td>
                                            <td style="text-align: center"><%# Eval("CourseName") %></td>
                                            <td style="text-align: center">
                                                <asp:CheckBox ID="cbMidtermExam" runat="server" Checked='<%# Eval("IsMidtermExam") %>' /></td>
                                            <td style="text-align: center">
                                                <asp:CheckBox ID="cbMidtermEExam" runat="server" Checked='<%# Eval("IsMidtermEExam") %>' /></td>
                                            <td style="text-align: center">
                                                <asp:TextBox ID="txtMidtermExamDate" runat="server" CssClass="form-control date-picker" Text='<%# Eval("MidtermExamDate") %>'></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtMidtermExamFrom" runat="server" CssClass="form-control text-center" Text='<%# Eval("MidtermExamTimeFrom1") %>'></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="txtMidtermExamTo" runat="server" CssClass="form-control text-center" Text='<%# Eval("MidtermExamTimeTo1") %>'></asp:TextBox>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn blue" OnClick="btnSave_Click">حفظ</asp:LinkButton></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:isra %>" ProviderName="System.Data.SqlClient" SelectCommand="GetOfferdCourseMidtermExamDetails" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" DefaultValue="6" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-actions fluid">
                        <div class="row">
                            <div class="col-md-offset-6 col-md-6">
                                 <asp:LinkButton ID="BtnSaveAll" runat="server" CssClass="btn blue" OnClick="BtnSaveAll_Click">حفظ</asp:LinkButton></td>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                    <div class="col-md-12">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="50" PagedControlID="ListView1" class="pager">
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
                            <strong></strong>
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

