<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="HeadOfferCourse.aspx.cs" Inherits="Academic_HeadOfferCourse" %>

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
            $('#HeadOffer').addClass("active open");
            $('#HeadOffer_1 a').css("background-color", "#575757");
            $('#HeadOffer a span.arrow').addClass("open");

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
                                    <asp:DropDownList ID="ddlProgram" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Program] WHERE (([IsActive] = 1) AND ([IsDelete] = 0))"></asp:SqlDataSource>
                                </div>
                                <label class="control-label col-md-2">الفصل الدراسي</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT top 1 ID, ArName FROM [Semester] WHERE (([Code] <> '111111111') AND ([IsActive] = 1) AND ([IsDelete] = 0) AND (ProgramFID in (Select ID From ProgramFollow Where ProgramID=@ProgramID))) ORDER BY ID DESC">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">القسم</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetDepartmentByHead" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="control-label col-md-2">المساق</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Course] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (DepartmentFID in (Select ID From DepartmentFollow Where DepartmentID=@DepartmentID))) union select -1,N'إختر المساق'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">المساق مطروح ل</label>
                                <div class="col-md-1">
                                    <asp:CheckBox ID="cbForMale" runat="server" Text="طلاب" />
                                </div>
                                <div class="col-md-1">
                                    <asp:CheckBox ID="cbForFemale" runat="server" Text="طالبات" />
                                </div>
                            </div>
                            <h3 class="form-section">إمتحان المساق المطروح</h3>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <asp:CheckBox ID="cbExamExist" runat="server" Text="يوجد إمتحان للمساق" Checked="true" OnCheckedChanged="cbExamExist_CheckedChanged" AutoPostBack="true" />
                                </div>
                            </div>
                            <div class="row" id="PnlExamDetails" runat="server">
                                <div class="form-group">
                                    <div class="col-md-4">
                                        <label class="control-label col-md-4">تاريخ الإمتحان</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txtExamDate" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال تاريخ الإمتحان" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <label class="control-label col-md-3" style="padding-right: 0; padding-left: 0">وقت الإمتحان</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtExamTimeFrom" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="14:00" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                        <label style="float: right; padding-top: 5px;">-</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtExamTimeTo" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="15:00" Style="text-align: center;"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-5">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
