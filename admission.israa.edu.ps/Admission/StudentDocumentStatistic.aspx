<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentDocumentStatistic.aspx.cs" Inherits="Admission_StudentDocumentStatistic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../assets/plugins/ckeditor/ckeditor.js"></script>
    <script src="../assets/scripts/form-validation.js"></script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentDocumentStatistic').addClass("active open");
            $('#StudentDocumentStatistic_1 a').css("background-color", "#575757");
            $('#StudentDocumentStatistic a span.arrow').addClass("open");
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
        <li><a href="ChangePassword.aspx" class="font-ha">مستندات الطلاب
        </a></li>
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
                            <label class="col-md-1 control-label isra-text-aling-right">البرنامج</label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlProgram" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Program] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1,N'الكل'"></asp:SqlDataSource>
                            </div>

                            <label class="col-md-1 control-label isra-text-aling-right">الكلية</label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [College] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (ProgramID=@ProgramID or @ProgramID=-1)) union select -1,N'الكل'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                            <label class="col-md-1 control-label isra-text-aling-right">القسم</label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Department] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (CollegeID=@CollegeID or @CollegeID=-1)) union select -1,N'الكل'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-1 control-label isra-text-aling-right">الجنس</label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="-1">الكل</asp:ListItem>
                                    <asp:ListItem Value="1">ذكر</asp:ListItem>
                                    <asp:ListItem Value="2">أنثى</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <label class="col-md-1 control-label isra-text-aling-right">نوع الطالب</label>

                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlStudentType" runat="server" CssClass="form-control" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From StudentTypes Where IsDelete=0 and IsActive=1 union select -1,N'الكل'"></asp:SqlDataSource>
                            </div>
                            <label class="col-md-1 control-label isra-text-aling-right">حالة الطالب</label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlStudentStatus" runat="server" CssClass="form-control" DataSourceID="SqlDataSource8" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From StudentStatus Where IsDelete=0 and IsActive=1 union select -1,N'الكل'"></asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-1 control-label">الفصل الدراسي </label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlSemesterID" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            </div>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsDelete] = 0) And Code<>'111111111') union select -1,N'الكل'"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-1 col-md-9">
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
                    <i class="fa fa-reorder"></i>عرض المستندات
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 50%;">نوع المستند</th>
                                <th style="width: 50%; text-align: center;">عدد المستندات</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                <ItemTemplate>
                                    <tr>
                                        <td><a href='StudentDocuments.aspx?ID=<%# Eval("StdDocumentTypeID") %>' target="_blank"><%# Eval("StdDocumentType") %></a></td>
                                        <td style="text-align: center;"><%# Eval("StdDocumentCount") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetFilteredStdDocument" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" DefaultValue="-1" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlGender" PropertyName="SelectedValue" DefaultValue="-1" Name="GenderID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlStudentType" PropertyName="SelectedValue" DefaultValue="-1" Name="StudentTypeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlStudentStatus" PropertyName="SelectedValue" DefaultValue="-1" Name="StudentStatusID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlSemesterID" PropertyName="SelectedValue" DefaultValue="-1" Name="RegisteredSemesterID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>

                    <div class="clearfix"></div>
                    <% } %>
                    <%  else
                        { %>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجد مستندات للعرض  </strong>
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

