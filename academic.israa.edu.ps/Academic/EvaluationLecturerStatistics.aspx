<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="EvaluationLecturerStatistics.aspx.cs" Inherits="Academic_EvaluationLecturerStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#TeacherEvaluation').addClass("active open");
            $('#Eval1 a').css("background-color", "#575757");
            $('#TeacherEvaluation a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">احصائية تقييم الطلبة للمحاضر خلال الفصل </a>
            <i class="fa fa-angle-left"></i>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="row">
            <div class="col-md-12">
                <div class="portlet box blue">
                    <div class="portlet-title">
                        <div class="caption"><i class="fa fa-cogs"></i>احصائية تقييم الطلبة للمحاضر خلال الفصل  </div>
                        <div class="tools">
                            <a class="collapse" href="javascript:;"></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="form-group row">
                            <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                            <label class="col-md-1 control-label">المحاضر</label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="DropDownList1" runat="server" class="select2_category form-control"  DataTextField="Employee" DataValueField="EmployeeID" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                            <%--    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:israaEvaluation %>"
                                    SelectCommand="GetAllLecturerInSemester" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="12" Name="SemesterID" Type="Int32"></asp:Parameter>
                                        <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="-1" Name="EmployeeID" Type="Int32"></asp:ControlParameter>

                                    </SelectParameters>
                                </asp:SqlDataSource>--%>
                            </div>
                            <label class="col-md-2 control-label">نسبة التقييم </label>
                            <div class="col-md-3">
                                <asp:Label ID="FinalPercentage" runat="server" Text=""></asp:Label>
                            </div>

                        </div>
                        <% if (Repeater2.Items.Count > 0)
                           { %>
                        <table class="table table-striped table-bordered table-hover">

                            <thead>
                                <tr>

                                    <th style="width: 8%; text-align: right; font-size: 11px">كود المساق</th>
                                    <th style="width: 5%; text-align: center; font-size: 11px">اسم المساق </th>
                                    <th style="width: 5%; text-align: center; font-size: 11px">رقم الشعبة</th>
                                    <th style="width: 5%; text-align: center; font-size: 11px">عدد المسجلين</th>
                                    <th style="width: 5%; text-align: center; font-size: 11px">عدد المقيمين</th>
                                    <th style="width: 5%; text-align: center; font-size: 11px">النسبة</th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource5">
                                    <ItemTemplate>
                                        <tr>

                                            <td style="text-align: right"><span><%# Eval("CourseCode") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("NumOfRegisterd") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("EvaluatedStudentCount") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Percentage") %></span></td>

                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>'
                                    SelectCommand="GetEvaluationTeacherResult" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="EmployeeID" Type="Int32" />
                                        <asp:Parameter DefaultValue="12" Name="SemesterID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <% }
                           else
                           {%>
                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                            <div class="col-xs-11" style="text-align: center;">
                                <strong>لا يوجد تقييم لهذا المحاضر</strong>
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
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>احصائية تقييم الطلبة للمحاضر حسب المساق </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group row">

                                <label class="col-md-1 control-label">المساق</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="CourseName" DataValueField="CourseID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetTeacherOfferdCoursesEvaluation" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="EmployeeID" Type="Int32" />

                                            <asp:Parameter DefaultValue="12" Name="SemesterID" Type="Int32"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">الشعبة</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="SectionNum" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetTeacherOfferdCoursesSectionsEvaluation" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="EmployeeID" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="CourseID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div class="col-md-6">


                                    <%-- <asp:Button ID="btnView" runat="server" Text="طباعة" CssClass="btn green" OnClick="Button1_Click" />--%>
                                    <asp:Button ID="group11" runat="server" Text="تقييم المجموعة 1" CssClass="btn green" OnClick="group11_Click" />
                                    <asp:Button ID="group22" runat="server" Text="تقييم المجموعة 2" CssClass="btn green" OnClick="group22_Click" />
                                </div>
                            </div>

                        </div>
                    </div>



                    <div id="group1" runat="server" visible="false">
                        <div class="col-md-12">

                            <% if (Repeater1.Items.Count > 0)
                           { %>
                            <table class="table table-striped table-bordered table-hover">

                                <thead>
                                    <tr>
                                        <th style="width: 2%; text-align: right; font-size: 3px">#</th>
                                        <th style="width: 8%; text-align: right; font-size: 11px">السؤال</th>
                                        <th style="width: 5%; text-align: center; font-size: 11px">كبيرة جدا </th>
                                        <th style="width: 5%; text-align: center; font-size: 11px">كبيرة</th>
                                        <th style="width: 5%; text-align: center; font-size: 11px">متوسطة</th>
                                        <th style="width: 5%; text-align: center; font-size: 11px">قليلة</th>
                                        <th style="width: 5%; text-align: center; font-size: 11px">قليلة جدا</th>
                                        <th style="width: 5%; text-align: center; font-size: 11px">عدد المقيمين</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource3">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="text-align: right"><span><%# Eval("ID") %></span></td>
                                                <td style="text-align: right"><span><%# Eval("QuestionName") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("a5")  %> </span></td>
                                                <td style="text-align: center"><span><%# Eval("a4")  %> </span></td>
                                                <td style="text-align: center"><span><%# Eval("a3") %> </span></td>
                                                <td style="text-align: center"><span><%# Eval("a2") %> </td>
                                                <td style="text-align: center"><span><%# Eval("a1") %> </td>
                                                <td style="text-align: center"><span><%# Eval("EvaluatedStudentCount")  %> </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                        ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>'
                                        SelectCommand="EvaluationResultByQuestion" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" DefaultValue="-1" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>

                            <% }
                           else
                           {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center;">
                                    <strong>لا يوجد تقييم لهذا المساق</strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                            <% } %>
                        </div>
                    </div>




                    <div id="group2" runat="server" visible="false">
                        <div class="col-md-12">

                            <% if (Repeater3.Items.Count > 0)
               { %>

                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>

                                        <%--  <th></th>
                        <th></th>--%>
                                    </tr>
                                </thead>
                                <tbody>

                                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource6">
                                        <ItemTemplate>
                                            <tr>
                                                <td><span><%# Eval("ID") %></span>
                                                    <asp:Label ID="EvaluationQuestionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label></td>
                                                <td style="text-align: right; font-size: 16px; font-style: italic"><span><%# Eval("QuestionName") %></span></td>
                                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource11">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><span><%# Eval("OptionID") %></span></td>
                                                            <td><span><%# Eval("OptionText") %></span></td>
                                                            <td><span><%# Eval("AnswerCount") %></span></td>
                                                        </tr>
                                                    </ItemTemplate>

                                                </asp:Repeater>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource11" ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>' SelectCommand="EvaluationResultGroup2" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32"></asp:ControlParameter>
                                                        <asp:ControlParameter ControlID="EvaluationQuestionID" PropertyName="Text" Name="QuestionID" Type="Int32"></asp:ControlParameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <%--   <td></td>--%>
                                            </tr>
                                        </ItemTemplate>

                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                        ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>'
                                        SelectCommand="EvaluationResultByQuestion" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" DefaultValue="91" />
                                            <asp:Parameter DefaultValue="2" Name="EvaluationQuestionGroupID" Type="Int32"></asp:Parameter>

                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>


                            <% }
               else
               {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center;">
                                    <strong>لا يوجد تقييم لهذا المساق</strong>
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

