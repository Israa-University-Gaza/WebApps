<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateOfferdCourseMidtermExamDetails2.aspx.cs" Inherits="FinalExam_UpdateOfferdCourseMidtermExamDetails2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#UpdateOfferdCourseMidtermExamDetails2').addClass("active open");
            $('#UpdateOfferdCourseMidtermExamDetails2 a').css("background-color", "#575757");
            $('#UpdateOfferdCourseMidtermExamDetails2 a span.arrow').addClass("open");
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
                <span>بيانات المساق</span> <i class="fa fa-angle-down"></i>
            </button>

        </li>
    </ul>
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
                            <div class="col-md-4">
                                <span>البرنامج :</span>
                                <asp:DropDownList ID="ddlProgram" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="ddlPrograms" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-4">
                                <span>القسم :</span>
                                <asp:DropDownList ID="ddlDepartment" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="ddlDepartments2" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlProgram" PropertyName="Text" Name="ProgramID" Type="String" DefaultValue="-1" />
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
                                <%--<asp:DropDownList ID="ddlOfferdCourseType" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlOfferdCourseType_SelectedIndexChanged"></asp:DropDownList>--%>
                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlOfferdCourseTypes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <span>التاريخ :</span>
                                <asp:DropDownList ID="ddlExamDate" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="MidtermExamDate" DataValueField="MidtermExamDate" AutoPostBack="true" OnSelectedIndexChanged="ddlExamDate_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetMidtermExamDates" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>

                            <div class="col-md-2">
                                <span>الوقت :</span>
                                <%--<asp:DropDownList ID="ddlExamTime" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource7" DataTextField="MidtermExamTime" DataValueField="MidtermExamTimeFrom" AutoPostBack="true" OnSelectedIndexChanged="ddlExamTime_SelectedIndexChanged"></asp:DropDownList>--%>
                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetDateMidtermExamTimes" SelectCommandType="StoredProcedure">
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
                            <%--<asp:Button ID="btnPdf" runat="server" Text="PDF" CssClass="btn blue" OnClick="btnPdf_Click" />--%>
                            <%-- by RSR <asp:Button ID="lbExcel" runat="server" Text="Excel" CssClass="btn green" OnClick="lbExcel_Click" />--%>
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
                                    <th style="width: 5%; text-align: center;">ع.طالبات</th>
                                    <th style="width: 5%; text-align: center;">ع.طلاب</th>
                                    <th style="width: 15%; text-align: center;">التاريخ</th>

                                    <th colspan="2" style="width: 20%; text-align: center;">وقت الامتحان</th>
                                    <th style="width: 15%;"></th>
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
                                                <td style="text-align: center"><%# Eval("MStudentCount") %></td>
                                                <td style="text-align: center"><%# Eval("FStudentCount") %></td>
                                                <td style="text-align: center">
                                                    <asp:TextBox ID="txtMidtermExamDate" runat="server" CssClass="form-control date-picker" Text='<%# Eval("MidtermExamDate") %>'></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMidtermExamFrom" runat="server" CssClass="form-control text-center" Text='<%# Eval("MidtermExamTimeFrom1") %>'></asp:TextBox></td>
                                                <td>
                                                    <asp:TextBox ID="txtMidtermExamTo" runat="server" CssClass="form-control text-center" Text='<%# Eval("MidtermExamTimeTo1") %>'></asp:TextBox>
                                                </td>
                                                <td style="text-align: center">
                                                    <%-- by RSR <asp:LinkButton ID="btnSave" runat="server" CssClass="btn blue" OnClick="btnSave_Click">حفظ</asp:LinkButton>--%>
                                                    <%-- by RSR <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn red" OnClick="btnCancel_Click">الغاء</asp:LinkButton></td>--%>
                                        </tr>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:isra %>" ProviderName="System.Data.SqlClient" SelectCommand="GetOfferdCourseMidtermExamDetails2" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlExamDate" PropertyName="SelectedValue" Name="ExamDate" Type="String" DefaultValue="-1" />
                                    <asp:ControlParameter ControlID="ddlExamTime" PropertyName="SelectedValue" Name="ExamTime" Type="String" DefaultValue="-1" />
                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="Text" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlDepartment" PropertyName="Text" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlStudyLevel" PropertyName="Text" Name="StudyLevelID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlCourseType" PropertyName="Text" Name="CourseTypeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlProgram" PropertyName="Text" Name="ProgramID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                       <asp:ControlParameter ControlID="ddlOfferdCourseType" PropertyName="Text" Name="OfferdCourseTypeID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-actions fluid">
                        <div class="row">
                            <div class="col-md-offset-6 col-md-6">
                                <%--<asp:LinkButton ID="BtnSaveAll" runat="server" CssClass="btn blue" OnClick="BtnSaveAll_Click">حفظ</asp:LinkButton></td>--%>
                            </div>
                        </div>
                    </div>
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

