<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="ExceptionStudentCourseAdd.aspx.cs" Inherits="Academic_ExceptionStudentCourseAdd" %>
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
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>إضافة/ تعديل استثناء  مساق</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblExceptionsCourseID" runat="server" Visible="false"></asp:Label>
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
                    <uc1:StudentSideBar ActiveTab="ExceptionStudentCourseAdd" runat="server" ID="StudentSideBar" />

                    <div style="width: 81%; float: right;">
                        <div id="tab2" class="tab-pane" runat="server" clientidmode="Static">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <h4>إضافة /تعديل استثناء للطالب</h4>
                                        </div>
                                    </div>
                                    <hr style="margin: 10px 0 15px 0" />

                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">الفصل الدراسي : </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlSemesterID" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="SELECT ID, ArName FROM [Semester] Where IsDelete=0 and IsActive=1 ORDER BY ID DESC"></asp:SqlDataSource>
                                    </div>

                                    <div class="form-group row">

                                        <label class="col-md-2 control-label isra-text-aling-right">نوع الاستثناء</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlExceptionsCourseType" runat="server" DataSourceID="SqlDataSource2" CssClass="select2_category form-control" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetExceptionType" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="2" Name="ExceptionCategoryID" Type="Int32"></asp:Parameter>
                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" DefaultValue="" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        </div>
                                    </div>
                                    <div class="form-group row">

                                        <label class="col-md-2 control-label isra-text-aling-right">المساق</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCourse" runat="server" DataSourceID="SqlDataSource1" CssClass="select2_category form-control" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID, CourseCode +'  ' + ArName as Name FROM [Course] WHERE ([IsActive] = 1) AND ([IsDelete] = 0) union Select -1, N'اختر المساق'"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="form-group row">

                                        <label class="col-md-2 control-label isra-text-aling-right">تارخ نهاية الاستثناء</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control date-picker"></asp:TextBox>
                                        </div>

                                        <label class="col-md-1 control-label isra-text-aling-right">وقت </label>
                                        <div class="col-md-2">
                                            <asp:TextBox ID="txtTime" runat="server" CssClass="form-control clockface_1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label isra-text-aling-right">سبب الاستثناء</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group ">

                                        <div class="col-md-offset-3 col-md-3">
                                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>استثناءات الطالب</h4>
                                    </div>
                                </div>
                                <hr style="margin: 10px 0 15px 0" />

                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-striped table-hover" id="sample_editable_1 ">
                                    <thead>
                                        <tr>
                                            <th style="width: 30%; text-align: center;">الفصل الدراسي</th>
                                            <th style="width: 15%; text-align: center;">المساق</th>
                                            <th style="width: 10%; text-align: center;">نوع الاستثناء </th>
                                            <th style="width: 20%; text-align: center;">نهاية الاستنثاء</th>
                                            <th style="width: 15%; text-align: center;">السبب</th>
                                            <th style="width: 5%; text-align: center;">فعال</th>
                                            <th style="width: 5%; text-align: center;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>

                                                    <td style="text-align: center"><%# Eval("Semester") %></td>
                                                    <td style="text-align: center"><%# Eval("CourseName") %></td>
                                                    <td style="text-align: center"><%# Eval("ExceptionsTypeName") %></td>
                                                    <td style="text-align: center"><%# Eval("DeadlineDateTime") %></td>
                                                    <td style="text-align: center"><%# Eval("Note") %></td>
                                                    <td style="text-align: center">
                                                        <asp:CheckBox ID="cbIsActive" runat="server" Checked='<%# Eval("IsActive") %>' AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" /></td>
                                                   <%-- <td>
                                                        <asp:LinkButton ID="lbDelete" runat="server" CssClass="btn default btn-xs purple" Style="font-size: 11px; padding: 4px 10px;" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbDelete_Click">حذف</asp:LinkButton></td>--%>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetExceptionStudentCourse" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <div class="clearfix"></div>
                                <div class="col-md-12">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                            <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                                            <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                            <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                                <div class="clearfix"></div>
                                <% } %>
                                <%  else
                                    { %>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center">
                                        <strong>لا يوجد استثناءات للعرض  </strong>
                                        <div style="clear: both"></div>
                                    </div>
                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                    <div style="clear: both"></div>
                                </div>
                                <%  } %>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

