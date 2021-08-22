<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentSideBar.ascx.cs" Inherits="Admission_UserControls_StudentSideBar" %>
<asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblEmployeeName" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblStdStatusID" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblGraduationStatusID" runat="server" Visible="false"></asp:Label>
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

        <li id="litab1" runat="server" class="active">
            <asp:LinkButton ID="LinkButton1" runat="server"  OnClick="LinkRedirect" CommandArgument="1">
                                    <i class="fa fa-home"></i>الصفحة الرئيسية<span class="after"></span>
            </asp:LinkButton>
        </li>

        <li class="dropdown" runat="server" id="litab_2">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-list"></i>ملف الطالب</a>
            <ul class="dropdown-menu ver-inline-menu tabbable margin-bottom-10 font-ha" role="menu" style="width: 199px; margin-right: 199px; margin-top: -38px">
                <li><a href="StudentProfile.aspx?id=<%= lblStudentID.Text %>&tab=201"><i class="fa fa-briefcase"></i>بيانات أساسية</a></li>
                <li><a href="StudentProfile.aspx?id=<%= lblStudentID.Text %>&tab=202"><i class="fa fa-male"></i>بيانات ولي الأمر</a></li>
                <li><a href="StudentProfile.aspx?id=<%= lblStudentID.Text %>&tab=203"><i class="fa fa-mobile-phone"></i>بيانات الإتصال</a></li>
                <li><a href="StudentProfile.aspx?id=<%= lblStudentID.Text %>&tab=204"><i class="fa fa-mobile-phone"></i>الرغبات وبيانات التجسير</a></li>
                <li><a href="StudentFinancialProfile.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>الملف المالي</a></li>
                <li><a href="StudentScholarship.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>منح الطالب</a></li>
                <li><a href="StudentImage.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>تغيير صورة الطالب</a></li>
            </ul>
        </li>

        <% if (lblEmployeeID.Text != "0000" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12"))
            { %>
        <li id="StudentSemesterRegistration" runat="server"><a href="StudentSemesterRegistration.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>التسجيل الفصلي</a></li>
       
        <li id="StudentCourse" runat="server"><a href="StudentCourse.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>طلبات تسجيل المساقات</a></li>
        <li id="StudentInstallmentOrder" runat="server"><a href="StudentInstallmentOrder.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>اقساط الطالب</a></li>
        <% } %>

          <% if (lblEmployeeID.Text != "0000" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12") && lblGraduationStatusID.Text != "1")
            { %>
         <li id="StdOfficeRegister" runat="server"><a href="StdOfficeRegister.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>التسجيل المكتبي</a></li>
             <% } %>
        <% if (lblEmployeeID.Text != "0000" && (lblStdStatusID.Text == "1"))
            { %>
        <li id="litab8" runat="server">
            <asp:LinkButton ID="LinkButton8" runat="server" OnClick="LinkRedirect" CommandArgument="8">
                                        <i class="fa fa-home"></i>تسجيل مساقات الخطة<span class="after"></span>
            </asp:LinkButton>
        </li>
        <% } %>
        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7")
            { %>
        <li id="litab2" runat="server">
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkRedirect" CommandArgument="2">
                                        <i class="fa fa-home"></i>الجدول الدراسي<span class="after"></span>
            </asp:LinkButton>
        </li>
        <% } %>
        <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5497") && lblStdStatusID.Text == "1")
            { %>
        <li id="litab3" runat="server">
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkRedirect" CommandArgument="3">
                                        <i class="fa fa-home"></i>جدول الإمتحانات<span class="after"></span>
            </asp:LinkButton>
        </li>
        <% } %>
        <li id="litab4" runat="server">
            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkRedirect" CommandArgument="4">
                                    <i class="fa fa-home"></i>الخطة الدراسية<span class="after"></span>
            </asp:LinkButton>
        </li>

        <li id="litab23" runat="server">
            <asp:LinkButton ID="LinkButton23" runat="server" OnClick="LinkRedirect" CommandArgument="23">
                                    <i class="fa fa-home"></i>الخطة الدراسية باللغة الانجليزية<span class="after"></span>
            </asp:LinkButton>
        </li>

        <% if (lblEmployeeID.Text != "0000" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "3" || lblStdStatusID.Text == "8" || lblStdStatusID.Text == "12"))
            { %>
        <li id="litab15" runat="server">
            <asp:LinkButton ID="LinkButton15" runat="server" OnClick="LinkRedirect" CommandArgument="15">
                                        <i class="fa fa-lock"></i>كشف الإرشاد الأكاديمي<span class="after"></span>
            </asp:LinkButton>
        </li>
        <% } %>
        <% if ((lblEmployeeID.Text != "5083" && lblEmployeeID.Text != "5497"
                // Added by RSR
                && lblEmployeeID.Text != "5534" && lblEmployeeID.Text != "14" && lblEmployeeID.Text != "5084") 
                && (lblStdStatusID.Text != "4" && lblStdStatusID.Text != "6"))
            { %>
        <li id="litab5" runat="server">
            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkRedirect" CommandArgument="5">
                                        <i class="fa fa-lock"></i>علامات المساقات<span class="after"></span>
            </asp:LinkButton>
        </li>

<%--        <li id="litab22" runat="server">
            <asp:LinkButton ID="LinkButton22" runat="server" OnClick="LinkRedirect" CommandArgument="22">
                                        <i class="fa fa-lock"></i> علامات المساقات قبل المعادلة<span class="after"></span>
            </asp:LinkButton>
        </li>--%>

        <% } %>
        <% if (lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "0000" || lblEmployeeID.Text != "5497")
            { %>
        <li id="litab21" runat="server">
            <asp:LinkButton ID="LinkButton21" runat="server" OnClick="LinkRedirect" CommandArgument="21">
                                        <i class="fa fa-lock"></i>  إنسحاب المساقات<span class="after"></span>
            </asp:LinkButton>
        </li>

        <% } %>

        <% if ((lblEmployeeID.Text != "5083" && lblEmployeeID.Text != "5497"
                // Added by RSR
                && lblEmployeeID.Text != "5534" && lblEmployeeID.Text != "14" && lblEmployeeID.Text != "5084") 
                && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12"))
            { %>
        <li id="litab6" runat="server">
            <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkRedirect" CommandArgument="6">
                                        <i class="fa fa-lock"></i>  كشف درجات<span class="after"></span>
            </asp:LinkButton>
        </li>
       <%-- <li id="litab20" runat="server">
            <asp:LinkButton ID="LinkButton20" runat="server" OnClick="LinkRedirect" CommandArgument="20">
                                        <i class="fa fa-lock"></i>  كشف الدرجات قبل المعادلة<span class="after"></span>
            </asp:LinkButton>
        </li>--%>
        <% } %>
        <% if ((lblEmployeeID.Text != "0000" || lblEmployeeID.Text != "5497") && lblStdStatusID.Text == "1")
            { %>
        <li id="litab10" runat="server">
            <asp:LinkButton ID="LinkButton10" runat="server" OnClick="LinkRedirect" CommandArgument="10" >
                                        <i class="fa fa-lock"></i>  تحويل التخصص<span class="after"></span>
            </asp:LinkButton>
        </li>


        <% } %>
        <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "0000" || lblEmployeeID.Text != "5497") && lblStdStatusID.Text == "1")
            { %>
        <li id="litab11" runat="server"><a data-toggle="tab" href="#tab11"><i class="fa fa-lock"></i>تأجيل الفصل الدراسي</a></li>
        <% } %>

        <li id="litab7" runat="server">
            <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkRedirect" CommandArgument="7">
                                    <i class="fa fa-lock"></i>  مستندات الطالب<span class="after"></span>
            </asp:LinkButton>
        </li>
        <% if (lblStdStatusID.Text != "8" || lblStdStatusID.Text != "9")
            { %>
        <li id="litab9" runat="server">
            <asp:LinkButton ID="LinkButton9" runat="server" OnClick="LinkRedirect" CommandArgument="9">
                                        <i class="fa fa-lock"></i>   إرسال SMS<span class="after"></span>
            </asp:LinkButton>
        </li>
        <% } %>
        <% if (lblStdStatusID.Text == "1")
            { %>
        <li id="litab12" runat="server">
            <asp:LinkButton ID="LinkButton12" runat="server" OnClick="LinkRedirect" CommandArgument="12">
                                        <i class="fa fa-lock"></i>   شروط انتساب الطالب <span class="after"></span>
            </asp:LinkButton>
        </li>
        <% } %>
        <% if (lblStdStatusID.Text != "6" && lblStdStatusID.Text != "8" && lblStdStatusID.Text != "9" && lblStdStatusID.Text != "10" && lblStdStatusID.Text != "12")
            { %>
        <li id="litab13" runat="server" >
            <asp:LinkButton ID="LinkButton13" runat="server" OnClick="LinkRedirect" CommandArgument="13">
                                        <i class="fa fa-lock"></i>   تغير نوع الطالب <span class="after"></span>
            </asp:LinkButton>
        </li>
        <% } %>
        <% if (lblEmployeeID.Text != "0000" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7"))
            { %>
        <li id="litab14" runat="server" >
            <asp:LinkButton ID="LinkButton14" runat="server" OnClick="LinkRedirect" CommandArgument="14">
                                    <i class="fa fa-lock"></i>   إنذارات الحضور والغياب <span class="after"></span>
            </asp:LinkButton>
        </li>
        <li id="litab16" runat="server">
            <asp:LinkButton ID="LinkButton16" runat="server" OnClick="LinkRedirect" CommandArgument="16">
                                    <i class="fa fa-lock"></i>   إحصائيات الحضور والغياب <span class="after"></span>
            </asp:LinkButton>
        </li>
        <% } %>
        <li id="SuspendStudentPage" runat="server"><a href="SuspendStudentPage.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>إيقاف صفحة الطالب</a></li>
        <li id="AdmissionStudentIssuesShow" runat="server"><a href="AdmissionStudentIssuesShow.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>عرض قضايا الطالب </a></li>
        <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7")
            { %>
        <li id="ExceptionStudentGeneral" runat="server"><a href="ExceptionStudentGeneral.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-book"></i>استثناءات التسجيل الفصلي</a></li>
        <li id="ExceptionStudentCourse" runat="server"><a href="ExceptionStudentCourse.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>استثناءات المساق </a></li>
        <% } %>

        <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "0000" || lblEmployeeID.Text != "5497") && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7"))
            { %>
        <li id="FinalMarkDeductionAddEdit" runat="server"><a href="FinalMarkDeductionAddEdit.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>خصم درجات</a></li>
        <% } %>

        <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "0000" || lblEmployeeID.Text != "5497") && (lblStdStatusID.Text != "6" && lblStdStatusID.Text != "9" && lblStdStatusID.Text != "10"))
            { %>
        <li id="li6" runat="server"><a href="StdInfractionAddEdit.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>مخالفات الطالب</a></li>
        <% } %>
    </ul>
</div>
