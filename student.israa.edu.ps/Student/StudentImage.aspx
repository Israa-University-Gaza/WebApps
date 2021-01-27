<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudentImage.aspx.cs" Inherits="Student_StudentImage" %>

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

    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>تغير كلمة المرور</div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-3">
                        <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                            <li>
                                <img id="ImgStudentProfile" runat="server" class="img-responsive" style="width: 100%" alt="" />
                            </li>
                            <li><a href="Default.aspx"><i class="fa fa-home"></i>الصفحة الرئيسية</a></li>
                            <li><a href="StudentProfile.aspx#tab1"><i class="fa fa-briefcase"></i>بيانات أساسية</a></li>
                            <li><a href="StudentProfile.aspx#tab2"><i class="fa fa-male"></i>بيانات ولي الأمر</a></li>
                            <li><a href="StudentProfile.aspx#tab3"><i class="fa fa-mobile-phone"></i>بيانات الإتصال</a></li>
                            <li class="active"><a href="StudentImage.aspx"><i class="fa fa-camera"></i>تغيير الصورة الشخصية</a></li>
                            <li><a href="ChangePassword.aspx"><i class="fa fa-lock"></i>تغير كلمة المرور</a></li>
                            <li>
                                <asp:LinkButton ID="lbSignOut" runat="server" OnClick="lbSignOut_Click"><i class="fa fa-key"></i>تسجيل الخروج</asp:LinkButton></li>
                        </ul>
                    </div>
                    <div class="col-md-9">

                        <div class="row">
                            <div style="width: 200px; margin: 0 auto;">
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
                                    <input type="range" class="cropit-image-zoom-input" style="width: 200px;" />
                                    </div>
                                    <br />
                                    <input type="hidden" name="imgCropped" class="hidden-image-data" />
                                    <input type="button" class="crop btn red btn btn-rounded default btn-block w80" value="اقتصاص" />
                                    <asp:Button ID="btnUpload" runat="server" class="btn blue btn btn-rounded default btn-block w80" Text="حفظ" OnClick="Upload" ClientIDMode="Static" Style="display: none" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

