<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsAcademicWarning.aspx.cs" Inherits="Admission_StudentsAcademicWarning" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../assets/plugins/ckeditor/ckeditor.js"></script>
    <script src="../assets/scripts/form-validation.js"></script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_6 a').css("background-color", "#575757");
            $('#Student a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="StudentAcademicWarning.aspx" class="font-ha">المحذرين أكاديميا
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
       <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>طلاب التحذير الأكاديمي
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group row">

                        <label class="control-label col-md-2">البرنامج </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlProgram" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="ddlPrograms" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                        <label class="control-label col-md-2">القسم </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlDepartment" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="DataBind_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="ddlDepartments2" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlProgram" PropertyName="Text" Name="ProgramID" Type="String" DefaultValue="-1" />
                                </SelectParameters>

                            </asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">اسم أو رقم الطالب</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtStudentName" runat="server" class="form-control" OnTextChanged="DataBind_Click"></asp:TextBox>
                        </div>

                        <label class="control-label col-md-2">فصل التحذير </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="DataBind_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-2">نوع التحذير </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlAcademicWarning" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="DataBind_Click">
                                <asp:ListItem Value="-1" Selected="True">الكل</asp:ListItem>
                                <asp:ListItem Value="1">تحذير أول</asp:ListItem>
                                <asp:ListItem Value="2">تحذير ثان</asp:ListItem>
                                <asp:ListItem Value="3">تحذير ثالث</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <label class="control-label col-md-2">حالة التحذير </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlAcademicWarningStatus" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="DataBind_Click">
                                <asp:ListItem Value="-1" Selected="True">الكل</asp:ListItem>
                                <asp:ListItem Value="0">فعال</asp:ListItem>
                                <asp:ListItem Value="1">ملغي</asp:ListItem>

                            </asp:DropDownList>

                        </div>
                    </div>

                    <br />
                    <hr />
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 5%;">#</th>
                                <th style="width: 10%; text-align: center;">رقم الطالب </th>
                                <th style="width: 15%; text-align: center;">اسم الطالب</th>
                                <th style="width: 15%; text-align: center;">قسم الطالب</th>
                                <th style="width: 10%; text-align: center;">نوع التحذير</th>
                                <th style="width: 10%; text-align: center;">حالة التحذير</th>
                                <th style="width: 30%; text-align: center;">فصل التحذير</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <td><%# Eval("RowNo") %></td>

                                        <td style="text-align: center"><%# Eval("StudentNo") %></td>
                                        <td style="text-align: center;"><a href="Student.aspx?id=<%# Eval("StudentID") %>&tab=1" target="_blank"><%# Eval("StudentName") %></a></td>
                                        <td style="text-align: center"><%# Eval("StudentDepartment") %></td>

                                        <td style="text-align: center"><%# Eval("AcademicWarning") %></td>
                                        <td style="text-align: center"><%# Eval("AcademicWarningStatus") %></td>
                                        <td style="text-align: center"><%# Eval("SemesterName") %></td>


                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStudentsAcademicWarning" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlDepartment" PropertyName="Text" Name="DepartmentID" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="Text" Name="SemesterID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtStudentName" PropertyName="Text" Name="StudentName" Type="String" DefaultValue="%"></asp:ControlParameter>

                                    <asp:ControlParameter ControlID="ddlAcademicWarning" PropertyName="SelectedValue" Name="AcademicWarning" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlAcademicWarningStatus" PropertyName="SelectedValue" DefaultValue="-1" Name="IsCancel" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                </div>

                <% } %>
                <%  else
                    { %>

                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                    <div class="col-xs-11" style="text-align: center">
                        <strong>لا يوجد بيانات للعرض</strong>
                        <div style="clear: both"></div>
                    </div>
                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                    <div style="clear: both"></div>
                </div>
                <%  } %>
            </div>

        </div>
    </div>

</asp:Content>

