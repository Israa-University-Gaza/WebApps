<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentScholarship.aspx.cs" Inherits="Admission_StudentScholarship" %>

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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
       <asp:Label ID="lblStdStatusID" runat="server" Visible="true"></asp:Label>
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
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
                    <uc1:StudentSideBar runat="server" ID="StudentSideBar" ActiveTab="litab_2" />
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div id="tab1" class="tab-pane active">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="row">
                                    <ContentTemplate>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>منح الطالب</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="divMsg2" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg2" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <label class="col-md-3 control-label">الفصل الدراسي : </label>
                                                <div class="col-md-5">
                                                    <asp:DropDownList ID="ddlSemesterID" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="Semester" DataValueField="SemesterID" AutoPostBack="true"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdSemesters" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <% if (ListView1.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 40%; text-align: center">المنحة</th>
                                                            <th style="width: 20%; text-align: center">قيمة المنحة</th>
                                                            <th style="width: 10%; text-align: center">معتمد</th>
                                                            <th style="width: 30%; text-align: center">التاريخ</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                                            <ItemTemplate>
                                                                <asp:Label ID="StudentScholarshipID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td style="text-align: center"><span><%# Eval("ActionArName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("ActionValue") %></span></td>
                                                                    <td style="text-align: center">
                                                                        <asp:CheckBox ID="cbAcademicAccreditation" runat="server" Checked='<%# Eval("AcademicAccreditation") %>' Enabled="false" />
                                                                    </td>
                                                                    <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd HH:mm tt}") %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                                            SelectCommand="GetStudentScholarshipBySemesterID" SelectCommandType="StoredProcedure">
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
                                                        <strong>لا يوجد منح مضافة للطالب</strong>
                                                        <% }
                                                            else
                                                            { %>
                                                        <strong>اختر الفصل الدراسي لعرض منح الطالب</strong>
                                                        <% } %>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
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

