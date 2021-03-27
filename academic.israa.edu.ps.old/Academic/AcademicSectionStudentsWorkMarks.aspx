<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="AcademicSectionStudentsWorkMarks.aspx.cs" Inherits="Academic_AcademicSectionStudentsWorkMarks" %>


<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .sale-summary li .sale-num {
            color: #169ef4;
            font-family: hasanin;
            font-size: 14px;
            font-weight: 100;
            float: left;
        }

        .sale-summary li .sale-info {
            color: #646464;
            float: right;
            font-family: hasanin;
            font-size: 12px;
            text-transform: uppercase;
        }

        .sale-summary li {
            border-top: none;
            overflow: hidden;
            padding: 1.9px 0;
        }

        .dropdown-menu li > a {
            clear: both;
            color: #333;
            display: block;
            font-weight: normal;
            line-height: 18px;
            padding: 0;
            text-decoration: none;
            white-space: nowrap;
        }

        .dropdown.open .dropdown-toggle {
            background: #e0eaf0 !important;
            color: #121212;
        }

        .sp > a {
            height: 30px;
            width: 242px;
            text-align: right;
            color: #fff !important;
            background-color: #169ef4 !important;
            display: inline-block;
            line-height: 29px;
            font-family: hasanin;
            padding: 0 10px 0 0;
        }

        .sp .dropdown-menu li > a {
            clear: both;
            color: #fff;
            display: block;
            font-weight: normal;
            line-height: 22px;
            padding: 0;
            text-decoration: none;
            white-space: nowrap;
            height: 30px !important;
            display: inline-block;
            width: 100%;
        }

        .sp .dropdown.open .dropdown-toggle {
            background: #fff !important;
            color: #4b8df8 !important;
        }

        .spa {
            background: #fff !important;
            color: #4b8df8 !important;
            border: none !important;
            text-align: right;
            padding: 0 15px !important;
        }

            .spa:hover {
                background-color: #4b8df8 !important;
                color: #fff !important;
            }
    </style>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicSectionsWorkMarks').addClass("active open");
            $('#AcademicSectionsWorkMarks_2 a').css("background-color", "#575757");
            $('#AcademicSectionsWorkMarks_2 a span.arrow').addClass("open");

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
                <span>علامات الطلاب</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>علامات الطلاب</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div style="width: 19%; float: right;">
                            <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                                <li>
                                    <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                                    <label class="row control-label">البرنامج</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeePrograms" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <label class="row control-label">الكلية</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlCollege" runat="server" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeCollages" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <label class="row control-label">القسم</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource7" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeDepartments" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <label class="row control-label">المساق :</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="CourseArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetAcademicOfferdCourses" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                                                <asp:ControlParameter ControlID="lblSemesterID" Name="SemesterID" PropertyName="Text" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlProgram" Name="ProgramID" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlCollege" Name="CollegeID" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlDepartment" Name="DepartmentID" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <label class="row control-label">الشعبة :</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="SectionNum" DataValueField="ID"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetOfferdCourseAccreditationSections" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="OfferdCourseID" Type="Int32" />
                                                <asp:Parameter Name="AccreditationType" DefaultValue="1" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <div class="row" style="text-align: center">
                                        <asp:Button ID="btnView" runat="server" Text="عرض" CssClass="btn green" OnClick="btnView_Click" />
                                    </div>
                                </li>
                                <li class="active"><a data-toggle="tab" href="#tab1"><i class="fa fa-home"></i>علامات الطلاب</a></li>
                                <%--   <li><a data-toggle="tab" href="#tab2"><i class="fa fa-book"></i>إحصائيات العلامات</a></li>--%>
                            </ul>
                        </div>
                        <div style="width: 81%; float: right;">
                            <div class="tab-content">
                                <div id="tab1" class="tab-pane active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4 class="font-ha">علامات الطلاب</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="divMsg1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <div style="font-size: 14px;" class="alert alert-info alert-dismissable">
                                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource3">
                                                        <ItemTemplate>
                                                            <asp:Label ID="SectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                            <div class="col-md-4">
                                                                <strong>المساق : </strong><span><%# Eval("CourseName") %></span><br />
                                                                <strong>الشعبة : </strong><span><%# Eval("SectionNum") %></span><br />
                                                                <strong>المحاضر : </strong><span><%# Eval("Employee") %></span><br />
                                                            </div>
                                                            <div class="col-md-4" style="text-align: center;">
                                                                <%--<asp:LinkButton ID="lbSectionStudentsMarksPDF" runat="server" OnClick="lbSectionStudentsMarksPDF_Click">كشف علامات الطلاب</asp:LinkButton>--%><br />
                                                                <br />
                                                                <%--<asp:LinkButton ID="lbSectionStudentsMidtermMarkExcel" runat="server" OnClick="lbSectionStudentsMidtermMarkExcel_Click">كشف Excel بالعلامات النصفية</asp:LinkButton>--%>
                                                            </div>
                                                            <div class="col-md-4" style="text-align: center;">
                                                                <br />
                                                                <asp:Button ID="btnMarkAllAccreditation" runat="server" Text='<%# (Convert.ToBoolean(Eval("AcademicAccreditation").ToString())==false) ? "إعتماد نائب اكاديمي":"تم إعتماد العلامات" %>' CssClass="btn green" Enabled='<%# (Convert.ToBoolean(Eval("AcademicAccreditation").ToString())==false) ? true:false %>' OnClick="btnMarkAllAccreditation_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إعتماد العلامات ؟');" />
                                                                <asp:Button ID="btnMarkAllUnaccreditation" runat="server" Text="ارجاع العلامات" Visible='<%# (Convert.ToBoolean(Eval("AcademicAccreditation").ToString())==true)? true:false %>' CssClass="btn green" Enabled="true" OnClick="btnMarkAllUnaccreditation_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إرجاع العلامات ؟');" />
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetSectionWorkMarkDetails" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />

                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <% if (ListView1.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" style="width: 5%; text-align: center">رقم</th>
                                                            <th scope="col" style="width: 10%; text-align: center">رقم الطالب</th>
                                                            <th scope="col" style="width: 20%; text-align: center">اسم الطالب</th>
                                                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource222">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMark1" runat="server" Text='<%# Eval("Mark1") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblMark2" runat="server" Text='<%# Eval("Mark2") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblMark3" runat="server" Text='<%# Eval("Mark3") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblMark4" runat="server" Text='<%# Eval("Mark4") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblMark5" runat="server" Text='<%# Eval("Mark5") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblMark6" runat="server" Text='<%# Eval("Mark6") %>' Visible="false"></asp:Label>
                                                                    <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark1Visable")) %>'><%# Eval("Title1") + " ("+ Eval("Mark1")+ ")" %></th>
                                                                    <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark2Visable")) %>'><%# Eval("Title2") + " ("+ Eval("Mark2")+ ")"  %></th>
                                                                    <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark3Visable")) %>'><%# Eval("Title3") + " ("+ Eval("Mark3")+ ")"  %></th>
                                                                    <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark4Visable")) %>'><%# Eval("Title4") + " ("+ Eval("Mark4")+ ")"  %></th>
                                                                    <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark5Visable")) %>'><%# Eval("Title5") + " ("+ Eval("Mark5")+ ")"  %></th>
                                                                    <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark6Visable")) %>'><%# Eval("Title6") + " ("+ Eval("Mark6")+ ")"  %></th>
                                                                    <th>المجموع</th>
                                                                    <th scope="col" style="width: 10%; text-align: center" runat="server">اعتمادات</th>
                                                                </ItemTemplate>
                                                            </asp:ListView>
                                                            <asp:SqlDataSource ID="SqlDataSource222" runat="server"
                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                SelectCommand="GetWorkMarkTitle" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                            <th scope="col" style="width: 10%; text-align: center"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                                            <ItemTemplate>
                                                                <asp:Label ID="WorkMarkID" runat="server" Text='<%# Eval("WorkMarkID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <tr>
                                                                        <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("RowNo") %></span></td>
                                                                        <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentNo") %></span></td>
                                                                        <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentName") %></span></td>
                                                                        <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark1Visable"))%>'><%# Eval("WorkMark1") %></td>
                                                                        <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark2Visable"))%>'><%# Eval("WorkMark2") %></td>
                                                                        <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark3Visable"))%>'><%# Eval("WorkMark3") %></td>
                                                                        <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark4Visable")) %>'><%# Eval("WorkMark4") %></td>
                                                                        <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark5Visable"))%>'><%# Eval("WorkMark5") %></td>
                                                                        <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark6Visable"))%>'><%# Eval("WorkMark6") %></td>
                                                                        <span><%# Eval("TotalWorkMark") %></span>
                                                                        <td style="text-align: center; font-size: 12px; padding: 10px;">
                                                                            <span><%# (Convert.ToBoolean(Eval("TeacherAccreditation"))) ? "(محاضر)": "" %></span>
                                                                            <span><%# (Convert.ToBoolean(Eval("DeanAccreditation"))) ? "(عميد)": "" %></span>
                                                                            <span><%# (Convert.ToBoolean(Eval("AcademicAccreditation"))) ? "(نائب أكاديمي)": "" %></span>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Button ID="btnMarkUnaccreditation" runat="server" Text="ارجاع" CssClass="btn green" Visible='<%# (Convert.ToBoolean(Eval("DeanAccreditation").ToString())) ? true:false %>' OnClick="btnMarkUnaccreditation_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إلغاء إعتماد علامة الطالب ؟');" />
                                                                        </td>
                                                                    </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetSectionStudentsWorkMarks" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                                <% }
                                                    else if (ddlSection.SelectedIndex == 0)
                                                    { %>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center">
                                                        <strong>لم يتم إختيار الشعبة لعرض طلابها</strong>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
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
