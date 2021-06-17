﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="OfferCourse.aspx.cs" Inherits="Academic_OfferCourse" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" type="text/css" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/clockface.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudyTable').addClass("active open");
            $('#StudyTable_4 a').css("background-color", "#575757");
            $('#StudyTable a span.arrow').addClass("open");

            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
            $('.clockface_1').clockface();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>طرح مساق</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="OfferCourse.aspx">طرح مساق</a></li>
                <li class="font-ha"><a href="PlanCourse.aspx">إدارة المساقات المطروحة</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>طرح مساق</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <h3 class="form-section">بيانات رئيسية</h3>
                            <div class="row">
                                <asp:Label ID="lblOfferCourseID" runat="server" Text="" Visible="false"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">البرنامج</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeePrograms" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="control-label col-md-2">الفصل الدراسي</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Semester] ORDER BY ID DESC"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label isra-text-aling-right">الكلية</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCollege" runat="server" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeCollages" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <label class="col-md-2 control-label isra-text-aling-right">القسم</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeDepartments" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">المساق</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ('(' + CourseCode +') - ' + ArName)as ArName FROM [Course] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (DepartmentID=@DepartmentID)) union select -1,N'إختر المساق'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="control-label col-md-2">المساق مطروح ل</label>
                                <div class="col-md-2">
                                    <asp:CheckBox ID="cbForMale" runat="server" Text="طلاب" />
                                </div>
                                <div class="col-md-2">
                                    <asp:CheckBox ID="cbForFemale" runat="server" Text="طالبات" />
                                </div>
                            </div>
                            <h3 class="form-section">إمتحان المساق النصفي</h3>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <asp:CheckBox ID="cbIsMidtermExam" runat="server" Text="يوجد إمتحان للمساق" Checked="true" OnCheckedChanged="cbIsMidtermExam_CheckedChanged" AutoPostBack="true" />
                                </div>
                            </div>
                            <div class="row" id="pnlMidtermExamDetails" runat="server">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-4">تاريخ الإمتحان</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txtMidtermExamDate" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال تاريخ الإمتحان" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label class="control-label col-md-3" style="padding-right: 0; padding-left: 0">وقت الإمتحان (طلاب)</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtMidtermExamTimeFrom1" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="14:00" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                        <label style="float: right; padding-top: 5px;">-</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtMidtermExamTimeTo1" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="15:00" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3" style="padding-right: 0; padding-left: 0">وقت الإمتحان (طالبات)</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtMidtermExamTimeFrom2" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="14:00" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                        <label style="float: right; padding-top: 5px;">-</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtMidtermExamTimeTo2" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="15:00" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h3 class="form-section">إمتحان المساق النهائي</h3>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <asp:CheckBox ID="cbIsFinalExam" runat="server" Text="يوجد إمتحان للمساق" Checked="true" OnCheckedChanged="cbIsFinalExam_CheckedChanged" AutoPostBack="true" />
                                </div>
                            </div>
                            <div class="row" id="pnlFinalExamDetails" runat="server">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-4">تاريخ الإمتحان</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txtFinalExamDate" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال تاريخ الإمتحان" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label class="control-label col-md-3" style="padding-right: 0; padding-left: 0">وقت الإمتحان (طلاب)</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtFinalExamTimeFrom1" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="14:00" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                        <label style="float: right; padding-top: 5px;">-</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtFinalExamTimeTo1" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="15:00" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3" style="padding-right: 0; padding-left: 0">وقت الإمتحان (طالبات)</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtFinalExamTimeFrom2" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="14:00" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                        <label style="float: right; padding-top: 5px;">-</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtFinalExamTimeTo2" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="15:00" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="row">
                                <div class="col-md-offset-5 col-md-5">
                                    <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>