<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="ReportData.aspx.cs" Inherits="Academic_ReportData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">

        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicReport').addClass("active open");
            $('#AcademicReport_1 a').css("background-color", "#575757");
            $('#AcademicReport a span.arrow').addClass("open");
        });
    </script>
    <style type="text/css">
        body, td, th {
            font-family: Verdana, Geneva, sans-serif;
            font-size: 12px;
            font-style: normal;
        }

        .checkboxlist input {
            font: inherit;
            font-size: 0.875em; /* 14px / 16px */
            color: black;
            float: right;
            margin-bottom: 2px;
            margin-right: 20px;
            margin-top: 10px;
        }

        .checkboxlist label {
            font: inherit;
            font-size: 0.875em; /* 14px / 16px */
            color: black;
            position: relative;
            margin-top: 2px;
            display: block;
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ReportData.aspx" class="font-ha"></a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs">بيانات البحث</i></div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:CheckBoxList runat="server" CssClass="checkboxlist" ID="cblStudentPersonal" DataTextField="Column_name" DataValueField="Column_name" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5" />
                            </div>
                        </div>
                        <hr />
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-1 control-label">البرنامج</label><%--select2_category --%>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlprogram" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlprogram_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From Program Where IsDelete=0 and IsActive=1 union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">الكلية</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From College Where ID<>1 and  ProgramID=@ProgramID and IsDelete=0 union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">القسم</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From Department Where ID<>1 and CollegeID=@CollegeID and IsDelete=0 union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>


                                <label class="col-md-1 control-label">المساقات</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control select2_category" DataSourceID="SqlDataSource11" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From Course Where DepartmentID=@DepartmentID and IsDelete=0 union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">المسجلين جدول</label><%--select2_category --%>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From Semester Where Code<>'111111111' and IsDelete=0 union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">الثانوية</label><%--select2_category --%>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlTawjehyType" runat="server" CssClass="form-control" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From TawjehyType Where IsDelete=0 and IsActive=1 union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">الجنس</label><%--select2_category --%>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="-1">الكل</asp:ListItem>
                                        <asp:ListItem Value="1">ذكر</asp:ListItem>
                                        <asp:ListItem Value="2">أنثى</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">نوع الطالب</label><%--select2_category --%>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlStudentType" runat="server" CssClass="form-control" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From StudentTypes Where IsDelete=0 and IsActive=1 union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">حالة الطالب</label><%--select2_category --%>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlStudentStatus" runat="server" CssClass="form-control" DataSourceID="SqlDataSource8" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From StudentStatus Where IsDelete=0 and IsActive=1 union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">مسدد</label><%--select2_category --%>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlIsPaid" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="-1">الكل</asp:ListItem>
                                        <asp:ListItem Value="1">نعم</asp:ListItem>
                                        <asp:ListItem Value="0">لا</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label">اعتماد طلب الالتحاق</label><%--select2_category --%>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlAppAccreditation" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="-1">الكل</asp:ListItem>
                                        <asp:ListItem Value="1">معتمد</asp:ListItem>
                                        <asp:ListItem Value="0">غير معتمد</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <label class="col-md-1 control-label">اعتماد الكلية</label><%--select2_category --%>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlAccreditation" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="-1">الكل</asp:ListItem>
                                        <asp:ListItem Value="1">معتمد</asp:ListItem>
                                        <asp:ListItem Value="0">غير معتمد</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <label class="col-md-1 control-label">الملتحقين للفصل</label><%--select2_category --%>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="FirstRegisterSemesterID" runat="server" CssClass="form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From Semester Where Code<>'111111111' and IsDelete=0 union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">

                                <label class="col-md-1 control-label">معدل فصلي أكبر من:</label><%--select2_category --%>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtSemesterGPA" runat="server" class="form-control" placeholder="المعدل من"></asp:TextBox>
                                </div>
                                <label class="col-md-1 control-label">معدل الثانوية اكبر من:</label><%--select2_category --%>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtTawjehyGPAFrom" runat="server" class="form-control" placeholder="المعدل من"></asp:TextBox>
                                </div>
                                <label class="col-md-1 control-label">أقل من:</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtTawjehyGPATo" runat="server" class="form-control" placeholder="المعدل الي"></asp:TextBox>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-1 control-label">الرغبة</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlFirstWish" runat="server" CssClass="form-control" DataSourceID="SqlDataSource10" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From Department Where ID<>1 and  IsDelete=0 union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">مكان الدراسة:</label><%--select2_category --%>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlStudyPlace" runat="server" CssClass="form-control" DataSourceID="SqlDataSource12" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlPlaceOfStudies" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-1 control-label">حالة التخرج للطالب </label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlGraduationStatus" runat="server" CssClass="form-control" DataSourceID="SqlDataSource13" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlGraduationStatuses" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="col-md-5 col-lg-offset-5">
                                    <asp:Button ID="btnGenrateReport" runat="server" Text="بناء التقرير" class="btn green" OnClick="btnGenrateReport_Click" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <asp:GridView ID="GridView1" runat="server" EnableViewState="False" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AllowSorting="True" EditRowStyle-HorizontalAlign="Right" DataKeyNames="ID">
                                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                        <Columns></Columns>

                                        <FooterStyle BackColor="Tan" />
                                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />

                                    </asp:GridView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetReportData1" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlprogram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlStudentType" PropertyName="SelectedValue" Name="StudentTypeID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlStudentStatus" PropertyName="SelectedValue" Name="StudentStatusID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlGender" PropertyName="SelectedValue" Name="Gender" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="txtTawjehyGPAFrom" PropertyName="Text" Name="TawjehyGPAFrom" Type="String"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="txtTawjehyGPATo" PropertyName="Text" Name="TawjehyGPATo" Type="String"></asp:ControlParameter>
                                            <asp:Parameter Name="ScholarshipID" Type="Int32"></asp:Parameter>
                                            <asp:ControlParameter ControlID="ddlIsPaid" PropertyName="SelectedValue" Name="IsPaid" Type="Int32"></asp:ControlParameter>
                                            <asp:Parameter Name="IsSemesterRegisterID" Type="Int32"></asp:Parameter>
                                            <asp:ControlParameter ControlID="ddlAppAccreditation" PropertyName="SelectedValue" Name="AppAccreditation" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlAccreditation" PropertyName="SelectedValue" Name="Accreditation" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="FirstRegisterSemesterID" PropertyName="SelectedValue" Name="FirstRegisterSemesterID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlTawjehyType" PropertyName="SelectedValue" Name="TawjehyTypeID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlFirstWish" PropertyName="SelectedValue" Name="FirstWishID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlGraduationStatus" PropertyName="SelectedValue" Name="GraduationStatusID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-5 col-lg-offset-5">
                                    <asp:Button ID="btExcel" runat="server" Text="تصدير الي Excel" class="btn green" OnClick="btExcel_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

