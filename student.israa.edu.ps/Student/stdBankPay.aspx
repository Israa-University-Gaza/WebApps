<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="stdBankPay.aspx.cs" Inherits="Student_stdBankPay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu30').addClass("active");
        });
    </script>
    <style>
        .trtd tr, .trtd td, .trtd th, .trtd {
            border: 0px !important;
            text-align: center !important;
        }

            .trtd tr:last-child {
                column-span: all !important;
                text-align: center !important;
            }

            .trtd a {
                text-decoration: none !important;
                transition: all ease-in-out 0.5s;
            }

                .trtd a:hover {
                    color: #808080 !important;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder font-ha">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#">نموذج الدفع البنكي</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>نموذج الدفع البنكي</div>
                </div>
                <div class="portlet-body">
                    <br />
                    <br />
                    <div class="row">
                        <div class="form-group">
                            <label class="control-label col-md-3"> </label>
                            <div class="col-md-6">
                                <asp:Button ID="btn_print" OnClick="btn_print_Click" CssClass="btn btn-primary" runat="server" Text="طباعة" />
                                </div>
                        </div>
                    </div>


                    </div>
                </div>
            </div>
        </div>
</asp:Content>

