<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="AdmissionIssueDetails.aspx.cs" Inherits="Admission_AdmissionIssueDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../assets/plugins/ckeditor/ckeditor.js"></script>
    <script src="../assets/scripts/form-validation.js"></script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu3').addClass("active open");
            $('#menu3 a span.arrow').addClass("open");
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
        <li><a href="AdmissionIssueSearch.aspx" class="font-ha">قضايا الطالب
        </a></li>
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
        <div class="portlet box blue">
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
                    <div class="form-group row">
                        <asp:Label ID="Label5" runat="server" Text=" اسم الطالب" CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox ID="StudentName" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Label ID="Label3" runat="server" Text="رقم الطالب" CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtStudentNo" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <asp:Label ID="Label6" runat="server" Text=" كلية الطالب" CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtStudentCollege" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        </div>

                        <asp:Label ID="Label1" runat="server" Text=" القضية" CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox ID="Issue" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <asp:Label ID="Label7" runat="server" Text="تاريخ القضية" CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtIssueDate" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <asp:Label ID="Label2" runat="server" Text="وصف القضية" CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="Description" runat="server" placeholder="" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">

                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-striped table-hover" id="sample_editable_1 ">
                                <thead>
                                    <tr>

                                        <th style="width: 20%;">الجهة المعتمدة</th>
                                        <th style="width: 20%;">الموظف المعتمد</th>
                                        <th style="width: 20%;">رأي المسؤول </th>
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
                                                <td>
                                                    <% if (Permissions.Contains("ReAccredationIssue"))
                                                        { %>
                                                    <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" Visible='<%# ( (Eval("CanDelete").ToString() == "1")) ? true:false %>' OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> التراجع عن الإجراء</a></asp:LinkButton>
                                                    <% } %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaStudentIssue %>' SelectCommand="GetIssueDetails" SelectCommandType="StoredProcedure">
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
        </div>
    </div>
</asp:Content>

