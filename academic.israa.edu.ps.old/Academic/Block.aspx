<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="Block.aspx.cs" Inherits="Academic_Block" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../assets/plugins/ckeditor/ckeditor.js"></script>
    <script src="../assets/scripts/form-validation.js"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudyTable').addClass("active open");
            $('#StudyTable_6 a').css("background-color", "#575757");
            $('#StudyTable a span.arrow').addClass("open");
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
                <span>جداول الطلاب</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                 <div class="caption"><i class="fa fa-cogs"></i>جداول الطلاب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                            <div class="row">
                        <div class="col-md-5">
                        <asp:DropDownList ID="ddlBranches" DataTextField="Name" CssClass="form-control" DataValueField="ID"  runat="server"></asp:DropDownList>
                        </div>
                            </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 10%;">رقم</th>
                                <th style="width: 25%; text-align: center;">القسم</th>
                                <th style="width: 25%; text-align: center;">المستوى</th>
                                <th style="width: 10%; text-align: center">الجندر</th>
                                <th style="width: 15%; text-align: center;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="DepartmentID" runat="server" Text='<%# Eval("DepartmentID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="StudyLevelID" runat="server" Text='<%# Eval("StudyLevelID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="GenderID" runat="server" Text='<%# Eval("GenderID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("RowNo") %></span></td>

                                        <td style="text-align: center"><span><%# Eval("DepartmentName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("StudyLevelName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("GenderName") %></span></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbPDF" runat="server" class="btn default btn-xs black" OnClick="lbPDF_Click">pdf</asp:LinkButton>

                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetDepartmentsStudyLevelsGenders" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </tbody>
                    </table>

                    <div class="clearfix"></div>
                    <% }
                        else
                        {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center;">
                            <strong>لم يتم إضافة بعد</strong>
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
</asp:Content>
