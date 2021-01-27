<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StdTranscript.aspx.cs" Inherits="Student_StdTranscript" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>كشف الدرجات</div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <% if (Repeater1.Items.Count > 0)
                            {%>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource8">
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
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="Repeater12" runat="server" DataSourceID="SqlDataSource2">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td><span><%# Eval("CourseCode") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CourseHours") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("MarkEstimation") %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetStdSemesterMarks" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <tr>
                                                            <td colspan="8" style="text-align: left;">
                                                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                                    <ItemTemplate>
                                                                        <span style="font-weight: bold;">المعدل التراكمي : </span>
                                                                        <span><%# Eval("CumulativeGPA").ToString() + " %" %></span>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                                                    <ItemTemplate>
                                                                        <span style="font-weight: bold;">المعدل الفصلي : </span>
                                                                        <span><%# Eval("w").ToString() + " %" %></span>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                    SelectCommand="GetStdGPAs" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="StdSemesterID" PropertyName="Text" Name="StdSemesterID" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                    SelectCommand="CalculateSemesterGPA" SelectCommandType="StoredProcedure">
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
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server"
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
</asp:Content>

