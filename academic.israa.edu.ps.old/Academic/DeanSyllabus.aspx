<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="DeanSyllabus.aspx.cs" Inherits="Academic_DeanSyllabus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Syllabus').addClass("active open");
            $('#Syllabus_2 a').css("background-color", "#575757");
            $('#Syllabus a span.arrow').addClass("open");
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
                <span>طلبات توصيف المساق</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lbEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lbSyllabusID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lbPlaceID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <asp:Label ID="lblPlanID" runat="server" Text="" Visible="false"></asp:Label>
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
                            <label class="col-md-2 control-label isra-text-aling-right">البرنامج</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" CssClass="select2_category form-control"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeePrograms" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <label class="col-md-2 control-label isra-text-aling-right">الكلية</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlCollege" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged" CssClass="select2_category form-control"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeCollages" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label isra-text-aling-right">القسم</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeDepartments" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                            <label class="col-md-2 control-label isra-text-aling-right">المساق</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Course] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (DepartmentID=@DepartmentID or @DepartmentID=-1)) union select -1,N'الكل'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label isra-text-aling-right">المحاضر</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlInstructor" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="DisplayName" DataValueField="Emp_ID"></asp:DropDownList>
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
                    <div class="form-actions fluid">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn green" OnClick="btnSearch_Click" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">

        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>طلبات توصيف المساق</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">

<%--                <div class="row">
                    <div class="col-md-offset-10 col-md-2">
                        <asp:Button ID="lbSyllabusAllWord" runat="server" Text="تجهيز ملفات Word" CssClass="btn blue" OnClick="lbSyllabusAllWord_Click" />
                        <asp:Button ID="lbSyllabusPrintAllWord" runat="server" Text="تنزيل ملفات Word" CssClass="btn green" OnClick="lbSyllabusPrintAllWord_Click" />
                    </div>
                </div>--%>
                <% if (ListView1.Items.Count > 0)
                    { %>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="text-align: center; width: 15%">رقم المساق</th>
                            <th style="text-align: center; width: 10%">المساق</th>
                            <th style="text-align: center; width: 15%">عدد الساعات</th>
                            <th style="text-align: center; width: 20%">القسم</th>
                            <th style="text-align: center; width: 20%">المحاضر</th>
                            <th style="text-align: center; width: 25%">حالة الطلب</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <asp:Label ID="SyllabusID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="CourseName" runat="server" Text='<%# Eval("CourseName") %>' Visible="false"></asp:Label>
                                <asp:Label ID="ValidatePlace" runat="server" Text='<%# Eval("ValidatePlace") %>' Visible="false"></asp:Label>
                                <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                <td style="text-align: center"><span><%# Eval("NumOfHours") %></span></td>
                                <td style="text-align: center"><span><%# Eval("DepartmentName") %></span></td>
                                <td style="text-align: center"><span><%# Eval("InstructorName") %></span></td>
                                <td style="text-align: center"><span><%# Eval("SyllabusStatusName") %></span></td>

                                <td>
                                    <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click" Visible='<%# ( (Eval("CanDepartmentEdit").ToString() == "1")) ? true:false %>'><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                </td>
                                <td>
                                    <asp:LinkButton ID="lbPrint" runat="server" class="btn default btn-xs blue" OnClick="lbPrint_Click"></i> طباعة الوصف</asp:LinkButton>
                                    <asp:LinkButton ID="lbWord" runat="server" class="btn default btn-xs green" OnClick="lbWord_Click"></i> Word</asp:LinkButton>
                                </td>
                                <td>
                                    <div class="actions">
                                        <div class="btn-group">
                                            <a class="btn default btn-xs green" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" runat="server" visible='<%# ( (Eval("ValidatePlace").ToString() == "1")) ? true:false %>'>اعتماد الوصف
                                            <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <asp:LinkButton ID="lbAccept" runat="server" class="btn default btn-xs black" OnClick="lbAccept_Click" Visible='<%# ( (Eval("ValidatePlace").ToString() == "1")) ? true:false %>'>  قبول توصيف المساق</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbReject" runat="server" class="btn default btn-xs black" OnClick="lbReject_Click" Visible='<%# ( (Eval("ValidatePlace").ToString() == "1")) ? true:false %>'>  رفض توصيف المساق</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbReturn" runat="server" class="btn default btn-xs black" OnClick="lbReturn_Click" Visible='<%# ( (Eval("ValidatePlace").ToString() == "1")) ? true:false %>'>  ارجاع توصيف المساق</asp:LinkButton>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </td>

                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetSyllabus" SelectCommandType="StoredProcedure">


                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" DefaultValue="-1" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" DefaultValue="-1" Name="CourseID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="lbSyllabusID" PropertyName="Text" DefaultValue="-1" Name="ID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlInstructor" PropertyName="SelectedValue" DefaultValue="-1" Name="InstructorID" Type="Int32"></asp:ControlParameter>

                                <asp:ControlParameter ControlID="lbPlaceID" PropertyName="Text" DefaultValue="3" Name="PlaceID" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
                <div class="clearfix"></div>
                <div class="form-group">
                </div>
                <div class="clearfix"></div>
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
                    <div class="col-xs-11" style="text-align: center;">
                        <strong>لا يوجد طلبات توصيف مساق بعد</strong>
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

