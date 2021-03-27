<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="CourseView.aspx.cs" Inherits="Academic_CourseView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu20').addClass("active open");
            $('#menu20_2 a').css("background-color", "#575757");
            $('#menu20 a span.arrow').addClass("open");
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
                <span>المساقات</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="Program.aspx">عرض البرامج</a></li>
                <li class="font-ha"><a href="College.aspx">عرض الكليات</a></li>
                <li class="font-ha"><a href="Department.aspx">عرض الأقسام</a></li>
                <li class="font-ha"><a href="CourseView.aspx">عرض المساقات</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">

        <div class="col-md-12">
            <div class="portlet box blue">
                <asp:Label ID="EmpID" runat="server" Text="" Visible="false"></asp:Label>

                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>عرض المساقات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">

                            <div class="form-group">
                                <label class="col-md-1 control-label">البرنامج</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeePrograms" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">الكلية</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCollege" runat="server" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeCollages" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">القسم</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeDepartments" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="EmpID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">الكود</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtCourseCode" runat="server" CssClass="form-control" placeholder="الرجاء ادخال كود المساق"></asp:TextBox>
                                </div>
                                <label class="col-md-1 control-label">الإسم</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtArName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم المساق بالعربي"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="btnView" runat="server" Text="عرض" class="btn green" OnClick="btnView_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>المساقات</div>
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
                                <th style="width: 10%">الكود</th>
                                <th style="width: 20%; text-align: center">المساق</th>
                                <th style="width: 20%; text-align: center">القسم</th>
                                <th style="width: 10%; text-align: center">المستوى</th>
                                <th style="width: 10%; text-align: center">الفصل</th>
                                <th style="width: 9%; text-align: center">عدد الساعات</th>
                                <th style="width: 8%; text-align: center">يوجد مناقشة</th>
                                <th style="width: 8%; text-align: center">يوجد عملي</th>
                                <th style="width: 5%; text-align: center">منحة</th>
                                <th style="width: 5%; text-align: center">فعال</th>
                                <th style="width: 8%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="CourseID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                   <tr <%# Eval("StudyLevel").ToString()=="" || Eval("SemesterName").ToString()==""? "style='color:red;'" : Eval("CourseCode1").ToString()!="" ? "style='color:green;'" : "" %>>
                                        <td><span><%# Eval("CourseCode") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ArName") %></span></td>
                                        <%--<td style="text-align: center"><span><%# Eval("IsOffered") %></span></td>--%>
                                        <td style="text-align: center"><span><%# Eval("Department") %></span></td>
                                       <td style="text-align: center"><span><%# Eval("StudyLevel") %></span></td>
                                       <td style="text-align: center"><span><%# Eval("SemesterName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("NumOfHours") %></span></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("IsHaveDiscussion") %>' Enabled="false" /></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("IsHaveLab") %>' Enabled="false" /></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Eval("IsScholarship") %>' Enabled="false" /></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" Checked='<%# Eval("IsActive") %>' Enabled='<%# (Permissions.Contains("AcademicCourseActivate"))? true:false %>' /></td>
                                        <td style="text-align: center">

                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" Visible='<%# (Eval("IsOffered").ToString() != "True")%>' OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbCode" runat="server" class="btn default btn-xs black"  Visible='<%# (Eval("CCourseTypeID").ToString() != "22")%>' OnClick="lbCode_Click"><i class="fa fa-code"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" Visible='<%# (Eval("IsOffered").ToString() != "True")%>' OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbDelete_Click"><i class="fa fa-trash-o"></i></a></asp:LinkButton>

                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetFilteredCourses" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="Program" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="College" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="Department" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtCourseCode" PropertyName="Text" Name="CourseCode" Type="String" DefaultValue="%"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtArName" PropertyName="Text" Name="CourseName" Type="String" DefaultValue="%"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="50" PagedControlID="ListView1" class="pager">
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
                            <strong>لم يتم إضافة مساقات بعد</strong>
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
</asp:Content>
