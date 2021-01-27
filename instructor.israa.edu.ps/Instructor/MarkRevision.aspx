<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="MarkRevision.aspx.cs" Inherits="Instructor_MarkRevision" %>

<asp:Content ID="Style" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Script" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#StudentMarks, #MarkRevision').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>طلبات المراجعة</span>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">طلبات المراجعة</span>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div id="divMsg" runat="server" class="alert alert-dismissable alert-top alert-success" visible="false">
                                <asp:Label ID="lblMsg" runat="server" Style="font-weight: bold; float: right;" Text=""></asp:Label>
                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <%--                    <div class="row">
                        <div class="col-md-12">
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-12" style="text-align: center">
                                    <span>بعد قبول طلب المراجعة يمكنك تعديل العلامة من علامات الطلاب</span>
                                    <div style="clear: both"></div>
                                </div>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <br />--%>
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col" style="width: 2%; text-align: center">#</th>
                                        <th scope="col" style="width: 10%; text-align: center">رقم الطالب</th>
                                        <th scope="col" style="width: 12%; text-align: center">اسم الطالب</th>
                                        <th scope="col" style="width: 12%; text-align: center">المساق</th>
                                        <th scope="col" style="width: 5%; text-align: center">الشعبة</th>
                                        <th scope="col" style="width: 20%; text-align: center">درجة الطالب</th>
                                        <th scope="col" style="width: 17%; text-align: center"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                        <ItemTemplate>
                                            <asp:Label ID="MarkRevisionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblWorkMark" runat="server" Text='<%# Eval("WorkMark") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblFinalMark" runat="server" Text='<%# Eval("FinalMark") %>' Visible="false"></asp:Label>
                                            <tr>
                                                <td style="text-align: center; font-size: 12px;"><span><%# Eval("RowNo") %></span></td>
                                                <td style="text-align: center; font-size: 12px;"><span><%# Eval("StudentNo") %></span></td>
                                                <td style="text-align: center; font-size: 12px;"><span><%# Eval("StudentName") %></span></td>
                                                <td style="text-align: center; font-size: 12px;"><span><%# Eval("CourseArName") %></span></td>
                                                <td style="text-align: center; font-size: 12px;"><span><%# Eval("SectionNum") %></span></td>
                                                <td style="text-align: center;">
                                                    <span><%# Eval("WorkMark").ToString() + " + " + ((Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "من 70" :  ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())) ? "غياب" : Eval("MidtermMark").ToString())) + " + " + Eval("FinalMark").ToString() + " = " + Eval("TotalMark").ToString() %></span><br />
                                                    <span runat="server" visible='<%# (Convert.ToBoolean(Eval("IsAcceptRequest").ToString())) %>'><%# Eval("LastWorkMark").ToString() + " + " + ((Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "من 70" :  ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())) ? "غياب" : Eval("MidtermMark").ToString())) + " + " + Eval("LastFinalMark").ToString() + " = " + Eval("LastTotalMark").ToString() %></span>
                                                </td>
                                                <%-- <td style="padding:6px 8px">
                                                    <asp:TextBox ID="txtWorkMark" runat="server" CssClass="form-control" Style="height: 26px; text-align: center;" Text='<%# Eval("LastWorkMark") %>' Enabled='<%# !(Convert.ToBoolean(Eval("IsAcceptRequest").ToString()) || Convert.ToBoolean(Eval("IsRejectRequest").ToString())) %>'></asp:TextBox></td>
                                                <td style="padding:6px 8px">
                                                    <asp:TextBox ID="txtFinalMark" runat="server" CssClass="form-control" Style="height: 26px; text-align: center;" Text='<%# Eval("LastFinalMark") %>' Enabled='<%# !(Convert.ToBoolean(Eval("IsAcceptRequest").ToString()) || Convert.ToBoolean(Eval("IsRejectRequest").ToString())) %>'></asp:TextBox></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("LastTotalMark") %></span></td>
                                                --%>
                                                <td style="text-align: center;">
                                                    <asp:Button ID="btnAcceptRequest" runat="server" Text="تعديل الدرجة" CssClass="btn green" Style="height: 26px; padding: 0 8px" OnClick="btnAcceptRequest_Click" Visible='<%# !(Convert.ToBoolean(Eval("IsAcceptRequest").ToString()) || Convert.ToBoolean(Eval("IsRejectRequest").ToString())) %>' />
                                                    <asp:Button ID="btnRejectRequest" runat="server" Text="رفض الطلب" CssClass="btn default" Style="height: 26px; padding: 0 8px" OnClick="btnRejectRequest_Click" Visible='<%# !(Convert.ToBoolean(Eval("IsAcceptRequest").ToString())  || Convert.ToBoolean(Eval("IsRejectRequest").ToString())) %>' />
                                                    <span><%# (Convert.ToBoolean(Eval("IsAcceptRequest").ToString())) ? "تم قبول الطلب" : (Convert.ToBoolean(Eval("IsRejectRequest").ToString()) ? "تم رفض الطلب" : "") %></span>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                        SelectCommand="GetInstructorMarkRevision" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                            <asp:Parameter DefaultValue="15" Name="SemesterID" Type="Int32"></asp:Parameter>
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
    </div>
</asp:Content>

