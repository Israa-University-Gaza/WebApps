<%@ Page Title="" Language="C#" MasterPageFile="~/AdmissionApp/MasterPage.master" AutoEventWireup="true" CodeFile="Accreditation.aspx.cs" Inherits="AdmissionApp_Accreditation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.holder-style').removeClass('holder-active');
            $('#Accreditation').addClass('holder-active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="portlet-body form">
        <div class="form-horizontal">
            <div class="form-body">
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="row font-fe">
                                أقر أنا مقدم الطلب أن جميع البيانات
                                 المقدمة لجامعة الإسراء صحيحة و أتحمل كامل المسئولية القانونية علي ذلك
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-5">
                    <a class="btn btn-rounded default" href="StudentImage.aspx">السابق</a>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="Button3" runat="server" Text="اعتماد" CssClass="btn green" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

