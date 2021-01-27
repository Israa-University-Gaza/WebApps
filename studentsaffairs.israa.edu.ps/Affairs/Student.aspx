<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Affairs_Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu2').addClass("active open");
            $('#menu2 a').css("background-color", "#575757");
            $('#menu2 a span.arrow').addClass("open");

            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">شؤون الطلاب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>صفحة الطالب</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
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
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource10">
                                    <ItemTemplate>
                                        <h5 style="text-align: center;"><%# Eval("DisplayName") %> (<%# Eval("StudentNo") %>)</h5>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                    SelectCommand="GetStudentData" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </li>
                            <li id="litab1" runat="server" class="active"><a data-toggle="tab" href="#tab1"><i class="fa fa-home"></i>الصفحة الرئيسية<span class="after"></span></a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-list"></i>ملف الطالب</a>
                                <ul class="dropdown-menu ver-inline-menu tabbable margin-bottom-10 font-ha" role="menu" style="width: 199px; margin-right: 199px; margin-top: -38px">
                                    <li><a href="StudentProfile.aspx#tab1"><i class="fa fa-briefcase"></i>بيانات أساسية</a></li>
                                    <li><a href="StudentProfile.aspx#tab2"><i class="fa fa-male"></i>بيانات ولي الأمر</a></li>
                                    <li><a href="StudentProfile.aspx#tab3"><i class="fa fa-mobile-phone"></i>بيانات الإتصال</a></li>
                                    <li><a href="StudentProfile.aspx#tab4"><i class="fa fa-mobile-phone"></i>بيانات التجسير</a></li>
                                    <li><a href="StudentSpecialFinancialProfile.aspx"><i class="fa fa-mobile-phone"></i>الملف المالي</a></li>
                                </ul>
                            </li>
                            <li id="litab2" runat="server"><a data-toggle="tab" href="#tab2"><i class="fa fa-male"></i>تثبيت منحة</a></li>
                            <li id="litab3" runat="server"><a data-toggle="tab" href="#tab3"><i class="fa fa-male"></i>منح واعفاءات الطالب</a></li>
                            <li id="litab4" runat="server"><a data-toggle="tab" href="#tab4"><i class="fa fa-male"></i>اضافة قرض</a></li>
                            <li id="litab5" runat="server"><a data-toggle="tab" href="#tab5"><i class="fa fa-male"></i>قروض الطالب</a></li>
                            <li><a href="StudentSocialSolidarity.aspx"><i class="fa fa-male"></i>طلب التكافل الإجتماعي</a></li>
                            <li><a href="StudentBox.aspx"><i class="fa fa-male"></i>تحويل من صندوق الإقراض</a></li>
                            <li><a href="StudentInstallment.aspx"><i class="fa fa-male"></i>طلب تقسيط رسوم دراسية</a></li>
                            <li><a href="StudentInstallmentOrder.aspx"><i class="fa fa-male"></i>طلبات التقسيط</a></li>
                            <li id="litab10" runat="server"><a data-toggle="tab" href="#tab10"><i class="fa fa-lock"></i>إرسال SMS</a></li>
                            <li id="litab13" runat="server"><a data-toggle="tab" href="#tab13"><i class="fa fa-magic"></i>ع. ساعات التسجيل</a></li>
                            <% if ((lblEmployeeID.Text == "5124"))
                                { %>
                            <li id="litab11" runat="server"><a data-toggle="tab" href="#tab11"><i class="fa fa-dollar"></i>اعفاء الطالب من شرط ال 20%</a></li>
                            <% } %>
                            <% if ((lblEmployeeID.Text == "6"))
                                { %>
                            <li id="li6" runat="server"><a href="StdInfractionAddEdit.aspx?id=<%= lblStudentID.Text %>"><i class="fa fa-lock"></i>مخالفات الطالب</a></li>
                            <li id="litab12" runat="server"><a data-toggle="tab" href="#tab12"><i class="fa fa-lock"></i>مستندات الطالب</a></li>
                            <% } %>
                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div id="tab1" class="tab-pane active" runat="server" clientidmode="Static">
                                <asp:Repeater ID="Repeater10" runat="server" DataSourceID="SqlDataSource11">
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-md-8 profile-info">
                                                <h1><%# Eval("StudentName") %></h1>
                                                <div class="portlet box blue">
                                                    <div class="portlet-title">
                                                        <div class="caption font-ha"><i class="fa fa-cogs"></i>تقارير خاصة بالطلبة</div>
                                                        <div class="tools">
                                                            <a href="javascript:;" class="collapse"></a>
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <asp:LinkButton ID="lbShowIssueReportPDF" runat="server" OnClick="lbShowIssueReportPDF_Click" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">عرض موضوع </asp:LinkButton>
<% if (lblEmployeeID.Text == "5084")
                                                           { %>
                                                        <asp:LinkButton ID="lbStdValnteerHourReportPDF" runat="server" OnClick="lbStdValnteerHourReportPDF_OnClick" CssClass="btn default btn-sm dark-stripe isra-inline font-ha">طباعة ساعات التطوع</asp:LinkButton>
                                                        <% } %>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-md-8-->
                                            <div class="col-md-4">
                                                <div class="portlet sale-summary">
                                                    <div class="portlet-title">
                                                        <div class="caption font-ha">البيانات الأساسية</div>
                                                        <div class="tools">
                                                            <a class="reload" href="javascript:;"></a>
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <ul class="list-unstyled">
                                                            <li>
                                                                <span class="sale-info">الرقم الجامعي : </span>
                                                                <span class="sale-num"><%# Eval("StudentNo") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">الكلية : </span>
                                                                <span class="sale-num"><%# Eval("StudentCollege") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">القسم : </span>
                                                                <span class="sale-num"><%# Eval("StudentDepartment") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">الرصيد : </span>
                                                                <span class="sale-num"><%# Eval("Balance") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">نوع الطالب : </span>
                                                                <span class="sale-num"><%# Eval("StudentType") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">حالة الطالب : </span>
                                                                <span class="sale-num"><%# Eval("StudentStatus") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات الدراسة : </span>
                                                                <span class="sale-num"><%# Eval("StudiedHour") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات النجاح : </span>
                                                                <span class="sale-num"><%# Eval("SucceedHour") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">المستوي الدراسي : </span>
                                                                <span class="sale-num"><%# Eval("Studentlevel") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">المعدل التراكمي خريج : </span>
                                                                <span class="sale-num"><%# Eval("GPAGraduate") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">المعدل التراكمي : </span>
                                                                <span class="sale-num"><%# Eval("GPAUniversity") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">العبيء الدراسي : </span>
                                                                <span class="sale-num"><%# Eval("StudiedHour") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">ساعات الإنجاز : </span>
                                                                <span class="sale-num"><%# Eval("SucceedHour") %></span>
                                                            </li>
