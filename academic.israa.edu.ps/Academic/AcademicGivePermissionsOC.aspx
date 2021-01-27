<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="AcademicGivePermissionsOC.aspx.cs" Inherits="Academic_AcademicGivePermissionsOC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicOffer').addClass("active open");
            $('#AcademicOffer_4 a').css("background-color", "#575757");
            $('#AcademicOffer a span.arrow').addClass("open");

            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
            $('.cbisalltime :checkbox').change(function () {
                var tr = $(this).parent().parent().parent();
                if (this.checked) {
                    tr.children('td').children('.date-picker').prop("disabled", true);
                } else {
                    tr.children('td').children('.date-picker').prop("disabled", false);
                }
            });

            $('.cbaction :checkbox').change(function () {
                var tr = $(this).parent().parent().parent();
                if (this.checked) {
                    tr.children('td').children('.cbisalltime').children('checkbox').prop("disabled", false);
                    tr.children('td').children('.date-picker').prop("disabled", false);
                    tr.children('td').children('.cbisactive').children('checkbox').prop("disabled", false);
                } else {
                    tr.children('td').children('.cbisalltime').children('checkbox').prop("disabled", true);
                    tr.children('td').children('.date-picker').prop("disabled", true);
                    tr.children('td').children('.cbisactive').children('checkbox').prop("disabled", true);
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>اضافة صلاحيات</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>اضافة صلاحيات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="row">
                                <div class="form-group font-ha" style="font-size: 28px;">
                                    <label class="col-md-offset-2 col-md-2 control-label font-ha">اسم الموظف </label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlEmployee" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="ID"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>" SelectCommand="GetEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 30%; text-align: center">الصلاحية</th>
                                                <th style="width: 20%; text-align: center">نوع الصلاحية</th>
                                                <th style="width: 20%; text-align: center">بدء الصلاحية</th>
                                                <th style="width: 20%; text-align: center">انتهاء الصلاحية</th>
                                                <th style="width: 10%; text-align: center">فعال</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="cbAction" runat="server" CssClass="cbaction" Font-Bold="True" Text='<%# Eval("ArName") %>' />
                                                            <asp:Label ID="lblActionID" runat="server" Text='<%# Eval("ID") %>' Visible="false" /></td>
                                                        <td style="text-align: center">
                                                            <asp:CheckBox ID="cbIsAllTime" CssClass="cbisalltime" runat="server" Font-Bold="True" Text="دائم" /></td>
                                                        <td>
                                                            <asp:TextBox ID="txtAvailableFrom" runat="server" CssClass="form-control date-picker" placeholder="من"></asp:TextBox></td>
                                                        <td>
                                                            <asp:TextBox ID="txtAvailableTo" runat="server" CssClass="form-control date-picker" placeholder="الى"></asp:TextBox></td>
                                                        <td style="text-align: center">
                                                            <asp:CheckBox ID="cbIsActive" runat="server" CssClass="cbisactive" /></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                                SelectCommand="SELECT * FROM [Action] WHERE  (AGroup='3HeadOCGroup' or AGroup='2DeanOCGroup' or AGroup='1AcademicOCGroup' or AGroup='4SectionGroup' or AGroup='5LectureGroup')  AND ([IsDelete] = 0) order by AGroup"></asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <div class="col-md-9">
                                        <div class="col-md-offset-6 col-md-5">
                                            <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
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

