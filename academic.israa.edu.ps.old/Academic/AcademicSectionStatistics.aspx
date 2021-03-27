<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="AcademicSectionStatistics.aspx.cs" Inherits="Academic_AcademicSectionStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إحصائيات الشعب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row" style="margin: 25px 0 20px 0;">
                        <div class="col-md-12">
                            <label class="col-md-2 control-label">المساق</label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="CourseArName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetAcademicOfferdCourses" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="btnView" runat="server" Text="عرض" CssClass="btn green" OnClick="btnView_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="row">

                         <% if (Repeater1.Items.Count > 0)
                           { %>
                        <table class="table table-condensed table-hover">
                            <thead>
                                <tr>
                                    <td style="text-align: center; width: 10%; font-weight: bold">الشعبة</td>
                                    <td style="text-align: center; width: 10%; font-weight: bold"></td>
                                    <td style="text-align: center; width: 20%; font-weight: bold">المحاضر</td>
                                    <td style="text-align: center; width: 22%; font-weight: bold">المواعيد</td>
                                    <td style="text-align: center; width: 10%; font-weight: bold">طلاب/طالبات</td>
                                    <td style="text-align: center; width: 8%; font-weight: bold">فعال</td>
                                    <td style="text-align: center; width: 20%; font-weight: bold"></td>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="OfferdCourseID" runat="server" Text='<%# Eval("OfferdCourseID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="SectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="IsClosed" runat="server" Text='<%# Eval("IsClosed").ToString() %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                            <td style="text-align: center;">نظري</td>
                                            <td style="text-align: center;"><%# Eval("Employee") %> <%# Eval("PTEmployee") %></td>
                                            <td style="text-align: center;">
                                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                    <ItemTemplate>
                                                        <span><%# Eval("Room") %></span>
                                                        <span><%# Eval("CDay") %></span>
                                                        <span><%# Eval("FromToHour") %></span>
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                    SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td style="text-align: center;"><%# (Eval("Gender").ToString()=="1")? "طلاب" : "طالبات"  %></td>
                                            <td style="text-align: center;">
                                                <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbSectionIsActive1_CheckedChanged" Checked='<%# Eval("IsActive") %>' Enabled='<%# (Permissions.Contains("SectionActivate"))? true:false %>' /></td>
                                            <td style="text-align: center;">
                                                <% if (Permissions.Contains("SectionEdit"))
                                                   { %>
                                                <asp:LinkButton ID="lbSectionEdit1" runat="server" class="btn default btn-xs black" OnClick="lbSectionEdit1_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <%  } %>
                                                <% if (Permissions.Contains("SectionDelete"))
                                                   { %>
                                                <asp:LinkButton ID="lbSectionDelete1" runat="server" class="btn default btn-xs purple" OnClick="lbSectionDelete1_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                <%  } %>
                                            </td>
                                        </tr>
                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                            <ItemTemplate>
                                                <asp:Label ID="SectionID2" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <tr <%# (Convert.ToInt32(Eval("StdSectionID").ToString())> 0)? "style='background-color:#F2F2F2'":"" %>>
                                                    <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                                    <td style="text-align: center;">مناقشة</td>
                                                    <td style="text-align: center;"><%# Eval("Employee") %> <%# Eval("PTEmployee") %></td>
                                                    <td style="text-align: center;">
                                                        <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
                                                            <ItemTemplate>
                                                                <span><%# Eval("Room") %></span>
                                                                <span><%# Eval("CDay") %></span>
                                                                <span><%# Eval("FromToHour") %></span>
                                                                <br />
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="SectionID2" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td style="text-align: center;"><%# (Eval("Gender").ToString()=="1")? "طلاب" : "طالبات"  %></td>
                                                    <td style="text-align: center;">
                                                        <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbSectionIsActive2_CheckedChanged" Checked='<%# Eval("IsActive") %>' Enabled='<%# (Permissions.Contains("SectionActivate"))? true:false %>' /></td>
                                                    <td style="text-align: center;">
                                                        <% if (Permissions.Contains("SectionEdit"))
                                                           { %>
                                                        <asp:LinkButton ID="lbSectionEdit2" runat="server" class="btn default btn-xs black" OnClick="lbSectionEdit2_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                        <%  } %>
                                                        <% if (Permissions.Contains("SectionDelete"))
                                                           { %>
                                                        <asp:LinkButton ID="lbSectionDelete2" runat="server" class="btn default btn-xs purple" OnClick="lbSectionDelete2_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                        <%  } %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetDissSectionsBySectionID" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <asp:Label ID="SectionID3" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                                    <td style="text-align: center;">معمل</td>
                                                    <td style="text-align: center;"><%# Eval("Employee") %> <%# Eval("PTEmployee") %></td>
                                                    <td style="text-align: center;">
                                                        <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
                                                            <ItemTemplate>
                                                                <span><%# Eval("Room") %></span>
                                                                <span><%# Eval("CDay") %></span>
                                                                <span><%# Eval("FromToHour") %></span>
                                                                <br />
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="SectionID3" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td style="text-align: center;"><%# (Eval("Gender").ToString()=="1")? "طلاب" : "طالبات"  %></td>
                                                    <td style="text-align: center;">
                                                        <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbSectionIsActive3_CheckedChanged" Checked='<%# Eval("IsActive") %>' Enabled='<%# (Permissions.Contains("SectionActivate"))? true:false %>' /></td>
                                                    <td style="text-align: center;">
                                                        <% if (Permissions.Contains("SectionEdit"))
                                                           { %>
                                                        <asp:LinkButton ID="lbSectionEdit3" runat="server" class="btn default btn-xs black" OnClick="lbSectionEdit3_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                        <%  } %>
                                                        <% if (Permissions.Contains("SectionDelete"))
                                                           { %>
                                                        <asp:LinkButton ID="lbSectionDelete3" runat="server" class="btn default btn-xs purple" OnClick="lbSectionDelete3_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                        <%  } %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetLabSectionsBySectionID" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <% }
                           else
                           { %>
                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                            <div class="col-xs-11" style="text-align: center">
                                <strong>لا يوجد شعب مطروحة يمكن عرضها لهذا المساق</strong>
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

