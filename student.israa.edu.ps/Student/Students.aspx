<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="Affairs_Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu2').addClass("active open");
            $('#menu2 a').css("background-color", "#575757");
            $('#menu2 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">شؤون الطلاب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>بحث الطلاب</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <%-- <% if (Permissions.Contains("StudentsView"))
       { %>--%>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلاب الجامعة</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label class="control-label col-md-4">رقم الطالب : </label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtStudentNo" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-10">
                            <div class="form-group">
                                <label class="control-label col-md-2">إسم الطالب : </label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtArFirstName" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtSecoundName" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtArThirdName" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtArFamilyName" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <br />
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label class="control-label col-md-4"></label>
                                <div class="col-md-8">
                                    <asp:Button ID="btnFilter" runat="server" Text="بحث" class="btn green" OnClick="btnFilter_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; width: 10%">رقم الطالب</th>
                                        <th style="text-align: center; width: 15%">إسم الطالب</th>
                                        <th style="text-align: center; width: 15%">الكلية</th>
                                        <th style="text-align: center; width: 15%">القسم</th>
                                        <th style="text-align: center; width: 18%">المعدل التراكمي جامعة</th>
                                        <th style="text-align: center; width: 10%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                            <tr>
                                                <asp:Label ID="StudentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <td style="text-align: center;"><%# Eval("StudentNo") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentName") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentCollege") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentDepartment") %></td>
                                                <td style="text-align: center;"><%# Eval("GPAUniversity") %></td>
                                                <td style="text-align: center;">
                                                    <asp:LinkButton ID="lbOpenStudent" runat="server" class="btn default btn-xs black" OnClick="lbOpenStudent_Click"><i class="fa fa-edit"></i> دخول</asp:LinkButton></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                        SelectCommand="GetStudents" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtStudentNo" DefaultValue="%" PropertyName="Text" Name="StudentNo" Type="String" />
                                            <asp:ControlParameter ControlID="txtArFirstName" DefaultValue="%" PropertyName="Text" Name="ArFirstName" Type="String" />
                                            <asp:ControlParameter ControlID="txtSecoundName" DefaultValue="%" PropertyName="Text" Name="ArSecoundName" Type="String" />
                                            <asp:ControlParameter ControlID="txtArThirdName" DefaultValue="%" PropertyName="Text" Name="ArThirdName" Type="String" />
                                            <asp:ControlParameter ControlID="txtArFamilyName" DefaultValue="%" PropertyName="Text" Name="ArFamilyName" Type="String" />
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
                                { %>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد نتائج للبحث</strong>
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
    <%--  <% } %>--%>
</asp:Content>


