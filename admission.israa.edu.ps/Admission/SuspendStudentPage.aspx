<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="SuspendStudentPage.aspx.cs" Inherits="Admission_SuspendStudentPage" %>

<%@ Register Src="~/Admission/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">ايقاف صفحة الطالب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblDepartmentID" runat="server" Visible="false" Text="16"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStdStatusID" runat="server" Visible="false"></asp:Label>
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
                    <uc1:StudentSideBar runat="server" ID="StudentSideBar" ActiveTab="SuspendStudentPage" />
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">

                            <div class="form-body">

                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <h4>ايقاف صفحة الطالب</h4>
                                        </div>
                                        <div class="col-md-9 isra-pl-0">
                                            <div id="div2" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                <asp:Label ID="Label1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr style="margin: 10px 0 15px 0" />
                                    <div class="row" style="padding-top: 15px;">
                                        <label class="col-md-4 control-label">شرط ايقاف صفحة الطالب</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="SuspendCondition" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="SuspendCondition_SelectedIndexChanged" DataTextField="Name" DataValueField="ID" DataSourceID="SqlDataSource25"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource25" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="Select ID,Name from StudentSuspendedCondition where IsDelete=0 union select -1, N'إختر' union select 9999, N'أخري'">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="row" style="padding-top: 15px;" id="others" runat="server" visible="false">
                                        <label class="col-md-4 control-label">شرط اخر</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="OtherCondition" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="padding-top: 15px;">
                                        <label class="col-md-4 control-label">التفاصيل</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="SuspendDetails" TextMode="MultiLine" runat="server" CssClass="form-control" Rows="6"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="padding-top: 15px;" runat="server" id="UnSuspendRow" visible="false">
                                        <asp:Label ID="SuspendID" runat="server" Text="" Visible="false"></asp:Label>
                                        <label class="col-md-4 control-label">تفاصيل الغاء الحظر</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="UnSuspendDetails" TextMode="MultiLine" runat="server" CssClass="form-control" Rows="6"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="padding-top: 15px;">
                                        <div class="col-md-offset-4 col-md-6">
                                            <asp:Button ID="Suspend" runat="server" Text=" حظر صفحة الطالب" CssClass="btn green" OnClick="Suspend_Click" />
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

