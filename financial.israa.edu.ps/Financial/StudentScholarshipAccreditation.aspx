<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="StudentScholarshipAccreditation.aspx.cs" Inherits="Financial_StudentScholarshipAccreditation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentScholarshipAccreditation').addClass("active open");
            $('#StudentScholarshipAccreditation_1 a').css("background-color", "#575757");
            $('#StudentScholarshipAccreditation a span.arrow').addClass("open");
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
                <span>إعتماد منح الطلاب</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إعتماد منح الطلاب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="control-label col-md-2">رقم الطالب : </label>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtStudentNo" runat="server" class="form-control"></asp:TextBox>
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
                            <asp:TextBox ID="txtArFamilyName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-md-2 control-label">الفصل الدراسي</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-offset-4 col-md-4"></label>
                        <div class="col-lg-offset-2 col-md-8">
                            <asp:Button ID="btnFilter" runat="server" Text="بحث" class="btn green" OnClick="btnFilter_Click" />
                            <asp:Button ID="btnAccrediteStudentScholarship" runat="server" Text="إعتماد المحدد" class="btn green" OnClick="btnAccrediteStudentScholarship_Click" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <hr />
                    <div class="table-responsive">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 4%;"></th>
                                    <th style="text-align: right; width: 3%; padding: 8px;">#</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">رقم الطالب</th>
                                    <th style="text-align: center; width: 17%; padding: 8px 0px;">اسم الطالب</th>
                                    <th style="text-align: center; width: 28%; padding: 8px 0px;">نوع المنحة</th>
                                    <th style="text-align: center; width: 6%; padding: 8px 0px;">قيمة المنحة</th>
                                    <th style="text-align: center; width: 20%; padding: 8px 0px;">ملاحظات</th>
                                    <th style="text-align: center; width: 12%; padding: 8px 0px;"></th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="StudentScholarshipID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td style="text-align: center;">
                                                <asp:CheckBox ID="cbStudentScholarship" runat="server" />
                                            </td>
                                            <td style="text-align: center;"><%# Eval("RowNo") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentNo") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentName") %></td>
                                            <td style="text-align: center;"><%# Eval("ActionArName") %></td>
                                            <td style="text-align: center;"><%# Eval("ActionValue") %></td>
                                            <td style="text-align: center;"><%# Eval("Note") %></td>
                                            <td style="text-align: center;">
                                                <asp:LinkButton ID="lbAccrediteStudentScholarship" runat="server" class="btn default btn-xs green" OnClick="lbAccrediteStudentScholarship_Click" Enabled='<%# (!Convert.ToBoolean(Eval("AcademicAccreditation").ToString())) %>'><i title="اعتماد المنحة" class="fa  fa-check-square-o"style="margin-left:10px;padding:5px;"></i><%# (!Convert.ToBoolean(Eval("AcademicAccreditation").ToString())) ? "إعتماد المنحة" : "تم إعتماد المنحة" %></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                    SelectCommand="GetSemesterStudentScholarship" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtStudentNo" DefaultValue="%" PropertyName="Text" Name="StudentNo" Type="String" />
                                        <asp:ControlParameter ControlID="txtArFirstName" DefaultValue="%" PropertyName="Text" Name="ArFirstName" Type="String" />
                                        <asp:ControlParameter ControlID="txtSecoundName" DefaultValue="%" PropertyName="Text" Name="ArSecoundName" Type="String" />
                                        <asp:ControlParameter ControlID="txtArFamilyName" DefaultValue="%" PropertyName="Text" Name="ArFamilyName" Type="String" />
                                       <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="100" PagedControlID="ListView1" class="pager">
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
                                <strong>لا يوجد منح للإعتماد</strong>
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
