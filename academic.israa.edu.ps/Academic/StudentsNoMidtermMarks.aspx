<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsNoMidtermMarks.aspx.cs" Inherits="Academic_StudentsNoMidtermMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicSectionStudentsMarks').addClass("active open");
            $('#StudentsNoMidtermMarks a').css("background-color", "#575757");
            $('#StudentsNoMidtermMarks a span.arrow').addClass("open");

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
                <span>طلاب امتحانات الاعادة النصفي</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <%--  <div class="col-md-12">
        <div class="portlet box blue">
         
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>بحث حسب</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="form-group row">

                            <label class="col-md-2 control-label">الفصل الدراسي  </label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlSemester" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                            </div>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            <label class="col-md-2 control-label isra-text-aling-right">القسم</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlDepartments3" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions fluid">
                        <div class="col-md-offset-2 col-md-9">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn blue" OnClick="btnSearch_Click" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <div class="col-md-12 ">
        <div id="Div1" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box purple">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>اعتماد علامات الطلاب
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group row">
                        <div class="col-md-9 isra-pl-0">
                            <div id="divMsg1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="form-group row">

                        <label class="col-md-2 control-label">الفصل الدراسي  </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlSemester" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                        </div>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <label class="col-md-2 control-label isra-text-aling-right">القسم</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlDepartments3" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <% if (IsPermissionsContains("AcademicSectionStudentsMarks"))
                        { %>
                    <div class="form-group row">
                        <div class="col-md-3">
                            <asp:Button ID="btnAcrreditAll" runat="server" CssClass="btn green" Text="اعتماد العلامات المحددة كنائب" OnClick="btnAcrreditAll_Click" />
                        </div>
                      
                        <div class="col-md-3">
                            <asp:Button ID="btnUnAcrreditAll" runat="server" CssClass="btn red" Text="ارجاع العلامات المحددة" OnClick="btnUnAcrreditAll_Click" />
                        </div>
                          <div class="col-md-3">
                            <asp:Button ID="btnDeanAcrreditAll" runat="server" CssClass="btn green" Text="اعتماد العلامات المحددة كعميد" OnClick="btnDeanAcrreditAll_Click" />
                        </div>
                           <div class="col-md-3">
                            <asp:Button ID="btnDeanUnAcrreditAll" runat="server" CssClass="btn red" Text="ارجاع العلامات المحددة كعميد" OnClick="btnDeanUnAcrreditAll_Click" />
                        </div>
                    </div>
                    <% } %>
                    <hr />
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" id="selectAll" />
                                </th>
                                <th scope="col" style="width: 3%; text-align: center">رقم</th>
                                <th scope="col" style="width: 10%; text-align: center">رقم الطالب</th>
                                <th scope="col" style="width: 15%; text-align: center">اسم الطالب</th>
                                <th scope="col" style="width: 15%; text-align: center">المساق</th>
                                <th scope="col" style="width: 15%; text-align: center">المحاضر</th>
                                <th scope="col" style="width: 10%; text-align: center">العلامة</th>
                                <th scope="col" style="width: 20%; text-align: center">إعتمادات</th>
                                <th scope="col" style="width: 17%; text-align: center"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("StdSectionID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbAdopt" runat="server" Checked="false" /></td>
                                        <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("RowNo") %></span></td>
                                        <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentNo") %></span></td>
                                        <td style="text-align: center; font-size: 12px; padding: 15px;"><span><%# Eval("StudentName") %></span></td>
                                        <td style="text-align: center; font-size: 12px; padding: 15px;"><span><%# Eval("CourseName") %></span></td>
                                        <td style="text-align: center; font-size: 12px; padding: 15px;"><span><%# Eval("EmployeeName") %></span></td>
                                        <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("MidtermMark") %></span></td>
                                        <td style="text-align: center; font-size: 12px; padding: 10px; color:green"><span><%# (Convert.ToBoolean(Eval("TeacherAccreditation").ToString())) ? "(محاضر)": "" %></span> <span><%# (Convert.ToBoolean(Eval("DeanAccreditation").ToString())) ? "(عميد)": "" %></span> <span><%# (Convert.ToBoolean(Eval("AcademicAccreditation").ToString())) ? "(نائب أكاديمي)": "" %></span></td>
                                        <td>
                                            <% if (IsPermissionsContains("DeanSectionStudentsMarks"))
                                                { %>

                                            <asp:Button ID="btnMarkAccreditation" runat="server" Text="اعتماد عميد" CssClass="btn green" Visible='<%# (Convert.ToBoolean(Eval("TeacherAccreditation").ToString()) && !Convert.ToBoolean(Eval("DeanAccreditation").ToString())) ? true:false %>' OnClick="btnMarkAccreditation_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إعتماد علامة الطالب ؟');" />
                                            <asp:Button ID="btnMarkUnaccreditation" runat="server" Text="ارجاع عميد" CssClass="btn green" Visible='<%# (Convert.ToBoolean(Eval("TeacherAccreditation").ToString()) && Convert.ToBoolean(Eval("DeanAccreditation").ToString()) && !Convert.ToBoolean(Eval("AcademicAccreditation").ToString())) ? true:false %>' OnClick="btnMarkUnaccreditation_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إلغاء إعتماد علامة الطالب ؟');" />
                                            <% } %>
                                            <% if (IsPermissionsContains("AcademicSectionStudentsMarks"))
                                                { %>

                                            <asp:Button ID="btnMarkAcademicAccreditation" runat="server" Text="اعتماد" CssClass="btn green" Visible='<%# (Convert.ToBoolean(Eval("DeanAccreditation").ToString()) && !Convert.ToBoolean(Eval("AcademicAccreditation").ToString())) ? true:false %>' OnClick="btnMarkAcademicAccreditation_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إعتماد علامة الطالب ؟');" />
                                            <asp:Button ID="btnMarkAcademicUnaccreditation" runat="server" Text="ارجاع" CssClass="btn green" Visible='<%# (Convert.ToBoolean(Eval("AcademicAccreditation").ToString())) ? true:false %>' OnClick="btnMarkAcademicUnaccreditation_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إلغاء إعتماد علامة الطالب ؟');" />
                                            <% } %>
                                        </td>


                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetStudentsNoMidtermMarks" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" DefaultValue="-1" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>

                    <% } %>
                    <%  else
                        { %>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجد علامات للعرض  </strong>
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


    <script>
        $('#selectAll').click(function (e) {
            $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);

        });



    </script>
</asp:Content>

