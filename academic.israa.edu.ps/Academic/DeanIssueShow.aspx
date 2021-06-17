<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="DeanIssueShow.aspx.cs" Inherits="DeanIssueShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentIssue').addClass("active open");
            $('#StudentIssue_3 a').css("background-color", "#575757");
            $('#StudentIssue a span.arrow').addClass("open");
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
                <span>عرض قضايا الطلاب</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="UserID" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblStudentIssueID" runat="server" Text=""></asp:Label>
    <div class="col-md-12 ">
        <div id="Div1" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض القضايا
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group row">
                        <label class="control-label col-md-2">القضية : </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="Issues" CssClass="select2_category form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DataBind_Click" DataSourceID="SqlDataSource2" DataTextField="IsuueName" DataValueField="ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:UniversityStudentIssues %>' SelectCommand="SELECT  [ID] ,[IsuueName]FROM [Issue] where IsDelete=0 union select -1,N'الكل'"></asp:SqlDataSource>
                        </div>

                        <label class="control-label col-md-2">حالة القضية </label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="DataBind_Click">
                                <asp:ListItem Value="-1" Selected="True">الكل</asp:ListItem>
                                <asp:ListItem Value="0">طلب مقدم</asp:ListItem>
                                <asp:ListItem Value="10">مرجع من الشؤون الاكاديمية</asp:ListItem>
                                <asp:ListItem Value="11">مرجع من القبول والتسجيل</asp:ListItem>
                                <asp:ListItem Value="16">محولة من كلية</asp:ListItem>

                            </asp:DropDownList>
                        </div>
                        <label class="control-label col-md-2">رقم الطالب : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="StudentNo" runat="server" placeholder="" CssClass="form-control" AutoPostBack="true" OnTextChanged="DataBind_Click"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
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
                <div class="form-actions ">
                    <div class="col-md-8 col-lg-offset-2">
                        <asp:Button ID="Search" runat="server" Text="بحث" OnClick="DataBind_Click" CssClass="btn green" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض قضايا الطلاب
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>

                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 5%;">التاريخ </th>
                                <th style="width: 15%; text-align: center;">اسم الطالب</th>
                                <th style="width: 15%; text-align: center;">رقم الطالب</th>
                                <th style="width: 15%; text-align: center;">قسم الطالب</th>
                                <th style="width: 20%; text-align: center;">القضية</th>
                                <th style="width: 25%; text-align: center;">وصف القضية</th>
                                <th style="width: 25%; text-align: center;">حالة القضية  </th>
                                <th style="width: 5%; text-align: center;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="Place" runat="server" Text='<%# Eval("PlaceID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="MinOrderDepartment" runat="server" Text='<%# Eval("MinOrderDepartment") %>' Visible="false"></asp:Label>
                                        <td><%# Eval("RequestDate","{0:yyyy/MM/dd}") %></td>
                                        <td style="text-align: center"><%# Eval("StudentName") %></td>
                                        <td style="text-align: center"><%# Eval("StudentNo") %></td>
                                        <td style="text-align: center"><%# Eval("DepartmentName") %></td>
                                        <td style="text-align: center"><%# Eval("IssueName") %></td>
                                        <td style="text-align: center"><%# Eval("Describtion") %></td>
                                        <td style="text-align: center"><%# Eval("IssueStatus") %></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="BtnAcceptReject" runat="server" CssClass="btn green" Style="font-size: 11px; padding: 4px 10px;" OnClick="BtnAcceptReject_Click">الاجراء الإداري</asp:LinkButton></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbTransferIssueCollege" runat="server" CssClass="btn blue" Style="font-size: 11px; padding: 4px 10px;" OnClick="lbTransferIssueCollege_Click">تحويل الى كلية أخرى </asp:LinkButton></td>
                                        <%-- <td style="text-align: center">
                                            <asp:LinkButton ID="lbTransferIssue" runat="server" Visible='<%# Convert.ToBoolean(Eval("Valid")) %>' CssClass="btn blue" Style="font-size: 11px; padding: 4px 10px;" OnClick="lbTransferIssue_Click">تحويل القضية الى متطلبات الجامعة</asp:LinkButton></td>--%>
                                    </tr>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:UniversityStudentIssues %>' SelectCommand="IssuesShow" SelectCommandType="StoredProcedure">

                                <SelectParameters>
                                    <asp:ControlParameter ControlID="UserID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    <asp:Parameter DefaultValue="2" Name="Place" Type="Int32"></asp:Parameter>
                                    <asp:ControlParameter ControlID="ddlStatus" PropertyName="SelectedValue" DefaultValue="-1" Name="IssueStatusID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtArFirstName" PropertyName="Text" DefaultValue="%" Name="ArFirstName" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtSecoundName" PropertyName="Text" DefaultValue="%" Name="ArSecoundName" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtArThirdName" PropertyName="Text" DefaultValue="%" Name="ArThirdName" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtArFamilyName" PropertyName="Text" DefaultValue="%" Name="ArFamilyName" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="Issues" PropertyName="SelectedValue" DefaultValue="-1" Name="IssueID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="StudentNo" PropertyName="Text" DefaultValue="-1" Name="StudentNO" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                    <div class="col-md-12">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
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
                            <strong>لا يوجد قضايا للعرض  </strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <%  } %>

                    <div class="row" id="divTransfer" runat="server" visible="false">
                        <hr />
                        <div class="form-group row">
                            <label class="col-md-2 control-label isra-text-aling-right">الكلية :</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlIssueColleges" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlIssueColleges" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group row">
                            <asp:Label ID="Label3" runat="server" Text="سبب التحويل :" CssClass="col-md-2 control-label"></asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtReason" runat="server" placeholder="" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>

