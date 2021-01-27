<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="MarkRevisionEdit.aspx.cs" Inherits="Instructor_MarkRevision" %>

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
    <asp:Label ID="lblMarkRevisionID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">مراجعة الطلب</span>
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
                    <asp:Repeater ID="Repeter1" runat="server" DataSourceID="SqlDataSource5">
                        <ItemTemplate>
                            <asp:Label ID="lblWorkMark" runat="server" Text='<%# Eval("WorkMark") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblFinalMark" runat="server" Text='<%# Eval("FinalMark") %>' Visible="false"></asp:Label>

                            <div class="form-horizontal">
                                <div class="form-body">
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">رقم الطالب :</label>
                                        <div class="col-md-4" style="padding-top: 6px;">
                                            <span><%# Eval("StudentNo") %></span>
                                        </div>
                                        <label class="col-md-2 control-label">اسم الطالب :</label>
                                        <div class="col-md-4" style="padding-top: 6px;">
                                            <span><%# Eval("StudentName") %></span>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">المساق :</label>
                                        <div class="col-md-4" style="padding-top: 6px;">
                                            <span><%# Eval("CourseArName") %></span>
                                        </div>
                                        <label class="col-md-2 control-label">الشعبة :</label>
                                        <div class="col-md-4" style="padding-top: 6px;">
                                            <span><%# Eval("SectionNum") %></span>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">علامة الطالب :</label>
                                        <div class="col-md-4" style="padding-top: 6px;">
                                            <span><%# Eval("WorkMark").ToString() + " + " + ((Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "من 70" :  ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString())) ? "غياب" : Eval("MidtermMark").ToString())) + " + " + Eval("FinalMark").ToString() + " = " + Eval("TotalMark").ToString() %></span><br />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">أعمال الفصل :</label>
                                        <div class="col-md-4" style="padding-top: 6px;">
                                            <asp:TextBox ID="txtWorkMark" runat="server" CssClass="form-control" Style="height: 26px; width: 150px; text-align: center;" Text='<%# Eval("LastWorkMark") %>' Enabled='<%# !(Convert.ToBoolean(Eval("IsAcceptRequest").ToString()) || Convert.ToBoolean(Eval("IsRejectRequest").ToString())) %>'></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">النهائي :</label>
                                        <div class="col-md-4" style="padding-top: 6px;">
                                            <asp:TextBox ID="txtFinalMark" runat="server" CssClass="form-control" Style="height: 26px; width: 150px; text-align: center;" Text='<%# Eval("LastFinalMark") %>' Enabled='<%# !(Convert.ToBoolean(Eval("IsAcceptRequest").ToString()) || Convert.ToBoolean(Eval("IsRejectRequest").ToString())) %>'></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">سبب التعديل :</label>
                                        <div class="col-md-8" style="padding-top: 6px;">
                                            <asp:TextBox ID="txtUpdateReason" runat="server" CssClass="form-control" Text="" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-actions fluid row">
                                    <div class="row">
                                        <div class="col-md-offset-2 col-md-4">
                                            <asp:Button ID="btnAcceptRequest" runat="server" Text="تعديل الدرجة" CssClass="btn green" OnClick="btnAcceptRequest_Click" Visible='<%# !(Convert.ToBoolean(Eval("IsAcceptRequest").ToString()) || Convert.ToBoolean(Eval("IsRejectRequest").ToString())) %>' />
                                            <asp:Button ID="btnRejectRequest" runat="server" Text="رفض الطلب" CssClass="btn default" OnClick="btnRejectRequest_Click" Visible='<%# !(Convert.ToBoolean(Eval("IsAcceptRequest").ToString())  || Convert.ToBoolean(Eval("IsRejectRequest").ToString())) %>' />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                        ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                        SelectCommand="GetMarkRevision" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblMarkRevisionID" PropertyName="Text" Name="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

