<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="AcceptStudentCondition.aspx.cs" Inherits="Admission_AcceptStudentCondition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
       <script type="text/javascript">
           $('document').ready(function () {
               $('.page-sidebar-menu li').removeClass("active").removeClass("open");
               $('.page-sidebar-menu li ul li').css("background-color", "");
               $('#ShowAdmissionApplication').addClass("active open");
               $('#ShowAdmissionApplication_2 a').css("background-color", "#575757");
               $('#ShowAdmissionApplication a span.arrow').addClass("open");
           });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="AcceptAdmissionApplication.aspx" class="font-ha">قبول الطلبة المجسرين</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
   <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>عرض طلبات الالتحاق للطلبة الجدد</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">نوع طلب الالتحاق </label>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddlProgram" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="SELECT ID, ArName FROM [Program] WHERE ([IsActive] = 1) AND ([IsDelete] = 0)"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                 <% if (ListView1.Items.Count > 0)
                                   { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>

                                            <th style="width: 10%;">رقم الطالب</th>
                                            <th style="width: 20%; text-align: center">اسم الطالب</th>
                                            <th style="width: 15%; text-align: center">معدل الثانوية</th>
                                            <th style="width: 10%; text-align: center">سنة الثانوية</th>
                                            <th style="width: 15%; text-align: center">الفرع الدراسي</th>
                                            <th style="width: 10%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                            <ItemTemplate>
                                                <asp:Label ID="StudentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="StudentTypeID" runat="server" Text='<%# Eval("StudentTypeID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td ><span><%# Eval("StudentNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("TawjehyGPA") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("TawjehyYear") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("TawjehyType") %></span></td>
                                                     <td style="text-align: center">
                                                        <asp:LinkButton ID="lbView" runat="server" class="btn default btn-xs black" OnClick="lbView_Click"><i class="fa fa-edit"></i> عرض</asp:LinkButton>
                                                    </td>
                                               
                                                     </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="ShowStudentApplicationGet" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="30" PagedControlID="ListView1" class="pager">
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
                                        <strong>لا يوجد طلبات إلتحاق</strong>
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
    </div>
</asp:Content>

