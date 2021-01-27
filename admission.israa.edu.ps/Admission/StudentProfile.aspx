<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="Admission_StudentProfile" %>

<%@ Register Src="~/Admission/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <style>
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
    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu2').addClass("active");

            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
            $('.select').select2({
                placeholder: "إختر من القائمة",
                allowClear: true
            });
            $('.numeric').keyup(function () {
                if (this.value.match(/[^0-9]/g)) {
                    this.value = this.value.replace(/[^0-9]/g, '');
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">ملف الطالب
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="true"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStdStatusID" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <uc1:StudentSideBar runat="server" ID="StudentSideBar" ActiveTab="litab_2" />
                    <div class="col-md-9">
                        <div class="tab-content">
                            <div id="tab1" class="" runat="server">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="portlet-body form">
                                    <ContentTemplate>
                                        <div class="form-horizontal">
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                <ProgressTemplate>
                                                    <div class="divWaiting">
                                                        <div class="alert alert-warning loading">
                                                            <span class="glyphicon glyphicon-refresh glyphicon-spin"></span>
                                                            <strong>جاري إجراء العملية ...</strong>
                                                        </div>
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h4>بيانات أساسية</h4>
                                                    </div>
                                                    <div class="col-md-9 isra-pl-0">
                                                        <div id="divMsg1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                            <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                            <div style="clear: both"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr style="margin: 10px 0 15px 0" />
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">الإسم بالعربية</label>
                                                    <div class="col-md-10 pad-zero">
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtArFirstName" CssClass="form-control text-center" runat="server" Enabled="True"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtArSecoundName" CssClass="form-control text-center" runat="server" Enabled="True"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtArThirdName" CssClass="form-control text-center" runat="server" Enabled="True"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtArFamilyName" CssClass="form-control text-center" runat="server" Enabled="True"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label " style="padding-left: 0px!important">الإسم بالانجليزية</label>
                                                    <div class="col-md-10 pad-zero">
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtEnFirstName" CssClass="form-control text-center" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtEnSecoundName" CssClass="form-control text-center" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtEnThirdName" CssClass="form-control text-center" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtEnFamilyName" CssClass="form-control text-center" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">رقم الهوية</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtSSN" CssClass="form-control numeric" runat="server"></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-2 control-label">رقم جواز السفر</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtPassport" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">مكان الميلاد</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtPlaceOfBirth" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-2 control-label">تاريخ الميلاد</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtDateOfBirth" CssClass="form-control date-picker" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">الحالة الصحية</label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlCHealthStatusID" runat="server" DataSourceID="SqlDataSource16" DataTextField="ArName" DataValueField="ID" CssClass="form-control" OnSelectedIndexChanged="ddlCHealthStatusID_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=16) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر الحالة الصحية'"></asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label">الاعاقة</label>
                                                    <div class="col-md-4">
                                                        <asp:RadioButton ID="rbDisabilityOk" runat="server" Text="يوجد" GroupName="Disability" OnCheckedChanged="rbDisabilityOk_CheckedChanged" AutoPostBack="true" />
                                                        <asp:RadioButton ID="rbDisabilityNot" runat="server" Text="لا يوجد" GroupName="Disability" Checked="true" OnCheckedChanged="rbDisabilityNot_CheckedChanged" AutoPostBack="true" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div id="DiseaseType" runat="server" class=" col-md-6" visible="false">
                                                        <label class="col-md-4 control-label">نوع المرض</label>
                                                        <div class="col-md-8">
                                                            <asp:TextBox ID="txtDiseaseType" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div id="Disability" runat="server" class=" col-md-6" visible="false">
                                                        <label class="col-md-4 control-label">حالة الإعاقة</label>
                                                        <div class="col-md-8">
                                                            <asp:TextBox ID="txtDisabilityStatus" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">الحالة الاجتماعية</label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlCStatusID" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" CssClass="select form-control" OnSelectedIndexChanged="ddlCStatusID_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=3) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر الحالة الاجتماعية'"></asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label">الجنس</label>
                                                    <div class="col-md-4">
                                                        <asp:RadioButton ID="rbMale" runat="server" Text="ذكر" GroupName="MF" />
                                                        <asp:RadioButton ID="rbFemale" runat="server" Text="أنثي" GroupName="MF" />
                                                    </div>
                                                </div>
                                                <div id="Status" runat="server" class="form-group" visible="false">
                                                    <label class="col-md-2 control-label">رقم هوية الزوج/ة</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtNextSSN" CssClass="form-control numeric" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">الجنسية</label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlCNationalityID" runat="server" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" CssClass="select form-control"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=1) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر الجنسية'"></asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label">الديانة</label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlCReligionID" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" CssClass="select form-control"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=2) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر الديانة'"></asp:SqlDataSource>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">رقم هوية الأب</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtFatherSSN" CssClass="form-control numeric" runat="server"></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-2 control-label">اسم الام</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtMotherName" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2"></label>
                                                    <div class="col-md-2">
                                                        <asp:Button ID="btnSaveMainData" runat="server" CssClass="btn blue btn btn-rounded default btn-block w80" OnClick="btnSaveMainData_Click" Text="حفظ" />
                                                    </div>
                                                </div>

                                                <%-- بيانات إضافية --%>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h4>بيانات إضافية</h4>
                                                    </div>
                                                    <div class="col-md-9 isra-pl-0">
                                                        <div id="div2" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                            <asp:Label ID="Label3" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                            <div style="clear: both"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr style="margin: 10px 0 15px 0" />

                                               
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">يوجد جنسية أخرى</label>
                                                    <div class="col-md-4">
                                                        <asp:RadioButtonList ID="rBtnHaveOtherNationality" runat="server">
                                                            <asp:ListItem Value="0">نعم</asp:ListItem>
                                                            <asp:ListItem Value="1">لا</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        </div>
                                                    <label class="col-md-2 control-label">الجنسية الأخرى</label>
                                                    <div class="col-md-4">
                                                   <asp:TextBox ID="txtOtherNationality" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">عدد الطلاب الجامعيين</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtStdsUnivNo" CssClass="form-control" runat="server"></asp:TextBox>
                                                   </div>
                                                    <label class="col-md-2 control-label">رقم تسلسل الطالب في الأسرة</label>
                                                    <div class="col-md-4">
                                                   <asp:TextBox ID="txtStdFSerialNo" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">متوسط دخل الأسرة بالشيكل</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtFIncome" CssClass="form-control" runat="server"></asp:TextBox>
                                                   </div>
                                                    <label class="col-md-2 control-label">حالة الأثاث</label>
                                                    <div class="col-md-4">
                                                              <asp:DropDownList ID="DDLFurStatus" runat="server" DataSourceID="SqlDataSource10" DataTextField="ArName" DataValueField="ID" CssClass="select form-control"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=24) AND ([IsActive] = 1) AND ([IsDelete] = 0)) "></asp:SqlDataSource>
                                                   
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">حالة الطالب</label>
                                                    <div class="col-md-4">
                                                             <asp:DropDownList ID="DDLStdStatus" runat="server" DataSourceID="SqlDataSource18" DataTextField="ArName" DataValueField="ID" CssClass="select form-control"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=25) AND ([IsActive] = 1) AND ([IsDelete] = 0)) "></asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label">البلدة الأصلية</label>
                                                    <div class="col-md-4">
                                                   <asp:TextBox ID="txtOriginalTown" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">يوجد أسير</label>
                                                    <div class="col-md-4">
                                                        <asp:RadioButtonList ID="rBtnHavePrisoner" runat="server">
                                                            <asp:ListItem Value="1">نعم</asp:ListItem>
                                                            <asp:ListItem Value="0">لا</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        </div>
                                                    <label class="col-md-2 control-label">إسم الأسير</label>
                                                    <div class="col-md-4">
                                                   <asp:TextBox ID="txtPrisName" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">يوجد شهيد</label>
                                                    <div class="col-md-4">
                                                        <asp:RadioButtonList ID="rbtnHaveMartyr" runat="server">
                                                            <asp:ListItem Value="1">نعم</asp:ListItem>
                                                            <asp:ListItem Value="0">لا</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        </div>
                                                    <label class="col-md-2 control-label">إسم الشهيد</label>
                                                    <div class="col-md-4">
                                                   <asp:TextBox ID="txtMartyr" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">نوع السكن</label>
                                                    <div class="col-md-4">
                                                                <asp:DropDownList ID="DDLHouseType" runat="server" DataSourceID="SqlDataSource19" DataTextField="ArName" DataValueField="ID" CssClass="select form-control"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=23) AND ([IsActive] = 1) AND ([IsDelete] = 0)) "></asp:SqlDataSource>
                                                     </div>
                                                    <label class="col-md-2 control-label">حالة الأب</label>
                                                    <div class="col-md-4">
                                                        <asp:RadioButtonList ID="rBtnFatherStatus" runat="server">
                                                            <asp:ListItem Value="1">متوفي</asp:ListItem>
                                                            <asp:ListItem Value="0">غير متوفي</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                <label class="col-md-2 control-label">عدد أفراد الأسرة</label>
                                                    <div class="col-md-4">
                                                   <asp:TextBox ID="txtFamilyNo" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-md-2"></label>
                                                    <div class="col-md-2">
                                                        <asp:Button ID="btnSaveOtherData" runat="server" CssClass="btn blue btn btn-rounded default btn-block w80" OnClick="btnSaveOtherData_Click" Text="حفظ" />
                                                    </div>
                                                </div>
                                                <%-- End of Complete data- Tasneem --%>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div id="tab2" class="" runat="server">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" class="portlet-body form">
                                    <ContentTemplate>
                                        <div class="form-horizontal">
                                            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                                <ProgressTemplate>
                                                    <div class="divWaiting">
                                                        <div class="alert alert-warning loading">
                                                            <span class="glyphicon glyphicon-refresh glyphicon-spin"></span>
                                                            <strong>جاري إجراء العملية ...</strong>
                                                        </div>
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h4>بيانات ولي الأمر</h4>
                                                    </div>
                                                    <div class="col-md-9 isra-pl-0">
                                                        <div id="divMsg2" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                            <asp:Label ID="lblMsg2" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                            <div style="clear: both"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr style="margin: 10px 0 15px 0" />
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">صلة القرابة</label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlCSuperiorLink" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" CssClass="select form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCSuperiorLink_SelectedIndexChanged"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ((ConstantID=12) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1, N'إختر صلة القرابة' union SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ((ConstantID=15) AND (ArName=N'غير ذلك') AND ([IsActive] = 1) AND ([IsDelete] = 0))"></asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label">اسم ولي الامر</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtSuperiorName" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div id="link" runat="server" class="form-group">
                                                    <label class="col-md-2 control-label">صلة القرابة</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtSuperiorLink" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" style="padding-left: 0;">رقم هوية ولي الامر</label>
                                                    <div class="col-md-4">
                                                        <asp:Label ID="lblFatherSSN" runat="server" Visible="false"></asp:Label>
                                                        <asp:TextBox ID="txtSuperiorSSN" CssClass="form-control numeric" runat="server"></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-2 control-label">عنوان ولي الأمر</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtSuperiorAddress" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">مهنة ولي الأمر</label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlCSuperiorJopID" runat="server" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" CssClass="select form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCSuperiorJopID_SelectedIndexChanged"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=11) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر المهنة' union SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ((ConstantID=15) AND (ArName=N'غير ذلك') AND ([IsActive] = 1) AND ([IsDelete] = 0))"></asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label">مكان العمل</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtSuperiorPlaceJop" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div id="job" runat="server" class="form-group">
                                                    <label class="col-md-2 control-label">مهنة ولي الأمر</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtSuperiorJop" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">هاتف ولي الامر</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtSuperiorPhone" CssClass="form-control numeric" runat="server"></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-2 control-label">جوال ولي الامر</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtSuperiorMobile" CssClass="form-control numeric" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-offset-2 col-md-2">
                                                        <asp:Button ID="btnSaveSuperiorData" runat="server" CssClass="btn blue btn btn-rounded default btn-block w80" OnClick="btnSaveSuperiorData_Click" Text="حفظ" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div id="tab3" class="" runat="server">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" class="portlet-body form">
                                    <ContentTemplate>
                                        <div class="form-horizontal">
                                            <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
                                                <ProgressTemplate>
                                                    <div class="divWaiting">
                                                        <div class="alert alert-warning loading">
                                                            <span class="glyphicon glyphicon-refresh glyphicon-spin"></span>
                                                            <strong>جاري إجراء العملية ...</strong>
                                                        </div>
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h4>بيانات الإتصال</h4>
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
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">الدولة</label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlCountryID" runat="server" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" CssClass="select form-control" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT [ID], [ArName] FROM [Country] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر الدولة'"></asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label">المحافظة</label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlGovernoratesID" runat="server" DataSourceID="SqlDataSource7" DataTextField="ArName" DataValueField="ID" CssClass="select form-control" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT [ID], [ArName] FROM [Governorates] WHERE ((CountryID=@CountryID) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر المحافظة'">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="ddlCountryID" Name="CountryID" PropertyName="SelectedValue" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">المدينة</label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlCityID" runat="server" DataSourceID="SqlDataSource8" DataTextField="ArName" DataValueField="ID" CssClass="select form-control" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT [ID], [ArName] FROM [City] WHERE ((GovernoratesID=@GovernoratesID) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر المدينة'">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="ddlGovernoratesID" Name="GovernoratesID" PropertyName="SelectedValue" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label">اسم الحي</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtNeighborhood" runat="server" CssClass="form-control" placeholder="ادخل اسم الحي"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">اسم الشارع</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtStreet" runat="server" CssClass="form-control" placeholder="ادخل اسم الشارع"></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-2 control-label">رقم المنزل</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtHomeNo" runat="server" CssClass="form-control" placeholder="ادخل رقم المنزل"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">العنوان بالتفصيل</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtAddressDetails" runat="server" CssClass="form-control" placeholder="ادخل العنوان بالتفصيل"></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-2 control-label">البريد الإلكتروني</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="ادخل البريد الإلكتروني"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">رقم الهاتف</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control numeric" placeholder="ادخل رقم الهاتف"></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-2 control-label">رقم الجوال</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control numeric" placeholder="ادخل رقم الجوال"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-offset-2 col-md-2">
                                                        <asp:Button ID="btnSaveContactData" runat="server" class="btn blue btn btn-rounded default btn-block w80" OnClick="btnSaveContactData_Click" Text="حفظ" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div id="tab4" class="" runat="server">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" class="portlet-body form">
                                    <ContentTemplate>
                                        <div class="form-horizontal">
                                            <asp:UpdateProgress ID="UpdateProgress4" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
                                                <ProgressTemplate>
                                                    <div class="divWaiting">
                                                        <div class="alert alert-warning loading">
                                                            <span class="glyphicon glyphicon-refresh glyphicon-spin"></span>
                                                            <strong>جاري إجراء العملية ...</strong>
                                                        </div>
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <h4>رغبات الطالب /
                                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h4>
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
                                                <div class="form-group">
                                                    <div class="row col-md-12">
                                                        <div class="col-md-2">
                                                        </div>
                                                        <div class="col-md-3">الرغبة الأولى :</div>
                                                        <div class="col-md-3">
                                                            <asp:DropDownList ID="ddlCollege1" runat="server" DataSourceID="SqlDataSource9" DataTextField="ArName" DataValueField="ID" CssClass="form-control dropdown-control w200" AutoPostBack="true"></asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableCollege" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:DropDownList ID="ddlDepartment1" runat="server" DataSourceID="SqlDataSource11" DataTextField="ArName" DataValueField="ID" CssClass="form-control" class="dropdown-control w200"></asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableDepartment" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="ddlCollege1" Name="CollegeID" PropertyName="SelectedValue" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row col-md-12">
                                                        <div class="col-md-2">
                                                        </div>
                                                        <div class="col-md-3">الرغبة الثانية :</div>
                                                        <div class="col-md-3">
                                                            <asp:DropDownList ID="ddlCollege2" runat="server" DataSourceID="SqlDataSource12" DataTextField="ArName" DataValueField="ID" CssClass="form-control dropdown-control w200" AutoPostBack="true"></asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableCollege" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:DropDownList ID="ddlDepartment2" runat="server" DataSourceID="SqlDataSource13" DataTextField="ArName" DataValueField="ID" CssClass="form-control" class="dropdown-control w200"></asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableDepartment" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="ddlCollege2" Name="CollegeID" PropertyName="SelectedValue" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="ddlDepartment1" Name="DepartmentID1" PropertyName="SelectedValue" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row col-md-12">
                                                        <div class="col-md-2">
                                                        </div>
                                                        <div class="col-md-3">الرغبة الثالثة :</div>
                                                        <div class="col-md-3">
                                                            <asp:DropDownList ID="ddlCollege3" runat="server" DataSourceID="SqlDataSource14" DataTextField="ArName" DataValueField="ID" CssClass="form-control dropdown-control w200" AutoPostBack="true"></asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableCollege" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:DropDownList ID="ddlDepartment3" runat="server" DataSourceID="SqlDataSource15" DataTextField="ArName" DataValueField="ID" CssClass="form-control" class="dropdown-control w200"></asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableDepartment" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="ddlCollege3" Name="CollegeID" PropertyName="SelectedValue" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="ddlDepartment1" Name="DepartmentID1" PropertyName="SelectedValue" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="ddlDepartment2" Name="DepartmentID2" PropertyName="SelectedValue" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="xxxx" runat="server" class="form-body" visible="false">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <h4>شروط انتساب الطالب</h4>
                                                        </div>
                                                        <div class="col-md-9 isra-pl-0">
                                                            <div id="div1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                                <asp:Label ID="Label2" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                                <div style="clear: both"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr style="margin: 10px 0 15px 0" />
                                                    <div class="row">
                                                        <table class="table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 40%; text-align: center">الشرط</th>
                                                                    <th style="width: 10%; text-align: center">تفعيل</th>
                                                                    <th style="width: 40%; text-align: center">ملاحظات</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource17">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <asp:Label ID="lblAdmissionConditionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                            <td style="text-align: right"><%# Eval("ConditionName") %></td>
                                                                            <td style="text-align: center">
                                                                                <asp:CheckBox ID="cbIsValidate" runat="server" Checked='<%# Eval("IsValidate") %>' /></td>
                                                                            <td style="text-align: center">
                                                                                <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="1" Width="300px" Text='<%# Eval("Notes") %>'></asp:TextBox></td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                <asp:SqlDataSource ID="SqlDataSource17" runat="server"
                                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                    SelectCommand="GetStudentCondition" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </tbody>
                                                        </table>
                                                        <div class="form-group">
                                                            <div class="col-md-offset-2 col-md-2">
                                                                <asp:Button ID="Button1" runat="server" Text="حفظ الشروط " class="btn green" OnClick="Button1_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="x" runat="server" class="form-group" visible="false">
                                                    <h3 style="margin: 20px 0; font-size: 20px; font-weight: 600; margin-right: 5px;">خاص الطلبة المجسرين</h3>
                                                    <label class="col-md-3 control-label">اسم الجامعة/الكلية السابقة</label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="txtOldUniversity" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-3 control-label">اسم التخصص السابق</label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="txtOldDepartment" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div id="xx" runat="server" class="form-group" visible="false">
                                                    <label class="col-md-3 control-label">معدل التخصص</label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="txtOldUniversityGPA" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-3 control-label">تقدير الشامل</label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="txtShamelRate" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div id="xxx" runat="server" class="form-group" visible="false">
                                                    <label class="col-md-3 control-label">عددسنوات الخبرة</label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="txtExpertYears" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <label class="col-md-3 control-label">عدد ساعات النجاح</label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="txtOldUniversityHours" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-offset-2 col-md-2">
                                                        <asp:Button ID="btStudentWishes" runat="server" class="btn blue btn btn-rounded default btn-block w80" OnClick="btStudentWishes_Click" Text="حفظ" />
                                                    </div>
                                                </div>
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

