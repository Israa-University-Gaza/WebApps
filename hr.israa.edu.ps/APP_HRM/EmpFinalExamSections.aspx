<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="EmpFinalExamSections.aspx.cs" Inherits="EmployeeFinalExamSections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#EmpFinalExamSections').addClass("active open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">لجنة الإمتحانات النهائية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>جدول مراقبات الموظف</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>جدول مراقبات الموظف</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <div class="row">
                                <div style="font-size: 14px;" class="alert alert-info alert-dismissable">
                                    <div class="col-md-4">
                                    </div>
                                    <div class="col-md-4" style="text-align: center;">
                                    </div>
                                    <div style="clear: both"></div>
                                </div>
                            </div>
                            <br />
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col" style="width: 5%; text-align: center;">م</th>
                                        <th scope="col" style="width: 15%; text-align: center">التاريخ</th>
                                        <th scope="col" style="width: 10%; text-align: center">اليوم</th>
                                        <th scope="col" style="width: 15%; text-align: center">الوقت</th>
                                        <th scope="col" style="width: 15%; text-align: center">اسم المساق</th>
                                        <th scope="col" style="width: 10%; text-align: center">القاعة</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("RowNo") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("ExamDate") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("ExamDay") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("ExamTime") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("CourseName") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("Room") %></span></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetEmployeeFinalExamSections" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="text" Name="EmployeeID" Type="Int32" />
                                            <asp:Parameter DefaultValue="15" Name="SemesterID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <% }
                                else
                                {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد مراقبات لعرضها</strong>
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
</asp:Content>
