<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="AdmissionIssueEdit.aspx.cs" Inherits="Admission_AdmissionIssueEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu3').addClass("active open");
            $('#menu3_3 a').css("background-color", "#575757");
            $('#menu3 a span.arrow').addClass("open");

            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>القضايا الجامعية </span> <i class="fa fa-angle-down"></i>
            </button>

        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <asp:Label ID="lblSemesterID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblOfferCourseID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>تعديل بيانات القضايا 
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-body">

                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-hover" id="sample_editable_1 ">
                            <thead>
                                <tr>
                                    <th style="width: 5%" >رقم </th>
                                    <th style="width: 45%; text-align: center;">القضية </th>
                                      <th style="width:10%; text-align: center;">فعال</th>
                                    <th style="width: 15%; text-align: center;">من تاريخ</th>
                                    <th style="width: 15%; text-align: center;">الى تاريخ</th>
                                    <th style="width: 10%;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <td><%# Eval("RowNo") %></td>
                                            <td style="text-align: center"><%# Eval("IsuueName") %></td>
                                              <td style="text-align: center">
                                                <asp:CheckBox ID="cbIsActive" runat="server" Checked='<%# Eval("IsActive")%>'/></td>
                                            <td style="text-align: center">
                                                <asp:TextBox ID="txtActiveFrom" runat="server" CssClass="form-control date-picker text-center" Text='<%# Eval("ActiveFrom") %>'></asp:TextBox>
                                            </td> 
                                            <td  style="text-align: center">
                                            <asp:TextBox ID="txtActiveTo" runat="server" CssClass="form-control date-picker text-center" Text='<%# Eval("ActiveTo") %>'></asp:TextBox>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn blue" OnClick="btnSave_Click">حفظ</asp:LinkButton></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:IsraaStudentIssue %>" ProviderName="System.Data.SqlClient" SelectCommand="getissueInfo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-actions fluid">
                        <div class="row">
                            <div class="col-md-offset-6 col-md-6">
                                <asp:LinkButton ID="BtnSaveAll" runat="server" CssClass="btn blue" OnClick="BtnSaveAll_Click">حفظ الكل</asp:LinkButton></td>
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

