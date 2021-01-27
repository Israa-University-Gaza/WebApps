<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="BlockStudent.aspx.cs" Inherits="Student_BlockStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu15').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">حجب معلومات الطالب</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i> حجب معلومات الطالب</div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                               <!-- <h4>تم اغلاق بوابتك بقرار من الشؤون الأكاديمية ،عليك مراجعة دائرة  شؤون الطلبة</h4>-->
                                <h4>عذرا تم حجب هذه الخاصية ،عليك مراجعة دائرة  شؤون الطلبة</h4>
                            </div>
                        </div>
                        <br />
                    </div>
                </div>
                <div class="form-actions fluid">
                    <div class="col-md-12" style="text-align: left">

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
