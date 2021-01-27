<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="Accept-RejectStudentsIssues.aspx.cs" Inherits="Academic_Accept_RejectStudentsIssues" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentIssue').addClass("active open");
            $('#StudentIssue a span.arrow').addClass("open");
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
                <span>قضاياالطلاب</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <% if (IsPermissionsContains("AcademicIssueShow"))
                    { %>
                <li class="font-ha"><a href="AcademicIssueShow.aspx">قضايا الطلاب</a></li>

                <% } %>
                <% if (IsPermissionsContains("DeanIssueShow"))
                    { %>

                <li class="font-ha"><a href="DeanIssueShow.aspx">قضايا الطلاب</a></li>
                <% } %>
                <% if (IsPermissionsContains("RequirementDeanIssueShow"))
                    { %>

                <li class="font-ha"><a href="RequirementDeanIssueShow.aspx">قضايا الطلاب</a></li>
                <% } %>
            </ul>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="UserID" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblIssueID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblPlaceID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lbMinOrderDepartment" runat="server" Text="" Visible="false"></asp:Label>
    <div class="col-md-12 ">
        <div id="Div1" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>عرض تفاصيل قضية الطالب
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
                                <th style="width: 15%;">الجهة المعتمدة</th>
                                <th style="width: 15%;">الشخص المعتمد </th>
                                <th style="width: 35%;">رأي المسؤول </th>
                                <th style="width: 20%; text-align: center;">حالة القضية</th>
                                <th style="width: 15%;">التاريخ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <td><%# Eval("AccreditedDepartment") %></td>
                                        <td><%# Eval("AccerdationEmployeeName") %></td>
                                        <td><%# Eval("AccreditedAcademicOpinion") %></td>
                                        <td style="text-align: center"><%# Eval("IsuueStatus") %></td>
                                        <td><%# Eval("AccerdationDate") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:UniversityStudentIssues %>' SelectCommand="GetIssueDetails" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblIssueID" PropertyName="Text" Name="StudentIssueID" Type="Int32"></asp:ControlParameter>
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
                            <strong>لايوجد أي اجراء إداري مسبق للقضية</strong>
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
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>الإجراء الإداري لقضية الطالب
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group row">
                        <asp:Label ID="Label5" runat="server" Text=" اسم الطالب" CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="StudentName" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label ID="Label7" runat="server" Text=" رقم الطالب" CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txtStudentNo" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="Label6" runat="server" Text=" كلية الطالب" CssClass="col-md-2 control-label"></asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtStudentCollege" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <asp:Label ID="Label1" runat="server" Text=" القضية" CssClass="col-md-2 control-label"></asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox ID="Issue" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <asp:Label ID="Label2" runat="server" Text="وصف القضية" CssClass="col-md-2 control-label"></asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox ID="Description" runat="server" placeholder="" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <asp:Label ID="Label3" runat="server" Text="رأي المسؤول" CssClass="col-md-2 control-label"></asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox ID="Opinion" runat="server" placeholder="" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="form-actions ">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button ID="btnAccept" runat="server" Text="قبول" OnClick="btnAccept_Click" CssClass="btn green" />
                        <asp:Button ID="btnReject" runat="server" Text="رفض" OnClick="btnReject_Click" CssClass="btn red" />
                        <asp:Button ID="btnReturn" runat="server" Text="ارجاع" OnClick="btnReturn_Click" CssClass="btn default" />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

