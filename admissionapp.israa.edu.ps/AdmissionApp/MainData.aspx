<%@ Page Title="" Language="C#" MasterPageFile="~/AdmissionApp/MasterPage.master" AutoEventWireup="true" CodeFile="MainData.aspx.cs" Inherits="AdmissionApp_MainData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />
    <style>
        .form-control {
            width: 100% !important;
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
            $('.holder-style').removeClass('holder-active');
            $('#MainData').addClass('holder-active');
        });
    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="portlet-body form">
        <div class="form-horizontal">
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-2 control-label">الإسم بالعربية</label>
                    <div class="col-md-10 pad-zero">
                        <div class="col-md-3">
                            <asp:TextBox ID="txtArFirstName" CssClass="form-control text-center" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtArSecoundName" CssClass="form-control text-center" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtArThirdName" CssClass="form-control text-center" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtArFamilyName" CssClass="form-control text-center" runat="server"></asp:TextBox>
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
                        <asp:TextBox ID="txtDateOfBirth" CssClass="form-control date-picker" runat="server" data-date-format="yyyy/mm/dd"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">الحالة الاجتماعية</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlCStatusID" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" CssClass="form-control" OnSelectedIndexChanged="ddlCStatusID_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
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
                    <label class="col-md-2 control-label">الحالة الصحية</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlCHealthStatusID" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" CssClass="form-control" OnSelectedIndexChanged="ddlCHealthStatusID_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=16) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر الحالة الصحية'"></asp:SqlDataSource>
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
                    <label class="col-md-2 control-label">الجنسية</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlCNationalityID" runat="server" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=1) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر الجنسية'"></asp:SqlDataSource>
                    </div>
                    <label class="col-md-2 control-label">الديانة</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlCReligionID" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
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
                <hr />
                <div class="form-group">
                    <div class="col-md-5">
                        <a href="Default.aspx" class="btn btn-rounded green default">السابق</a>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSaveMainData" runat="server" CssClass="btn blue btn btn-rounded default btn-block w80" OnClick="btnSaveMainData_Click" Text="حفظ" />
                    </div>
                    <div class="col-md-5" style="direction: ltr">
                        <asp:LinkButton ID="lbSuperiorData" runat="server" CssClass="btn btn-rounded green default" OnClick="lbSuperiorData_Click" Visible="false">التالي</asp:LinkButton>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>
