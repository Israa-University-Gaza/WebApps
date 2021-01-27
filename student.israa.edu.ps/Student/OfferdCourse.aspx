<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="OfferdCourse.aspx.cs" Inherits="Student_OfferdCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu7').addClass("active");
        });
    </script>
    <style>
        .trtd tr, .trtd td, .trtd th, .trtd {
            border: 0px !important;
            text-align: center !important;
        }

            .trtd tr:last-child {
                column-span: all !important;
                text-align: center !important;
            }

            .trtd a {
                text-decoration: none !important;
                transition: all ease-in-out 0.5s;
            }

                .trtd a:hover {
                    color: #808080 !important;
                }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder font-ha">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#">المساقات المطروحة</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>المساقات المطروحة</div>
                </div>
                <div class="portlet-body">
                    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label class="control-label col-md-4">الفصل الدراسي : </label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlSemester" runat="server" class="form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetActiveSemesters" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label class="control-label col-md-4">الكلية : </label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlStdColleges" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetStdOCColleges" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label class="control-label col-md-4">القسم : </label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlStdDepartment" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="Select [ID], [ArName] From [Department] Where [CollegeFID] in (Select ID From [CollegeFollow] Where [CollegeID]=@CollegeID and IsActive=1 and IsDelete=0) and IsActive=1 and IsDelete=0  union select -1,N'إختر القسم';">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlStdColleges" Name="CollegeID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label class="control-label col-md-4">كود المساق : </label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtCourseCode" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label class="control-label col-md-4">إسم المساق : </label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtCourseName" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label class="control-label col-md-4"></label>
                                <div class="col-md-8">
                                    <asp:Button ID="btnFilter" runat="server" Text="بحث" class="btn green" OnClick="btnFilter_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-4">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-striped table-hover trtd" PagerStyle-HorizontalAlign="Center" PageSize="6">
                                <Columns>
                                    <asp:BoundField DataField="CourseCode" HeaderText="الكود" ReadOnly="True" SortExpression="CourseCode" HeaderStyle-Width="30%" />
                                    <asp:BoundField DataField="CourseName" HeaderText="المساق" ReadOnly="True" SortExpression="CourseName" HeaderStyle-Width="55%" />
                                    <asp:CommandField ShowSelectButton="True" SelectText="عرض" HeaderStyle-Width="15%" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetStdActiveSemesterOfferdCourse" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlStdDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtCourseCode" PropertyName="Text" DefaultValue="%" Name="CourseCode" Type="String" />
                                    <asp:ControlParameter ControlID="txtCourseName" PropertyName="Text" DefaultValue="%" Name="CourseName" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-md-8">
                            <div class="portlet-body" id="divSections" runat="server" visible="false">
                                <div class="table-responsive">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="border-top: none!important; width: 25%"><span>اسم المساق : </span>
                                                <asp:Label ID="lblCourseName" runat="server"></asp:Label></td>
                                            <td style="text-align: center; border-top: none!important; width: 25%"><span>ساعات معتمدة : </span>
                                                <asp:Label ID="lblNumOfHours" runat="server"></asp:Label></td>
                                            <td style="text-align: center; border-top: none!important; width: 25%"><span>تاريخ الإمتحان : </span>
                                                <asp:Label ID="lblExamDate" runat="server"></asp:Label></td>
                                            <td style="text-align: center; border-top: none!important; width: 25%"><span>موعد الإمتحان : </span>
                                                <asp:Label ID="lblExamTime" runat="server"></asp:Label></td>
                                        </tr>
                                    </table>
                                    <hr />
                                    <table class="table table-condensed table-hover">
                                        <thead>
                                            <tr>
                                                <td style="text-align: center; width: 20%;">الشعبة</td>
                                                <td style="text-align: center; width: 10%;"></td>
                                                <td style="text-align: center; width: 30%;">المحاضر</td>
                                                <td style="text-align: center; width: 40%;">المواعيد</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater2" runat="server">
                                                <ItemTemplate>
                                                    <asp:Label ID="SectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                                        <td style="text-align: center;">نظري</td>
                                                        <td style="text-align: center;"><%# Eval("Employee") %></td>
                                                        <td style="text-align: center;">
                                                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                                                <ItemTemplate>
                                                                    <span><%# Eval("Room") %></span>
                                                                    <span><%# Eval("CDay") %></span>
                                                                    <span><%# Eval("FromToHour") %></span>
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                        <ItemTemplate>
                                                            <asp:Label ID="SectionID2" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                            <tr style="text-align: center;">
                                                                <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                                                <td style="text-align: center;">مناقشة</td>
                                                                <td style="text-align: center;"><%# Eval("Employee") %></td>
                                                                <td style="text-align: center;">
                                                                    <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
                                                                        <ItemTemplate>
                                                                            <span><%# Eval("Room") %></span>
                                                                            <span><%# Eval("CDay") %></span>
                                                                            <span><%# Eval("FromToHour") %></span>
                                                                            <br />

                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="SectionID2" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetDissSectionsBySectionID" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
                                                        <ItemTemplate>
                                                            <asp:Label ID="SectionID3" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                            <tr style="text-align: center;">
                                                                <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                                                <td style="text-align: center;">معمل</td>
                                                                <td style="text-align: center;"><%# Eval("Employee") %></td>
                                                                <td style="text-align: center;">
                                                                    <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
                                                                        <ItemTemplate>
                                                                            <span><%# Eval("Room") %></span>
                                                                            <span><%# Eval("CDay") %></span>
                                                                            <span><%# Eval("FromToHour") %></span>
                                                                            <br />
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="SectionID3" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetLabSectionsBySectionID" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
