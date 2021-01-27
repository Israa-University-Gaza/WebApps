<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="DeanTransforamtionAccreditation.aspx.cs" Inherits="Academic_DeanTransforamtionAccreditation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#DeanTransforamtionAccreditation').addClass("active open");
            $('#DeanTransforamtionAccreditation_1 a').css("background-color", "#575757");
            $('#DeanTransforamtionAccreditation a span.arrow').addClass("open");
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
                <span>إعتماد المساقات المعادلة</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إعتماد المساقات المعادلة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <% if (ListView1.Items.Count > 0)
                           { %>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th style="text-align: right; width: 3%; padding: 8px;">#</th>
                                    <th style="text-align: center; width: 15%; padding: 8px 0px;">رقم الطالب</th>
                                    <th style="text-align: center; width: 20%; padding: 8px 0px;">اسم الطالب</th>
                                    <th style="text-align: center; width: 20%; padding: 8px 0px;">التخصص</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">نوع الطالب</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">ساعات الخطة</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">ساعات معادلة</th>
                                    <th style="text-align: center; width: 12%; padding: 8px 0px;"></th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="StudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td style="text-align: center;"><%# Eval("RowNo") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentNo") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentName") %></td>
                                            <td style="text-align: center;"><%# Eval("DepartmentName") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentType") %></td>
                                            <td style="text-align: center;"><%# Eval("PlanTotalHours") %></td>
                                            <td style="text-align: center;"><%# Eval("SumOfHours") %></td>
                                            <td style="text-align: center;">
                                                <asp:LinkButton ID="lbEditTransformation" runat="server" class="btn default btn-xs black" OnClick="lbEditTransformation_Click"><i title="تعديل" class="fa fa-edit"></i></a></asp:LinkButton>
                                                <asp:LinkButton ID="lbDeleteTransformation" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteTransformation_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i title="حذف" class="fa fa-trash-o"></i></a></asp:LinkButton>

                                                <asp:LinkButton ID="lbAccrediteTransformation" runat="server" class="btn default btn-xs green" OnClick="lbAccrediteTransformation_Click" Visible='<%# (Eval("DeanAccreditation").ToString() == "0") && (Eval("AcademicAccreditation").ToString() == "0") %>'><i title="اعتماد المعادلة" class="fa  fa-check-square-o"></i></a></asp:LinkButton>
                                                <asp:LinkButton ID="lbUnaccrediteTransformation" runat="server" class="btn default btn-xs red" OnClick="lbUnaccrediteTransformation_Click" Visible='<%# (Eval("HeadAccreditation").ToString() == "1") && (Eval("DeanAccreditation").ToString() == "0") && (Eval("AcademicAccreditation").ToString() == "0") %>'><i title="رفض المعادلة" class="fa  glyphicon glyphicon-plus"style="transform:rotate(45deg);margin-left:2px;margin-top:1px"></i></a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetDeanUnaccrediteTransformation" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
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
                                <strong>لا يوجد معادلة مساقات للإعتماد</strong>
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
