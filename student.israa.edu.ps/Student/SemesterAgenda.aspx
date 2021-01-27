<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="SemesterAgenda.aspx.cs" Inherits="Student_SemesterAgenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu5').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">الأجندة الفصلية</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الأجندة الفصلية</div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="control-label col-md-3">الفصل الدراسي</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" DataSourceID="SqlDataSource3"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetStdProgramSemester" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10" style="margin-right: 8.4%!important; margin-top: 30px!important;">
                            <div>
                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" CssClass="col-md-6">
                                            <ItemTemplate>
                                                <table class="table table-striped table-hover">
                                                    <thead>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 50%">بداية التسجيل</td>
                                                            <td style="width: 20%"><span><%# Eval("RegisterBeginning","{0:dddd}") %></span></td>
                                                            <td style="width: 30%"><span><%# Eval("RegisterBeginning","{0: yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>بداية الدراسة</td>
                                                            <td><span><%# Eval("StudyBeginning","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("StudyBeginning","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>بداية الإضافة</td>
                                                            <td><span><%# Eval("AddBeginning","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("AddBeginning","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>نهاية السحب</td>
                                                            <td><span><%# Eval("DelayEnd","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("DelayEnd","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>بداية الإمتحانات النصفية</td>
                                                            <td><span><%# Eval("StartMidtermExams","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("StartMidtermExams","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>بدء تقديم طلبات المراجعة النصفية</td>
                                                            <td><span><%# Eval("MidtermExamRevisionBeginning","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("MidtermExamRevisionBeginning","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>

                                                        <tr>
                                                            <td>بداية الإمتحانات النهائية</td>
                                                            <td><span><%# Eval("StartFinalExams","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("StartFinalExams","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>بدء تقديم طلبات المراجعة النهائية</td>
                                                            <td><span><%# Eval("MarkRevisionBeginning","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("MarkRevisionBeginning","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </ItemTemplate>
                                        </asp:FormView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT * FROM [StudentAcademicCalendar] WHERE ((SemesterID = @ID) AND ([IsDelete] = 0))">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSemester" Name="ID" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div>

                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource1" CssClass="col-md-6">
                                            <ItemTemplate>
                                                <table class="table table-striped table-hover">
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 50%">نهاية التسجيل</td>
                                                            <td style="width: 20%"><span><%# Eval("RegisterEnd","{0:dddd}") %></span></td>
                                                            <td style="width: 30%"><span><%# Eval("RegisterEnd","{0:yyyy/MM/dd}") %></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>نهاية الدراسة</td>
                                                            <td><span><%# Eval("StudyEnd","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("StudyEnd","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>نهاية الإضافة</td>
                                                            <td><span><%# Eval("AddEnd","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("AddEnd","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>نهاية الإنسحاب</td>
                                                            <td><span><%# Eval("WithdrawEnd","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("WithdrawEnd","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>نهاية الإمتحانات النصفية</td>
                                                            <td><span><%# Eval("EndMidtermExams","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("EndMidtermExams","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>نهاية تقديم طلبات المراجعة النصفية</td>
                                                            <td><span><%# Eval("MidtermExamRevisionEnd","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("MidtermExamRevisionEnd","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>نهاية الإمتحانات النهائية</td>
                                                            <td><span><%# Eval("EndFinalExams","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("EndFinalExams","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>

                                                        <tr>
                                                            <td>نهاية تقديم طلبات المراجعة النهائية</td>
                                                            <td><span><%# Eval("MarkRevisionEnd","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("MarkRevisionEnd","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </ItemTemplate>
                                        </asp:FormView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT * FROM [StudentAcademicCalendar] WHERE ((SemesterID = @ID) AND ([IsDelete] = 0))">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSemester" Name="ID" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
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

