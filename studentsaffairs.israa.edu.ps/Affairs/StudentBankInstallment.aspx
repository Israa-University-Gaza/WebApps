<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="StudentBankInstallment.aspx.cs" Inherits="Affairs_StudentBankInstallment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../assets/plugins/ckeditor/ckeditor.js"></script>
    <script src="../assets/scripts/form-validation.js"></script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentBankInstallment').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">شؤون الطلاب</a>
           
        </li>
        <li><a href="StudentsCourses.aspx" class="font-ha">طلبات التقسيط البنكية 
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblSemesterID" runat="server" Visible="false" Text="9"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض طلبات التقسيط البنكية 
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">

                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">اسم أو رقم الطالب</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtStudentName" runat="server" class="form-control" OnTextChanged="txtStudentName_TextChanged"></asp:TextBox>
                        </div>

                    </div>

                    <hr />
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 10%;">رقم</th>
                                <th style="width: 10%; text-align: center">رقم الطالب</th>
                                <th style="width: 30%; text-align: center">اسم الطالب</th>
                                <th style="width: 20%; text-align: center">كلية الطالب</th>
                                <th style="width: 20%; text-align: center">ساعات التسجيل </th>
                                <th style="width: 10%; text-align: center"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="lblStudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <td><span><%# Eval("RowNo") %></span></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbGoStudent" runat="server" OnClick="lbGoStudent_Click"><%# Eval("StudentNo") %></asp:LinkButton></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbGoStudent1" runat="server" OnClick="lbGoStudent_Click"><%# Eval("StudentName") %></asp:LinkButton></td>
                                        <td style="text-align: center"><span><%# Eval("StudentCollege") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("RegesterHour") %></span></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbStudentBankInstallmentPDF" runat="server" class="btn default btn-xs blue" OnClick="lbStudentBankInstallmentPDF_Click">طباعة الطلب</a></asp:LinkButton>
                                            <asp:LinkButton ID="lbStudentBankInstallmentPDF1" runat="server" class="btn default btn-xs red" OnClick="lbStudentBankInstallmentPDF1_Click"  Visible='<%# ((Eval("IsStudentBalance").ToString() == "1")) ? true:false %>'>طباعة التعهد</a></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetStudentBankInstallment" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtStudentName" PropertyName="Text" Name="StudentName" Type="String" DefaultValue="%" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                    <div class="col-md-12">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="30" PagedControlID="ListView1" class="pager">
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
                            <strong>لا يوجد طلبات للعرض  </strong>
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

