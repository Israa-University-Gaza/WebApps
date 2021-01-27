<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentSideBar.ascx.cs" Inherits="Academic.UserControls.Academic_UserControls_StudentSideBar" %>
<asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblEmployeeName" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblStdStatusID" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblStdTypeID" runat="server" Visible="false"></asp:Label>
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
                    <h5 class="font-ha" style="text-align: center;"><%# Eval("DisplayName") %> (<%# Eval("StudentNo") %>)</h5>
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
        <%--        <li id="litab1" runat="server" class="active"><a data-toggle="tab" href="#tab1"><i class="fa fa-home"></i>الصفحة الرئيسية</a></li>--%>


        <li id="StudentMain" runat="server" class="active">
            <asp:LinkButton ID="LinkButton18" runat="server" OnClick="Link_OnClick" CommandArgument="StudentMain.aspx; ">
            <i class="fa fa-briefcase"></i> الصفحة الرئيسية
            </asp:LinkButton>


        </li>

        <li class="dropdown" runat="server" id="StudentProfile">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-list"></i>ملف الطالب </a>
            <ul class="dropdown-menu ver-inline-menu tabbable margin-bottom-10 font-ha" role="menu" style="width: 199px; margin-right: 199px; margin-top: -38px">
                <li>
                    <asp:LinkButton ID="StudentProfile1" OnClick="Link_OnClick" runat="server" CommandArgument="StudentProfile.aspx;1">
                        <i class="fa fa-briefcase"></i>بيانات أساسية
                    </asp:LinkButton>
                </li>

                <li>
                    <asp:LinkButton ID="StudentProfile2" runat="server" OnClick="Link_OnClick" CommandArgument="StudentProfile.aspx;2">
                        <i class="fa fa-briefcase"></i>بيانات ولي الأمر
                    </asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Link_OnClick" CommandArgument="StudentProfile.aspx;3">
                        <i class="fa fa-briefcase"></i>بيانات الإتصال
                    </asp:LinkButton>
                </li>

                <li>
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="Link_OnClick" CommandArgument="StudentFinancialProfile.aspx; ">
                        <i class="fa fa-briefcase"></i>الملف المالي
                    </asp:LinkButton>
                </li>
            </ul>
        </li>
        <li runat="server" id="StudentCondition">
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="Link_OnClick" CommandArgument="StudentCondition.aspx; ">
                <i class="fa fa-briefcase"></i>شروط الإنتساب
            </asp:LinkButton>


        </li>

      <% if (lblStdTypeID.Text != "1" &&  lblStdTypeID.Text != "7")
            {%>
        <li id="StudentExternalTransforamtion" runat="server">
            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="Link_OnClick" CommandArgument="StudentExternalTransforamtion.aspx; ">
                <i class="fa fa-briefcase"></i> معادلة خارجية
            </asp:LinkButton>
        </li>
        <% } %>

        <li id="StdInternalTransformationAdd" runat="server">
            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="Link_OnClick" CommandArgument="StdInternalTransformationAdd.aspx; ">
                <i class="fa fa-briefcase"></i> معادلة داخلية
            </asp:LinkButton>


        </li>



        <li id="StdSemesterPlan" runat="server">
            <asp:LinkButton ID="LinkButton6" runat="server" OnClick="Link_OnClick" CommandArgument="StdSemesterPlan.aspx; ">
                <i class="fa fa-briefcase"></i> الخطة الدراسية
            </asp:LinkButton>


        </li>

        <li id="StdSemesterPlanEnglish" runat="server">
            <asp:LinkButton ID="LinkButton7" runat="server" OnClick="Link_OnClick" CommandArgument="StdSemesterPlanEnglish.aspx; ">
                <i class="fa fa-briefcase"></i> الخطة الدراسية باللغة الانجليزية
            </asp:LinkButton>


        </li>



        <li id="StdStudyTable" runat="server">
            <asp:LinkButton ID="LinkButton8" runat="server" OnClick="Link_OnClick" CommandArgument="StdStudyTable.aspx; ">
                <i class="fa fa-briefcase"></i> الجدول الدراسي
            </asp:LinkButton>


        </li>


        <li id="StdSemesterMarks" runat="server">
            <asp:LinkButton ID="LinkButton9" runat="server" OnClick="Link_OnClick" CommandArgument="StdSemesterMarks.aspx; ">
                <i class="fa fa-briefcase"></i> علامات المساقات
            </asp:LinkButton>


        </li>


      <%--  <li id="StdSemesterMarksBITrans" runat="server">
            <asp:LinkButton ID="LinkButton10" runat="server" OnClick="Link_OnClick" CommandArgument="StdSemesterMarksBITrans.aspx; ">
                <i class="fa fa-briefcase"></i> علامات المساقات قبل المعادلة
            </asp:LinkButton>


        </li>--%>

        <li id="StudentCSemesterAcademicGuidence" runat="server">
            <asp:LinkButton ID="LinkButton11" runat="server" OnClick="Link_OnClick" CommandArgument="StudentCSemesterAcademicGuidence.aspx; ">
                <i class="fa fa-briefcase"></i> كشف الإرشاد الأكاديمي
            </asp:LinkButton>


        </li>

        <li id="StdExamsTable" runat="server">
            <asp:LinkButton ID="LinkButton12" runat="server" OnClick="Link_OnClick" CommandArgument="StdExamsTable.aspx; ">
                <i class="fa fa-briefcase"></i> جدول الإمتحانات
            </asp:LinkButton>


        </li>


        <li id="StdMarks" runat="server">
            <asp:LinkButton ID="LinkButton13" runat="server" OnClick="Link_OnClick" CommandArgument="StdMarks.aspx; ">
                <i class="fa fa-briefcase"></i> كشف الدرجات
            </asp:LinkButton>


        </li>


      <%--  <li id="StdMarksBITrans" runat="server">
            <asp:LinkButton ID="LinkButton14" runat="server" OnClick="Link_OnClick" CommandArgument="StdMarksBITrans.aspx; ">
                <i class="fa fa-briefcase"></i> كشف الدرجات قبل المعادلة

            </asp:LinkButton>
        </li>--%>





        <li id="StdDocuments" runat="server">
            <asp:LinkButton ID="LinkButton15" runat="server" OnClick="Link_OnClick" CommandArgument="StdDocuments.aspx; ">
                <i class="fa fa-briefcase"></i> مستندات الطالب

            </asp:LinkButton>
        </li>



        <li id="StudentAttendanceWarning" runat="server">
            <asp:LinkButton ID="LinkButton16" runat="server" OnClick="Link_OnClick" CommandArgument="StudentAttendanceWarning.aspx; ">
                <i class="fa fa-briefcase"></i> إنذارات الحضور والغياب

            </asp:LinkButton>
        </li>



        <li id="ExceptionStudentGeneralAdd" runat="server">
            <asp:LinkButton ID="LinkButton19" runat="server" OnClick="Link_OnClick" CommandArgument="ExceptionStudentGeneralAdd.aspx; ">
            <i class="fa fa-briefcase"></i>استثناءات التسجيل الفصلي
            </asp:LinkButton>
        </li>




    <li id="ExceptionStudentCourseAdd" runat="server">
        <asp:LinkButton ID="LinkButton20" runat="server" OnClick="Link_OnClick" CommandArgument="ExceptionStudentCourseAdd.aspx; ">
            <i class="fa fa-briefcase"></i>    استثناء تسجيل مساق

        </asp:LinkButton>
    </li>



    <li id="StdInfractionAddEdit" runat="server">
        <asp:LinkButton ID="LinkButton21" runat="server" OnClick="Link_OnClick" CommandArgument="StdInfractionAddEdit.aspx; ">
            <i class="fa fa-briefcase"></i> مخالفات الطالب

        </asp:LinkButton>
    </li>





        <li id="RefusalStudent" runat="server">
            <asp:LinkButton ID="LinkButton17" runat="server" OnClick="Link_OnClick" CommandArgument="RefusalStudent.aspx; ">
                <i class="fa fa-briefcase"></i> رفض الطالب

            </asp:LinkButton>
        </li>





        <%--        <li id="li1"><a href="../Student/ExceptionStudentGeneralAdd.aspx"><i class="fa fa-book"></i>استثناءات التسجيل الفصلي</a></li>
        <li id="litab18" runat="server"><a href="../Student/ExceptionStudentCourseAdd.aspx"><i class="fa fa-lock"></i>استثناء تسجيل مساق </a></li>
        <li id="li2" runat="server"><a href="../Student/StdInfractionAddEdit.aspx"><i class="fa fa-lock"></i>مخالفات الطالب </a></li>--%>
    </ul>
</div>
