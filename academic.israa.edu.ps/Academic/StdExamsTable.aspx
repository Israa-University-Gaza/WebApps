<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StdExamsTable.aspx.cs" Inherits="Academic_StdExamsTable" %>

<%@ Register Src="~/Academic/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_1 a').css("background-color", "#575757");
            $('#Student a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
       <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
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
                    <uc1:StudentSideBar ActiveTab="StdExamsTable" runat="server" ID="StudentSideBar" />
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                                    <div id="tab7" class="" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4 class="font-ha">جدول الإمتحانات</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row" style="border-bottom: 1px solid #ddd; padding: 15px 0;">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">الفصل الدراسي</label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="ddlStdSemester1" runat="server" class="form-control" DataTextField="Semester" DataValueField="ID" AutoPostBack="true" DataSourceID="SqlDataSource9"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource9" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetStdSemesterWithoutTrans" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 15px;">
                                            <% if (Repeater3.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 15%">كود المساق</th>
                                                        <th style="width: 20%; text-align: center">المساق</th>
                                                        <th style="width: 15%; text-align: center">رقم الشعبة</th>
                                                        <th style="width: 15%; text-align: center">تاريخ الإمتحان</th>
                                                        <th style="width: 20%; text-align: center">نوقيت الإمتحان</th>
                                                        <th style="width: 15%; text-align: center">استدراكي</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource2">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <asp:Label ID="SectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <td><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ArNameCourse") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ExamDate", "{0:yyyy/MM/dd}") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("ExamTime") %></span></td>
                                                                <td style="text-align: center">
                                                                    <asp:CheckBox ID="cbIsRemedialCourse" runat="server" Checked='<%# Eval("IsRemedialCourse") %>' OnCheckedChanged="cbIsRemedialCourse_CheckedChanged" AutoPostBack="true" /></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdExamsTable" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlStdSemester1" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تسجيل مساقات لهذا الفصل الدراسي</strong>
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
            </div>
        </div>
    </div>
</asp:Content>

