<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="InstallmentOrder.aspx.cs" Inherits="Student_InstallmentOrder" %>

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
        <li><a href="#">طلب تقسيط رسوم دراسية</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلب تقسيط رسوم دراسية</div>
                </div>
                <div class="portlet-body">
                    <div class="clearfix">

                    <div id="divMsg" runat="server" class="alert alert-warning alert-dismissable" visible="true" style="font-size: 14px;">
                        <div class="col-xs-10">
                            <strong>
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                            </strong>
                            <div style="clear: both"></div>
                        </div>
                        <button aria-hidden="true" data-dismiss="alert" class="close col-xs-2" style="margin-top: 4px;" type="button"></button>
                        <div style="clear: both"></div>
                    </div>
                    <div class="form-horizontal">
                      <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-4">عدد ساعات التسجيل</label>
                            <div class="col-md-8">
                                 <asp:TextBox ID="txtCoursesHours" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>

                          <asp:Label ID="lblCoursesHours" runat="server" Enabled="false" Text="" Visible="false"></asp:Label>
                          <asp:Label ID="lblTotalCost" runat="server" Text="" Visible="false"></asp:Label>
                          <asp:Label ID="lblBalance" runat="server" Text="" Visible="false"></asp:Label>
                          <asp:Label ID="lblPayed" runat="server" Text="" Visible="false"></asp:Label>
                          <asp:Label ID="lblRemain" runat="server" Text="" Visible="false"></asp:Label>
                          <asp:Label ID="lblLastPaidAmount" runat="server" Text="" Visible="false"></asp:Label>


                          <div class="form-group">
                            <label class="control-label col-md-4">آخر دفعة مالية</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtLastPaidAmount" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                         

                      </div>

                      <div class="col-md-6">
                           <div class="form-group">
                            <label class="control-label col-md-4">المدفوع</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtPayed" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-4">المتبقي الفصلي</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtRemain" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>



                          <div class="form-group">
                            <div class="col-md-4">
                                <br /><br />
                              <asp:Button ID="btnSave" Width="100%" OnClick="btnSave_Click" CssClass="btn btn-primary"  runat="server" Text="إرسال الطلب" />
                            </div>
                        </div>
                      </div>
                      
                        
                        
                       
                    
                    </div>
                </div>
            </div>
        </div>
        </div>
    
</asp:Content>

