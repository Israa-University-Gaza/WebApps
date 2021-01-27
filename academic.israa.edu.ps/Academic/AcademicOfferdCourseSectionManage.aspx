<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="AcademicOfferdCourseSectionManage.aspx.cs" Inherits="Academic_AcademicOfferdCourseSectionManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicOffer').addClass("active open");
            $('#AcademicOffer_3 a').css("background-color", "#575757");
            $('#AcademicOffer a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>المساقات المطروحة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <label class="control-label col-md-2">الفصل الدراسي</label>
                        <div class="col-md-5">
                            <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([Code] <> '111111111') AND ([IsActive] = 1) AND ([IsDelete] = 0) AND (ProgramID=2)) ORDER BY ID DESC"></asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <label class="col-md-2 control-label">الكلية</label>
                        <div class="col-md-5">
                            <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource7" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [College] WHERE (([IsActive] = 1) AND ([IsDelete] = 0))"></asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <hr />
                    <div class="row">
                        <% if (Repeater1.Items.Count > 0)
                            { %>
                        <table class="table table-condensed table-hover">
                            <thead>
                                <tr>
                                    <td style="text-align: center; width: 10%; font-weight: bold">المساق</td>
                                    <td style="text-align: center; width: 5%; font-weight: bold">الشعبة</td>
                                    <td style="text-align: center; width: 10%; font-weight: bold">المحاضر</td>
                                    <td style="text-align: center; width: 40%; font-weight: bold">المواعيد</td>
                                    <td style="text-align: center; width: 5%; font-weight: bold">فعال</td>
                                    <td style="text-align: center; width: 5%; font-weight: bold"></td>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <asp:Label ID="OfferdCourseID" runat="server" Text='<%# Eval("OfferdCourseID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="SectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="IsClosed" runat="server" Text='<%# Eval("IsClosed").ToString() %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                            <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                            <td style="text-align: center;"><%# (Eval("EmployeeID").ToString()!="9999")? Eval("Employee") :  Eval("PTEmployee") %></td>
                                            <td style="text-align: center;">
                                                <div class="portlet-body form">
                                                    <div class="form-horizontal">
                                                        <div class="form-body">
                                                            <asp:Label ID="lblLectureID" runat="server" Text="" Visible="false"></asp:Label>
                                                            <div class="form-group">
                                                                <div class="col-md-3" style="padding-right:0">
                                                                    <asp:DropDownList ID="ddlRoomID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, Name FROM [Room] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر القاعة'"></asp:SqlDataSource>
                                                                </div>
                                                                <div class="col-md-3" style="padding-right:0">
                                                                    <asp:DropDownList ID="ddlDayID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [ConstantDetails] WHERE ((ConstantID=4) and ([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر اليوم'"></asp:SqlDataSource>
                                                                </div>
                                                                <div class="col-md-2" style="padding-right:0">
                                                                    <asp:TextBox ID="txtFromHour" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1 clockface-open" placeholder="من" Style="text-align: center;"></asp:TextBox>
                                                                </div>
                                                                <div class="col-md-2" style="padding-right:0">
                                                                    <asp:TextBox ID="txtToHour" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1 clockface-open" placeholder="الي" Style="text-align: center;"></asp:TextBox>
                                                                </div>
                                                                <div class="col-md-1" style="padding-right:0">
                                                                    <asp:CheckBox ID="cbLectureIsActive" runat="server" Text="فعال" Checked="true" Visible="false" />
                                                                    <asp:Button ID="btnLectureSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnLectureSave_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr />
                                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LectureID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                        <span><%# Eval("Room") %></span>
                                                        <span><%# Eval("CDay") %></span>
                                                        <span><%# Eval("FromToHour") %></span>
                                                         <asp:LinkButton ID="lbLectureDelete" runat="server" class="btn default btn-xs purple" OnClick="lbLectureDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                    SelectCommand="LectureGetBySectionID" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
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
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetCollegeOfferdCourseSections" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
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

