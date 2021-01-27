<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Info_AddEdit.aspx.cs" Inherits="APP_HRM_Emp_Info_AddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="assets/datepicker/datetimepicker.css" rel="stylesheet" />
    <link href="../assets/css/pages/profile-rtl.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="../assets/stdimage/css/jquery.Jcrop.css" type="text/css" />
    <script src="../assets/stdimage/js/jquery.cropit.min.js"></script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.holder-style').removeClass('holder-active');
            $('#StudentImage').addClass('holder-active');

            $('.image-editor').cropit({
                imageBackground: true,
                imageBackgroundBorderWidth: 15
            });
            $('.crop').click(function () {
                // Move cropped image data to hidden input
                var imageData = $('.image-editor').cropit('export');
                $('.hidden-image-data').val(imageData);
                $('#Button11').show();
            });
        });
    </script>
    <style>
        .profile label:first-child {
            margin-top: 12px;
        }

        .profile label {
            margin-top: 12px;
        }

        .profile span:first-child {
            margin-top: 12px;
        }

        .profile span {
            margin-top: 12px;
        }

        .select2-container .select2-choice .select2-arrow {
            background: transparent none repeat scroll 0 0;
            border-radius: 0 0 4px 4px;
            border-right: 1px solid #e5e5e5;
            display: inline-block;
            height: 100%;
            left: 0;
            margin-top: 0px;
            position: absolute;
            top: 0;
            width: 18px;
        }

        .select2-container .select2-choice > .select2-chosen {
            display: block !important;
            margin-left: 26px;
            margin-top: 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .sale-summary li .sale-num {
            color: #169ef4;
            font-family: hasanin;
            font-size: 14px;
            font-weight: 100;
        }

        .sale-summary li .sale-info {
            color: #646464;
            float: right;
            font-family: hasanin;
            font-size: 14px;
            text-transform: uppercase;
        }

        .sale-summary li {
            border-top: none;
            overflow: hidden;
            padding: 1.9px 0;
        }

        .sale-num {
            color: #169ef4 !important;
            font-size: 14px !important;
            font-weight: 300 !important;
        }

        input[type="radio"], input[type="checkbox"] {
            line-height: normal;
            margin: 0 24px;
        }
    </style>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/clockface.js"></script>
    <script type="text/javascript" src="../assets/datepicker/moment.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-datetimepicker.min.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>
    <script src="../assets/datepicker/quick-sidebar.js" type="text/javascript"></script>
    <script src="../assets/datepicker/demo.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js"></script>
    <script>
        jQuery(document).ready(function () {

            QuickSidebar.init(); // init quick sidebar
            Demo.init(); // init demo features
            ComponentsPickers.init();

        });
    </script>


    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu1').addClass("active");
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Emp_Info_AddEdit.aspx" class="font-ha">الموظف</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row profile">
        <div class="col-md-12">
            <!--BEGIN TABS-->
            <div class="tabbable tabbable-custom tabbable-full-width">
                <ul class="nav nav-tabs">
                    <li id="li1" runat="server" class="active "><a href="#tab_1_1" class="font-ha-mune" data-toggle="tab">البيانات الأساسية</a></li>
                    <li id="li2" runat="server"><a href="#tab_1_2" class="font-ha-mune" data-toggle="tab">بيانات الموظف</a></li>
                    <li id="li3" runat="server"><a href="#tab_1_3" class="font-ha-mune" data-toggle="tab">الخبرات العلمية والعملية</a></li>
                    <li id="li4" runat="server"><a href="#tab_1_4" class="font-ha-mune" data-toggle="tab">البحوث العلميةوالمؤتمرات</a></li>
                    <li id="li5" runat="server"><a href="#tab_1_5" class="font-ha-mune" data-toggle="tab">بيانات المعرفين والطوارئ</a></li>
                    <li id="li6" runat="server"><a href="#tab_1_6" class="font-ha-mune" data-toggle="tab">طباعة السيرة الذاتية</a></li>
                    <li id="li7" runat="server" class="active" style="cursor: pointer;"><a href="fb.aspx" class="font-ha-mune"><i class="fa fa-facebook"></i>الإشتراك في تطبيق الفيس بوك الخاص بالجامعة</a></li>

                    <asp:Label ID="Label4" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblEmpFamily" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblQualifactionID" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblExperinceID" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblCourseID" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lbllangID" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblComputerID" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblResearchID" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblRefID" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblEmergancyID" runat="server" Visible="false"></asp:Label>
                </ul>
                <div class="tab-content">
                    <div runat="server" class="tab-pane active" id="tab_1_1" clientidmode="Static">
                        <div class="row">
                            <div class="col-md-3">

                                <ul class="list-unstyled profile-nav">
                                    <li style="margin-bottom: 0;">
                                        <div id="DivCheckEmployee" class="input-group" runat="server" visible="false">
                                            <asp:TextBox ID="txtEmployeeNo" runat="server" class="form-control" placeholder="الرجاء ادخال رقم الموظف" Style="font-family: Tahoma; font-size: 12px !important;"></asp:TextBox>
                                            <span class="input-group-btn">
                                                <asp:Button ID="btnEmployeeSearch" runat="server" Text="بحث" class="btn green" OnClick="btnEmployeeSearch_Click" Style="height: 34px;" />
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="#" runat="server" id="imgTitle" class="img-responsive" />
                                        <asp:LinkButton CssClass="profile-edit" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">تحرير</asp:LinkButton>
                                        <%--                                                <a href="#" class="profile-edit"></a>--%>
                                    </li>


                                    <%-- <li>
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">رجوع لصفحات الموظفين</asp:LinkButton></li>
                                    --%>
                                    <li id="changePassword" runat="server"><a href="ChangePassword.aspx">تغيير كلمة المرور </a></li>

                                </ul>
                            </div>


                            <div class="col-md-9">
                                <div class="row">

                                    <div class="col-md-5 profile-info">
                                        <asp:Repeater ID="Repeater15" runat="server" DataSourceID="SqlDataSource88">
                                            <ItemTemplate>
                                                <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>

                                                <h1><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Family_Name") %></h1>
                                                <p><a href="#"><%# Eval("Emp_Email") %></a></p>
                                                <ul class="list-inline">
                                                    <%--    <li><i class="fa fa-map-marker"></i><%# Eval("ArName") %></li>--%>
                                                    <li><i class="fa fa-calendar"></i><%# Eval("Emp_DOB","{0:yyyy/MM/dd}") %></li>

                                                </ul>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>

                                    <!--end col-md-8-->
                                    <div class="col-md-7">
                                        <div class="portlet sale-summary">
                                            <div class="portlet-title">
                                                <div class="caption">البيانات الأساسية</div>
                                                <div class="tools">
                                                    <%--    <a class="reload" href="javascript:;"></a>--%>
                                                </div>
                                            </div>
                                            <div class="portlet-body">
                                                <ul class="list-unstyled">

                                                    <li>
                                                        <span class="sale-info">الرقم الوظيفي <i class="fa fa-img-up"></i></span>
                                                        <asp:Repeater ID="Repeater16" runat="server" DataSourceID="SqlDataSource88">
                                                            <ItemTemplate>
                                                                <span class="sale-num"><%# Eval("EmployeeNO") %></span>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </li>
                                                    <li>
                                                        <span class="sale-info">المسمى الوظيفي</span>
                                                        <asp:Repeater ID="Repeater17" runat="server" DataSourceID="SqlDataSource89">
                                                            <ItemTemplate>
                                                                <span class="sale-num"><%# Eval("Ar_Job_Name") %></span>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </li>
                                                    <div id="DivContract" runat="server" visible="false">

                                                        <asp:Repeater ID="Repeater18" runat="server" DataSourceID="SqlDataSource90">
                                                            <ItemTemplate>
                                                                <li>
                                                                    <span class="sale-info">نوع العقد <i class="fa fa-img-down"></i></span>

                                                                    <span class="sale-num"><%# Eval("Contract_Type") %></span>
                                                                </li>
                                                                <li>
                                                                    <span class="sale-info">الدائرة/القسم  <i class="fa fa-img-down"></i></span>

                                                                    <span class="sale-num"><%# Eval("Department") %></span>
                                                                </li>
                                                            </ItemTemplate>
                                                        </asp:Repeater>

                                                    </div>
                                                </ul>
                                            </div>
                                        </div>

                                        <!--end col-md-4-->
                                        <asp:SqlDataSource ID="SqlDataSource88" runat="server"
                                            ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="SELECT [dbo].[GetEmployeeNO](Emp_ID) as EmployeeNo,*  FROM [dbo].[Employee_TB]

                                     WHERE Emp_ID=@Emp_ID ">


                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource89" runat="server"
                                            ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="SELECT [dbo].[GetEmployeeJobTitle](@Emp_ID) as Ar_Job_Name">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource90" runat="server"
                                            ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="SELECT [dbo].[GetEmployeeContractType](@Emp_ID) as Contract_Type,[dbo].[GetDepartment](dbo.GetDepartmentID(@Emp_ID)) as Department">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <!--end row-->
                                <!--end row-->
                                <div class="tabbable tabbable-custom tabbable-custom-profile">
                                    <ul class="nav nav-tabs">
                                        <li id="li1_1" runat="server" class="active"><a href="#tab_1_11" data-toggle="tab">جدول دوام الموظف</a></li>
                                        <li id="li1_2" runat="server"><a href="#tab_1_22" data-toggle="tab">رصيد الإجازات</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div runat="server" class="tab-pane active" id="tab_1_11" clientidmode="Static">
                                            <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource99">
                                                <ItemTemplate>
                                                    <ul class="list-unstyled">
                                                        <li>
                                                            <span class="sale-info">نوع دوام الموظف <i class="fa fa-img-up"></i></span>
                                                            <asp:Label ID="Att" runat="server" Width="22%" class="sale-num"><%# Eval("Ar_Name") %></asp:Label>
                                                            <asp:Label ID="Label3" runat="server" class="sale-num" Visible="false" Width="22%"><%# Eval("Attendance_Type_ID") %></asp:Label>
                                                        </li>
                                                    </ul>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource99" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="select DefualtAttendanceTypeID as Attendance_Type_ID,
                                                (select Ar_Name from Emp_Sub_Constant where Sub_Constant_ID = this.DefualtAttendanceTypeID) as Ar_Name 
                                                From [dbo].[EmployeeAttendanceDefualt] as this where ID =[dbo].[GetEmployeeDefaultAttendanceID](@Emp_ID)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <div runat="server" id="Div1" visible="false">
                                                <div class="portlet-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 20%; text-align: center" class="sale-num">اسم النسق</th>
                                                                    <th style="width: 20%; text-align: center" class="sale-num">بداية الدوام الافتراضي</th>
                                                                    <th style="width: 20%; text-align: center" class="sale-num">نهاية الدوام الافتراضي </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater ID="Repeater12" runat="server" DataSourceID="SqlDataSource55">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td style="text-align: center"><span><%# Eval("AttendanceFormat") %></span></td>
                                                                            <td style="text-align: center"><span><%# Eval("Attendance_From") %></span></td>
                                                                            <td style="text-align: center"><span><%# Eval("Attendance_To") %></span></td>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                <asp:SqlDataSource ID="SqlDataSource55" runat="server"
                                                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                                    SelectCommand="DefAttGet" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div runat="server" id="Div2" visible="false">
                                                <div class="portlet-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 20%; text-align: center" class="sale-num">اليوم </th>
                                                                    <th style="width: 40%; text-align: center" class="sale-num">بداية الداوم</th>
                                                                    <th style="width: 40%; text-align: center" class="sale-num">نهاية الدوام</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater ID="Repeater11" runat="server" DataSourceID="SqlDataSource66">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                                                        <tr>
                                                                            <td><span><%# Eval("DayName1") %>
                                                                                <asp:Label ID="Attendance_Day_ID" CssClass="form-control input-xsmall" runat="server" Visible="false" Text='<%# Eval("Attendance_Day_ID") %>'></asp:Label></span></td>
                                                                            <td style="text-align: center">
                                                                                <asp:TextBox ID="TextBox1" CssClass="form-control input-xsmall" runat="server" Enabled="false" data-format="HH:mm " MaxLength="5" class="clockface_1" Text='<%# Eval("Attendance_From") %>'></asp:TextBox></td>
                                                                            <td style="text-align: center">
                                                                                <asp:TextBox ID="TextBox2" CssClass="form-control input-xsmall" Enabled="false" runat="server" data-format="HH:mm" MaxLength="5" class="clockface_1" Text='<%# Eval("Attendance_To") %>'></asp:TextBox></td>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                <asp:SqlDataSource ID="SqlDataSource66" runat="server"
                                                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                                    SelectCommand="WeekAttGet" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div runat="server" id="Div3" visible="false">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">الشهر </label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="DropDownList3" CssClass="select2_category form-control" placeholder="اختر الشهر" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                                            <asp:ListItem></asp:ListItem>
                                                            <asp:ListItem Value="1">يناير</asp:ListItem>
                                                            <asp:ListItem Value="2">فبراير</asp:ListItem>
                                                            <asp:ListItem Value="3">مارس</asp:ListItem>
                                                            <asp:ListItem Value="4">ابريل</asp:ListItem>
                                                            <asp:ListItem Value="5">مايو</asp:ListItem>
                                                            <asp:ListItem Value="6">يونيو</asp:ListItem>
                                                            <asp:ListItem Value="7">يوليو</asp:ListItem>
                                                            <asp:ListItem Value="8">أغسطس</asp:ListItem>
                                                            <asp:ListItem Value="9">سبتمبر</asp:ListItem>
                                                            <asp:ListItem Value="10">أكتوبر</asp:ListItem>
                                                            <asp:ListItem Value="11">نوفمبر</asp:ListItem>
                                                            <asp:ListItem Value="12">ديسمبر</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <label class="col-md-2 control-label">السنة </label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <hr style="height: 12px; box-shadow: inset 0 5px 5px -5px rgba(0,0,0,0.5);" />
                                                <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
                                                    <thead>
                                                        <tr>
                                                            <th>تاريخ الحضور</th>
                                                            <th>وقت الحضور</th>
                                                            <th>تاريخ الانصراف</th>
                                                            <th>وقت الانصراف</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="Repeater10" runat="server" DataSourceID="SqlDataSource72">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                        <div class="input-icon">
                                                                            <i class="fa fa-calendar"></i>
                                                                            <asp:TextBox ID="date" runat="server" Enabled="false" class="form-control form-control-inline input-meduim date-picker" Width="150px" MaxLength="50" Text='<%# Eval("Date_From","{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="from" runat="server" class="form-control clockface_1" Width="150px" MaxLength="50" Text='<%# Eval("Time_From") %>'></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <div class="input-icon">
                                                                            <i class="fa fa-calendar"></i>
                                                                            <asp:TextBox ID="TextBox5" runat="server" Enabled="false" class="form-control form-control-inline input-meduim date-picker" Width="150px" MaxLength="50" Text='<%# Eval("Date_to","{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                                                        </div>
                                                                    </td>

                                                                    <td>
                                                                        <asp:TextBox ID="to" runat="server" class="form-control clockface_1" Width="150px" MaxLength="50" Text='<%# Eval("Time_To") %>'></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:SqlDataSource runat="server" ID="SqlDataSource72" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                            SelectCommand="GetEmpAttMonth" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                                <asp:ControlParameter ControlID="DropDownList3" PropertyName="SelectedValue" Name="Month" Type="Int32"></asp:ControlParameter>
                                                                <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="Year" Type="Int32"></asp:ControlParameter>
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!--tab-pane-->
                                        <div runat="server" class="tab-pane" id="tab_1_22" clientidmode="Static">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 5%">#</th>

                                                        <th style="text-align: center; width: 20%">نوع الإجازة </th>
                                                        <th style="text-align: center; width: 20%">سنة الإجازة </th>
                                                        <th style="text-align: center; width: 20%">رصيد اساسي</th>
                                                        <th style="text-align: center; width: 20%">رصيد مرحل</th>
                                                        <th style="text-align: center; width: 20%">رصيد مستنفذ</th>
                                                        <th style="text-align: center; width: 15%">رصيد متبقي</th>


                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                                        <ItemTemplate>
                                                            <td><span><%# Eval("RowNo") %></span></td>

                                                            <td style="text-align: center"><span><%# Eval("VacationType") %></span></td>
                                                            <td style="text-align: center"><span><%# Eval("VacationBalanceYear") %></span></td>
                                                            <td style="text-align: center"><span><%# Eval("DefualtDays") %></span></td>
                                                            <td style="text-align: center"><span><%# Eval("PostponeDays") %></span></td>
                                                            <td style="text-align: center"><span><%# Eval("ConsumedDays") %></span></td>
                                                            <td style="text-align: center"><span><%# Eval("RemainingDays") %></span></td>


                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IsraaHumanResource %>' SelectCommand="GetFilterdEmployeeVacationBalances" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!--tab-pane-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--tab_1_2-->
                    <div runat="server" class="tab-pane" id="tab_1_2" clientidmode="Static">
                        <div class="row profile-account">
                            <div class="col-md-3">
                                <ul class="ver-inline-menu tabbable margin-bottom-10">
                                    <li id="li21" runat="server" class="active">
                                        <a data-toggle="tab" href="#Subtab_2_1">
                                            <i class="fa fa-cog"></i>
                                            البيانات الشخصية
                                        </a>
                                        <span class="after"></span>
                                    </li>
                                    <li id="li22" runat="server"><a data-toggle="tab" href="#Subtab_2_2"><i class="fa fa-picture-o"></i>الصورة الشخصية</a></li>
                                    <li id="li23" runat="server"><a data-toggle="tab" href="#Subtab_2_3"><i class="fa  fa-phone"></i>بيانات الإتصال والتواصل</a></li>
                                    <li id="li24" runat="server"><a data-toggle="tab" href="#Subtab_2_4"><i class="fa fa-file-text-o"></i>بيانات الحالة الإجتماعية</a></li>
                                    <li id="li25" runat="server"><a data-toggle="tab" href="#Subtab_2_5"><i class="fa glyphicon glyphicon-user"></i>بيانات العائلة</a></li>
                                    <li id="li26" runat="server"><a data-toggle="tab" href="#Subtab_2_6"><i class="fa fa-gears"></i>بيانات التوظيف</a></li>
                                    <li id="li29" runat="server"><a data-toggle="tab" href="#Subtab_2_9"><i class="fa fa-building"></i>بيانات الراتب</a></li>
                                    <li id="li27" runat="server"><a data-toggle="tab" href="#Subtab_2_7"><i class="fa fa-building"></i>بيانات البنك</a></li>
                                    <li id="li28" runat="server" visible="false"><a data-toggle="tab" href="#Subtab_2_8"><i class="fa fa-building"></i>انهاء خدمة الموظف </a></li>
                                </ul>
                            </div>
                            <div class="col-md-9">
                                <div class="tab-content">
                                    <div runat="server" id="Subtab_2_1" class="tab-pane active" clientidmode="Static">
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">الاسم بالكامل <span class="required" style="font-family: Tahoma!important" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-9" style="padding: 0px">
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="Ar_F_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="Ar_S_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="Ar_Th_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="Ar_Family" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">Full Name <span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-9" style="padding: 0px">
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="En_F_Name" runat="server" placeHolder="الاسم الاول" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="En_S_Name" runat="server" placeHolder="اسم الاب" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="En_Th_Name" runat="server" placeHolder="اسم الجد" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="En_Family" runat="server" placeHolder="اسم العائلة" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">اسم الام  <span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <asp:TextBox ID="MotherName" placeholder="ادخل اسم الام" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <label class="control-label col-md-3">الجنس<span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <div class="radio-list">
                                                    <asp:RadioButtonList ID="Gender" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="Gender_SelectedIndexChanged">
                                                        <asp:ListItem Value="True">ذكر</asp:ListItem>
                                                        <asp:ListItem Value="False">أنثى</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                                <div id="form_gender_error"></div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">الجنسية   </label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <asp:DropDownList ID="Nationality" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select 0,N' '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="3" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                            <label class="control-label col-md-3">تاريخ الميلاد <span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="DOB" runat="server" placeholder="ادخل تاريج ميلادك" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">مكان الميلاد  <span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <asp:TextBox ID="POB" placeholder="ادخل مكان ميلادك" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <label class="control-label col-md-3">رقم الهوية </label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <asp:TextBox ID="SSN" placeholder="ادخل رقم الهوية" runat="server" CssClass="form-control" name="username"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">رقم جواز السفر </label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <asp:TextBox ID="passportNo" placeholder="الرجاء ادخال  رقم جواز السفر." runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <label class="control-label col-md-3">نوع رخصة القيادة </label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <asp:DropDownList ID="DriverType" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select 0,N' '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="4" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">رقم رخصة القيادة </label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <asp:TextBox ID="DriverNo" runat="server" placeholder="ادخل رخصة القيادة" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9" style="padding: 5px">
                                                <asp:Button ID="Button1" runat="server" Text="حفظ" class="btn green" OnClick="Button1_Click" />
                                                <asp:Button ID="Button2" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button2_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div runat="server" id="Subtab_2_2" class="tab-pane" clientidmode="Static">
                                        <div class="form-group row">
                                            <div class="col-md-5">
                                                <div class="image-editor" style="width: 200px;">
                                                    <input type="file" class="cropit-image-input" />
                                                    <div class="cropit-image-preview">
                                                    </div>
                                                    <div class="image-size-label" style="text-align: center">
                                                        تكبير / تصغير الصورة
                                                    </div>
                                                    <input type="range" class="cropit-image-zoom-input" />
                                                    <input type="hidden" name="imgCropped" class="hidden-image-data" />
                                                    <input type="button" class="crop btn red btn btn-rounded default btn-block w80" value="اقتصاص" />
                                                    <asp:Button ID="Button11" runat="server" class="btn blue btn btn-rounded default btn-block w80" Text="حفظ" OnClick="Button11_Click" ClientIDMode="Static" Style="display: none" />
                                                </div>
                                            </div>
                                            <div class="col-md-5" style="float: left; padding-top: 33px;">

                                                <img runat="server" id="image" />
                                            </div>
                                            <%--     <label class="control-label col-md-3">ادخال صورة شخصية  <span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-4">
                                                <asp:FileUpload ID="image" runat="server" Width="436px" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="Button11" runat="server" Text="حفظ" class="btn green" OnClick="Button11_Click" />
                                                <asp:Button ID="Button12" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button12_Click" />
                                            </div>--%>
                                        </div>
                                    </div>
                                    <div runat="server" id="Subtab_2_3" class="tab-pane" clientidmode="Static">
                                        <div role="form">

                                            <div class="form-group row">
                                                <label class="control-label col-md-2">رقم الهاتف<span class="required" style="font-family: Tahoma!important">*</span></label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="phone" placeholder="ادخل رقم الهاتف" MaxLength="7" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <label class="control-label col-md-2">رقم الجوال<span class="required" style="font-family: Tahoma!important">*</span></label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="mobile" placeholder="ادخل رقم الجوال" MaxLength="10" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-2">البريد الالكتروني <span class="required" style="font-family: Tahoma!important">*</span></label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                                        <asp:TextBox ID="email" type="email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <label class="control-label col-md-2">رقم الفاكس</label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="fax" runat="server" placeholder="ادخل رقم الفاكس" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-2">المحافظة</label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="CityID" OnSelectedIndexChanged="CityID_SelectedIndexChanged" CssClass="select2_category form-control" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource12" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:HumanResources  %>' SelectCommand="SELECT  [ID], [ArName] FROM [Governorates] WHERE  ((CountryID=1) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر المحافظة'"></asp:SqlDataSource>
                                                </div>

                                                <label class="control-label col-md-2">المدينة<span class="required" style="font-family: Tahoma!important">*</span></label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="Region" runat="server" DataSourceID="SqlDataSource19" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:HumanResources %>" SelectCommand="SELECT  [ID], [ArName] FROM [City] WHERE  ((GovernoratesID=@GovernoratesID) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select 0 , N'إختر المدينة'">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="CityID" Name="GovernoratesID" PropertyName="SelectedValue" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-2">اسم الشارع<span class="required" style="font-family: Tahoma!important">*</span></label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="street" placeholder="ادخل اسم الشارع" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <label class="control-label col-md-2">رقم المنزل <span class="required" style="font-family: Tahoma!important">*</span></label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="home" runat="server" placeholder="ادخل رقم المنزل" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-2">البريدالجامعي <span class="required" style="font-family: Tahoma!important">*</span></label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                                        <asp:TextBox ID="UnivEmail" type="email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-actions fluid">
                                                <div class="col-md-offset-2 col-md-10">
                                                    <asp:Button ID="Button15" runat="server" Text="حفظ" class="btn green" OnClick="Button3_Click" />
                                                    <asp:Button ID="Button16" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button16_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div runat="server" id="Subtab_2_4" class="tab-pane" clientidmode="Static">
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">الحالة الاجتماعية<span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-3">
                                                <div class="radio-list">
                                                    <asp:DropDownList ID="MStatus" CssClass="select2_category form-control" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource8" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" OnSelectedIndexChanged="MStatus_SelectedIndexChanged"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select 0,N''">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="6" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div runat="server" id="wifesNo" visible="false">
                                                <label class="control-label col-md-3">عدد الزوجات  </label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="wifes" runat="server" placeholder="ادخل عدد الزوجات" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <div runat="server" id="chNo" visible="false">
                                                <label class="control-label col-md-3">عدد الأبناء  </label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="children" runat="server" placeholder="ادخل عدد الأبناء " CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <label class="control-label col-md-3">عدد المعالين  <span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="DependentNo" runat="server" placeholder="ادخل عدد المعالين" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="Button5" runat="server" Text="حفظ" class="btn green" OnClick="Button5_Click" />
                                                <asp:Button ID="Button6" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button6_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div runat="server" id="Subtab_2_5" class="tab-pane" clientidmode="Static">

                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">صلة القرابة</label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <asp:DropDownList ID="RelativeID" CssClass="select2_category form-control" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource9" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" OnSelectedIndexChanged="RelativeID_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID], [Ar_Name] FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select 0,N' '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="11" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>

                                        </div>

                                        <div class="form-group row">
                                            <asp:Label runat="server" ID="lblName" class="control-label col-md-3">الاسم بالكامل<span class="required"style="font-family:Tahoma!important">*</span></asp:Label>
                                            <div class="col-md-9" style="padding: 0px">
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="F_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="S_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="Th_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="Family_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Label ID="EmpFamilyID" runat="server" Text="" Visible="false"></asp:Label>

                                        <div class="form-group row" runat="server">
                                            <asp:Label ID="lbldate" runat="server" class="col-md-3 control-label" Text="تاريخ الميلاد"></asp:Label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="DOB1" runat="server" placeholder="ادخل التاريخ" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>

                                                </div>
                                            </div>
                                            <asp:Label ID="BPlace" runat="server" class="col-md-3 control-label" Text="مكان الميلاد"></asp:Label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <asp:TextBox ID="birth_Place" placeholder="مكان الميلاد " runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>

                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">نوع الوظيفة</label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <asp:DropDownList ID="JobType" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource10" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource10" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select 0,N' '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="19" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                            </div>
                                            <label class="col-md-3 control-label">هل تعيل هذا الفرد     </label>
                                            <div class="col-md-3" style="padding: 5px">
                                                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="Check_Changed" />
                                            </div>


                                        </div>

                                        <div class="form-group row col-md-6" runat="server" id="Active" style="padding: 0px">
                                            <label class="col-md-6 control-label">سبب اعتباره غير فعال </label>
                                            <div class="col-md-6" style="padding: 5px">
                                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource11" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource11" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select 34,N' '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="21" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                        <div class="form-group row col-md-6" runat="server" id="Active2" style="padding: 0px">

                                            <label class="col-md-6 control-label">تاريخ اعتباره غير فعال</label>
                                            <div class="col-md-6" style="padding: 5px">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="NotActive_Date" placeholder="تاريخ اعتباره غير فعال" runat="server" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="dd/mm/yyyy"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-actions fluid row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="Button13" runat="server" Text="حفظ" CssClass="btn green" OnClick="Button13_Click" />
                                                <asp:Button ID="Button14" runat="server" Text="تفريغ الحقول" CssClass="btn default" OnClick="Button14_Click" />
                                            </div>
                                        </div>

                                        <div class="portlet box red">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>بيانات العائلة</div>
                                                <div class="tools">
                                                    <%--    <a class="remove" href="javascript:;"></a>--%>
                                                    <a href="javascript:;" class="collapse"></a>

                                                </div>
                                            </div>
                                            <div class="portlet-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 20%">الاسم </th>

                                                                <th style="width: 10%; text-align: center">صلة القرابة</th>
                                                                <th style="width: 15%; text-align: center">تاريخ الميلاد</th>
                                                                <th style="width: 15%; text-align: center">الوظيفة</th>
                                                                <th style="width: 15%"></th>
                                                                <%--     <th style="width: 5%; text-align: center">فعال</th>--%>
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource18">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="EmpFamilyID" runat="server" Text='<%# Eval("Emp_Family_ID") %>' Visible="false"></asp:Label>
                                                                    <tr>
                                                                        <td><span><%# Eval("F_Name") %> <%# Eval("S_Name") %> <span><%# Eval("Th_Name") %> <%# Eval("Family_Name") %></span></td>

                                                                        <td style="text-align: center"><span><%# Eval("Ar_Name") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("Date_Of_Birth","{0:yyyy/MM/dd}")  %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("h") %></span></td>

                                                                        <td style="text-align: center">
                                                                            <%-- <% if (Permissions.Contains("FamilyEdit"))
                                                                               { %>--%>
                                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                            <%-- <%} %>
                                                                            <% if (Permissions.Contains("FamilyDelete"))
                                                                               { %>--%>
                                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                            <%--   <%} %>--%>
                                                                        </td>


                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource18" runat="server"
                                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                                SelectCommand="EmpFamilyGet" SelectCommandType="StoredProcedure">

                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div runat="server" id="Subtab_2_6" class="tab-pane" clientidmode="Static">


                                        <div class="form-group row">
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">

                                            <label class="col-md-2 control-label">تصنيف الدوام</label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="ddlEmpCategory" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource16" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource16" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,CategoryName FROM [EmpCategory] where ID<>0 union select -1,N'اختر تصنيف الدوام'"></asp:SqlDataSource>
                                            </div>

                                            <label class="control-label col-md-2">بيانات اكاديمية  </label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="ddlAcademicData" runat="server" CssClass="select2_category form-control">
                                                    <asp:ListItem Value="-1">اختر التصنيف</asp:ListItem>
                                                    <asp:ListItem Value="0">غير خاضع للبيانات الاكاديمية</asp:ListItem>
                                                    <asp:ListItem Value="1">خاضع للبيانات الاكاديمية</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>

                                        </div>
                                        <div id="RetirmentStatus" runat="server">
                                            <div class="form-group row">
                                                <label class="col-md-2 control-label">حالة التقاعد </label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="ddlRetirementStatus" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource33" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource33" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] where Constant_ID=1032 union select -1,N'اختر حالة التقاعد'"></asp:SqlDataSource>
                                                </div>
                                                <label class="col-md-2 control-label">خاضع للكادر  </label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="ddlCaderEmployee" runat="server" CssClass="select2_category form-control">
                                                        <asp:ListItem Value="1">فعال</asp:ListItem>
                                                        <asp:ListItem Value="0">غير فعال</asp:ListItem>

                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-md-4">
                                                    <asp:Button ID="Button9" runat="server" Text="حفظ" class="btn green" OnClick="Button9_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div id="DivEmpDegree" runat="server" visible="false">
                                            <h3>تغيير درجة الموظف</h3>
                                            <hr />
                                            <div class="form-group row">

                                                <label class="col-md-2 control-label">درجة الموظف</label>
                                                <div class="col-md-3">
                                                    <asp:DropDownList ID="ddlCader" runat="server" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="ID" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCader_SelectedIndexChanged"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Cader] union select -1,N'اختر الكادر'"></asp:SqlDataSource>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:DropDownList ID="ddlGrade" runat="server" DataSourceID="SqlDataSource28" DataTextField="Name" DataValueField="ID" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlGrade_SelectedIndexChanged"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource28" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Grade] where CaderID=@CaderID union select -1,N'اختر الفئة'">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlCader" Name="CaderID" DbType="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:DropDownList ID="ddlDegree" runat="server" DataSourceID="SqlDataSource29" DataTextField="Name" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource29" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Degree] where GradeID=@GradeID union select -1,N'اختر الدرجة '">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlGrade" Name="GradeID" DbType="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                                <asp:Button ID="btnEmpDegree" runat="server" Text="حفظ" class="btn green" OnClick="btnEmpDegree_Click" />

                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-2 control-label">أقدمية الموظف</label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="txtSeniority" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <asp:LinkButton ID="btnSeniority" runat="server" Text="حفظ" OnClick="btnSeniority_Click" CssClass="btn green" />
                                            </div>
                                        </div>
                                        <div id="EmpType" runat="server" visible="false">
                                            <h3>تغيير نوع الموظف</h3>
                                            <hr />
                                            <div class="form-group row">

                                                <label class="col-md-2 control-label">نوع الموظف</label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="ddlEmpTypeID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource36" DataTextField="EmployeeType" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpTypeID_SelectedIndexChanged"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource36" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,EmployeeType FROM [EmployeeTypes] union select -1,N'اختر نوع الموظف'"></asp:SqlDataSource>
                                                </div>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="ddlEmpSubTypeID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource37" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource37" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [EmployeeSubTypes] where EmployeeTypesID=@EmpTypeID union select -1,N'اختر نوع الموظف'">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlEmpTypeID" PropertyName="SelectedValue" Type="String" Name="EmpTypeID" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                                <asp:Button ID="brnSaveEmpType" runat="server" Text="حفظ" class="btn green" OnClick="brnSaveEmpType_Click" />
                                            </div>
                                        </div>
                                        <div id="DivEmpStatus" runat="server" visible="false">
                                            <h3>تغيير حالة الموظف</h3>
                                            <hr />
                                            <div class="form-group row">

                                                <label class="col-md-2 control-label">حالة الموظف</label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="Empstatus" Enabled="true" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource7" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" OnSelectedIndexChanged="Empstatus_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select -1,N' اختر حالة الموظف'">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="7" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>

                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="ddlEmpSubStatus" Enabled="true" CssClass="select2_category form-control" runat="server" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>

                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource22" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1034 Union Select -1,N'الكل'"></asp:SqlDataSource>

                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource34" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1030 Union Select -1,N'الكل'"></asp:SqlDataSource>

                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource35" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select Sub_Constant_ID,Ar_Name from Emp_Sub_Constant where Constant_ID=1033 Union Select -1,N'الكل'"></asp:SqlDataSource>

                                                </div>
                                                <asp:Button ID="btnChangeEmpStatus" runat="server" Text="حفظ" class="btn green" OnClick="btnChangeEmpStatus_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div runat="server" id="Subtab_2_7" class="tab-pane" clientidmode="Static">
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">البنك</label>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="Banks" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource25" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource25" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select 0,N' '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="10" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                            <label class="control-label col-md-3">فرع البنك</label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="BankBranch" runat="server" placeholder="ادخل فرع البنك" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">رقم الحساب البنكي  <span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="AccountBank" runat="server" placeholder="ادخل رقم الحساب البنكي" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="Button7" runat="server" Text="حفظ" class="btn green" OnClick="Button7_Click" />
                                                <asp:Button ID="Button8" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button8_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div runat="server" id="Subtab_2_9" class="tab-pane" clientidmode="Static" visible="true">
                                        <div id="DegreeBounsDiv" runat="server" visible="true">
                                            <h3>علاوة طبيعة عمل الموظف  </h3>
                                            <hr />
                                            <div class="form-group row">
                                                <label class="col-md-4 control-label">نسبة علاوة طبيعة العمل</label>
                                                <div class="col-md-5">
                                                    <asp:Repeater ID="Repeater19" runat="server" DataSourceID="SqlDataSource42">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmployeeDegreeBouns" Style="color: red" runat="server" Text='<%#Eval("Value") %>' class="col-md-2 control-label"></asp:Label>
                                                            <label class="col-md-1 control-label" style="color: red">%</label>

                                                            <asp:Button ID="btnAddExceptionDegreeBouns" Visible='<%# !Convert.ToBoolean(Eval("HaveExceptionDegreeBouns")) %>' runat="server" Text="اضافة استثناء علاوة طبيعة عمل" CssClass="btn green" OnClick="btnAddExceptionDegreeBouns_Click" />
                                                            <asp:Button ID="btnDeleteDegreeBounsException" Visible='<%# Eval("HaveExceptionDegreeBouns") %>' runat="server" CssClass="btn purple" Text="حذف الاستثناء" OnClick="btnDeleteDegreeBounsException_Click" />

                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource42" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Select [dbo].[GetEmployeeDegreeBounsValue](@EmployeeID) as Value,[dbo].[HaveExceptionDegreeBouns](@EmployeeID) as HaveExceptionDegreeBouns">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="EmployeeID"></asp:ControlParameter>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                                <br />
                                                <div class="form-group row" id="ExceptionDegreeBounsDiv" runat="server" visible="false">
                                                    <br />
                                                    <h4 class="inlineh"><i class="fa fa-edit" style="margin: 0 20px!important"></i>اضافة استثناء علاوة لموظف</h4>
                                                    <label class="col-md-1 control-label">الوصف</label>
                                                    <div class="col-md-2">
                                                        <asp:DropDownList ID="ddlDegreeBounsRVType" CssClass="select2_category form-control" placeholder="اختر الوصف" runat="server">
                                                            <asp:ListItem>اختر الوصف</asp:ListItem>
                                                            <asp:ListItem Value="1">نسبة</asp:ListItem>
                                                            <asp:ListItem Value="2">قيمة</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <label class="col-md-2 control-label">النسبة/المبلغ</label>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="txtDegreeBounsValue" placeholder="ادخل نسبة/قيمة " runat="server" class="form-control" Text=""></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-1 control-label">العملة</label>
                                                    <div class="col-md-2">
                                                        <asp:DropDownList ID="ddlDegreeBounsCurrencyID" class="form-control" CssClass="select2_category form-control" placeholder="ادخل نوع العملة " runat="server" DataSourceID="SqlDataSource41" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                                        <asp:SqlDataSource runat="server" ID="SqlDataSource41" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select -1,N' اختر العملة '"></asp:SqlDataSource>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:Button ID="btnAddDegreeBouns" runat="server" Text="حفظ" class="btn blue" OnClick="btnAddDegreeBouns_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="Div4" runat="server" visible="false">
                                            <h3>اضافة علاوة للموظف  </h3>
                                            <hr />
                                            <%-- <iframe width="100%" height="70%" src="../Finanical/AddEmployeeBouns - Copy.aspx"  scrolling="no"></iframe>--%>
                                            <div class="form-group row">

                                                <label class="col-md-2 control-label" style="text-align: right">نوع العلاوة </label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="ddlBounsType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBounsType_SelectedIndexChanged" DataSourceID="SqlDataSource38" DataTextField="Name" DataValueField="ID" CssClass="form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource38" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [BounsType]  Where IsDelete=0 union select -1,N' اختر نوع العلاوة '"></asp:SqlDataSource>
                                                </div>


                                                <label class="col-md-2 control-label" style="text-align: right">العلاوة </label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="ddlBouns" runat="server" DataSourceID="SqlDataSource39" DataTextField="Name" DataValueField="ID" CssClass="form-control" data-placeholder="Choose a Category" TabIndex="1" AutoPostBack="true" OnSelectedIndexChanged="ddlBouns_SelectedIndexChanged"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource39" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT ID,Name FROM [Bouns] where BounsTypeID=@BounsTypeID and   IsDelete=0  union select -1,N' اختر  العلاوة '">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlBounsType" PropertyName="SelectedValue" Name="BounsTypeID"></asp:ControlParameter>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="form-group row" id="Div5" runat="server" visible="false">
                                                <label class="col-md-2 control-label">الوصف</label>
                                                <div class="col-md-2">
                                                    <asp:Label ID="lblRVType" Style="color: red" runat="server" Text="Label" class="col-md-2 control-label"></asp:Label>
                                                </div>
                                                <label class="col-md-2 control-label">النسبة/المبلغ</label>
                                                <div class="col-md-2">
                                                    <asp:Label ID="lblValue" Style="color: red" runat="server" Text="Label" class="col-md-2 control-label"></asp:Label>
                                                </div>
                                                <label class="col-md-2 control-label">العملة</label>
                                                <div class="col-md-2">
                                                    <asp:Label ID="lblCurrency" Style="color: red" runat="server" Text="" class="col-md-2 control-label"></asp:Label>
                                                </div>

                                            </div>
                                            <div class="form-group row" id="exceptionAdddiv" runat="server" visible="false">
                                                <label style="font-weight: bold;" class="col-md-4 control-label">لاضافة استثناء علاوة اضغط هنا </label>
                                                <div class="col-md-2">
                                                    <asp:Button ID="AddException" runat="server" Text="اضافة استثناء" CssClass="btn green" OnClick="AddException_Click" />
                                                </div>
                                            </div>
                                            <div class="form-group row" id="DivException" runat="server" visible="false">
                                                <h4 class="inlineh"><i class="fa fa-edit" style="margin: 0 20px!important"></i>اضافة استثناء علاوة لموظف</h4>
                                                <label class="col-md-2 control-label">الوصف</label>
                                                <div class="col-md-2">
                                                    <asp:DropDownList ID="ddlRVType" CssClass="select2_category form-control" placeholder="اختر الوصف" runat="server">
                                                        <asp:ListItem>اختر الوصف</asp:ListItem>
                                                        <asp:ListItem Value="1">نسبة</asp:ListItem>
                                                        <asp:ListItem Value="2">قيمة</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <label class="col-md-2 control-label">النسبة/المبلغ</label>
                                                <div class="col-md-2">
                                                    <asp:TextBox ID="txtAmount" placeholder="ادخل نسبة/قيمة " runat="server" class="form-control" Text=""></asp:TextBox>
                                                </div>
                                                <label class="col-md-2 control-label">العملة</label>
                                                <div class="col-md-2">
                                                    <asp:DropDownList ID="CurrType" class="form-control" CssClass="select2_category form-control" placeholder="ادخل نوع العملة " runat="server" DataSourceID="SqlDataSource40" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource40" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select -1,N' اختر العملة '"></asp:SqlDataSource>
                                                </div>

                                            </div>
                                            <div class="form-group row">
                                                <asp:Button ID="btnSaveBouns" runat="server" Text="حفظ العلاوة أو الاستثناء" class="btn blue" OnClick="btnSaveBouns_Click" />
                                            </div>
                                        </div>
                                        <div class="portlet box green">

                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>علاوات الموظف</div>
                                                <div class="tools">
                                                    <a class="remove" href="javascript:;"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body form">

                                                <div class="form-body">

                                                    <% if (ListView1.Items.Count > 0)
                                                        { %>
                                                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 30%">الموظف</th>
                                                                <th style="width: 30%">نوع العلاوة</th>
                                                                <th style="width: 30%">العلاوة</th>
                                                                <th style="width: 5%">فعال</th>
                                                                <th style="width: 5%"></th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource32">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                        <td><span><%# Eval("DisplayName") %></span></td>
                                                                        <td><span><%# Eval("BounsTypeName") %></span></td>
                                                                        <td><span><%# Eval("BounsName") %></span></td>
                                                                        <td><span>
                                                                            <asp:CheckBox ID="IsActive" runat="server" AutoPostBack="true" Checked=' <%# Convert.ToBoolean(Eval("IsActive")) %>' OnCheckedChanged="IsActive_CheckedChanged" /></td>
                                                                        <td>
                                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click1" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton></td>

                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:ListView>
                                                            <asp:SqlDataSource runat="server" ID="SqlDataSource32" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="GetEmployeeBouns" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="EmployeeID" Type="Int16" DefaultValue="-1"></asp:ControlParameter>
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>

                                                    </table>
                                                    <div class="clearfix"></div>

                                                    <% } %>
                                                    <%  else
                                                        { %>

                                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                        <div class="col-xs-11" style="text-align: center">
                                                            <strong>لايوجد علاوات للموظف</strong>
                                                            <div style="clear: both"></div>
                                                        </div>
                                                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                        <div style="clear: both"></div>
                                                    </div>

                                                    <%  } %>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div runat="server" id="Subtab_2_8" class="tab-pane" clientidmode="Static" visible="false">
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">نوع انهاء الخدمة</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="DropDownList4" Enabled="true" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource43" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID" OnSelectedIndexChanged="Empstatus2_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource43" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Sub_Constant_ID] in (1043, 2122))"></asp:SqlDataSource>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">سبب انهاء الخدمة</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlTerminateReason" CssClass="select2_category form-control" runat="server" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="control-label col-md-3">تاريخ انهاء الخدمة</label>
                                            <div class="col-md-6">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="txtTerminateDate" runat="server" placeholder="ادخل تاريج انهاء الخدمة" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="btnTerminate" runat="server" Text="انهاء الخدمة" class="btn green" OnClick="btnTerminate_Click" />

                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!--end col-md-9-->

                            </div>
                        </div>
                    </div>
                    <!--end tab-pane-->
                    <div runat="server" class="tab-pane" id="tab_1_3" clientidmode="Static">
                        <div class="row profile-account">
                            <div class="col-md-3">
                                <ul class="ver-inline-menu tabbable margin-bottom-10">
                                    <li id="li31" runat="server" class="active">
                                        <a data-toggle="tab" href="#subtab_3_1">
                                            <i class="fa fa-certificate"></i>
                                            المؤهلات العلمية
                                        </a>
                                        <span class="after"></span>
                                    </li>
                                    <li id="li32" runat="server"><a data-toggle="tab" href="#subtab_3_2"><i class="fa fa-bookmark-o"></i>الخبرات العملية</a></li>
                                    <li id="li33" runat="server"><a data-toggle="tab" href="#subtab_3_3"><i class="fa fa-list"></i>الدورات التدريبية</a></li>
                                    <li id="li34" runat="server"><a data-toggle="tab" href="#subtab_3_4"><i class="fa fa-pencil-square"></i>اللغات</a></li>
                                    <li id="li35" runat="server"><a data-toggle="tab" href="#subtab_3_5"><i class="fa fa-pencil-square"></i>الحاسوب</a></li>
                                    <li id="li36" runat="server"><a data-toggle="tab" href="#subtab_3_6"><i class="fa fa-pencil-square"></i>ارفق ملفاتك</a></li>
                                </ul>
                            </div>
                            <div class="col-md-9">
                                <div class="tab-content">
                                    <div runat="server" id="subtab_3_1" class="tab-pane active" clientidmode="Static">
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">نوع المؤهل</label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="QulTypeID" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource14" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource14" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID],  [Ar_Name] FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select 0,N' '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="12" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                            <label class="col-md-2 control-label">دولة المؤهل</label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="CuntID" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource15" DataTextField="ArabicName" DataValueField="ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource15" ConnectionString='<%$ ConnectionStrings: HumanResources %>'
                                                    SelectCommand="SELECT  [ID], [ArabicName] FROM [Country] WHERE  (([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر الدولة'"></asp:SqlDataSource>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">الجامعة / الكلية</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="UniID" runat="server" CssClass="form-control" placeholder="الجامعة"></asp:TextBox>
                                                <%--<asp:DropDownList ID="UniID" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource16" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource16" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID],  [Ar_Name] FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select 0,N''">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="22" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>--%>
                                            </div>
                                            <label class="col-md-2 control-label">تاريخ التخرج    </label>
                                            <div class="col-md-4">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="Res_Date" runat="server" placeholder="ادخل التاريخ" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">المعدل/التقدير </label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtAvg" runat="server" CssClass="form-control" placeholder="ادخل معدل التخرج"></asp:TextBox>
                                            </div>
                                            <label class="col-md-2 control-label">الكلية</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="col" runat="server" CssClass="form-control" placeholder="ادخل الكلية"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">التخصص</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="Speclize" runat="server" CssClass="form-control" placeholder="ادخل التخصص"></asp:TextBox>
                                                <span class="help-block"></span>
                                            </div>
                                            <label class="col-md-2 control-label">الشهادة المرفقة</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="QTextBox11" runat="server" CssClass="form-control" placeholder="ادخل الشهادة المرفقة"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">

                                            <div class="col-md-4">
                                                <asp:Image ID="Image1" runat="server" Visible="false" Width="150px" Height="150px" />
                                                <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
                                                <asp:FileUpload ID="FileUpload1" runat="server" Visible="true" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="Button30" runat="server" Text="حفظ" class="btn green" OnClick="Button30_Click" />
                                                <asp:Button ID="Button31" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCance31_Click2" />
                                            </div>
                                        </div>
                                        <div class="portlet box red">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>بيانات مؤهلات الموظف</div>
                                                <div class="tools">
                                                    <%--  <a class="remove" href="javascript:;"></a>--%>
                                                    <a href="javascript:;" class="collapse"></a>

                                                </div>
                                            </div>
                                            <div class="portlet-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>

                                                                <th style="width: 20%">نوع المؤهل العلمي</th>
                                                                <th style="width: 20%">الكلية</th>
                                                                <th style="width: 20%">التخصص  </th>
                                                                <th style="width: 20%; text-align: center">تاريخ التخرج</th>
                                                                <th style="width: 20%"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource21">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Qualifaction_ID" runat="server" Text='<%# Eval("Qualifaction_ID") %>' Visible="false"></asp:Label>
                                                                    <tr>

                                                                        <td><span><%# Eval("Ar_Name") %></span></td>
                                                                        <td><span><%# Eval("Collage_Name") %></span></td>
                                                                        <td><span><%# Eval("Speclize") %></span></td>
                                                                        <td><span><%# Eval("Graduate_Date","{0:yyyy/MM/dd}") %></span></td>

                                                                        <td style="text-align: center">
                                                                            <%-- <% if (Permissions.Contains("QualificationsEdit"))
                                                                               { %>--%>
                                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEditQul_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                            <%-- <%} %>

                                                                            <% if (Permissions.Contains("QualificationsDelete"))
                                                                               { %>--%>
                                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteQul_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                            <%-- <%} %> --%>   </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource21" runat="server"
                                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                                SelectCommand="EmpQualGetAll" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div runat="server" id="subtab_3_2" class="tab-pane" clientidmode="Static">
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">نوع العمل</label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="JobName" runat="server" Rows="3" CssClass="form-control" placeholder="ادخل نوع العمل "></asp:TextBox>
                                                <span class="help-block"></span>
                                            </div>
                                            <label class="col-md-3 control-label">تفاصيل العمل</label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="JobDetailes" runat="server" Rows="3" CssClass="form-control" placeholder="ادخل تفاصيل العمل"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">مكان العمل</label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="CompName" runat="server" Rows="3" CssClass="form-control" placeholder="ادخل  مكان العمل"></asp:TextBox>
                                            </div>
                                            <label class="col-md-3 control-label">مجال العمل </label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="ScopeName" runat="server" Rows="3" CssClass="form-control" placeholder="ادخل  مجال العمل "></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">تاريخ بداية العمل    </label>
                                            <div class="col-md-3">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="From_Date" runat="server" placeholder="ادخل تاريخ بداية العمل" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>

                                                </div>
                                            </div>
                                            <label class="col-md-3 control-label">تاريخ نهاية العمل    </label>
                                            <div class="col-md-3">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="To_Date" runat="server" placeholder="ادخل تاريخ نهاية العمل" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">أسباب ترك العمل</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="LeaveReason" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="ادخل أسباب ترك العمل"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="Button21" runat="server" Text="حفظ" class="btn green" OnClick="Button21_Click" />
                                                <asp:Button ID="Button22" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel21_Click2" />
                                            </div>
                                        </div>
                                        <!--end tab-pane-->
                                        <div class="portlet box red">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>بيانات خبرات الموظف</div>
                                                <div class="tools">
                                                    <%--  <a class="remove" href="javascript:;"></a>--%>
                                                    <a href="javascript:;" class="collapse"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 20%">اسم الموظف</th>
                                                                <th style="width: 20%">نوع العمل</th>
                                                                <th style="width: 20%">مكان العمل  </th>
                                                                <th style="width: 20%; text-align: center">مجال العمل</th>
                                                                <th style="width: 20%; text-align: center"></th>


                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource23">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Experince_ID" runat="server" Text='<%# Eval("Experince_ID") %>' Visible="false"></asp:Label>
                                                                    <tr>
                                                                        <td><span><%# Eval("Ar_F_Name") %>  <%# Eval("Ar_Family_Name") %></span></td>
                                                                        <td><span><%# Eval("Job_Name") %></span></td>
                                                                        <td><span><%# Eval("Company_Name") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("Company_Work_Scope") %></span></td>
                                                                        <td style="text-align: center">
                                                                            <%-- <% if (Permissions.Contains("ExperiencesEdit"))
                                                                               { %>--%>
                                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEditExp_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                            <%--  <%} %>

                                                                            <% if (Permissions.Contains("ExperiencesDelete"))
                                                                               { %>--%>
                                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteExp_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                            <%-- <%} %>--%>

                                                                        </td>


                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource23" runat="server"
                                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                                SelectCommand="EmpExperienceGetAll" SelectCommandType="StoredProcedure">

                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>







                                        </div>


                                    </div>

                                    <div runat="server" id="subtab_3_3" class="tab-pane" clientidmode="Static">
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">اسم الدورة</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtName" runat="server" Rows="3" CssClass="form-control" placeholder="ادخل اسم الدورة"></asp:TextBox>
                                            </div>
                                            <label class="col-md-2 control-label">الجهة المنظمة</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtSubmit" runat="server" Rows="3" CssClass="form-control" placeholder="ادخل الجهة المنظمة"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">الاختصاص</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="SpecializeIn" runat="server" Rows="3" CssClass="form-control" placeholder="ادخل اختصاص الدورة"></asp:TextBox>
                                            </div>
                                            <label class="col-md-2 control-label">عدد الساعات</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="CourseHours" runat="server" Rows="3" CssClass="form-control" placeholder="ادخل عدد ساعات الدورة"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">تاريخ بداية الدورة    </label>
                                            <div class="col-md-4">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="txtSDate" runat="server" placeholder="ادخل تاريخ بداية الدورة" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                                </div>
                                            </div>
                                            <label class="col-md-2 control-label">تاريخ نهاية الدورة    </label>
                                            <div class="col-md-4">
                                                <div class="input-icon">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="txtFDate" runat="server" placeholder="ادخل تاريخ نهاية الدورة" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">ملاحظات</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtNotes" runat="server" placeholder="ادخل ملاحظات" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-2 col-md-10">
                                                <asp:Button ID="Button23" runat="server" Text="حفظ" class="btn green" OnClick="Button23_Click" />
                                                <asp:Button ID="Button24" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel24_Click2" />
                                            </div>
                                        </div>
                                        <div class="portlet box red">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>بيانات دورات الموظف</div>
                                                <div class="tools">
                                                    <a href="javascript:;" class="collapse"></a>
                                                </div>
                                            </div>
                                            <div class="portlet-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>

                                                                <th style="width: 15%">اسم الدورة </th>
                                                                <th style="width: 15%">الجهة المنظمة </th>
                                                                <th style="width: 20%; text-align: center">تاريخ البدء </th>
                                                                <th style="width: 20%; text-align: center">تاريخ الانتهاء </th>
                                                                <th style="width: 20%; text-align: center"></th>

                                                                <%--   <th style="width: 20%; text-align: center">ملاحظات</th>--%>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource24">
                                                                <ItemTemplate>

                                                                    <asp:Label ID="CourseID" runat="server" Text='<%# Eval("Course_ID") %>' Visible="false"></asp:Label>
                                                                    <tr>
                                                                        <td><span><%# Eval("Course_Name") %></span></td>
                                                                        <td><span><%# Eval("Course_Place") %></span></td>
                                                                        <%--    <td style="text-align: center"><span><%# Eval("Courses_Details") %></span></td>--%>
                                                                        <td style="text-align: center"><span><%# Eval("Course_From","{0:yyyy/MM/dd}") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("Course_To","{0:yyyy/MM/dd}")  %></span></td>

                                                                        <td style="text-align: center">
                                                                            <%--  <% if (Permissions.Contains("CoursesEdit"))
                                                                               { %>--%>
                                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEditCor_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                            <%--  <%} %>

                                                                            <% if (Permissions.Contains("CoursesDelete"))
                                                                               { %>--%>
                                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteCor_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                            <%-- <%} %>--%> </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource24" runat="server"
                                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                                SelectCommand="EmpCourcesGetAll" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <div runat="server" id="subtab_3_4" class="tab-pane" clientidmode="Static">
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">اسم اللغة</label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="LangName" CssClass="select2_category form-control" runat="server" DataSourceID="SqlDataSource17" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource17" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID],  [Ar_Name] FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select 0,N''">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="23" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>



                                        <div class="form-group row">
                                            <label class="control-label col-md-3">المحادثة </label>
                                            <div class="col-md-4">
                                                <div class="radio-list">
                                                    <asp:RadioButtonList ID="Speeking" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="جيد">جيد</asp:ListItem>
                                                        <asp:ListItem Value="جيد جدا">جيد جدا</asp:ListItem>
                                                        <asp:ListItem Value="ممتاز">ممتاز</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>


                                        <div class="form-group row">
                                            <label class="control-label col-md-3">الكتابة <span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-4">
                                                <div class="radio-list">
                                                    <asp:RadioButtonList ID="Writing" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="جيد">جيد</asp:ListItem>
                                                        <asp:ListItem Value="جيد جدا">جيد جدا</asp:ListItem>
                                                        <asp:ListItem Value="ممتاز">ممتاز</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>


                                        <div class="form-group row">
                                            <label class="control-label col-md-3">القراءة <span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-4">
                                                <div class="radio-list">
                                                    <asp:RadioButtonList ID="Reading" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="جيد">جيد</asp:ListItem>
                                                        <asp:ListItem Value="جيد جدا">جيد جدا</asp:ListItem>
                                                        <asp:ListItem Value="ممتاز">ممتاز</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>


                                            </div>
                                        </div>

                                        <div class="clearfix"></div>



                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="Button27" runat="server" Text="حفظ" class="btn green" OnClick="Button27_Click" />

                                                <asp:Button ID="Button28" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCance28_Click2" />
                                            </div>
                                        </div>


                                        <div class="portlet box red">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>بيانات لغات الموظف</div>
                                                <div class="tools">
                                                    <a class="remove" href="javascript:;"></a>
                                                    <a href="javascript:;" class="collapse"></a>

                                                </div>
                                            </div>

                                            <div class="portlet-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 10%">اللغة </th>
                                                                <th style="width: 15%; text-align: center">المحادثة  </th>
                                                                <th style="width: 15%; text-align: center">الكتابة </th>
                                                                <th style="width: 20%; text-align: center">القراءة</th>
                                                                <th style="width: 20%; text-align: center"></th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater9" runat="server" DataSourceID="SqlDataSource26">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                    <tr>
                                                                        <td><span><%# Eval("Ar_Name") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("Lang_Speak") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("Lang_Write") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("Lang_Read") %></span></td>

                                                                        </td>
                                                                        <td style="text-align: center">

                                                                            <%-- <% if (Permissions.Contains("LanguagesEdit"))
                                                                             { %>--%>
                                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEditLang_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                            <%--   <%} %>

                                                                        <% if (Permissions.Contains("LanguagesDelete"))
                                                                        { %>--%>
                                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteLang_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                            <%--   <%} %> --%>
                                                                        </td>

                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource26" runat="server"
                                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                                SelectCommand="LanguagesEmp_Option_GetAll" SelectCommandType="StoredProcedure">

                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>







                                        </div>


                                    </div>
                                    <div runat="server" id="subtab_3_5" class="tab-pane" clientidmode="Static">
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">اسم البرنامج</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="ProgamName" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>



                                        <div class="form-group row">
                                            <label class="control-label col-md-3">مستوى المعرفة </label>
                                            <div class="col-md-4">
                                                <div class="radio-list">
                                                    <asp:RadioButtonList ID="ComputerLevel" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="جيد">جيد</asp:ListItem>
                                                        <asp:ListItem Value="جيد جدا">جيد جدا</asp:ListItem>
                                                        <asp:ListItem Value="ممتاز">ممتاز</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="ComputerSkills" runat="server" Text="حفظ" class="btn green" OnClick="ComputerSkills_Click" />

                                                <asp:Button ID="ComputerEmpty" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="ComputerEmpty_Click" />
                                            </div>
                                        </div>


                                        <div class="portlet box red">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>برامج الحاسوب  </div>
                                                <div class="tools">
                                                    <a class="remove" href="javascript:;"></a>
                                                    <a href="javascript:;" class="collapse"></a>

                                                </div>
                                            </div>

                                            <div class="portlet-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 10%">البرنامج </th>
                                                                <th style="width: 15%; text-align: center">مستوى المعرفة  </th>
                                                                <th style="width: 20%; text-align: center"></th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource30">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                    <tr>
                                                                        <td><span><%# Eval("ProgramName") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("ComputerLevel") %></span></td>
                                                                        </td>
                                                                        <td style="text-align: center">

                                                                            <%-- <% if (Permissions.Contains("LanguagesEdit"))
                                                                        { %>--%>
                                                                            <asp:LinkButton ID="lbEditComputer" runat="server" class="btn default btn-xs black" OnClick="lbEditComputer_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                            <%--    <%} %>

                                                                        <% if (Permissions.Contains("LanguagesDelete"))
                                                                               { %>--%>
                                                                            <asp:LinkButton ID="lbDeleteComputer" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteComputer_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                            <%--  <%} %> --%>

                                                                        </td>

                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource30" runat="server"
                                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                                SelectCommand="ComputerSkillsEmp_GetAll" SelectCommandType="StoredProcedure">

                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>







                                        </div>


                                    </div>

                                    <div runat="server" id="subtab_3_6" class="tab-pane" clientidmode="Static">
                                        <div class="form-group row">
                                            <label class="col-md-4 control-label">ارفق سيرتك الذاتية (pdf أو Word ) </label>
                                            <div class="col-md-4">
                                                <asp:FileUpload ID="UploadCV" runat="server" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="form-group row">
                                            <% if (ViewCV.Text != "")
                                                { %>
                                            <label class="col-md-4 control-label">عرض الملف </label>
                                            <div class="col-md-4">
                                                <asp:LinkButton ID="ViewCVbtn" runat="server" OnClick="ViewCVbtn_Click">
                                                    <asp:Label ID="ViewCV" runat="server" class="btn default  black"></asp:Label>
                                                </asp:LinkButton>
                                            </div>
                                            <%} %>
                                        </div>


                                        <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <asp:Button ID="UploadCVFiles" runat="server" Text="تحميل" class="btn green" OnClick="UploadCVFiles_Click" />
                                                <asp:Button ID="GoToUploadPage" runat="server" Text="انتقل لصفحة تحميل المستندات" class="btn green" OnClick="GoToUploadPage_Click" />


                                            </div>
                                        </div>





                                    </div>

                                </div>
                            </div>
                            <!--end col-md-9-->
                        </div>
                    </div>
                    <!--end tab-pane-->
                    <div runat="server" class="tab-pane" id="tab_1_4" clientidmode="Static">

                        <div class="row" style="margin-bottom: 20px;">

                            <div class="form-group row">
                                <label class="col-md-3 control-label">عنوان البحث </label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TextBox3" runat="server" Rows="3" CssClass="form-control" placeholder="ادخل اسم الموضوع "></asp:TextBox>
                                </div>
                                <label class="col-md-3 control-label">الجهة المقدم لها</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TextBox2" runat="server" Rows="3" CssClass="form-control" placeholder="ادخل الجهة المقدم لها"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <label class="col-md-3 control-label">التاريخ    </label>
                                <div class="col-md-3">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="Research_Date" runat="server" placeholder="ادخل التاريخ" CssClass="form-control form-control-inline input-xsmall date-picker" data-date-format="yyyy/mm/dd" type="text" value=""></asp:TextBox>
                                    </div>
                                </div>
                                <label class="col-md-3 control-label">نبذة مختصرة عن البحث</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="ادخل نبذة مختصرة عن البحث"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-actions fluid">
                                <div class="col-md-offset-3 col-md-9">
                                    <asp:Button ID="Button25" runat="server" Text="حفظ" class="btn green" OnClick="Button25_Click" />
                                    <asp:Button ID="Button26" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel26_Click2" />
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>



                        <div class="portlet box red">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-cogs"></i>بيانات بحوث الموظف</div>
                                <div class="tools">
                                    <%--                        <a class="remove" href="javascript:;"></a>--%>
                                    <a href="javascript:;" class="collapse"></a>

                                </div>
                            </div>

                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>

                                                <th style="width: 50%">اسم الموضوع</th>
                                                <th style="width: 20%">الجهة التي قدمت لها </th>
                                                <th style="width: 15%; text-align: center">التاريخ</th>
                                                <th style="width: 15%; text-align: left"></th>


                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater14" runat="server" DataSourceID="SqlDataSource4">
                                                <ItemTemplate>
                                                    <asp:Label ID="ResearchID" runat="server" Text='<%# Eval("Research_ID") %>' Visible="false"></asp:Label>
                                                    <tr>

                                                        <td><span><%# Eval("Research_Subject") %></span></td>
                                                        <td><span><%# Eval("Submitted_To") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Research_Date","{0:yyyy/MM/dd}") %></span></td>


                                                        <td style="text-align: left">
                                                            <%--  <% if (Permissions.Contains("ResearchEdit"))
                                                               { %>--%>
                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEditRes_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                            <%--      <%} %>

                                                            <% if (Permissions.Contains("ResearchDelete"))
                                                               { %>--%>
                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteRes_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                            <%--    <%} %> --%> </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="SELECT [Research_TB].*,Employee_TB.* FROM [Research_TB] Inner Join [Employee_TB] 
on [Research_TB].Emp_ID=Employee_TB.Emp_ID where [Research_TB].IsDelete=0 and Research_TB.Emp_ID=@Emp_ID order by Research_ID DESC">

                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end tab-pane-->
                    <div runat="server" class="tab-pane" id="tab_1_5" clientidmode="Static">
                        <div class="row">
                            <div class="col-md-3">
                                <ul class="ver-inline-menu tabbable margin-bottom-10">
                                    <li id="li51" runat="server" class="active">
                                        <a data-toggle="tab" href="#subtab_5_1">
                                            <i class="fa fa-briefcase"></i>
                                            بيانات المعرفين
                                        </a>
                                        <span class="after"></span>
                                    </li>
                                    <li id="li52" runat="server"><a data-toggle="tab" href="#subtab_5_2"><i class="fa fa-group"></i>بيانات الطوارئ</a></li>
                                </ul>
                            </div>
                            <div class="col-md-9">
                                <div class="tab-content">
                                    <div runat="server" id="subtab_5_1" class="tab-pane active" clientidmode="Static">
                                        <div class="form-group row">
                                            <label class="control-label col-md-2">الاسم بالكامل<span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-10" style="padding: 0px">
                                                <div class="col-md-3" style="padding: 5px">

                                                    <asp:TextBox ID="RAr_F_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="RAr_S_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="RAr_Th_Name" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="RAr_Family" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row" style="padding: 0px">
                                            <label class="col-md-2 control-label">الوظيفة     </label>
                                            <div class="col-md-4" style="padding: 5px">
                                                <asp:TextBox ID="txtJob" runat="server" CssClass="form-control" placeholder="ادخل وظيفة المرجع"></asp:TextBox>
                                            </div>
                                            <label class="col-md-2 control-label">رقم الهاتف    </label>
                                            <div class="col-md-4" style="padding: 5px">
                                                <asp:TextBox ID="txtPhone" runat="server" MaxLength="7" CssClass="form-control" placeholder="ادخل رقم الهاتف"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row" style="padding: 0px">
                                            <label class="col-md-2 control-label">رقم الجوال     </label>
                                            <div class="col-md-4" style="padding: 5px">
                                                <asp:TextBox ID="txtMobile" MaxLength="10" runat="server" CssClass="form-control" placeholder="ادخل رقم الجوال"></asp:TextBox>
                                            </div>
                                            <label class="col-md-2 control-label">البريد الالكتروني    </label>
                                            <div class="col-md-4" style="padding: 5px">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                                    <asp:TextBox ID="txtEmail" type="email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row last " style="padding: 0px">
                                            <label class="col-md-2 control-label">تفاصيل العنوان </label>
                                            <div class="col-md-10" style="padding: 5px">
                                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="ادخل  العنوان بالكامل"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-2 col-md-10" style="padding: 5px">
                                                <asp:Button ID="Button17" runat="server" Text="حفظ" class="btn green" OnClick="Button17_Click" />
                                                <asp:Button ID="Button18" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button18_Click" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="portlet box purple">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-cogs"></i>بيانات المعرفين</div>
                                                <div class="tools">
                                                    <a href="javascript:;" class="collapse"></a>

                                                </div>
                                            </div>
                                            <div class="portlet-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 20%">الاسم </th>
                                                                <th style="width: 20%; text-align: center">الوظيفة </th>
                                                                <th style="width: 20%; text-align: center">رقم الهاتف </th>
                                                                <th style="width: 20%; text-align: center">رقم الجوال</th>
                                                                <th style="width: 20%; text-align: left"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource20">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="RefID" runat="server" Text='<%# Eval("Ref_ID") %>' Visible="false"></asp:Label>
                                                                    <tr>
                                                                        <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("Ref_Job") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("Ref_Phone") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("Ref_Mobile") %></span></td>
                                                                        <td style="text-align: left">
                                                                            <%--   <% if (Permissions.Contains("ReferencesEdit"))
                                                                               { %>--%>
                                                                            <asp:LinkButton ID="lbEdit3" runat="server" class="btn default btn-xs black" OnClick="lbEditRef_Click3"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                            <%--      <%} %>
                                                                            <% if (Permissions.Contains("ReferencesDelete"))
                                                                               { %>--%>
                                                                            <asp:LinkButton ID="lbDelete3" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteRef_Click3" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                            <%--   <%} %>--%>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource20" runat="server"
                                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                                SelectCommand="SELECT * FROM [References] WHERE IsDelete=0 and Emp_ID=@Emp_ID order by Ref_ID DESC">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div runat="server" id="subtab_5_2" class="tab-pane" clientidmode="Static">
                                        <div class="form-group row">
                                            <label class="control-label col-md-2">الاسم بالكامل<span class="required" style="font-family: Tahoma!important">*</span></label>
                                            <div class="col-md-10" style="padding: 0px">
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="ETextBox2" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="ETextBox3" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="ETextBox4" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3" style="padding: 5px">
                                                    <asp:TextBox ID="ETextBox5" runat="server" CssClass=" form-control input-xsmall"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">صلة القرابة</label>
                                            <div class="col-md-4" style="padding: 5px">
                                                <asp:DropDownList ID="DropDownList1" CssClass="select2_category form-control" runat="server"
                                                    DataSourceID="SqlDataSource13" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union  select 0,N' '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="11" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                            <label class="col-md-2 control-label">رقم الهاتف    </label>
                                            <div class="col-md-4" style="padding: 5px">
                                                <asp:TextBox ID="Ephone" runat="server" MaxLength="7" placeholder="ادخل رقم الهاتف " CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">رقم الجوال     </label>
                                            <div class="col-md-4" style="padding: 5px">
                                                <asp:TextBox ID="Emobile" runat="server" MaxLength="10" placeholder="ادخل رقم الجوال" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <label class="col-md-2 control-label">البريد الالكتروني    </label>
                                            <div class="col-md-4" style="padding: 5px">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                                    <asp:TextBox ID="Eemail" type="email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group row last">
                                                <label class="col-md-2 control-label">المحافظة </label>
                                                <div class="col-md-4" style="padding: 5px">
                                                    <asp:DropDownList ID="ECityID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources  %>' SelectCommand="SELECT  [ID], [ArName] FROM [Governorates] WHERE  ((CountryID=1) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر المحافظة'"></asp:SqlDataSource>
                                                </div>
                                                <label class="col-md-2 control-label">تفاصيل العنوان </label>
                                                <div class="col-md-4" style="padding: 5px">
                                                    <asp:TextBox ID="EAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="ادخل  اسم الشارع او اقرب مسجد"></asp:TextBox>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="form-actions fluid">
                                                    <div class="col-md-offset-2 col-md-10" style="padding: 5px">
                                                        <asp:Button ID="Button19" runat="server" Text="حفظ" class="btn green" OnClick="Button15_Click" />
                                                        <asp:Button ID="Button20" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="Button20_Click" />
                                                    </div>
                                                </div>
                                                <div class="portlet box purple">
                                                    <div class="portlet-title">
                                                        <div class="caption"><i class="fa fa-cogs"></i>بيانات الطوارئ</div>
                                                        <div class="tools">
                                                            <a href="javascript:;" class="collapse"></a>
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 20%">الاسم </th>
                                                                        <th style="width: 20%; text-align: center">صلة القرابة</th>
                                                                        <th style="width: 20%; text-align: center">رقم الهاتف </th>
                                                                        <th style="width: 20%; text-align: center">رقم الجوال</th>
                                                                        <th style="width: 20%; text-align: left"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource27">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="EmergancyID" runat="server" Text='<%# Eval("Emergancy_ID") %>' Visible="false"></asp:Label>
                                                                            <tr>
                                                                                <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <span><%# Eval("Ar_Family_Name") %></span></td>
                                                                                <td style="text-align: center"><span><%# Eval("Ar_Name") %></span></td>
                                                                                <td style="text-align: center"><span><%# Eval("Emergancy_Phone") %></span></td>
                                                                                <td style="text-align: center"><span><%# Eval("Emergancy_Mobile") %></span></td>
                                                                                <td style="text-align: left">
                                                                                    <%--   <% if (Permissions.Contains("EmergencyEdit"))
                                                                                       { %>--%>
                                                                                    <asp:LinkButton ID="lbEdit2" runat="server" class="btn default btn-xs black" OnClick="lbEditEmg_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                                    <%--     <%} %>    <% if (Permissions.Contains("EmergencyDelete"))
                                                                                                 { %>--%>
                                                                                    <asp:LinkButton ID="lbDelete2" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteEmg_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                                    <%--      <%} %>--%>
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource27" runat="server"
                                                                        ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                                        SelectCommand="Emergancy_TB_EmpGetAll" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="Label4" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end tab-pane-->
                        <!--END TABS-->
                    </div>

                    <div runat="server" class="tab-pane" id="tab_1_6" clientidmode="Static">
                        <div class="row">
                            <div class="form-group row">
                                <label class="control-label col-md-6">يمكنك طباعة سيرتك الذاتية حسب البيانات المدخلة من خلال الضغط على طباعة السيرة الذاتية <span style="font-family: Tahoma!important"></span></label>

                                <asp:Button ID="PrintCV" runat="server" Text="طباعة السيرة الذاتية" CssClass="btn green" OnClick="PrintCV_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>









