﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="StudentInstallmentAddEdit.aspx.cs" Inherits="StudentInstallmentAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu1').addClass("active open");
            $('#menu1 a').css("background-color", "#575757");
            $('#menu1 a span.arrow').addClass("open");
            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">شؤون الطلاب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>طلبات التقسيط</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblInstallmentID" runat="server" Text="" Visible="false"></asp:Label>

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
                    <div style="width: 19%; float: right;">
                        <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                            <li>
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource10">
                                    <ItemTemplate>
                                        <h5 style="text-align: center;"><%# Eval("DisplayName") %> (<%# Eval("StudentNo") %>)</h5>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                    SelectCommand="GetStudentData" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </li>
                            <li><a href="Student.aspx"><i class="fa fa-home"></i>الصفحة الرئيسية<span class="after"></span></a></li>
                        </ul>
                    </div>

                    <div style="width: 81%; float: right;">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-8">
                                    <h4>اضافة/ تعديل قسط</h4>
                                </div>

                            </div>
                            <hr style="margin: 10px 0 15px 0" />
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="col-md-3">عنوان القسط : </label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtInstallmentName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="col-md-3">قيمة القسط بالدينار : </label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtInstallmentValue" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="col-md-3">تاريخ الطلب : </label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtInstallmentRequestDate" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="col-md-3">تاريخ السداد : </label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtInstallmentRepayDate" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="col-md-3">ملاحظات : </label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtInstallmentNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="col-md-3"></label>
                                    <div class="col-md-3">
                                        <asp:Button ID="btnStudentInstallmentAddEdit" runat="server" CssClass="btn blue btn btn-rounded default btn-block" OnClick="btnStudentInstallmentAddEdit_Click" Text="إضافة قسط مالي" />
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
