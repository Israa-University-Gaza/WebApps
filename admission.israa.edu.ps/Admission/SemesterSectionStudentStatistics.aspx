<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="SemesterSectionStudentStatistics.aspx.cs" Inherits="Admission_SemesterSectionStudentStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#SemesterSectionStudentStatistics').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> احصائيات طلاب الشعب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
        <div class="form-group">
                                     <label class="control-label col-md-2">الفصل الدراسي</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([Code] <> '111111111') AND ([IsDelete] = 0)) ORDER BY ID DESC">
                                    </asp:SqlDataSource>
                                </div>
                                <label class="control-label col-md-2">البرنامج</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlProgram" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Program] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) UNION SELECT -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">الكلية</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [College] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (ProgramID=@ProgramID)) union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="control-label col-md-2">القسم</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Department] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (CollegeID=@CollegeID)) union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                              <div class="form-group">
                                <label class="control-label col-md-2">المساق</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="CourseName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetDepartmentOfferdCourses" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">الشعبة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="SectionNum" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                                   </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, Cast(SectionNum as nchar(10)) as SectionNum FROM [Section] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (OfferdCourseID=@OfferdCourseID)) union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="OfferdCourseID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                  
                            </div>
                         <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-10">
                                  <asp:Button ID="btnView" runat="server" Text="عرض" CssClass="btn green" OnClick="btnView_Click" />
                              </div>
                                </div>
                            <hr />
                            <div>
                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 8%; text-align: center">البرنامج</th>
                                            <th scope="col" style="width: 16%; text-align: center">الكلية</th>
                                            <th scope="col" style="width: 14%; text-align: center">القسم</th>
                                            <th scope="col" style="width: 14%; text-align: center">المساق</th>
                                            <th scope="col" style="width: 2%; text-align: center">الشعبة</th>
                                            <th scope="col" style="width: 10%; text-align: center"> اسم الطالب</th>
 <th scope="col" style="width: 10%; text-align: center">رقم الجوال</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource7">
                                            <ItemTemplate>
                                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td style="text-align: center"><span><%# Eval("Program") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("College") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("Department") %></span></td>
                                                    <td style="text-align: center;"><%# Eval("Course") %></td>
                                                    <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                                    <td style="text-align: center;"><%# Eval("StudentName") %></td>
                                                 <td style="text-align: center;"><%# Eval("StudentMobileNo") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetSemesterSectionStudentStatistics" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" DefaultValue="-1" />
                                                <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" DefaultValue="-1" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" DefaultValue="-1" Name="OfferdCourseID" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" DefaultValue="-1" Name="SectionID" Type="Int32"></asp:ControlParameter>
                                             
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                            </div>

                            
                            <div class="clearfix"></div>
                            <% }
                                else
                                {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد طلاب مسجلين في الشعبة</strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                            <% } %>
                        </div>
                    
                            </div></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

