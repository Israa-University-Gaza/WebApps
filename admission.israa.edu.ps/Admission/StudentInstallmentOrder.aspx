<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentInstallmentOrder.aspx.cs" Inherits="Admission_StudentInstallmentOrder" %>

<%@ Register Src="~/Admission/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ChangePassword.aspx" class="font-ha">الطالب
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblSemesterID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStdStatusID" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">

                    <uc1:StudentSideBar runat="server" ID="StudentSideBar" ActiveTab="StudentInstallmentOrder" />

                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div id="tab1" class="tab-pane active">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="row">
                                    <ContentTemplate>
                                      <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">
                                    <h4>أقساط الطالب</h4>
                                </div>
                                <div class="col-md-9 isra-pl-0">
                                    <div id="divMsg" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                        <asp:Label ID="lblMsg" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="margin: 10px 0 15px 0" />
                            <div class="row">
                                <label class="col-md-3 control-label">الفصل الدراسي : </label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlSemesterID" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                </div>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsActive] = 1) And ([IsDelete] = 0) And Code<>'111111111') order by ID DESC"></asp:SqlDataSource>
                            </div>
                            <br />
                            <div class="row">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 20%; text-align: center">عدد ساعات التسجيل</th>
                                            <th style="width: 14%; text-align: center">المبلغ المدفوع</th>
                                            <th style="width: 14%; text-align: center">المبلغ المتبقي</th>
                                            <th style="width: 13%; text-align: center">عدد الأقساط</th>
                                            <th style="width: 20%; text-align: center">مجموع الأقساط</th>
                                            <th style="width: 5%; text-align: center">معتمد</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource8">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="InstallmentOrderID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <td style="text-align: center"><span><%# Eval("NumOfHours") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("PaidAmount") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("RemainingAmount") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("CountofInstallments") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("SumOfInstallments") %></span></td>
                                                    <td style="text-align: center">
                                                        <asp:CheckBox ID="cbAccreditation" runat="server" Checked='<%# Eval("Accreditation") %>' Enabled="false" />
                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetStudentInstallmentOrder" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlSemesterID" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>

                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                        <% if (ddlSemesterID.SelectedValue != "-1")
                                            { %>
                                        <strong>لا يوجد طلبات تقسيط للطالب</strong>
                                        <% }
                                            else
                                            { %>
                                        <strong>اختر الفصل الدراسي لعرض طلبات تقسيط الطالب</strong>
                                        <% } %>
                                        <div style="clear: both"></div>
                                    </div>
                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                    <div style="clear: both"></div>
                                </div>
                                <% } %>
                            </div>



                            <div class="row">
                                <% if (ListView3.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 25%; text-align: center">القسط</th>
                                            <th style="width: 15%; text-align: center">قيمة القسط</th>
                                            <th style="width: 15%; text-align: center">تاريخ الطلب</th>
                                            <th style="width: 15%; text-align: center">تاريخ السداد</th>
                                            <th style="width: 5%; text-align: center">معتمد</th>
                                            <th style="width: 5%; text-align: center">مسدد</th>
                                            <th style="width: 5%; text-align: center">موقوف</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <asp:Label ID="StudentInstallmentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td style="text-align: center"><span><%# Eval("InstallmentName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("InstallmentValue") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("RequestDate") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("RepayDate") %></span></td>
                                                    <td style="text-align: center">
                                                        <asp:CheckBox ID="cbAcademicAccreditation" runat="server" Checked='<%# Eval("AcademicAccreditation") %>' Enabled="false" />
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:CheckBox ID="cbIsPaid" runat="server" Checked='<%# Eval("IsPaid") %>' Enabled="false" />
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:CheckBox ID="cbIsClosed" runat="server" Checked='<%# Eval("IsClosed") %>' Enabled="false" />
                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                            SelectCommand="GetStudentInstallmentBySemesterID" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlSemesterID" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                        <% if (ddlSemesterID.SelectedValue != "-1")
                                            { %>
                                        <strong>لا يوجد أقساط مالية علي الطالب</strong>
                                        <% }
                                            else
                                            { %>
                                        <strong>اختر الفصل الدراسي لعرض أقساط الطالب</strong>
                                        <% } %>
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
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
