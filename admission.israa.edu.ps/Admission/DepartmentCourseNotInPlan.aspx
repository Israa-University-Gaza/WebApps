<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="DepartmentCourseNotInPlan.aspx.cs" Inherits="Admission_DepartmentCourseNotInPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#DepartmentCourseNotInPlan').addClass("active open");
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
                <span>مساقات خارج الخطة</span> <i class="fa fa-angle-down"></i>
            </button>

        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblSemesterID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblOfferCourseID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>عرض المساقات وأعداد الطلاب
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-body">
                        <div class="row">

                            <div class="col-md-2">
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

                                <asp:Button ID="lbExcel" runat="server" Text="Excel" CssClass="btn green" OnClick="lbExcel_Click" />
                            </div>
                        </div>
                        <br />

                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-hover" id="sample_editable_1 ">
                            <thead>
                                <tr>
                                    <th style="width: 10%;">#</th>
                                    <th style="width: 20%; text-align: center;">رقم المساق</th>
                                    <th style="width: 20%; text-align: center;">المساق</th>
                                    <th style="width: 20%; text-align: center;">عدد الطلاب</th>
                                    <th style="width: 20%; text-align: center;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="CourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="DepartmentID" runat="server" Text='<%# Eval("DepartmentID") %>' Visible="false"></asp:Label>
                                            <td><%# Eval("RowNo") %></td>
                                            <td style="text-align: center"><%# Eval("CourseCode") %></td>
                                            <td style="text-align: center"><%# Eval("CourseName") %></td>
                                            <td style="text-align: center"><%# Eval("StudentCount") %></td>
                                            <td>  <asp:Button ID="lbStudentExcel" runat="server" Text="طباعة الطلاب اكسل" CssClass="btn green" OnClick="lbStudentExcel_Click"/></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:isra %>" ProviderName="System.Data.SqlClient" SelectCommand="GetDepartmentCourseNotInPlan" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlDepartment" PropertyName="Text" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
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

