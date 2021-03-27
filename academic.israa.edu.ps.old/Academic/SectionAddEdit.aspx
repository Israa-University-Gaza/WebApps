<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="SectionAddEdit.aspx.cs" Inherits="Academic_SectionAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" type="text/css" />

    <script src="../assets/datepicker/clockface.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudyTable').addClass("active open");
            $('#StudyTable_5 a').css("background-color", "#575757");
            $('#StudyTable a span.arrow').addClass("open");

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
                <span>إضافة/تعديل شعبة</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="OfferCourse.aspx">طرح مساق</a></li>
                <li class="font-ha"><a href="PlanCourse.aspx">إدارة المساقات المطروحة</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>إضافة / تعديل شعبة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group" style="font-size: 20px;">
                                        <label class="control-label col-md-4" style="font-size: 20px;">المساق :</label>
                                        <div class="col-md-7" style="margin-top: 7px;">
                                            <asp:Label ID="lblSectionID" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblOfferdCourseID" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblDepSectionID" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblCourseID" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblCourse" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                            <h3 class="form-section">تفاصيل الشعبة</h3>
                            <!--/row-->
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label col-md-4">رقم الشعبة</label>
                                        <div class="col-md-7">
                                            <asp:TextBox ID="txtSectionNum" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال رقم الشعبة"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-4">محاضر الشعبة</label>
                                            <div class="col-md-7">
                                                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="EmployeeName" DataValueField="EmployeeID" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetCourseInstructors" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblCourseID" PropertyName="Text" Name="CourseID" Type="Int32"></asp:ControlParameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4" id="divPTEmployee" runat="server" visible="false" style="padding-right: 0px">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">دوام جزئي</label>
                                            <div class="col-md-7">
                                                <asp:DropDownList ID="ddlPTEmployee" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetPTEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                            </div>
                                            <%--                                            <asp:Button ID="btnNewPTEmployee" runat="server" CssClass="btn btn-default green btn-sm col-md-2" Text="اضافة جديد" OnClick="btnNewPTEmployee_Click" />--%>
                                        </div>
                                    </div>
                                </div>

                                <%--<div id="divPTEmployeeDetails" runat="server" class="row" visible="false" style="padding: 20px 0">
                                    <div class="portlet box green">
                                        <div class="portlet-title">
                                            <div class="caption"><i class="fa fa-reorder"></i>إضافة / تعديل موظف بدوام جزئي</div>
                                            <div class="tools">
                                                <a class="collapse" href="javascript:;"></a>
                                            </div>
                                        </div>
                                        <div class="portlet-body form">
                                            <div class="form-horizontal" style="padding: 20px">
                                                <asp:Label ID="lblPTEmployeeID" runat="server" Visible="false"></asp:Label>
                                                <div class="form-group">
                                                    <label class="control-label col-md-1" style="padding: 0px">الاسم الافتراضي</label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال الاسم الافتراضي"></asp:TextBox>
                                                    </div>
                                                    <label class="control-label col-md-1">القسم</label>
                                                    <div class="col-md-3">
                                                        <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource9" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID, ArName From Department Where IsDelete=0 union Select -1,N'اختر الموظف'"></asp:SqlDataSource>

                                                    </div>
                                                    <label class="control-label col-md-1" style="padding: 0px">المؤهل العلمي</label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control" placeholder="الرجاء ادخال المؤهل العلمي"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-1" style="padding-right: 0px">ملاحظات</label>
                                                    <div class="col-md-11">
                                                        <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="الرجاء ادخال الملاحظات"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-actions fluid">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <asp:Button ID="btnPTEmployeeSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnPTEmployeeSave_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>--%>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-4">سعة الشعبة</label>
                                            <div class="col-md-7">
                                                <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال سعة الشعبة"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-4">نوع الشعبة</label>
                                            <div class="col-md-7">
                                                <asp:DropDownList ID="ddlSectionType" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSectionType_SelectedIndexChanged">
                                                    <asp:ListItem Text="نظري" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="مناقشة" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="عملي" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4" id="divSection" runat="server" visible="false">
                                        <div class="form-group">
                                            <label class="control-label col-md-4">تابع لشعبة</label>
                                            <div class="col-md-7">
                                                <asp:DropDownList ID="ddlSectionID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="SectionNum" DataValueField="ID"></asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, CAST(SectionNum as nvarchar(50))as SectionNum FROM [Section] WHERE (([IsDelete] = 0) and (SectionType = 1) and ([OfferdCourseID]=@OfferdCourseID)) union select -1,N'إختر الشعبة'">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblOfferdCourseID" Name="OfferdCourseID" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-3"></label>
                                            <div class="col-md-3">
                                                <asp:RadioButton ID="rbMale" runat="server" GroupName="FMFlage" Text="طلاب" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:RadioButton ID="rbFemale" runat="server" GroupName="FMFlage" Text="طالبات" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:RadioButton ID="rbMaleFemale" runat="server" GroupName="FMFlage" Text="مشترك" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-4"></label>
                                            <div class="col-md-7">
                                                <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                            </div>
                                        </div>
                                    </div>
                                    <!--/span-->
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label col-md-4"></label>
                                            <div class="col-md-7">
                                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                                <asp:Button ID="btnNew" runat="server" Text="جديد" CssClass="btn default" OnClick="btnNew_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--<div id="DepartmentSection" runat="server" visible="true">
                                    <h3 class="form-section">تنسيب الشعبة لقسم </h3>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="portlet box red">
                                                <div class="portlet-title">
                                                    <div class="caption"><i class="fa fa-cogs"></i>الشعب والاقسام </div>
                                                    <div class="tools">
                                                        <a class="collapse" href="javascript:;"></a>
                                                    </div>
                                                </div>
                                                <div class="portlet-body">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 20%">رقم الشعبة</th>
                                                                <th style="width: 20%">القسم</th>
                                                                <th style="width: 10%; text-align: center">فعال</th>
                                                                <th style="width: 20%"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource5">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="DepSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                    <tr>
                                                                        <td><span><%# Eval("SectionNum") %></span></td>
                                                                        <td><span><%# Eval("Department") %></span></td>
                                                                        <td style="text-align: center">
                                                                            <asp:CheckBox ID="cbDepSectionIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbDepSectionIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' /></td>
                                                                        <td style="text-align: center">
                                                                            <asp:LinkButton ID="lbDepSectionEdit" runat="server" class="btn default btn-xs black" OnClick="lbDepSectionEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                            <asp:LinkButton ID="lbDepSectionDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDepSectionDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="DepartmentSectionGetBySectionID" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblSectionID" Name="SectionID" PropertyName="Text" Type="Int32" DefaultValue="2" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4" id="div2" runat="server">
                                            <div class="portlet box blue">
                                                <div class="portlet-title">
                                                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل الشعب والاقسام</div>
                                                    <div class="tools">
                                                        <a class="collapse" href="javascript:;"></a>
                                                    </div>
                                                </div>
                                                <div class="portlet-body form">
                                                    <div class="form-horizontal">
                                                        <div class="form-body">
                                                            <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3">القسم :</label>
                                                                <div class="col-md-8">
                                                                    <asp:DropDownList ID="ddlDepartment2" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource7" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Department] WHERE [IsDelete] = 0 union select -1,N'إختر القسم'"></asp:SqlDataSource>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3"></label>
                                                                <div class="col-md-8">
                                                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="فعال" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-actions fluid">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <asp:Button ID="DepSectionSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="DepSectionSave_Click" />
                                                        <asp:Button ID="DepSectionCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="DepSectionCancel_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                <div id="divLectures" runat="server" visible="false">
                                    <h3 class="form-section">مواعيد الشعبة</h3>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="portlet box red">
                                                <div class="portlet-title">
                                                    <div class="caption"><i class="fa fa-cogs"></i>مواعيد المحاضرات</div>
                                                    <div class="tools">
                                                        <a class="collapse" href="javascript:;"></a>
                                                    </div>
                                                </div>
                                                <div class="portlet-body">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 20%">القاعة</th>
                                                                <th style="width: 20%">اليوم</th>
                                                                <th style="width: 15%; text-align: center">التوقيت</th>
                                                                <th style="width: 10%; text-align: center">فعال</th>
                                                                <th style="width: 20%"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="LectureID" runat="server" Text='<%# Eval("ID") %>' Visible="true"></asp:Label>
                                                                    <tr>
                                                                        <td><span><%# Eval("Room") %></span></td>
                                                                        <td><span><%# Eval("CDay") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("FromToHour") %></span></td>
                                                                        <td style="text-align: center">
                                                                            <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' /></td>
                                                                        <td style="text-align: center">
                                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="LectureGetBySectionID" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblSectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4" id="divLectureAddEdit" runat="server">
                                            <div class="portlet box blue">
                                                <div class="portlet-title">
                                                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل موعد</div>
                                                    <div class="tools">
                                                        <a class="collapse" href="javascript:;"></a>
                                                    </div>
                                                </div>
                                                <div class="portlet-body form">
                                                    <div class="form-horizontal">
                                                        <div class="form-body">
                                                            <asp:Label ID="lblLectureID" runat="server" Text="" Visible="false"></asp:Label>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3">قاعة :</label>
                                                                <div class="col-md-8">
                                                                    <asp:DropDownList ID="ddlRoomID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetCourseRooms" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="lblCourseID" PropertyName="Text" Name="CourseID" Type="Int32"></asp:ControlParameter>
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3">اليوم :</label>
                                                                <div class="col-md-8">
                                                                    <asp:DropDownList ID="ddlDayID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [ConstantDetails] WHERE ((ConstantID=4) and ([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر اليوم'"></asp:SqlDataSource>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3">التوقيت :</label>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtFromHour" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1 clockface-open" placeholder="من" Style="text-align: center;"></asp:TextBox>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtToHour" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1 clockface-open" placeholder="الي" Style="text-align: center;"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3"></label>
                                                                <div class="col-md-8">
                                                                    <asp:CheckBox ID="cbLectureIsActive" runat="server" Text="فعال" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-actions fluid">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <asp:Button ID="btnLectureSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnLectureSave_Click" />
                                                        <asp:Button ID="btnLectureCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnLectureCancel_Click1" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
