<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StdOfficeRegister2.aspx.cs" Inherits="Admission_StdOfficeRegister2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">


    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStdStatusID" runat="server" Visible="true"></asp:Label>

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
                    <div style="width: 19%; float: right;">
                        <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                            <li style="margin-bottom: 0;">
                                <div class="input-group">
                                    <asp:TextBox ID="txtStudentNo" runat="server" class="form-control" placeholder="الرجاء ادخال رقم الطالب" Style="font-family: Tahoma; font-size: 12px !important;"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button ID="btnChechStudent" runat="server" Text="بحث" class="btn green" OnClick="btnChechStudent_Click" Style="height: 34px;" />
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource10">
                                    <ItemTemplate>
                                        <h5 style="text-align: center;"><%# Eval("DisplayName") %> (<%# Eval("StudentNo") %>)</h5>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStudentData" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </li>
                            <li id="litab1" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-home"></i>الصفحة الرئيسية<span class="after"></span></a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-list"></i>ملف الطالب</a>
                                <ul class="dropdown-menu ver-inline-menu tabbable margin-bottom-10 font-ha" role="menu" style="width: 199px; margin-right: 199px; margin-top: -38px">
                                    <li><a href="StudentProfile.aspx?id=<%= lblStudentID.Text %>#tab1"><i class="fa fa-briefcase"></i>بيانات أساسية</a></li>
                                    <li><a href="StudentProfile.aspx?id=<%= lblStudentID.Text %>#tab2"><i class="fa fa-male"></i>بيانات ولي الأمر</a></li>
                                    <li><a href="StudentProfile.aspx?id=<%= lblStudentID.Text %>#tab3"><i class="fa fa-mobile-phone"></i>بيانات الإتصال</a></li>
                                    <li><a href="StudentProfile.aspx?id=<%= lblStudentID.Text %>#tab4"><i class="fa fa-mobile-phone"></i>الرغبات وبيانات التجسير</a></li>
                                    <li class="active"><a href="StudentFinancialProfile.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>الملف المالي</a></li>
                                    <li><a href="StudentScholarship.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>منح الطالب</a></li>
                                    <li><a href="StudentImage.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>تغيير صورة الطالب</a></li>
                                </ul>
                            </li>

                            <% if (lblEmployeeID.Text != "5301" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12"))
                                { %>
                            <li><a href="StudentSemesterRegistration.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>التسجيل الفصلي</a></li>
                            <li id="li4" runat="server"><a href="StudentCourse.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>طلبات تسجيل المساقات</a></li>
                            <% } %>

                            <% if (lblEmployeeID.Text != "5301" && (lblStdStatusID.Text == "1"))
                                { %>
                            <li id="litab8" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab8"><i class="fa fa-list-alt"></i>تسجيل مساقات الخطة</a></li>
                            <% } %>

                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7")
                                { %>
                            <li id="litab2" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab2"><i class="fa fa-list-alt"></i>الجدول الدراسي</a></li>
                            <% } %>

                            <% if (lblEmployeeID.Text != "5083" && lblStdStatusID.Text == "1")
                                { %>
                            <li id="litab3" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab3"><i class="fa fa-table"></i>جدول الإمتحانات</a></li>
                            <% } %>

                            <li id="litab4" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab4"><i class="fa fa-book"></i>الخطة الدراسية</a></li>

                            <% if (lblEmployeeID.Text != "5301" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "3" || lblStdStatusID.Text == "8" || lblStdStatusID.Text == "12"))
                                { %>
                            <li id="litab15" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab15"><i class="fa fa-lock"></i>كشف الإرشاد الأكاديمي</a></li>
                            <% } %>
                            <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301") && (lblStdStatusID.Text != "4" && lblStdStatusID.Text != "6"))
                                { %>
                            <li id="litab5" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab5"><i class="fa fa-stack-exchange"></i>علامات المساقات</a></li>
                            <% } %>
                            <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301") && lblStdStatusID.Text == "1")
                                { %>
                            <li id="litab21" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab21"><i class="fa fa-stack-exchange"></i>إنسحاب المساقات</a></li>
                            <% } %>

                            <% if (lblEmployeeID.Text != "5083" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12"))
                                { %>
                            <li id="litab6" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab6"><i class="fa fa-lock"></i>كشف درجات</a></li>
                            <% } %>
                            <% if (lblEmployeeID.Text != "5301" && lblStdStatusID.Text == "1")
                                { %>
                            <li id="litab10" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab10"><i class="fa fa-lock"></i>تحويل التخصص</a></li>
                            <% } %>
                            <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301") && lblStdStatusID.Text == "1")
                                { %>
                            <li id="litab11" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab11"><i class="fa fa-lock"></i>تأجيل الفصل الدراسي</a></li>
                            <% } %>
                            <li id="litab7" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab7"><i class="fa fa-lock"></i>مستندات الطالب</a></li>
                            <% if (lblStdStatusID.Text != "8" || lblStdStatusID.Text != "9")
                                { %>
                            <li id="litab9" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab9"><i class="fa fa-lock"></i>إرسال SMS</a></li>
                            <% } %>
                            <% if (lblStdStatusID.Text == "1")
                                { %>
                            <li id="litab12" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab12"><i class="fa fa-lock"></i>شروط انتساب الطالب</a></li>
                            <% } %>
                            <li id="litab13" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab13"><i class="fa fa-lock"></i>تغير نوع الطالب</a></li>
                            <% if (lblEmployeeID.Text != "5301" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7"))
                                { %>
                            <li id="litab14" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab14"><i class="fa fa-lock"></i>إنذارات الحضور والغياب</a></li>
                            <li id="litab16" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab16"><i class="fa fa-lock"></i>إحصائيات الحضور والغياب</a></li>
                            <% } %>
                            <li id="litab17" runat="server"><a href="SuspendStudentPage.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>إيقاف صفحة الطالب</a></li>
                            <li id="litab18" runat="server"><a href="AdmissionStudentIssuesShow.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>عرض قضايا الطالب </a></li>
                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7")
                                { %>
                            <li id="li1"><a href="ExceptionStudentGeneral.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-book"></i>استثناءات التسجيل الفصلي</a></li>
                            <li id="li2" runat="server"><a href="ExceptionStudentCourse.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>استثناءات المساق </a></li>
                            <% } %>
                            <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301") && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7"))
                                { %>
                            <li id="li3" runat="server"><a href="FinalMarkDeductionAddEdit.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>خصم درجات</a></li>
                            <% } %>

                            <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301") && (lblStdStatusID.Text != "6" && lblStdStatusID.Text != "9" && lblStdStatusID.Text != "10"))
                                { %>
                            <li id="li5" runat="server"><a href="StdInfractionAddEdit.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>مخالفات الطالب</a></li>
                            <% } %>
                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="col-md-12">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="row">
                                <ContentTemplate>
                                    <div class="col-md-12">
                       
                                        <% if (ListView1.Items.Count > 0)
                                            { %>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center; width: 15%">الفصل الدراسي</th>
                                                    <th style="text-align: center; width: 10%">مدين</th>
                                                    <th style="text-align: center; width: 10%">دائن</th>
                                                    <th style="text-align: center; width: 15%">الرصيد</th>
                                                    <th style="text-align: center; width: 30%">البيان</th>
                                                    <th style="text-align: center; width: 20%">التاريخ</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                                    <ItemTemplate>
                                                        <tr>
                                                              <asp:Label ID="CourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="true"></asp:Label>
                                                            <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                            <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                                            <td style="text-align: center"><span><%# Eval("CourseHour") %></span></td>
                                                           <td style="text-align: center">
                                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn blue" OnClick="Button1_Click">حفظ</asp:LinkButton></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetStdOfficeRegisterCourses" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                                   <%--     <asp:ControlParameter ControlID="txtCourseCode" PropertyName="Text" DefaultValue="%" Name="CourseCode" Type="String"></asp:ControlParameter>
                                                        <asp:ControlParameter ControlID="txtCourseName" PropertyName="Text" DefaultValue="%" Name="CourseName" Type="String"></asp:ControlParameter>--%>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </tbody>
                                        </table>

                                        <div class="clearfix"></div>
                                        <% }
                                            else
                                            {%>
                                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                            <div class="col-xs-11" style="text-align: center">
                                                <strong>لا يوجد بيانات مالية</strong>
                                                <div style="clear: both"></div>
                                            </div>
                                            <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                            <div style="clear: both"></div>
                                        </div>
                                        <% } %>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

