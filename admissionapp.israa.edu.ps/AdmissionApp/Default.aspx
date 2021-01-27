<%@ Page Title="" Language="C#" MasterPageFile="~/AdmissionApp/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="AcademicApp_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.holder-style').removeClass('holder-active');
            $('#Welcome').addClass('holder-active');
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <asp:HiddenField ID="HiddenFieldStdID" runat="server" />
    <div class="portlet-body form">
        <div class="form-horizontal">
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-2 control-label">أهلا وسهلا بالطالب :</label>
                    <div class="col-md-10">
                        <asp:Label ID="txtStudentName" runat="server" CssClass="form-control" Enabled="false"></asp:Label>
                    </div>
                </div>
                <div class="form-group">

                    <label class="col-md-2 control-label">رقم الطالب</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="student_Num" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>

                    <label class="col-md-2 control-label">رقم الجلوس</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">

                    <label class="col-md-2 control-label">الفرع الدراسي</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <label class="col-md-2 control-label">سنة الثانوية العامة</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">معدل الثانوية</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div id="divStudentType234" runat="server">
                    <div class="form-group">
                        <label class="col-md-3 control-label">اسم الجامعة/الكلية السابقة</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtOldUniversity" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <label class="col-md-3 control-label">اسم التخصص السابق</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtOldDepartment" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">عدد الساعات التي تم دراستها</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtOldUniversityHours" CssClass="form-control numeric" runat="server"></asp:TextBox>
                        </div>
                        <label class="col-md-3 control-label">معدل التخصص</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtOldUniversityGPA" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div id="divStudentType2" runat="server" class="form-group">
                        <label class="col-md-3 control-label">تقدير الشامل</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtShamelRate" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <label class="col-md-3 control-label">عدد سنوات الخبرة</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtExpertYears" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-2 control-label">كيف عرفت عنا</label>
                    <div class="form-group col-md-10">
                        <asp:CheckBoxList ID="cblHowKnow" runat="server" Width="100%" RepeatColumns="5" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                            SelectCommand="GetHowKnows" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-md-5">
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSave" runat="server" class="btn blue btn btn-rounded default btn-block w80" OnClick="btnSave_Click" Text="حفظ" />
                    </div>
                    <div class="col-md-5" style="direction: ltr">
                        <asp:Button ID="btnNext" runat="server" Text="التالي" class="btn btn-rounded green default " OnClick="btnNext_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
