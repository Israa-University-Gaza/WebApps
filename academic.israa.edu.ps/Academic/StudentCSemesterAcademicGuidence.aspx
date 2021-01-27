﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StudentCSemesterAcademicGuidence.aspx.cs" Inherits="Academic_StudentCSemesterAcademicGuidence" %>


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
                    <uc1:StudentSideBar ActiveTab="StudentCSemesterAcademicGuidence" runat="server" ID="StudentSideBar" />
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                         <div id="tab15" class="" runat="server" clientidmode="Static">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>كشف الإرشاد الأكاديمي</h4>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if (Repeater14.Items.Count > 0)
                                                { %>
                                            <asp:Repeater ID="Repeater14" runat="server" DataSourceID="SqlDataSource22">
                                                <ItemTemplate>
                                                    <div class="col-md-12 isra-clear">
                                                        <asp:Label ID="PlanID" runat="server" Text='<%# Eval("PlanID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="CSemesterID" runat="server" Text='<%# Eval("CSemesterID") %>' Visible="false"></asp:Label>
                                                        <div class="portlet">
                                                            <div class="portlet-title">
                                                                <div class="caption"><i class="fa fa-briefcase" style="width: 25px;"></i><span class="font-ha"><%# Eval("CSemester") %></span></div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="width: 15%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                                <th style="width: 35%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                                <th style="width: 20%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . الساعات</th>
                                                                                <th style="width: 30%; text-align: center"></th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <asp:Repeater ID="Repeater141" runat="server" DataSourceID="SqlDataSource141">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                                        <td style="text-align: center"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                                        <td style="text-align: center">
                                                                                            <span><%# (Eval("IsRegisterCourse").ToString()=="1")? "<img src='../assets/img/icons/11693605_10153855864475809_1372216708_n.gif' width='18' height='18' />": "" %></span>
                                                                                            <span><%# (Eval("IsDelayCourse").ToString()=="1")? "سحب": "" %></span>
                                                                                            <span><%# (Eval("IsWithdrawCourse").ToString()=="1")? "إنسحاب": "" %></span>
                                                                                            <span><%# (Eval("IsIncompleteCourse").ToString()=="1")? "غير مكتمل": "" %></span>
                                                                                            <span><%# (Eval("IsRepeatCourse").ToString()=="1")? "إعادة": "" %></span>
                                                                                            <span><%# (Eval("IsSuccessfulCourse").ToString()=="1")? "<img src='../assets/img/icons/12226411_10153855864455809_1009013865_n.jpg' width='18' height='18' />": "" %></span>
                                                                                            <span><%# (Eval("IsFailureCourse").ToString()=="1")?"<img src='../assets/img/icons/12207740_10153855864445809_964486009_n.jpg' width='18' height='18' />": "" %></span>
                                                                                            <span><%# (Eval("IsExternalTransformationCourse").ToString()=="1")?"<img src='../assets/img/icons/12036176_10153855864495809_1572926047_n.gif' width='18' height='18' />": "" %></span>
                                                                                            <span><%# (Eval("IsInternalTransformationCourse").ToString()=="1")?"<img src='../assets/img/icons/InternalTrans.png' width='18' height='18' />": "" %></span>
                                                                                            <span><%# (Eval("IsAvailableCourse").ToString()=="1")? "<img src='../assets/img/icons/sign_available.png' width='18' height='18' />": "" %></span>
                                                                                        </td>
                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                            <tr>
                                                                                <td colspan="2" style="text-align: center" class="font-ln">مجموع الساعات</td>
                                                                                <td style="text-align: center"><span><%# Eval("SumOfHours") %></span></td>
                                                                                <td></td>
                                                                            </tr>
                                                                            <asp:SqlDataSource ID="SqlDataSource141" runat="server"
                                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetStudentCSemesterAcademicGuidence" SelectCommandType="StoredProcedure">
                                                                                <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                                    <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
                                                                                </SelectParameters>
                                                                            </asp:SqlDataSource>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource22" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStdSemesterPlan" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <div class="row">
                                                <div class="col-md-2">
                                                    مفاتيح الرموز :
                                                </div>
                                                <div class="col-md-2">
                                                    <img src="../assets/img/icons/11693605_10153855864475809_1372216708_n.gif" width="18" height="18" />
                                                    تسجيل
                                                </div>
                                                <div class="col-md-2">

                                                    <img src="../assets/img/icons/12226411_10153855864455809_1009013865_n.jpg" width="18" height="18" />
                                                    ناجح
                                                </div>
                                                <div class="col-md-2">
                                                    <img src="../assets/img/icons/12207740_10153855864445809_964486009_n.jpg" width="18" height="18" />
                                                    راسب
                                                </div>
                                                <div class="col-md-2">
                                                    <img src="../assets/img/icons/12036176_10153855864495809_1572926047_n.gif" width="18" height="18" />
                                                    معادلة خارجية
                                                </div>
                                                <div class="col-md-2">
                                                    <img src="../assets/img/icons/InternalTrans.png" width="18" height="18" />
                                                    معادلة داخلية
                                                </div>
                                            </div>
                                            <% }
                                                else
                                                {%>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>لم يتم تعين خطة دراسية للطالب</strong>
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
    </div>
</asp:Content>

