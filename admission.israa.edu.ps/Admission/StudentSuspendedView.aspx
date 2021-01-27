<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentSuspendedView.aspx.cs" Inherits="Admission_StudentSuspendedView" %>

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
        <li><a href="#" class="font-ha">ايقاف صفحة الطالب
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>

    <asp:Label ID="lblDepartmentID" runat="server" Visible="false" Text="16"></asp:Label>
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
                                    <li><a href="StudentFinancialProfile.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>الملف المالي</a></li>
                                    <li><a href="StudentScholarship.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>منح الطالب</a></li>
                                    <li><a href="StudentImage.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>تغيير صورة الطالب</a></li>
                                </ul>
                            </li>
                            <% if (lblEmployeeID.Text != "5301")
                                { %>
                            <li><a href="StudentSemesterRegistration.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-edit"></i>التسجيل الفصلي</a></li>
                            <li id="litab8" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab8"><i class="fa fa-list-alt"></i>تسجيل مساقات الخطة</a></li>
                            <% } %>


                            <li id="litab2" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab2"><i class="fa fa-list-alt"></i>الجدول الدراسي</a></li>
                            <li id="litab3" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab3"><i class="fa fa-table"></i>جدول الإمتحانات</a></li>
                            <li id="litab4" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab4"><i class="fa fa-book"></i>الخطة الدراسية</a></li>
                            <% if (lblEmployeeID.Text != "5301")
                                { %>
                            <li id="litab15" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab15"><i class="fa fa-lock"></i>كشف الإرشاد الأكاديمي</a></li>
                            <li id="litab5" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab5"><i class="fa fa-stack-exchange"></i>علامات المساقات</a></li>
                            <li id="litab21" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab21"><i class="fa fa-stack-exchange"></i>إنسحاب المساقات</a></li>
                            <% } %>


                            <li id="litab6" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab6"><i class="fa fa-lock"></i>كشف درجات</a></li>
                            <% if (lblEmployeeID.Text != "5301")
                                { %>
                            <li id="litab10" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab10"><i class="fa fa-lock"></i>تحويل التخصص</a></li>
                            <li id="litab11" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab11"><i class="fa fa-lock"></i>تأجيل الفصل الدراسي</a></li>
                            <% } %>
                            <li id="litab7" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab7"><i class="fa fa-lock"></i>مستندات الطالب</a></li>
                            <li id="litab9" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab9"><i class="fa fa-lock"></i>إرسال SMS</a></li>
                            <li id="litab12" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab12"><i class="fa fa-lock"></i>شروط انتساب الطالب</a></li>
                            <% if (lblEmployeeID.Text != "5301")
                                { %>
                            <li id="litab13" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab13"><i class="fa fa-lock"></i>تغير نوع الطالب</a></li>
                            <% } %>
                            <li id="litab14" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab14"><i class="fa fa-lock"></i>إنذارات الحضور والغياب</a></li>
                            <li id="litab16" runat="server"><a href="Student.aspx?id=<%= lblStudentID.Text %>#tab16"><i class="fa fa-lock"></i>إحصائيات الحضور والغياب</a></li>
                            <li id="litab17" runat="server" class="active"><a href="SuspendStudentPage.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>إيقاف صفحة الطالب</a></li>
                            <li id="litab18" runat="server"><a href="AdmissionStudentIssuesShow.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>عرض قضايا الطالب </a></li>
                            <li id="li1"><a href="ExceptionStudentGeneral.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-book"></i>استثناءات التسجيل الفصلي</a></li>
                            <li id="li2" runat="server"><a href="ExceptionStudentCourse.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>استثناءات المساق </a></li>
                            <% if (lblEmployeeID.Text != "5301")
                                { %>
                            <li id="li3" runat="server"><a href="FinalMarkDeductionAddEdit.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>خصم درجات</a></li>
                            <% } %>
                               <% if (lblEmployeeID.Text != "5301")
                                { %>
                            <li id="li4" runat="server"><a href="FinancialBenefit.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>إفادة مالية</a></li>
                            <% } %>

                            <% if ((lblEmployeeID.Text != "5083") || (lblEmployeeID.Text != "5301"))
                                { %>
                            <li id="li5" runat="server"><a href="StdInfractionAddEdit.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>مخالفات الطالب</a></li>
                            <% } %>
                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">

                            <div class="row">
                                <div class="col-md-12">
                                    <% if (ListView1.Items.Count > 0)
                                        { %>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 2%">رقم</th>
                                                <th style="text-align: center; width: 20%">شرط الايقاف</th>
                                                <th style="text-align: center; width: 15%">القسم</th>
                                                <th style="text-align: center; width: 15%">اسم الموظف</th>
                                                <th style="text-align: center; width: 40%">التفاصيل</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                                <ItemTemplate>
                                                    <tr>
                                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                        <td><%# Eval("No") %></td>
                                                        <td style="text-align: center;"><%# Eval("Condition") %><%# Eval("OtherCondition") %></td>
                                                        <td style="text-align: center;"><%# Eval("Department") %></td>
                                                        <td style="text-align: center;"><%# Eval("Employee") %></td>
                                                        <td style="text-align: center;"><%# Eval("SuspendedDetails") %></td>
                                                        <td>
                                                            <asp:LinkButton ID="Unsuspend" runat="server" OnClick="Unsuspend_Click" class="btn default btn-xs green">الغاء الحظر</asp:LinkButton>
                                                        </td>
                                                        <%--    <td style="text-align: center;"><asp:TextBox ID="UnSuspendDetails" Visible='<%#(Eval("status").ToString()=="1")?true:false %>' TextMode="MultiLine" Rows="2" runat="server" CssClass="form-control"></asp:TextBox>
                                               
                                                  <asp:LinkButton ID="Unsuspend" runat="server" Visible='<%#(Eval("status").ToString()=="1")?true:false %>' OnClick="Unsuspend_Click" class="btn default btn-xs green" >الغاء الحظر </asp:LinkButton>
                                             </td>--%>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStudentSuspended" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                                    <asp:Parameter Name="DepartmentID" DefaultValue="16" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>
                                    <div class="col-md-5" style="float: left!important; direction: ltr!important;">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager col-md-12">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                                <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                                <asp:NumericPagerField ButtonType="Link" />
                                                <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                                <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                            </Fields>
                                        </asp:DataPager>
                                    </div>
                                    <div class="clearfix"></div>
                                    <% }
                                        else
                                        {%>
                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                        <div class="col-xs-11" style="text-align: center">
                                            <strong>لا يوجد طلاب تم حظرهم</strong>
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
</asp:Content>