<li>
                                                                <span class="sale-info">ساعات التطوع : </span>
                                                                <span class="sale-num"><%# Eval("VolunteerHours") %></span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">سعر الساعة : </span>
                                                                <span class="sale-num"><%# Eval("HourCost") %> دينار</span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">حالة الطالب أكاديمياً : </span>
                                                                <span class="sale-num" style="color: red"><%# Eval("AcademicWarning") %> </span>
                                                            </li>
                                                            <li>
                                                                <span class="sale-info">حالة صفحة الطالب : </span>
                                                                <span class="sale-num">
                                                                    <a class='btn default btn-xs red <%# Convert.ToBoolean(Eval("StudentPageStatus")) ? "hidden" : "" %>'>موقوفة</a>
                                                                    <a class="btn default btn-xs green" runat="server" visible='<%# Convert.ToBoolean(Eval("StudentPageStatus")) %>'>فعالة</a>
                                                                </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-md-4-->
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                    SelectCommand="GetStudentInfo" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div id="tab2" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="form-horizontal">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>تثبيت منحة</h4>
                                            </div>
                                            <div class="col-md-9 isra-pl-0">
                                                <div id="divMsg2" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="lblMsg2" runat="server" Style="font-weight: bold; float: right;" ClientIDMode="Static"></asp:Label>
                                                    <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">الفصل الدراسي : </label>
                                                <div class="col-md-8">
                                                    <asp:DropDownList ID="ddlSemester2" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                                        SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) And Code<>'111111111') union select -1,N'إختر الفصل الدراسي'"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">نوع المنحة : </label>
                                                <div class="col-md-8">
                                                    <asp:DropDownList ID="ddlAction" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="SELECT ID, ArName FROM [Action] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) And IsScholarship=1 and RVType=1) union select -1,N'إختر المنحة'"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2"></label>
                                                <div class="col-md-2">
                                                    <asp:Button ID="btnAddScholarship" runat="server" CssClass="btn blue btn btn-rounded default btn-block" OnClick="btnAddScholarship_Click" Text="تثبيت المنحة" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab3" class="tab-pane" runat="server" clientidmode="Static">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>منح الطالب</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="divMsg3" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg3" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <label class="col-md-3 control-label">الفصل الدراسي : </label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlSemesterID" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                                        SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsDelete] = 0) And Code<>'111111111') union select -1,N'إختر الفصل الدراسي'"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <% if (ListView1.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 40%; text-align: center">المنحة</th>
                                                            <th style="width: 20%; text-align: center">قيمة المنحة</th>
                                                            <th style="width: 20%; text-align: center">التاريخ</th>
                                                            <th style="width: 10%; text-align: center">معتمد</th>
                                                            <th style="width: 10%; text-align: center"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                                            <ItemTemplate>
                                                                <asp:Label ID="StudentScholarshipID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td style="text-align: center"><span><%# Eval("ActionArName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("ActionValue") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd HH:mm tt}") %></span></td>
                                                                    <td style="text-align: center">
                                                                        <asp:CheckBox ID="cbAcademicAccreditation" runat="server" Checked='<%# Eval("AcademicAccreditation") %>' Enabled="false" />
                                                                    </td>
                                                                    <td style="text-align: center">
                                                                        <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" Visible='<%# (Permissions.Contains("ScholarshipViewDelete")) %>'><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetStudentScholarshipBySemesterID" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="ddlSemesterID" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                                <div class="clearfix"></div>
                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <% if (ddlSemesterID.SelectedValue != "-1")
                                                            { %>
                                                        <strong>لا يوجد منح مضافة للطالب</strong>
                                                        <% }
                                                            else
                                                            { %>
                                                        <strong>اختر الفصل الدراسي لعرض منح الطالب</strong>
                                                        <% } %>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div id="tab4" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="form-horizontal">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>اضافة قرض</h4>
                                            </div>
                                            <div class="col-md-9 isra-pl-0">
                                                <div id="divMsg4" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="lblMsg4" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                    <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">الفصل الدراسي : </label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="ddlSemesterLoan" runat="server" CssClass="form-control" DataSourceID="SqlDataSource9" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                                        SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) And Code<>'111111111') union select -1,N'إختر الفصل الدراسي'"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">القرض : </label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="ddlActionLoan" runat="server" CssClass="form-control" DataSourceID="SqlDataSource12" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="SELECT ID, ArName FROM [Action] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) And FGroup='Loan') union select -1,N'إختر القرض'"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">قيمة القرض بالدينار : </label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="txtLoanValue" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">تاريخ الطلب : </label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="txtRequestDate" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">تاريخ السداد : </label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="txtRepayDate" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">ملاحظات : </label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtNoteLoan" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2"></label>
                                                <div class="col-md-2">
                                                    <asp:Button ID="btnAddLoan" runat="server" CssClass="btn blue btn btn-rounded default btn-block" OnClick="btnAddLoan_Click" Text="إضافة القرض" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab5" class="tab-pane" runat="server" clientidmode="Static">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>قروض الطالب</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="divMsg5" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg5" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <label class="col-md-3 control-label">الفصل الدراسي : </label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlSemesterID2" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <% if (ListView2.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 25%; text-align: center">القرض</th>
                                                            <th style="width: 10%; text-align: center">قيمة القرض</th>
                                                            <th style="width: 15%; text-align: center">تاريخ الطلب</th>
                                                            <th style="width: 15%; text-align: center">تاريخ الإستحقاق</th>
                                                            <th style="width: 10%; text-align: center">معتمد</th>
                                                            <th style="width: 15%; text-align: center">تاريخ الإضافة</th>
                                                            <th style="width: 10%; text-align: center"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource4">
                                                            <ItemTemplate>
                                                                <asp:Label ID="StudentLoanID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td style="text-align: center"><span><%# Eval("ActionArName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("LoanValue") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("RequestDate") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("RepayDate") %></span></td>
                                                                    <td style="text-align: center">
                                                                        <asp:CheckBox ID="cbAcademicAccreditation" runat="server" Checked='<%# Eval("AcademicAccreditation") %>' Enabled="false" />
                                                                    </td>
                                                                    <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd HH:mm tt}") %></span></td>
                                                                    <td style="text-align: center">
                                                                        <asp:LinkButton ID="lbDeleteLoan" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteLoan_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetStudentLoansBySemesterID" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="ddlSemesterID2" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                                <div class="clearfix"></div>
                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <% if (ddlSemesterID2.SelectedValue != "-1")
                                                            { %>
                                                        <strong>لا يوجد قروض مضافة للطالب</strong>
                                                        <% }
                                                            else
                                                            { %>
                                                        <strong>اختر الفصل الدراسي لعرض قروض الطالب</strong>
                                                        <% } %>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div id="tab6" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="form-horizontal">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4>اضافة أقساط مالية</h4>
                                            </div>
                                            <div class="col-md-9 isra-pl-0">
                                                <div id="divMsg6" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                    <asp:Label ID="lblMsg6" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                    <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">الفصل الدراسي : </label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="ddlSemesterInstallment" runat="server" CssClass="form-control" DataSourceID="SqlDataSource9" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">عنوان القسط : </label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="txtInstallmentName" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">قيمة القسط بالدينار : </label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="txtInstallmentValue" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">تاريخ الطلب : </label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="txtInstallmentRequestDate" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">تاريخ السداد : </label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="txtInstallmentRepayDate" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2">ملاحظات : </label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtInstallmentNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="col-md-2"></label>
                                                <div class="col-md-2">
                                                    <asp:Button ID="btnAddInstallment" runat="server" CssClass="btn blue btn btn-rounded default btn-block" OnClick="btnAddInstallment_Click" Text="إضافة قسط مالي" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab7" class="tab-pane" runat="server" clientidmode="Static">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>أقساط الطالب</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="divMsg7" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg7" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <label class="col-md-3 control-label">الفصل الدراسي : </label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlSemesterID3" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <% if (ListView3.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 25%; text-align: center">القسط</th>
                                                            <th style="width: 10%; text-align: center">قيمة القسط</th>
                                                            <th style="width: 15%; text-align: center">تاريخ الطلب</th>
                                                            <th style="width: 15%; text-align: center">تاريخ السداد</th>
                                                            <th style="width: 10%; text-align: center">معتمد</th>
                                                            <th style="width: 15%; text-align: center">تاريخ الإضافة</th>
                                                            <th style="width: 10%; text-align: center">مسدد</th>
                                                            <th style="width: 10%; text-align: center"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource8">
                                                            <ItemTemplate>
                                                                <asp:Label ID="StudentInstallmentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td style="text-align: center"><span><%# Eval("InstallmentName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("InstallmentValue") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("RequestDate") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("RepayDate") %></span></td>
                                                                    <td style="text-align: center">
                                                                        <asp:CheckBox ID="cbAcademicAccreditation" runat="server" Checked='<%# Eval("AcademicAccreditation") %>' Enabled="false" />
                                                                    </td>
                                                                    <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd HH:mm tt}") %></span></td>
                                                                    <td style="text-align: center">
                                                                        <asp:CheckBox ID="cbIsPaid" runat="server" Checked='<%# Eval("IsPaid") %>' Enabled="false" />
                                                                    </td>
                                                                    <td style="text-align: center">
                                                                        <asp:LinkButton ID="lbDeleteInstallment" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteInstallment_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetStudentInstallmentBySemesterID" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="ddlSemesterID3" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                                <div class="clearfix"></div>
                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <% if (ddlSemesterID3.SelectedValue != "-1")
                                                            { %>
                                                        <strong>لا يوجد أقساط مالية علي الطالب</strong>
                                                        <% }
                                                            else
                                                            { %>
                                                        <strong>اختر الفصل الدراسي لعرض أقساط الطالب</strong>
                                                        <% } %>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div id="tab10" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>إرسال رسالة SMS للطالب</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="divMsg10" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg10" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row" style="padding-top: 15px;">
                                                <label class="col-md-2 control-label">نص الرسالة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtSMSText" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 15px;">
                                                <div class="col-md-offset-2 col-md-6">
                                                    <asp:Button ID="btnSendSMS" runat="server" Text="إرسال الرسالة" CssClass="btn green" OnClick="btnSendSMS_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab11" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <h4>اعفاء الطالب من شرط ال 20% من عملية استحقاق موظفي غزة</h4>
                                                </div>
                                                <div class="col-md-5 isra-pl-0">
                                                    <div id="divMsg11" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg11" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row" style="padding-top: 15px;">
                                                <label class="col-md-2">الفصل الدراسي : </label>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="ddlSemester3" runat="server" CssClass="form-control" DataSourceID="SqlDataSource9" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                                        SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) And Code<>'111111111') union select -1,N'إختر الفصل الدراسي'"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 15px;">
                                                <label class="col-md-2 control-label">الملاحظة</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txtNot" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 15px;">
                                                <div class="col-md-offset-2 col-md-6">
                                                    <asp:Button ID="btnFreeFrom" runat="server" Text="اعفاء الطالب" CssClass="btn green" OnClick="btnFreeFrom_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab12" class="tab-pane" runat="server" clientidmode="Static">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <h4>مستندات الطالب</h4>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <% if (ListView4.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 30%">المستند</th>
                                                            <th style="width: 30%">المستند</th>
                                                            <th style="width: 25%; text-align: center">تاريخ الرفع</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource13">
                                                            <ItemTemplate>
                                                                <asp:Label ID="StudentLoanID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td><a href='http://admission.israa.edu.ps/Document/Student/<%# Eval("DocumentLink") %>' target="_blank"><%# Eval("StdDocumentType") %></a></td>
                                                                    <td><a href='http://admission.israa.edu.ps/Document/Student/<%# Eval("DocumentLink") %>' target="_blank"><%# Eval("DocumentName") %></a></td>
                                                                    <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource13" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                                            SelectCommand="Select *,(Select Name From StdDocumentType Where ID=StdDocumentTypeID) as StdDocumentType From StdDocument Where StudentID=@StudentID and IsDelete=0 and StdDocumentTypeID in(71,55,115,117,125,130,131,132,133,54,42,4,135,138,137,136,120,119,116,111,108,107,103,81,68,61) order by ID DESC">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                                <div class="clearfix"></div>
                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <% if (ddlSemesterID2.SelectedValue != "-1")
                                                            { %>
                                                        <strong>لا يوجد قروض مضافة للطالب</strong>
                                                        <% }
                                                            else
                                                            { %>
                                                        <strong>اختر الفصل الدراسي لعرض قروض الطالب</strong>
                                                        <% } %>
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
                            <div id="tab13" class="tab-pane" runat="server" clientidmode="Static">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>عدد الساعات النظرية والساعات العملية للطالب</h4>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <label class="col-md-3 control-label">الفصل الدراسي : </label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlSemesterID1" runat="server" class="form-control" DataSourceID="SqlDataSource7" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSemesterID1_SelectedIndexChanged"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                                        SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsDelete] = 0) And Code<>'111111111') union select -1,N'إختر الفصل الدراسي'"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <asp:Label ID="lbstatus" runat="server" Visible="false" Text="1"></asp:Label>
                                                <%if(txtTheoreCourseHours.Text!="0" ||txtPracticCourseHours.Text!="0"){ %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 50%; text-align: center;">ع.الساعات النظرية</th>
                                                            <th style="width: 50%; text-align: center;">ع. الساعات العملية</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td style="text-align: center;"><asp:TextBox ID="txtTheoreCourseHours" CssClass="form-control text-center" runat="server" Text="0" ReadOnly="true"></asp:TextBox></td>
                                                            <td style="text-align: center;"><asp:TextBox ID="txtPracticCourseHours" CssClass="form-control text-center" runat="server" Text="0" ReadOnly="true"></asp:TextBox></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div class="clearfix"></div>
                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <% if (ddlSemesterID1.SelectedValue != "-1")
                                                            { %>
                                                        <strong>الطالب غير مسجل للفصل المختار</strong>
                                                        <% }
                                                            else
                                                            { %>
                                                        <strong>اختر الفصل الدراسي لعرض ع.ساعات الطالب</strong>
                                                        <% } %>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

