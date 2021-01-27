<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="ExceptionStudentGeneralAdd.aspx.cs" Inherits="Academic_ExceptionStudentGeneralAdd" %>
<%@ Register TagPrefix="uc1" TagName="StudentSideBar" Src="~/Academic/UserControls/StudentSideBar.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />


    <script type="text/javascript" src="../assets/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/clockface.js"></script>
    <script type="text/javascript" src="../assets/datepicker/moment.min.js"></script>
    <script type="text/javascript" src="../assets/datepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="../assets/datepicker/bootstrap-datetimepicker.min.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script src="../assets/datepicker/quick-sidebar.js" type="text/javascript"></script>
    <script src="../assets/datepicker/demo.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js"></script>
    <script>
        jQuery(document).ready(function () {
            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });

                QuickSidebar.init(); // init quick sidebar
                Demo.init(); // init demo features
                ComponentsPickers.init();

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">الطالب
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>

    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>استثناءات التسجيل الفصلي </div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <uc1:StudentSideBar ActiveTab="ExceptionStudentGeneralAdd" runat="server" ID="StudentSideBar" />
                    <div style="width: 81%; float: right;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4 class="font-ha">استثناءات التسجيل الفصلي </h4>
                                    </div>
                                    <div class="col-md-7 isra-pl-0">
                                        <div id="div2" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                            <asp:Label ID="Label1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                            <div style="clear: both"></div>
                                        </div>
                                    </div>
                                </div>
                                <hr style="margin: 10px 0 15px 0" />
                                <div class="row" style="padding-top: 15px;">
                                    <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
                                    <label class="col-md-2 control-label">الفصل الدراسي </label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT top 2 ID, ArName FROM [Semester]  Where IsDelete=0 and IsActive=1 ORDER BY ID DESC"></asp:SqlDataSource>

                                    </div>
                                </div>
                                <div class="row" style="padding-top: 15px;">
                                    <label class="col-md-2 control-label">نوع الاستثناء </label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlExceptionType" runat="server" AutoPostBack="True" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="ddlExceptionType_OnSelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetExceptionType" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="ExceptionCategoryID" Type="Int32"></asp:Parameter>
                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" DefaultValue="" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>                                    </div>
                                </div>
<div class="row" style="padding-top: 15px;">
                                    <label class="col-md-2 control-label">عدد الساعات المسموحة </label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtHoursCount" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row" style="padding-top: 15px;">
                                    <label class="col-md-2 control-label">تاريخ انتهاء الاستثناء </label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtDeadlineDate" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                    </div>
                                     <label class="col-md-1 control-label"> الوقت </label>
                                     <div class="col-md-2">
                                        <asp:TextBox ID="txtDeadlineTime" runat="server" CssClass="form-control clockface_1"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                        <label class="col-md-2 control-label isra-text-aling-right">سبب الاستثناء</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                <div class="row" style="padding-top: 15px;">
                                    <div class="col-md-offset-2 col-md-6">
                                        <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                    </div>
                                </div>
                            </div>
                             <hr style="margin: 10px 0 15px 0" />
                            <div class="col-md-3">
                                <h4 class="font-ha">استثناءات التسجيل الفصلي </h4>
                            </div>


                            <div class="row" style="padding-top: 15px;">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 15%">الفصل الدراسي</th>
                                            <th style="width: 20%; text-align: center">نوع الاستثناء</th>
                                            <th style="width: 10%; text-align: center">عدد الساعات المسموحة</th>
                                            <th style="width: 10%; text-align: center">المعدل التراكمي</th>
                                            <th style="width: 15%; text-align: center">الموعد النهائي</th>
                                            <th style="width: 15%; text-align: center">سبب الإستثناء</th>
                                             <th style="width: 15%; text-align: center">فعال</th>
                                             <th style="width: 10%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource20">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <td><span><%# Eval("SemesterName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("ExceptionType") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("HoursCount") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("GPAUniversity") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("Deadline") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("Note") %></span></td>
                                                     <td style="text-align: center">
                                                         <asp:CheckBox ID="IsActive" runat="server" Checked='<%# Eval("IsActive") %>' AutoPostBack="true" OnCheckedChanged="IsActive_CheckedChanged" /></span></td>
                                                    <td style="text-align: center">
                                                     <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i>  حذف</a></asp:LinkButton></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource20" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetExceptionStudentGeneral" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                        <strong>لم يتم اضافة استثناءات </strong>
                                        <div style="clear: both"></div>
                                    </div>
                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                    <div style="clear: both"></div>
                                </div>
                                <% } %>
                            </div>


                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
</asp:Content>

