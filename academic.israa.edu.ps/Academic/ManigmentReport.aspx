<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="ManigmentReport.aspx.cs" Inherits="Academic_ManigmentReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicReport').addClass("active open");
            $('#AcademicReport_3 a').css("background-color", "#575757");
            $('#AcademicReport a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">دائرة الشئؤن الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <i class="fa fa-paste (alias)"></i>
            <a href="ManigmentReport.aspx" class="font-ha">تقارير إدارية</a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>تقارير إدارية</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <asp:LinkButton ID="lbNewStudent" runat="server" OnClick="lbNewStudent_Click">كشف الطلبة الجدد</asp:LinkButton><br />
                    <asp:LinkButton ID="lbAcceptedStudentDepartmentStatistic" runat="server" OnClick="lbAcceptedStudentDepartmentStatistic_Click">كشف بأعداد الطلبة التي تم تنسيبهم إلي الأقسام </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

