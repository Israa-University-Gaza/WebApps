<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StdSemesterMarksBITrans.aspx.cs" Inherits="Academic_StdSemesterMarksBITrans" %>


<%@ Register Src="~/Academic/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_1 a').css("background-color", "#575757");
            $('#Student a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
       <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
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
                    <uc1:StudentSideBar ActiveTab="StdSemesterMarksBITrans" runat="server" ID="StudentSideBar" />
                    <div style="width: 81%; float: right;">
                           <div id="tab16" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h4>علامات المساقات ماقبل المعادلة</h4>
                                            </div>
                                            <div class="col-md-9 isra-pl-0">
                                                <div id="divMsg1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                    <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row" style="border-bottom: 1px solid #ddd; padding: 15px 0;">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">الفصل الدراسي</label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="ddlStdSemester22" runat="server" class="form-control" DataTextField="Semester" DataValueField="ID" AutoPostBack="true" DataSourceID="SqlDataSource18"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource18" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetStdSemesterWithoutTrans" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 15px;">
                                            <% if (Repeater17.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%">كود المساق</th>
                                                        <th style="width: 15%; text-align: center">المساق</th>
                                                        <th style="width: 10%; text-align: center">أعمال الفصل</th>
                                                        <th style="width: 10%; text-align: center">العلامة الفصلية</th>
                                                        <th style="width: 10%; text-align: center">العلامة النهائية</th>
                                                        <th style="width: 10%; text-align: center">العلامة</th>
                                                        <th style="width: 35%; text-align: center"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater17" runat="server" DataSourceID="SqlDataSource19">
                                                        <ItemTemplate>
                                                            <asp:Label ID="MarkID" runat="server" Text='<%# Eval("MarkID") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                <td style="text-align: center"><span>
                                                                    <asp:Label ID="lblWorkMark" runat="server" Text='<%# Eval("WorkMark") %>'></asp:Label>
                                                                    <asp:TextBox ID="txtWorkMark" runat="server" CssClass="form-control text-center" Text='<%# Eval("WorkMark") %>' Visible="false"></asp:TextBox>
                                                                    <asp:Button ID="btnSaveWorkMark" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSaveWorkMark_Click" Visible="false" />
                                                                    <asp:Button ID="btnCancelWorkMark" runat="server" Text="إلغاء" CssClass="btn red" OnClick="btnCancelWorkMark_Click" Visible="false" />
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="lblMidtermMark" runat="server" Text='<%# (Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "غير مكتمل": ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())) ? "غياب" : Eval("MidtermMark")) %>'></asp:Label>
                                                                    <asp:TextBox ID="txtMidtermMark" runat="server" CssClass="form-control text-center" Text='<%# Eval("MidtermMark") %>' Visible="false"></asp:TextBox>
                                                                    <asp:Button ID="btnSaveMidtermMark" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSaveMidtermMark_Click" Visible="false" />
                                                                    <asp:Button ID="btnCancelMidtermMark" runat="server" Text="إلغاء" CssClass="btn red" OnClick="btnCancelMidtermMark_Click" Visible="false" />
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="lblFinalMark" runat="server" Text='<%# Eval("FinalMark") %>'></asp:Label>
                                                                    <asp:TextBox ID="txtFinalMark" runat="server" CssClass="form-control text-center" Text='<%# Eval("FinalMark") %>' Visible="false"></asp:TextBox>
                                                                    <asp:Button ID="btnSaveFinalMark" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSaveFinalMark_Click" Visible="false" />
                                                                    <asp:Button ID="btnCancelFinalMark" runat="server" Text="إلغاء" CssClass="btn red" OnClick="btnCancelFinalMark_Click" Visible="false" />
                                                                </td>
                                                                <td style="text-align: center"><span><%# Eval("TotalMark") %></span></td>
                                                                <td style="text-align: center">
                                                                    <% if (Permissions.Contains("MarkEdit"))
                                                                        { %>
                                                                    <asp:Button ID="btnEditMark" runat="server" Text="تعديل الدرجة" CssClass="btn green" OnClick="btnEditMark_Click" />
                                                                    <% } %>
                                                                    <% if (Permissions.Contains("MidtermIncomplete"))
                                                                        { %>
                                                                    <asp:Button ID="btnIsMidtermIncomplete2" runat="server" Text="إحتساب من 70" CssClass="btn green" OnClick="btnIsMidtermIncomplete2_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إحتساب علامة الإمتحان النهائي من 70 ؟');" Visible='<%# (!Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? true:false %>' />
                                                                    <% } %>
                                                                    <% if (Permissions.Contains("FinalMarkIncomplet"))
                                                                        { %>
                                                                    <asp:LinkButton ID="lbFinalMarkIncompleteAdd" runat="server" CssClass="btn default btn-xs black" OnClick="lbFinalMarkIncompleteAdd_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود تقديم طلب غير مكتمل ؟');">تقديم طلب غير مكتمل</asp:LinkButton>
                                                                    <% } %>
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <span><%# (Eval("IsPlanCourse").ToString() == "1") ? "داخل الخطة" : "خارج الخطة" %></span>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource19" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdSemesterMarksBITrans" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlStdSemester22" PropertyName="SelectedValue" Name="StdSemesterID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تسجيل مساقات لهذا الفصل الدراسي</strong>
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
        </div>
    </div>
</asp:Content>

