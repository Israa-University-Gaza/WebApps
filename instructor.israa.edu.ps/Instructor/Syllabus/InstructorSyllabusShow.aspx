<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="InstructorSyllabusShow.aspx.cs" Inherits="Instructor_InstructorSyllabusShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS CSS -->
    <link href="../assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="../assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS JS -->
    <script src="../assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>

    <script src="../assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS JS -->

    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>

    <script src="../assets/pages/scripts/components-date-time-pickers.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#EExam, #ExamForm').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>طلبات توصيف مساق</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <asp:Label ID="lbEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lbSyllabusID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lbPlaceID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="col-md-12">

        <div class="portlet light portlet-fit bordered calendar">
            <div class="portlet-title">
                <div class="row">
                    <div class="col-md-6">
                        <div class="caption">
                            <i class=" icon-layers font-red"></i>
                            <span class="caption-subject font-red uppercase font-ha">عرض المخرجات التعليمية للمساق</span>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="divMsg" runat="server" class="alert alert-dismissable alert-top alert-success" visible="false">
                            <asp:Label ID="lblMsg" runat="server" Style="font-weight: bold; float: left;" Text=""></asp:Label>
                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="form-horizontal">
                <div class="form-body">
                    <div class="portlet-body">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="text-align: center; width: 20%">رقم المساق</th>
                                    <th style="text-align: center; width: 15%">المساق</th>
                                    <th style="text-align: center; width: 20%">عدد الساعات</th>
                                    <th style="text-align: center; width: 20%">الكلية</th>
                                    <th style="text-align: center; width: 20%">القسم</th>

                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound">
                                    <ItemTemplate>
                                        <asp:Label ID="SyllabusID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblInstructorAccreditSyllabus" runat="server" Text='<%# Eval("InstructorAccreditSyllabus") %>' Visible="false"></asp:Label>
                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("NumOfHours") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("CollegeName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("DepartmentName") %></span></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbStart" runat="server" class="btn default btn-xs black" OnClick="lbStart_Click" Visible='<%# ( (Eval("InstructorAccreditSyllabus").ToString() == "0")) ? true:false %>'> بدء توصيف المساق</asp:LinkButton>
                                            <asp:LinkButton ID="lbPrint" runat="server" class="btn default btn-xs black" OnClick="lbPrint_Click"> طباعة توصيف المساق</asp:LinkButton>
                                            <asp:LinkButton ID="lbAccredit" runat="server" class="btn default btn-xs black" OnClick="lbAccredit_Click" Visible='<%# ( (Eval("SyllabusFilled").ToString() == "1") ) ? true:false %>'>  اعتماد توصيف المساق</asp:LinkButton>
                                        </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaAcademic %>' SelectCommand="GetSyllabus" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbEmployeeID" PropertyName="Text" Name="InstructorID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="lbPlaceID" PropertyName="Text" Name="PlaceID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <div class="clearfix"></div>
                        <div class="form-group">
                        </div>
                        <div class="clearfix"></div>
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                                <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            </Fields>
                        </asp:DataPager>
                        <div class="clearfix"></div>
                        <% }
                            else
                            {%>
                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                            <div class="col-xs-11" style="text-align: center;">
                                <strong>لا يوجد طلبات توصيف مساق</strong>
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
</asp:Content>

