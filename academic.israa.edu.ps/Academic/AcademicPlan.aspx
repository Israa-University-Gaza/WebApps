<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="AcademicPlan.aspx.cs" Inherits="Academic_AcademicPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicPlan').addClass("active open");
            $('#AcademicPlan_1 a').css("background-color", "#575757");
            $('#AcademicPlan a span.arrow').addClass("open");
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
                <span>الخطط الدراسية</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="Plan.aspx">عرض الخطط الدراسية</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الخطط الدراسية</div>
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
                                <th style="width: 18%">رقم الخطة</th>
                                <th style="width: 30%; text-align: center">التخصص</th>
                                <th style="width: 18%; text-align: center">سنة الإدراج</th>
                                <th style="width: 12%"></th>
                                <th style="width: 22%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="PlanID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("PlanNum") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("DepartmentArName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Year") %></span></td>
                                        <td style="text-align: center">
                                            <% if (Permissions.Contains("AcademicPlanAccreditation"))
                                               { %>
                                            <asp:LinkButton ID="lbAccrediation" runat="server" class="btn default btn-xs black" OnClick="lbAccrediation_Click" Visible='<%# (Eval("AcademicAccreditation").ToString() != "True")%>'><i class="fa fa-edit"></i> إعتماد</asp:LinkButton>
                                            <% } %>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbViewCourses" runat="server" CssClass="btn default btn-xs green" OnClick="lbViewCourses_Click" Visible='<%# (IsPermissionsContains("PlanCourse")) %>'><i class="fa fa-edit" ></i> عرض المساقات</asp:LinkButton>
                                            <asp:LinkButton ID="lbPrintPlanReport" runat="server" CssClass="btn default btn-xs purple" OnClick="lbPDF_Click" Visible='<%# (IsPermissionsContains("PlanCourse")) %>'><i class="fa fa-edit" style="margin-left:8px"></i> pdf</asp:LinkButton>
                                            <asp:LinkButton ID="lbEdit" runat="server" CssClass="btn default btn-xs black" OnClick="lbEdit_Click" Visible='<%# (Permissions.Contains("AcademicPlanEdit")) %>'><i class="fa fa-edit" ></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" runat="server" CssClass="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" Visible='<%# (Permissions.Contains("AcademicPlanDelete")) %>'><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="	SELECT *, (Select ArName From Department where ID=DepartmentID)as DepartmentArName FROM [Plan] WHERE [DeanAccreditation]=1 AND [IsDelete]=0 ORDER BY [ID] DESC"></asp:SqlDataSource>
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
                            <strong>لم يتم إضافة خطط دراسية بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <% if (Permissions.Contains("AcademicPlanAdd") || Permissions.Contains("AcademicPlanEdit"))
           { %>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:Label ID="lblPlanID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل نوع الخطة دراسية</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label isra-text-aling-right">رقم الخطة</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtPlanNum" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال رقم الخطة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label isra-text-aling-right">البرنامج</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlProgram" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Program] WHERE (([IsActive] = 1) AND ([IsDelete] = 0))"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label isra-text-aling-right">الكلية</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [College] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (ProgramID=@ProgramID)) union select -1,N'إختر الكلية'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label isra-text-aling-right">القسم</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Department] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (CollegeID=@CollegeID)) union select -1,N'إختر التخصص'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label isra-text-aling-right">سنة الإدراج</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtYear" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال السنة"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</asp:Content>
