<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="AcademicAttendanceWarning.aspx.cs" Inherits="Academic_AcademicAttendanceWarning" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicAttendanceWarning').addClass("active open");
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
                <span>إنذارات الحضور والغياب</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="AttendanceStudentStatistics.aspx">إحصائيات جدول الضبط</a></li>
                <li class="font-ha"><a href="AcademicAttendanceWarning.aspx">إنذارات الحضور والغياب</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إنذارات الحضور والغياب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">

                            <div class="form-group row">
                                <label class="col-md-1 control-label">الكلية</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCollege" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="Select ID, ArName From College Where ID<>1 and IsActive=1 and IsDelete=0 union Select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">القسم</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="Select ID, ArName From Department Where CollegeID=@CollegeID and IsActive=1 and IsDelete=0 union Select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-1 control-label">المساق</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="Select ID,(Select ArName From Course Where ID=OfferdCourse.CourseID) as ArName From OfferdCourse Where AcademicAccreditation=1 and IsDelete=0 union Select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">الشعبة</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="SectionNum" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="Select ID, CAST(SectionNum as nvarchar(4)) as SectionNum From Section Where [OfferdCourseID]=@OfferdCourseID and IsActive=1 and IsDelete=0 union Select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="OfferdCourseID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-offset-1 col-md-1">
                                    <asp:Button ID="btnView" runat="server" Text="عرض" CssClass="btn green" OnClick="btnView_Click" />
                                </div>
                            </div>
                            <hr />
                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                   { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 8%; text-align: center">رقم الطالب</th>
                                            <th style="width: 12%; text-align: center">اسم الطالب</th>
                                            <th style="width: 12%; text-align: center">الكلية</th>
                                            <th style="width: 12%; text-align: center">القسم</th>
                                            <th style="width: 16%; text-align: center">الإنذار</th>
                                            <th style="width: 20%; text-align: center">المساق</th>
                                            <th style="width: 10%; text-align: center">تاريخ الإنذار</th>
                                            <th style="width: 10%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <asp:Label ID="AttendanceWarningID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="WarningTypeID" runat="server" Text='<%# Eval("WarningTypeID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="StudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentCollege") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentDepartment") %></span></td>
                                                    <td style="text-align: center">
                                                        <asp:LinkButton ID="lblAttendanceWarning" runat="server" OnClick="lblAttendanceWarning_Click"><%# Eval("AttendanceWarningType") %></asp:LinkButton>
                                                    </td>
                                                    <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>
                                                    <td style="text-align: center;">
                                                        <asp:LinkButton ID="lbOpenStudent" runat="server" class="btn default btn-xs black" OnClick="lbOpenStudent_Click">فتح الملف</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>"
                                            SelectCommand="GetAttendanceWarnings" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="CourseID" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
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
                                   {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                        <strong>لا يوجد إنذارات حضور وغياب</strong>
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

