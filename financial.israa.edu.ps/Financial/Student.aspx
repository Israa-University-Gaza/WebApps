<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Financial_Student" %>

<%@ Register Src="~/Financial/UserControl/StudentMenu.ascx" TagPrefix="uc1" TagName="StudentMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/css/pages/profile-rtl.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Students').addClass("active open");
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
        <li><a href="ChangePassword.aspx" class="font-ha">الطالب
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeName" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div style="width: 19%; float: right;">
                        <uc1:StudentMenu runat="server" ID="StudentMenu" />
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div id="tab1" class="tab-pane active" runat="server" clientidmode="Static">
                                <asp:Repeater ID="Repeater10" runat="server" DataSourceID="SqlDataSource11">
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-md-8 profile-info">
                                                <h1><%# Eval("StudentName") %></h1>
                                            </div>
                                            <!--end col-md-8-->
                                            <div class="col-md-4">
                                                <div class="portlet sale-summary">
                                                    <div class="portlet-title">
                                                        <div class="caption font-ha">البيانات الأساسية</div>
                                                        <div class="tools">
                                                            <a class="reload" href="javascript:;"></a>
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <ul class="list-unstyled">
                                                            <li>
                                                                <span class="sale-info">الرقم الجامعي : </span>
                                                                <span class="sale-num"><%# Eval("StudentNo") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">الكلية : </span>
                                                                <span class="sale-num"><%# Eval("StudentCollege") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">القسم : </span>
                                                                <span class="sale-num"><%# Eval("StudentDepartment") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">الرصيد : </span>
                                                                <span class="sale-num"><%# Eval("Balance") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">نوع الطالب : </span>
                                                                <span class="sale-num"><%# Eval("StudentType") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">حالة الطالب : </span>
                                                                <span class="sale-num"><%# Eval("StudentStatus") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">المستوي الدراسي : </span>
                                                                <span class="sale-num"><%# Eval("Studentlevel") %></span>
                                                            </li>
<%--                                                            <li>
                                                                <span class="sale-info">المعدل التراكمي خريج : </span>
                                                                <span class="sale-num"><%# Eval("GPAGraduate") %></span>
                                                            </li>--%>
                                                            <li>
                                                                <span class="sale-info">المعدل التراكمي : </span>
                                                                <span class="sale-num"><%# Eval("GPAUniversity") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات الدراسة : </span>
                                                                <span class="sale-num"><%# Eval("StudiedHour") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات النجاح : </span>
                                                                <span class="sale-num"><%# Eval("SucceedHour") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات الخطة : </span>
                                                                <span class="sale-num"><%# Eval("StudentPlanHours") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات الإنجاز : </span>
                                                                <span class="sale-num"><%# Eval("PlanSucceedHour") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">سعر الساعة : </span>
                                                                <span class="sale-num"><%# Eval("HourCost") %> دينار</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-md-4-->
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStudentInfo" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div id="tab2" class="tab-pane" runat="server" clientidmode="Static">
                                <%--<div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>الخطة الدراسية</h4>
                                            </div>
                                            <div class="col-md-9" style="text-align: left; font-size: 14px; padding: 9px;">
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater1.Items.Count > 0)
                                                { %>
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <div class="col-md-12 isra-clear">
                                                        <asp:Label ID="PlanID" runat="server" Text='<%# Eval("PlanID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="CSemesterID" runat="server" Text='<%# Eval("CSemesterID") %>' Visible="false"></asp:Label>
                                                        <div class="portlet">
                                                            <div class="portlet-title">
                                                                <div class="caption"><i class="fa fa-briefcase" style="width: 25px;"></i><span class="font-ha"><%# Eval("CSemester") %></span></div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="width: 15%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                                <th style="width: 35%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                                <th style="width: 30%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>متطلب سابق</th>
                                                                                <th style="width: 20%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . الساعات</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("PreRequestCourse") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                            <tr>
                                                                                <td colspan="3" style="text-align: center" class="font-ln">مجموع الساعات</td>
                                                                                <td style="text-align: center"><span><%# Eval("SumOfHours") %></span></td>
                                                                            </tr>
                                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetCSemesterPlanCourses" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="PlanID" PropertyName="Text" Name="PlanID" Type="Int32" />
                                                                                    <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStdSemesterPlan" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تعين خطة دراسية للطالب</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
