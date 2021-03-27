<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="DeanSectionsWorkMarks.aspx.cs" Inherits="Academic_DeanSectionsWorkMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicSectionsWorkMarks').addClass("active open");
            $('#DeanSectionsWorkMarks a').css("background-color", "#575757");
            $('#DeanSectionsWorkMarks a span.arrow').addClass("open");

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
                <span>علامات أعمال الفصل لشعب المساقات</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="col-md-12">
        <div class="portlet box blue">
            <asp:Label ID="lblPlanID" runat="server" Text="" Visible="false"></asp:Label>
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
                                <asp:DropDownList ID="ddlSemesterID" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                            </div>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="SELECT ID, ArName FROM [Semester] WHERE Code<>'111111111' and IsActive=1 and IsDelete=0 Order by ID DESC"></asp:SqlDataSource>

                            <label class="col-md-2 control-label isra-text-aling-right">البرنامج</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlProgram" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeePrograms" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label isra-text-aling-right">الكلية</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeCollages" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                            <label class="col-md-2 control-label isra-text-aling-right">القسم</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeDepartments" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32"></asp:ControlParameter>
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
    </div>
    <div class="col-md-12 ">
        <div id="Div1" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>اعتماد علامات اعمال الفصل لشعب المساقات 
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="col-md-9 isra-pl-0">
                        <div id="divMsg1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                            <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <div class="form-group row">
                        <asp:Button ID="BtnSaveAll" runat="server" CssClass="btn green" Text="اعتماد الشعب كعميد" OnClick="BtnSaveAll1_Click" />
                       
                    </div>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th></th>
                                <th style="width: 25%;">القسم</th>
                                <th style="width: 10%; text-align: center;">المساق</th>
                                <th style="width: 5%; text-align: center;">الشعبة</th>
                                <th style="width: 10%; text-align: center;">المحاضر</th>
                                <th style="width: 10%; text-align: center;">عدد الطلاب</th>
                                <th style="width: 20%; text-align: center;">إعتمادات</th>
                                <th style="width: 15%;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="SectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbAdopt" runat="server" /></td>
                                        <td><%# Eval("DepartmentName") %></td>
                                        <td style="text-align: center"><%# Eval("CourseName") %></td>
                                        <td style="text-align: center"><%# Eval("SectionNum") %></td>
                                        <td style="text-align: center"><%# Eval("EmployeeName") %></td>
                                        <td style="text-align: center"><%# Eval("StudentCount") %></td>
                                        <td style="text-align: center; font-size: 12px; padding: 10px;">
                                            <span><%# (Convert.ToBoolean(Eval("TeacherAccreditation"))) ? "(محاضر)": "" %></span>
                                            <span><%# (Convert.ToBoolean(Eval("DeanAccreditation"))) ? "(عميد)": "" %></span>
                                            <span><%# (Convert.ToBoolean(Eval("AcademicAccreditation"))) ? "(نائب أكاديمي)": "" %></span>
                                        </td>
                                        <td style="text-align: center;">
                                            <asp:Button ID="btnWorkMarkDeanAccreditation" runat="server" Text='<%# (Convert.ToBoolean(Eval("DeanAccreditation").ToString())==false) ? "إعتماد كعميد":"تم إعتماد العلامات" %>' CssClass="btn green" Enabled='<%# (Convert.ToBoolean(Eval("DeanAccreditation").ToString())==false) ? true:false %>' OnClick="btnWorkMarkDeanAccreditation_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إعتماد العلامات ؟');" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetAcademicSectionsWorkMarks" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" DefaultValue="-1" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlSemesterID" PropertyName="SelectedValue" DefaultValue="-1" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                                <SelectParameters>
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
</asp:Content>

