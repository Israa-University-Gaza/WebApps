﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="DeanMarkRevision.aspx.cs" Inherits="Academic_DeanMarkRevision" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#DeanMarkRevision').addClass("active open");
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
                <span>طلبات المراجعة</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>علامات الطلاب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <label class="col-md-2 control-label">الكلية</label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource7" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetCollegeByDean" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <label class="control-label col-md-2">الفصل الدراسي</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Semester] ORDER BY ID DESC"></asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="row">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col" style="width: 12%; text-align: center">المساق</th>
                                    <th scope="col" style="width: 5%; text-align: center">الشعبة</th>
                                    <th scope="col" style="width: 8%; text-align: center">اسم الطالب</th>
                                    <th scope="col" style="width: 5%; text-align: center">محاضر</th>
                                    <th scope="col" style="width: 5%; text-align: center">عميد</th>
                                    <th scope="col" style="width: 5%; text-align: center">نائب أكاديمي</th>
                                    <th scope="col" style="width: 10%; text-align: center">العلامة</th>
                                    <th scope="col" style="width: 20%; text-align: center">سبب التعديل</th>
                                    <th scope="col" style="width: 5%; text-align: center">المعدل</th>
                                    <th scope="col" style="width: 15%; text-align: center"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                    <ItemTemplate>
                                        <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("StdSectionID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="MarkRevisionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("CourseName") %></span></td>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;"><span title='<%# Eval("EmployeeName") %>'><%# Eval("SectionNum") %></span></td>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentName") %></span></td>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;">
                                                <span style="color: green"><%# Convert.ToBoolean(Eval("IsAcceptRequest").ToString()) ? "مقبول": ""  %></span>
                                                <span style="color: red"><%# Convert.ToBoolean(Eval("IsRejectRequest").ToString()) ? "مرفوض": ""  %></span>
                                            </td>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;">
                                                <span style="color: green"><%# Convert.ToBoolean(Eval("IsDeanAccept").ToString()) ? "مقبول": ""  %></span>
                                                <span style="color: red"><%# Convert.ToBoolean(Eval("IsDeanReject").ToString()) ? "مرفوض": ""  %></span>
                                            </td>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;">
                                                <span style="color: green"><%# Convert.ToBoolean(Eval("IsAcademicAccept").ToString()) ? "مقبول": ""  %></span>
                                                <span style="color: red"><%# Convert.ToBoolean(Eval("IsAcademicReject").ToString()) ? "مرفوض": ""  %></span>
                                            </td>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;">
                                                <span>(<%# Eval("WorkMark") %> + <%# Eval("MidtermMark") %> + <%# Eval("FinalMark") %>) = <%# Eval("TotalMark") %></span>
                                                <br />
                                                <span>(<%# Eval("NewWorkMark") %> + <%# Eval("MidtermMark") %> + <%# Eval("NewFinalMark") %>) = <%# Eval("NewTotalMark") %></span>
                                            </td>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;">
                                                <span><%# Eval("UpdateReason") %></span>
                                            </td>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;">
                                                <span><%# Eval("SemesterGPA") %></span>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnAcceptRequest" runat="server" Text="إعتماد" CssClass="btn green" Style="height: 26px; padding: 0 15px" OnClick="btnAcceptRequest_Click" Visible='<%#(Convert.ToBoolean(Eval("IsAcceptRequest").ToString()) && !Convert.ToBoolean(Eval("IsDeanAccept").ToString()) && !Convert.ToBoolean(Eval("IsDeanReject").ToString())  ) ? true :false %>' />
                                                <%--<asp:Button ID="btnMarkUnaccreditation" runat="server" Text="ارجاع" CssClass="btn green" OnClick="btnMarkUnaccreditation_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إلغاء إعتماد علامة الطالب ؟');" Visible='<%#(Convert.ToBoolean(Eval("IsAcceptRequest").ToString()) && !Convert.ToBoolean(Eval("IsDeanAccept").ToString())&& !Convert.ToBoolean(Eval("IsDeanReject").ToString())  ) ? true :false %>' />--%>
                                                <asp:Button ID="btnRejectRequest" runat="server" Text="رفض الطلب" CssClass="btn default" Style="height: 26px; padding: 0 15px" OnClick="btnRejectRequest_Click" Visible='<%#(Convert.ToBoolean(Eval("IsAcceptRequest").ToString()) && !Convert.ToBoolean(Eval("IsDeanAccept").ToString())&& !Convert.ToBoolean(Eval("IsDeanReject").ToString())  ) ? true :false %>' />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetCollegeMarkRevision" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <% }
                            else
                            {%>
                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                            <div class="col-xs-11" style="text-align: center">
                                <strong>لا يوجد طلبات مراجعة</strong>
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
</asp:Content>

