<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentConditionApp.aspx.cs" Inherits="Admission_StudentConditionApp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
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
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">ملف الطالب
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
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
                    <div class="col-md-3">
                        <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                            <li>
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource10">
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
                            <li class="active"><a data-toggle="tab" href="#tab1"><i class="fa fa-briefcase"></i>بيانات أساسية<span class="after"></span>
                            </a></li>
                            <li><a data-toggle="tab" href="#tab2"><i class="fa fa-male"></i>بيانات ولي الأمر</a></li>
                            <li><a data-toggle="tab" href="#tab3"><i class="fa fa-mobile-phone"></i>بيانات الإتصال</a></li>
                            <li><a data-toggle="tab" href="#tab4"><i class="fa fa-lock"></i>شروط انتساب الطالب</a></li>

                            <% if (Permissions.Contains("AcceptAdmissionApplication"))
                               { %>
                            <li><a data-toggle="tab" href="#tab5"><i class="fa fa-lock"></i>اعتماد الطالب في القسم</a></li>
                            <% } %>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <div id="tab1" class="tab-pane active">
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
                                                            <asp:TextBox ID="txtArFirstName" CssClass="form-control text-center" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtArSecoundName" CssClass="form-control text-center" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtArThirdName" CssClass="form-control text-center" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <asp:TextBox ID="txtArFamilyName" CssClass="form-control text-center" runat="server" Enabled="false"></asp:TextBox>
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
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div id="tab2" class="tab-pane">
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
                                                        <asp:DropDownList ID="ddlCSuperiorLink" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCSuperiorLink_SelectedIndexChanged"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ((ConstantID=12) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1, N'إختر صلة القرابة' union SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ((ConstantID=15) AND (ArName=N'أخرى') AND ([IsActive] = 1) AND ([IsDelete] = 0))"></asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label">اسم ولي الامر</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtSuperiorName" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div id="link" runat="server" class="form-group">
                                                    <label class="col-md-2 control-label">صلة القرابة</label>
                                                    <div class="col-md-4">
                                                        <asp:TextBox ID="txtSuperiorLink" CssClass="select2_category form-control" runat="server"></asp:TextBox>
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
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=11) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر المهنة' union SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ((ConstantID=15) AND (ArName=N'أخرى') AND ([IsActive] = 1) AND ([IsDelete] = 0))"></asp:SqlDataSource>
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
                            <div id="tab3" class="tab-pane">
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
                                                        <asp:DropDownList ID="ddlCountryID" runat="server" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" CssClass=" form-control select_category" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT [ID], [ArName] FROM [Country] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر الدولة'"></asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label">المحافظة</label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlGovernoratesID" runat="server" DataSourceID="SqlDataSource7" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true"></asp:DropDownList>
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
                                                        <asp:DropDownList ID="ddlCityID" runat="server" DataSourceID="SqlDataSource8" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true"></asp:DropDownList>
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
                            <div id="tab4" class="tab-pane">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" class="portlet-body form">
                                    <ContentTemplate>
                                        <div class="form-horizontal">
                                            <asp:UpdateProgress ID="UpdateProgress4" runat="server" AssociatedUpdatePanelID="UpdatePanel4">
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
                                                        <h4>شروط انتساب الطالب</h4>
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
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 40%; text-align: center">الشرط</th>
                                                                <th style="width: 10%; text-align: center">تفعيل</th>
                                                                <th style="width: 40%; text-align: center">ملاحظات</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource9">
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
                                                            <asp:SqlDataSource ID="SqlDataSource9" runat="server"
                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                SelectCommand="GetStudentCondition" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
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
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div id="tab5" class="tab-pane">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" class="portlet-body form">
                                    <ContentTemplate>
                                        <div class="form-horizontal">
                                            <asp:UpdateProgress ID="UpdateProgress5" runat="server" AssociatedUpdatePanelID="UpdatePanel4">
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
                                                        <h4>رغبات الطالب</h4>
                                                    </div>
                                                     </div>
                                                </div>
                                                <hr style="margin: 10px 0 15px 0" />
                                                <div class="row">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 2%; text-align: center"></th>
                                                                <th style="width: 23%; text-align: center">الكلية</th>
                                                                <th style="width: 20%; text-align: center">القسم</th>
                                                                <th style="width: 13%; text-align: center">س.ق.طلاب</th>
                                                                <th style="width: 15%; text-align: center">#المنتسبين</th>
                                                                <th style="width: 13%; text-align: center">س.ق.طالبات</th>
                                                                <th style="width: 14%; text-align: center">#المنتسبات</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource11">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>1</td>
                                                                        <td style="text-align: center"><%# Eval("CollegeName1") %></td>
                                                                        <td style="text-align: center"><%# Eval("DepartmentName1") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdMCapacity1") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentMInDep1") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdFMCapacity1") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentFMInDep1") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>2</td>
                                                                        <td style="text-align: center"><%# Eval("CollegeName2") %></td>
                                                                        <td style="text-align: center"><%# Eval("DepartmentName2") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdMCapacity2") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentMInDep2") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdFMCapacity2") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentFMInDep2") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>3</td>
                                                                        <td style="text-align: center"><%# Eval("CollegeName3") %></td>
                                                                        <td style="text-align: center"><%# Eval("DepartmentName3") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdMCapacity3") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentMInDep3") %></td>
                                                                        <td style="text-align: center"><%# Eval("StdFMCapacity3") %></td>
                                                                        <td style="text-align: center"><%# Eval("CountStuentFMInDep3") %></td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                SelectCommand="StudentWishesGet" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h4>اعتماد الطالب في القسم</h4>
                                                    </div>
                                                    <div class="col-md-9 isra-pl-0">
                                                        <div class="col-md-9 isra-pl-0">
                                                            <div id="divMsg5" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                                <asp:Label ID="lblMsg5" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                                <div style="clear: both"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr style="margin: 10px 0 15px 0" />
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" style="text-align: left">الكلية : </label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlCollege" runat="server" DataSourceID="SqlDataSource14" class="select2_category form-control" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStdAvailableCollege" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                    <label class="col-md-2 control-label" style="text-align: left">القسم : </label>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlDepartment" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource15" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Department] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND ([CollegeID]=@CollegeID)) union select -1,N'إختر التخصص'">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-offset-2 col-md-2">
                                                        <asp:Button ID="btnSave" runat="server" Text="قبول الطالب" class="btn green" OnClick="btnSave_Click" />
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
