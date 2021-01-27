<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="ReadRool.aspx.cs" Inherits="Student_ReadRool" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu19').addClass("active");
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
        <li><a href="#" class="font-ha">إيقاف صفحة الطالب</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>قوانين ولوائح الجامعة</div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="form-group row">
                            <%--   <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" CssClass="col-md-12">
                            <ItemTemplate>--%>

                            <div class="row">
                                <div class="col-md-12">
                                    <h4>عزيزي الطالب عليك قراءة قوانين ولوائج الجامعة التالية ، والموافقة عليها</h4>
                                </div>
                                <br />
                                <table class="table table-hover table-bordered">
                                    <tbody>
                                        <tr>
                                            <td><a href='../Role/Terms.pdf' target="_blank">مصطلحات عامة</a></td>
                                        </tr>
                                        <tr>
                                            <td><a href='../Role/Warning.pdf' target="_blank">التحذير الاكاديمي والفصل</a></td>
                                        </tr>
                                        <tr>
                                            <td><a href='../Role/delay.pdf' target="_blank">التأجيل</a></td>

                                        </tr>
                                        <tr>
                                            <td><a href='../Role/Fees.pdf' target="_blank">الرسوم</a></td>
                                        </tr>
                                        <tr>
                                            <td><a href='../Role/q1.pdf' target="_blank">أسئلة شائعة 1 </a></td>
                                        </tr>
                                        <tr>
                                            <td><a href='../Role/q2.pdf' target="_blank">أسئلة شائعة 2 </a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset">
                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" Text="تم الاطلاع على كافة القوانين واللوائح وتمت الموافقة عليها" Checked="false" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
