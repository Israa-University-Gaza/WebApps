<%@ page title="" language="C#" masterpagefile="~/Admission/MasterPage.master" autoeventwireup="true" codefile="OfferdCourseStudentCounts.aspx.cs" inherits="Admission_OfferdCourseStudentCounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#OfferdCourseStudentCounts').addClass("active open");
        });
    </script>
</asp:content>
<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder2" runat="Server">
        <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>اعداد الطلبة في المساقات المطروحة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">

                    <div class="row">
                        <label class="control-label col-md-2">الفصل الدراسي </label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="dataBind_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                        <label class="col-md-2 control-label">المساق المطروح</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlOfferdCourse" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="dataBind1_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlOfferdCourses1" SelectCommandType="StoredProcedure">
                                 <SelectParameters>
                                                                                 <asp:ControlParameter ControlID="ddlSemester" Name="SemesterID" PropertyName="SelectedValue" Type="Int32" />
                                                                                                                            </SelectParameters>

                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <label class="col-md-2 control-label">حالة الطالب في المساق </label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlCourseStatus" runat="server" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="dataBind1_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlCourseStatuses" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>

                    <br />
                    <div class="row">
                        <div class="col-md-offset-2 col-md-3">
                            <asp:Button ID="btnView" runat="server" Text="عرض" class="btn green" OnClick="dataBind1_Click" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-condensed table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 5%; font-size: 12px;">م</th>
                                        <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">رقم الطالب</th>
                                        <th style="text-align: center; width: 75%; border-top: none!important; font-size: 12px;">اسم الطالب</th>
      <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">حالة المادة</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                                                                        <tr>
                                                <td><span><%# Eval("RowNo") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                                     <td style="text-align: center"><span><%# Eval("CourseStatus") %></span></td>         
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetOfferdCourseStudentCounts" SelectCommandType="StoredProcedure">
                                        <SelectParameters>

                                            <asp:ControlParameter ControlID="ddlOfferdCourse" Name="OfferdCourseID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                                            <asp:ControlParameter ControlID="ddlCourseStatus" Name="CourseStatusID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                                                                                 </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                       
                            <div class="clearfix"></div>

                            <% }
                                else
                                {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد بيانات للعرض</strong>
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


</asp:content>

