<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="LectureIrregular.aspx.cs" Inherits="Attendance_LectureIrregular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Academic').addClass("active open");
            $('#Academic_2 a').css("background-color", "#575757");
            $('#Academic a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha"> </a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>طلبات المحاضرات التعويضية</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>بحث حسب</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">


                        <div class="form-group">
                            <label class="col-md-2 control-label">الفصل الدراسي  </label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlSemesterID" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSemesterID_SelectedIndexChanged" DataSourceID="SqlDataSource7" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                            </div>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsDelete] = 0) And Code<>'111111111' and IsActive=1)"></asp:SqlDataSource>
                          
                            <label class="col-md-2 control-label isra-text-aling-right">المحاضر</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlInstructor" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="DisplayName" DataValueField="Emp_ID" AutoPostBack="true" OnSelectedIndexChanged="ddlInstructor_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetAllEmployeesName" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="-1" Name="EmpCategoryID" Type="Int32"></asp:Parameter>
                                        <asp:Parameter DefaultValue="1041" Name="EmpStatusID" Type="Int32"></asp:Parameter>
                                        <asp:Parameter DefaultValue="-1" Name="EmployeeCatID" Type="Int32"></asp:Parameter>
                                        <asp:Parameter DefaultValue="-1" Name="ContractTypeID" Type="Int32"></asp:Parameter>
                                        <asp:Parameter DefaultValue="-1" Name="SubContractTypeID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn green" OnClick="btnSearch_Click" />

                        </div>
                    </div>
                </div>
            </div>
     
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>طلبات  المحاضرات التعويضية</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <% if (ListView1.Items.Count > 0)
                    { %>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="text-align: center; width: 15%">المحاضر </th>
                            <th style="text-align: center; width: 15%">المساق</th>
                            <th style="text-align: center; width: 10%">الشعبة</th>
                            <th style="text-align: center; width: 15%">التاريخ</th>
                            <th style="text-align: center; width: 20%">الموعد</th>
                            <th style="text-align: center; width: 20%">اعتمادات</th>
                            <th style="text-align: center; width: 10%"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <td style="text-align: center"><span><%# Eval("EmployeeName") %></span></td>
                                <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                <td style="text-align: center"><span><%# Eval("LectureDate1") %></span></td>
                                <td style="text-align: center"><span><%# Eval("LectureTime") %></span></td>
                                 <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# (Convert.ToBoolean(Eval("DeanAccreditation").ToString())) ? "(عميد)": "" %></span> <span><%# (Convert.ToBoolean(Eval("AcademicAccreditation").ToString())) ? "(نائب أكاديمي)": "" %></span> <span><%# (Convert.ToBoolean(Eval("HRAccreditation").ToString())) ? "(الشئون الادارية)": "" %></span></td>
                                
                                <td style="text-align: center">
                              
                                    <asp:LinkButton ID="lbHRAccredit" runat="server" class="btn default btn-xs green" OnClick="lbHRAccredit_Click">  اعتماد الشئون الادارية  </asp:LinkButton>
<%--                         Visible='<%# Convert.ToBoolean(Eval("AcademicAccreditation")) && !Convert.ToBoolean(Eval("HRAccreditation")) %>'--%>
                                </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetLectureIrregular" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlSemesterID" PropertyName="SelectedValue" DefaultValue="-1" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlInstructor" PropertyName="SelectedValue" DefaultValue="-1" Name="EmployeeID" Type="Int32"></asp:ControlParameter>

                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
                <div class="clearfix"></div>
                <div class="form-group">
                </div>
                <div class="clearfix"></div>
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
                    <div class="col-xs-11" style="text-align: center;">
                        <strong>لا يوجد طلبات محاضرات تعويضية بعد</strong>
                        <div style="clear: both"></div>
                    </div>
                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                    <div style="clear: both"></div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</asp:Content>

