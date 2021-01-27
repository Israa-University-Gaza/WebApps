<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudentBankInstallment.aspx.cs" Inherits="Student_StudentBankInstallment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu16').addClass("active open");
            $('#menu16_1 a').css("background-color", "#575757");
            $('#menu16 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">طلب تقسيط رسوم فصلية بنكية
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <asp:Label ID="lblSemesterID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلب تقسيط رسوم فصلية بنكية</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">

                            <h2 class="text-center ">إقرار :</h2>
                            <br />
                            <span style="font-size: 15px;">حيث أنني أرغب في تقسيط رسومي الفصلية عن طريق برنامج التقسيط الميسر عرض تأجير منفعة موصوف بالذمة مع </span>
                            <div class="form-group row">
                            </div>
                            <br />
                            <div class="form-group row">
                                <label class="col-md-1 control-label" style="font-size: 16px;">بنك :</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlBank" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlBank_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                        SelectCommand="Select ID,ArName From Bank Where IsDelete=0 and IsActive=1 union Select -1,N'اختر البنك'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label" style="font-size: 16px;">: فرع</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlBankBranch" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                        SelectCommand="Select ID,ArName From BankBranch Where BankID=@BanKID and IsDelete=0 and IsActive=1 union Select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlBank" PropertyName="SelectedValue" Name="BankID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                            <br />
                            <span style="font-size: 15px;">وعليه فإنني لامانع لدي 
                            من مخاطبة البنك المعني بهذا الخصوص وارسال بياناتي له مع حملي كافة المسؤوليات المترتبة على ذلك وفي حالة قيامي بسحب 
                           أي من المساقات المسجلة وفق هذا البرنامج ، وإن رسومها المحصلة تبقى في رصيدي ولا تستردد نقداً وتستمر عملية التقسيط كما لو لم يحدث أي عارض ويجري نفس الأمر في حال الانسحاب من الجامعة اذا ترتب عليه رصيد دائن بعد إتمام التسويات المالية اللازمة.
                      
                            </span>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-1 col-md-11">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn blue" OnClick="btnSave_Click" />
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

