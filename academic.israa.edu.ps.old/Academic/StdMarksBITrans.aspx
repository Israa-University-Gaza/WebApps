<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StdMarksBITrans.aspx.cs" Inherits="Academic_StdMarksBITrans" %>

<%@ Register Src="~/Academic/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
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
                    <uc1:StudentSideBar ActiveTab="StdMarksBITrans" runat="server" ID="StudentSideBar" />
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div id="tab20" class="tab-pane">


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h4 class="font-ha">كشف درجات الطالب ماقبل المعادلة</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater16.Items.Count > 0)
                                                {%>
                                            <asp:Repeater ID="Repeater16" runat="server" DataSourceID="SqlDataSource17">
                                                <ItemTemplate>
                                                    <div class="col-md-12 isra-clear">
                                                        <asp:Label ID="StdSemesterID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                        <div class="portlet">
                                                            <div class="portlet-title">
                                                                <div class="caption"><i class="fa fa-briefcase" style="width: 25px;"></i><span class="font-ha"><%# Eval("Semester") %></span></div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="width: 8%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                                <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>عدد الساعات</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>العلامة</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>التقدير</th>
                                                                                <th style="width: 12%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>ضمن الخطة</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <asp:Repeater ID="Repeater93" runat="server" DataSourceID="SqlDataSource50">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td><span><%# Eval("CourseCode") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseHours") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("MarkEstimation") %></span></td>
                                                                                        <td><%#Convert.ToBoolean(Eval("IsPlanCourse"))? "نعم" : Convert.ToBoolean(Eval("IsInternalTransformation"))? "معادلة" : "لا"  %> </td>
                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                            <asp:SqlDataSource ID="SqlDataSource50" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetStdSemesterMarksBItrans" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />

                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>
                                                                            <tr>
                                                                                <td colspan="8" style="text-align: left;">
                                                                                    <asp:Repeater ID="Repeater41" runat="server" DataSourceID="SqlDataSource41">
                                                                                        <ItemTemplate>
                                                                                            <span style="font-weight: bold;">المعدل التراكمي : </span>
                                                                                            <span><%# Eval("BITransCumulativeGPA").ToString() + " %" %></span>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                    <asp:Repeater ID="Repeater31" runat="server" DataSourceID="SqlDataSource31">
                                                                                        <ItemTemplate>
                                                                                            <span style="font-weight: bold;">المعدل الفصلي : </span>
                                                                                            <span><%# Eval("w").ToString() + " %" %></span>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                    <asp:SqlDataSource ID="SqlDataSource41" runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                        SelectCommand="GetStdGPAs" SelectCommandType="StoredProcedure">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>
                                                                                    <asp:SqlDataSource ID="SqlDataSource31" runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                        SelectCommand="CalculateSemesterGPABITrans" SelectCommandType="StoredProcedure">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>

                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource17" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStdSemesters" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تسجيل فصول دراسية</strong>
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

