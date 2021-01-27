<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StdSemesterPlanEnglish.aspx.cs" Inherits="Academic_StdSemesterPlanEnglish" %>

<%@ Register Src="~/Academic/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
       <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>الخطة الدراسية</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <uc1:StudentSideBar ActiveTab="StdSemesterPlanEnglish" runat="server" ID="StudentSideBar" />
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div id="tab25" class="tab-pane active" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12" dir="ltr">
                                        <div class="row">

                                            <div class="col-md-9" style="text-align: end; font-size: 14px; padding: 9px;">
                                                <asp:LinkButton ID="lbStudyPlanPrint" runat="server" OnClick="lbStudyPlanPrint_Click"> pdf</asp:LinkButton>
                                            </div>
                                            <div class="col-md-3">
                                                <h4>Study Plan</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater18.Items.Count > 0)
                                                { %>
                                            <asp:Repeater ID="Repeater18" runat="server" DataSourceID="SqlDataSource23">
                                                <ItemTemplate>
                                                    <div class="col-md-12 isra-clear">
                                                        <asp:Label ID="PlanID" runat="server" Text='<%# Eval("PlanID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="CSemesterID" runat="server" Text='<%# Eval("CSemesterID") %>' Visible="false"></asp:Label>
                                                        <div class="portlet">
                                                            <div class="portlet-title">
                                                                <div class="caption" style="float: none"><i class="fa fa-briefcase" style="width: 25px; float: none"></i><span class="font-ha"><%# Eval("EnCSemester") %></span></div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="width: 15%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>Code</th>
                                                                                <th style="width: 35%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>Name</th>
                                                                                <th style="width: 30%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>Pre Course</th>
                                                                                <th style="width: 20%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>#Hours</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseEnName") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("EnNamePreRequestCourse") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                            <tr>
                                                                                <td colspan="3" style="text-align: center" class="font-ln">SumOfHours</td>
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
                                            <asp:SqlDataSource ID="SqlDataSource23" runat="server"
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
                                                    <strong>No student study plan has been identified</strong>
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

