﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="FinalExamDetails.aspx.cs" Inherits="Academic_FinalExamDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#FinalExamDetails2').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <asp:Label ID="lblOfferCourseID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>عرض بيانات المساق
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-body">
                        <div class="row">


                            <div class="col-md-4">
                                <span>الفصل :</span>
                                <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlExamDate_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>

                            <div class="col-md-2">
                                <span>الفرع :</span>
                                <asp:DropDownList ID="ddlBranch" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource9" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlExamTime_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="ddlBranches" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>

                            <div class="col-md-2">
                                <span>البرنامج :</span>
                                <asp:DropDownList ID="ddlProgram" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="ddlPrograms" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-4">
                                <span>القسم :</span>
                                <asp:DropDownList ID="ddlDepartment" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="ddlDepartments3" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>

                                </asp:SqlDataSource>
                            </div>

                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-2">
                                <span>المستوى :</span>
                                <asp:DropDownList ID="ddlStudyLevel" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="ddlStudyLevels2" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <span>نوع المساق :</span>
                                <asp:DropDownList ID="ddlCourseType" runat="server" class="form-control" AutoPostBack="true">
                                    <asp:ListItem Text="الكل" Value="-1" Selected="true"></asp:ListItem>
                                    <asp:ListItem Text="متطلب جامعة" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="متطلب تخصص" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-4">
                                <span>تصنيف المساق المطروح :</span>
                                <asp:DropDownList ID="ddlOfferdCourseType" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlOfferdCourseType_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlOfferdCourseTypes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <span>التاريخ :</span>
                                <asp:DropDownList ID="ddlExamDate" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="FinalExamDate" DataValueField="FinalExamDate" AutoPostBack="true" OnSelectedIndexChanged="ddlExamDate_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetFinalExamDates" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>

                            <div class="col-md-2">
                                <span>الوقت :</span>
                                <asp:DropDownList ID="ddlExamTime" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource7" DataTextField="FinalExamTime" DataValueField="FinalExamTimeFrom" AutoPostBack="true" OnSelectedIndexChanged="ddlExamTime_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetDateFinalExamTimes" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlSemester" PropertyName="Text" Name="SemesterID" Type="String" />
                                        <asp:ControlParameter ControlID="ddlExamDate" PropertyName="SelectedValue" Name="ExamDate" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>


                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-2">
                                <asp:Button ID="btnPdf" runat="server" Text="PDF" CssClass="btn blue" OnClick="btnPdf_Click" />
                                <asp:Button ID="lbExcel" runat="server" Text="Excel" CssClass="btn green" OnClick="lbExcel_Click" />
                            </div>
                        </div>
                        <br />

                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-hover" id="sample_editable_1 ">
                            <thead>
                                <tr>
                                    <th style="width: 13%;">القسم </th>
                                    <th style="width: 12%; text-align: center;">الكود</th>
                                    <th style="width: 15%; text-align: center;">المساق</th>
                                    <th style="width: 15%; text-align: center;">الفرع</th>
                                    <th style="width: 5%; text-align: center;">ع.طالبات</th>
                                    <th style="width: 5%; text-align: center;">ع.طلاب</th>
                                    <th style="width: 15%; text-align: center;">التاريخ</th>
                                    <th colspan="2" style="width: 25%; text-align: center;">وقت الامتحان</th>
                                    <th style="width: 10%;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <td><%# Eval("DepartmentName") %></td>
                                            <td style="text-align: center"><%# Eval("CourseCode") %></td>
                                            <td style="text-align: center"><%# Eval("CourseName") %></td>
                                            <th style="width: 15%; text-align: center;"><span><%# (Eval("OfferdBranch").ToString() == "1") ? "الزهراء" :Eval("OfferdBranch").ToString() == "2" ? "يافا" :"مشترك" %></span></th>
                                            <td style="text-align: center"><%# Eval("MStudentCount") %></td>
                                            <td style="text-align: center"><%# Eval("FStudentCount") %></td>
                                            <td style="text-align: center"><%# Eval("FinalExamDate") %></td>
                                            <td style="text-align: center"><%# Eval("FinalExamTimeFrom1") %></td>
                                            <td style="text-align: center"><%# Eval("FinalExamTimeTo1") %></td>

                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:isra %>" ProviderName="System.Data.SqlClient" SelectCommand="GetOfferdCourseFinalExamDetails2" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlExamDate" PropertyName="SelectedValue" Name="ExamDate" Type="String" DefaultValue="-1" />
                                        <asp:ControlParameter ControlID="ddlExamTime" PropertyName="SelectedValue" Name="ExamTime" Type="String" DefaultValue="-1" />
                                        <asp:ControlParameter ControlID="ddlSemester" PropertyName="Text" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlDepartment" PropertyName="Text" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlStudyLevel" PropertyName="Text" Name="StudyLevelID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlCourseType" PropertyName="Text" Name="CourseTypeID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlProgram" PropertyName="Text" Name="ProgramID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlOfferdCourseType" PropertyName="Text" Name="OfferdCourseTypeID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlBranch" PropertyName="Text" Name="BranchID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                    <div class="clearfix"></div>

                    <div class="clearfix"></div>
                    <% } %>
                    <%  else
                        { %>

                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong></strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <%  } %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
