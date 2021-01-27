<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="VisitorSMS.aspx.cs" Inherits="NewLibrary_VisitorSMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <link href="../assets/css/pages/profile-rtl.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/custom-rtl.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library6 a').css("background-color", "#575757");
            $('#new-library a span.arrow').addClass("open");

            $("#fuDocument").change(function () {
                $('#txtDocumentLink').val($(this).val());
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-book"></i>
        <a href="VisitorSMS.aspx" class="font-ha">إرسال رسالة للزائر</a>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblVisitorID" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الزائر</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div style="width: 19%; float: right;">
                        <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                            <li style="margin-bottom: 0;">
                                <div class="input-group">
                                    <asp:TextBox ID="txtSSN" runat="server" class="form-control" placeholder="الرجاء ادخال هوية الزائر" Style="font-family: Tahoma; font-size: 12px !important;"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button ID="btnChechVisitor" runat="server" Text="بحث" class="btn green" OnClick="btnChechVisitor_Click" Style="height: 34px;" />
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource10">
                                    <ItemTemplate>
                                        <h5 style="text-align: center;"><%# Eval("FullName") %> (<%# Eval("SSN") %>)</h5>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:IsraaLibrary %>"
                                    SelectCommand="GetVisitor" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblVisitorID" PropertyName="Text" Name="ID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </li>
                            <li><a href="Visitor.aspx"><i class="fa fa-home"></i>الصفحة الرئيسية</a></li>
                            <li><a href="VisitorBorrowedBooks.aspx"><i class="fa fa-edit"></i>الكتب المستعارة</a></li>
                            <%--<li><a href="#"><i class="fa fa-edit"></i>استعارة كتاب</a></li>--%>
                            <li class="active"><a href="VisitorSMS.aspx"><i class="fa fa-edit"></i>ارسال SMS</a></li>
                             <li>
                                <asp:LinkButton ID="lbEditVisitor" runat="server" OnClick="lbEditVisitor_Click"><i class="fa fa-edit"></i>تعديل بيانات الزائر</asp:LinkButton></li>
                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <h4>إرسال رسالة SMS للزائر</h4>
                                        </div>
                                        <div class="col-md-9 isra-pl-0">
                                            <div id="divMsg9" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                <asp:Label ID="lblMsg9" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr style="margin: 10px 0 15px 0" />
                                    <div class="row" style="padding-top: 15px;">
                                        <label class="col-md-2 control-label">نص الرسالة</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtSMSText" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="padding-top: 15px;">
                                        <div class="col-md-offset-2 col-md-6">
                                            <asp:Button ID="btnSendSMS" runat="server" Text="إرسال الرسالة" CssClass="btn green" OnClick="btnSendSMS_Click" />
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

