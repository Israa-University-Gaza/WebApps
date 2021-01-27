<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="FinalExamStudentStatistics.aspx.cs" Inherits="Admission_FinalExamStudentStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#FinalExamDetails').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>احصائيات الإمتحانات النهائية</span> <i class="fa fa-angle-down"></i>
            </button>

        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblSemesterID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblOfferCourseID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>
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

                            <div class="col-md-4">
                                <span>الفرع :</span>
                                <asp:DropDownList ID="ddlBranch" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource9" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlExamDate_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="ddlBranches" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>




                            <div class="col-md-4">
                                <span>المحافظة :</span>
                                <asp:DropDownList ID="ddlGovernorates" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlExamDate_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="ddlGovernorates" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>
                        </div>
                        <br />

                        <div class="row">
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

                            <asp:Button ID="lbExcel" runat="server" Text="طباعة الاسماء " CssClass="btn blue" OnClick="lbExcel_Click" />
                            <asp:Button ID="lbPrint" runat="server" Text="طباعة الاعداد الكلية " CssClass="btn blue" OnClick="lbPrint_Click" />
                        </div>
                        <br />
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-hover" id="sample_editable_1 ">
                            <thead>
                                <tr>
                                    <th style="width: 5%;">م </th>
                                    <th style="width: 10%; text-align: center;">رقم الطالب</th>
                                    <th style="width: 15%; text-align: center;">اسم الطالب</th>
                                    <th style="width: 10%; text-align: center;">اليوم</th>
                                    <th style="width: 10%; text-align: center;">الفترة</th>
                                    <th style="width: 15%; text-align: center;">المحافظة</th>
                                    <th style="width: 35%; text-align: center;">العنوان</th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="id" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                            <td><%# Eval("RowNo") %></td>
                                            <td style="text-align: center"><%# Eval("StudentNo") %></td>
                                            <td style="text-align: center"><%# Eval("Studentname") %></td>
                                            <td style="text-align: center"><%# Eval("ExamDate") %></td>
                                            <td style="text-align: center"><%# Eval("ExamTime1") %></td>
                                            <td style="text-align: center"><%# Eval("GovernoratesName") %></td>
                                            <td style="text-align: center"><%# Eval("AddressDetails") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:isra %>" ProviderName="System.Data.SqlClient" SelectCommand="GetFinalExamStudentStatistics" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlExamDate" PropertyName="SelectedValue" Name="ExamDate" Type="String" DefaultValue="-1" />
                                        <asp:ControlParameter ControlID="ddlExamTime" PropertyName="SelectedValue" Name="ExamTime" Type="String" DefaultValue="-1" />
                                        <asp:ControlParameter ControlID="ddlSemester" PropertyName="Text" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlBranch" PropertyName="Text" Name="BranchID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlGovernorates" PropertyName="Text" Name="GovernoratesID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
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

