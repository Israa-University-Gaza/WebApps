<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudentCourse.aspx.cs" Inherits="Student_StudentCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu30').addClass("active");
        });
    </script>
    <style>
        .trtd tr, .trtd td, .trtd th, .trtd {
            border: 0px !important;
            text-align: center !important;
        }

            .trtd tr:last-child {
                column-span: all !important;
                text-align: center !important;
            }

            .trtd a {
                text-decoration: none !important;
                transition: all ease-in-out 0.5s;
            }

                .trtd a:hover {
                    color: #808080 !important;
                }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder font-ha">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#">رغبات تسجيل المساقات</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>رغبات تسجيل المساقات</div>
                </div>
                <div class="portlet-body">
                    <br />
                    <br />
                    <div class="row">
                        <div class="form-group">
                            <label class="control-label col-md-3">الفصل الدراسي : </label>
                            <div class="col-md-6">
                                <asp:DropDownList ID="ddlSemester" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetSemesters3" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th style="width: 8%; text-align: center">كود المساق</th>
                                <th style="width: 20%; text-align: center">المساق</th>
                                <th style="width: 12%; text-align: center">عدد الساعات</th>
                                <th style="width: 12%; text-align: center">حالة المساق</th>
                                <th style="width: 12%; text-align: center"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="OfferdCourseID" runat="server" Text='<%# Eval("OfferdCourseID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="CourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="false"></asp:Label>
                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("CourseHours") %></span></td>

                                        <td style="text-align: center">
                                            <span><%# (Eval("CourseStatusID").ToString()=="3")? "<img src='../assets/img/icons/w.png' width='18' height='18' />": "" %></span>
                                            <span><%# (Eval("CourseStatusID").ToString()=="1")? "<img src='../assets/img/icons/11693605_10153855864475809_1372216708_n.gif' width='18' height='18' />": "" %></span>
                                            <span><%# (Eval("CourseStatusID").ToString()=="7")? "<img src='../assets/img/icons/12207740_10153855864445809_964486009_n.jpg ' width='18' height='18' />": "" %></span>
                                  <%--          <span><%# (Eval("IsNotRegisterd").ToString()=="1")? "متبقي": "" %></span>--%>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbStudentCourseAdd" runat="server" class="btn green btn-xs" OnClick="lbStudentCourseAdd_Click" Visible='<%# Convert.ToInt32(Eval("ID"))==0 && Convert.ToBoolean(Eval("IsAccredit"))==false %>'><i class="fa fa-edit"></i> طلب التسجيل</asp:LinkButton>
                                            <asp:LinkButton ID="lbStudentCourseDelete" runat="server" class="btn red btn-xs" OnClick="lbStudentCourseDelete_Click" Visible='<%# Convert.ToInt32(Eval("ID"))>0 && Convert.ToBoolean(Eval("IsAccredit"))==false  %>'><i class="fa fa-edit"></i> إلغاء الطلب</asp:LinkButton>
                                            <span runat="server" visible='<%# Convert.ToInt32(Eval("ID"))>0 && Convert.ToBoolean(Eval("IsAccredit"))==true %>'>تم تأكيد تسجيل المساق من قبل القبول والتسجيل يرجى مراجعة الدائرة</span>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetStudentCourses" SelectCommandType="StoredProcedure">
                                <SelectParameters>

                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
