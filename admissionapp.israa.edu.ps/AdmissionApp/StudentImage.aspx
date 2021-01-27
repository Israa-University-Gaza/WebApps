<%@ Page Title="" Language="C#" MasterPageFile="~/AdmissionApp/MasterPage.master" AutoEventWireup="true" CodeFile="StudentImage.aspx.cs" Inherits="AdmissionApp_StudentImage" %>

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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
        <div class="row">
            <div class="col-md-5">
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
                    </div>
                    <input type="range" class="cropit-image-zoom-input" />
                    <input type="hidden" name="imgCropped" class="hidden-image-data" />
                    <input type="button" class="crop btn red btn btn-rounded default btn-block w80" value="اقتصاص" />
                    <asp:Button ID="btnUpload" runat="server" class="btn blue btn btn-rounded default btn-block w80" Text="حفظ" OnClick="Upload" ClientIDMode="Static" Style="display: none" />
                </div>
            </div>
            <div class="col-md-5" style="float: left; padding-top: 33px;">
                <img runat="server" id="image" />
            </div>
        </div>
        <hr />
        <div class="form-group">
            <div class="col-md-5">
                <a href="StudentWishes.aspx" class="btn btn-rounded green default">السابق</a>
            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-5" style="direction: ltr">
                <a href="Accreditation.aspx" class="btn btn-rounded green default">التالي</a>
            </div>
        </div>
        <div class="clearfix"></div>
</asp:Content>

