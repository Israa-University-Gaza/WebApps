<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentImage.aspx.cs" Inherits="Admission_StudentImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                $('#btnUpload').show();
            });
        });
    </script>
    <style>
        label.filebutton {
            width: 120px;
            height: 40px;
            overflow: hidden;
            position: relative;
            background-color: #ccc;
        }

        label span input {
            z-index: 999;
            line-height: 0;
            font-size: 50px;
            position: absolute;
            top: -2px;
            left: -700px;
            opacity: 0;
            filter: alpha(opacity = 0);
            -ms-filter: "alpha(opacity=0)";
            cursor: pointer;
            _cursor: hand;
            margin: 0;
            padding: 0;
        }

        .fileUpload {
            position: relative;
            overflow: hidden;
            padding: 7px;
            width: 20%;
        }

            .fileUpload input.upload {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }

        .dropdown-menu li > a {
            clear: both;
            color: #333;
            display: block;
            font-weight: normal;
            line-height: 18px;
            padding: 0;
            text-decoration: none;
            white-space: nowrap;
        }

        .dropdown.open .dropdown-toggle {
            background: #e0eaf0 !important;
            color: #121212;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">تغيير الصورة الشخصية
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStdStatusID" runat="server" Visible="true"></asp:Label>
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>

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
                                <img runat="server" id="Img1" class="img-responsive" style="width: 100%" alt="" />
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
                                    <li><a href="StudentFinancialProfile.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>الملف المالي</a></li>
                                    <li><a href="StudentScholarship.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>منح الطالب</a></li>
                                    <li class="active"><a href="StudentImage.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>تغيير صورة الطالب</a></li>
                                </ul>
                            </li>

                            <% if (lblEmployeeID.Text != "5301" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12"))
                                { %>
                            <li><a href="StudentSemesterRegistration.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>التسجيل الفصلي</a></li>
                            <li><a href="StdOfficeRegister.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>التسجيل المكتبي</a></li>
                            <li id="li4" runat="server"><a href="StudentCourse.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>طلبات تسجيل المساقات</a></li>
                            <% } %>
                            <li id="li6" runat="server"><a href="StudentInstallmentOrder.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>اقساط الطالب</a></li>
                            <% if (lblEmployeeID.Text != "5301" && (lblStdStatusID.Text == "1"))
                                { %>
                            <li id="litab8" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab8"><i class="fa fa-list-alt"></i>تسجيل مساقات الخطة</a></li>
                            <% } %>

                            <% if (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7")
                                { %>
                            <li id="litab2" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab2"><i class="fa fa-list-alt"></i>الجدول الدراسي</a></li>
                            <% } %>

                            <% if ((lblEmployeeID.Text != "5083"|| lblEmployeeID.Text != "5497") && lblStdStatusID.Text == "1")
                                { %>
                            <li id="litab3" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab3"><i class="fa fa-table"></i>جدول الإمتحانات</a></li>
                            <% } %>

                            <li id="litab4" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab4"><i class="fa fa-book"></i>الخطة الدراسية</a></li>

                            <% if (lblEmployeeID.Text != "5301" && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "2" || lblStdStatusID.Text == "3" || lblStdStatusID.Text == "8" || lblStdStatusID.Text == "12"))
                                { %>
                            <li id="litab15" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab15"><i class="fa fa-lock"></i>كشف الإرشاد الأكاديمي</a></li>
                            <% } %>
                            <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301" || lblEmployeeID.Text != "5497") && (lblStdStatusID.Text != "4" && lblStdStatusID.Text != "6"))
                                { %>
                            <li id="litab5" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab5"><i class="fa fa-stack-exchange"></i>علامات المساقات</a></li>
                            <% } %>
                            <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301" || lblEmployeeID.Text != "5497") && lblStdStatusID.Text == "1")
                                { %>
                            <li id="litab21" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab21"><i class="fa fa-stack-exchange"></i>إنسحاب المساقات</a></li>
                            <% } %>

                            <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5497") && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7" || lblStdStatusID.Text == "12"))
                                { %>
                            <li id="litab6" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab6"><i class="fa fa-lock"></i>كشف درجات</a></li>
                            <% } %>
                            <% if (lblEmployeeID.Text != "5301" && lblStdStatusID.Text == "1")
                                { %>
                            <li id="litab10" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab10"><i class="fa fa-lock"></i>تحويل التخصص</a></li>
                            <% } %>
                            <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301" || lblEmployeeID.Text != "5497") && lblStdStatusID.Text == "1")
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
                            <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301" || lblEmployeeID.Text != "5497") && (lblStdStatusID.Text == "1" || lblStdStatusID.Text == "7"))
                                { %>
                            <li id="li3" runat="server"><a href="FinalMarkDeductionAddEdit.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>خصم درجات</a></li>
                            <% } %>

                            <% if ((lblEmployeeID.Text != "5083" || lblEmployeeID.Text != "5301" || lblEmployeeID.Text != "5497") && (lblStdStatusID.Text != "6" && lblStdStatusID.Text != "9" && lblStdStatusID.Text != "10"))
                                { %>
                            <li id="li5" runat="server"><a href="StdInfractionAddEdit.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>مخالفات الطالب</a></li>
                            <% } %>
                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div class="col-md-9">

                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="image-editor" style="width: 200px;">
                                            <div class="fileUpload btn btn-primary" style="width: 200px; float: right;">
                                                <span>إختر الصورة</span>
                                                <input type="file" class="cropit-image-input upload" />
                                            </div>
                                            <div class="clearfix"></div>
                                            <br />
                                            <div class="cropit-image-preview">
                                            </div>
                                            <div class="image-size-label" style="text-align: center">
                                                تكبير / تصغير الصورة
                                            </div>
                                            <input type="range" class="cropit-image-zoom-input" />
                                            <input type="hidden" name="imgCropped" class="hidden-image-data" />
                                            <input type="button" class="crop btn red btn btn-rounded default btn-block w80" value="اقتصاص" />
                                            <asp:Button ID="btnUpload" runat="server" class="btn blue btn btn-rounded default btn-block w80" Text="حفظ" OnClick="Upload" ClientIDMode="Static" Style="display: none" />
                                        </div>
                                    </div>
                                    <div class="col-md-5" style="float: left; padding-top: 33px;">
                                        <img runat="server" id="image" />
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

