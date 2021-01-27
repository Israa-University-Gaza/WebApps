<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="Messanger.aspx.cs" Inherits="Admission_Messanger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicSectionStudents').addClass("active open");
        });
    </script>
    <style>
        .commentArea {
            font: 14px Arial;
            padding: 10px;
            margin-top: 20px;
            min-height: 400px;
            height: 400px;
            max-height: 400px;
            border: 1px solid #ddd;
            border-bottom: none;
            overflow: scroll;
        }

        .bubbledLeft, .bubbledRight {
            margin-top: 20px;
            padding: 5px 9px;
            max-width: 50%;
            position: relative;
        }

        .bubbledLeft {
            float: left;
            margin-right: auto;
            -webkit-border-radius: 8px 8px 8px 0px;
            -moz-border-radius: 8px 8px 8px 0px;
            -o-border-radius: 8px 8px 8px 0px;
            -ms-border-radius: 8px 8px 8px 0px;
            border-radius: 8px 8px 8px 0px;
            background-color: #65B045;
            color: #ffffff;
        }

            .bubbledLeft:before {
                border-bottom: 10px solid #65B045;
                border-left: 9px solid rgba(0, 0, 0, 0);
                position: absolute;
                bottom: 0;
                left: -8px;
                content: "";
            }

        .bubbledRight {
            float: right;
            margin-left: auto;
            text-align: right;
            -webkit-border-radius: 8px 8px 0px 8px;
            -moz-border-radius: 8px 8px 0px 8px;
            -o-border-radius: 8px 8px 0px 8px;
            -ms-border-radius: 8px 8px 0px 8px;
            border-radius: 8px 8px 0px 8px;
            background-color: #07D;
            color: white;
        }

            .bubbledRight:before {
                border-bottom: 9px solid #07D;
                border-right: 9px solid rgba(0, 0, 0, 0);
                position: absolute;
                bottom: 0;
                right: -8px;
                content: "";
            }
    </style>

    <script src="../Scripts/jquery.signalR-2.1.2.min.js"></script>
    <script src="../signalr/hubs"></script>
    <script type="text/javascript">
        $(function () {
            var chat = $.connection.chatHub;
            chat.client.broadcastMessage = function (name, message) {
                if ($('#displayname').val() == name) {
                    $('.commentArea').append('<div class="bubbledLeft">' + message + '</div><div style="clear:both;"></div>');
                } else {
                    $('.commentArea').append('<div class="bubbledRight">' + message + '</div>');
                }
                $(".commentArea").animate({ scrollTop: $(document).height() }, "fast");
                return false;
            };
            $('#message').focus();
            $.connection.hub.start().done(function () {
                $('#sendmessage').click(function () {
                    if ($('#message').val() != '') {
                        chat.server.send($('#displayname').val(), $('#message').val());
                        $('#message').val('').focus();
                    }
                });
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">دائرة القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>محادثات القبول والتسجيل الجماعية</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>محادثات القبول والتسجيل الجماعية</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div style="width: 50%; margin: auto;">
                        <input type="hidden" id="displayname" value='<%= User.Identity.Name.ToString() %>' />
                        <div class="commentArea">
                        </div>
                        <div>
                            <input type="text" id="message" class="form-control" style="width: 80%; float: right;" />
                            <input type="button" id="sendmessage" value="إرسال" class="btn green" style="width: 20%; height: 34px;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>





</asp:Content>

