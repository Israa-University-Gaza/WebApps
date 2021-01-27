<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudentAdvertisement.aspx.cs" Inherits="Student_StudentAdvertisement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu1').addClass("active");
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
        <li><a href="#" class="font-ha">الإعلانات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>تفاصيل الاعلان</div>
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
                            <li><a href="StudentImage.aspx"><i class="fa fa-camera"></i>تغيير الصورة الشخصية</a></li>
                            <li><a href="ChangePassword.aspx"><i class="fa fa-lock"></i>تغير كلمة المرور</a></li>
                            <li>
                                <asp:LinkButton ID="lbSignOut" runat="server" OnClick="lbSignOut_Click"><i class="fa fa-key"></i>تسجيل الخروج</asp:LinkButton></li>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <div class="col-md-12 isra-down isra-news isra-mt-0" style="padding: 30px;">
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <h2 class="isra-mt-0"><%# Eval("Title") %></h2>
                                    <h3 class="col-md-4 isra-p-zero isra-mt-0 sale-num"><%# Eval("InsertDate","{0:hh:mm tt - dddd yyyy/MM/dd}") %></h3>
                                    <div class="col-md-8 isra-plus1" style="margin-right: 0px!important;"></div>
                                    <div class="clearfix"></div>
                                    <div class="col-md-12 isra-p-zero">
                                        <div class="col-md-12 isra-p-zero">
                                            <div class="isra-news-titel">
                                                <br />
                                                <br />
                                                <div class="editouer11" style="font-size: 16px;">
                                                    <%# Eval("Details") %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="SELECT * FROM [Advertisement]  where ID=@ID and [IsDelete]=0 order by [ID] DESC">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

