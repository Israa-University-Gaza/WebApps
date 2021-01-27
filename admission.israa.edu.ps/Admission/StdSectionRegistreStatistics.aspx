<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StdSectionRegistreStatistics.aspx.cs" Inherits="Admission_StdSectionRegistreStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" type="text/css" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/clockface.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Statistics').addClass("active open");
            $('#StdSectionRegistreStatistics a').css("background-color", "#575757");
            $('#StdSectionRegistreStatistics a span.arrow').addClass("open");


            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
            $('.clockface_1').clockface();
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
        <li><a href="StdSectionRegistreStatistics.aspx" class="font-ha">احصائية أعداد تسجيل الطلبة
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>احصائية تسجيل مساقات الطلبة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">

                    <div class="form-group row">
                    </div>
                    <div class="form-group row">

                        <label class="control-label col-md-1">التاريخ : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control date-picker text-center " placeholder="من تاريخ" OnTextChanged="DataBind_Click"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control date-picker text-center" placeholder="الى تاريخ" OnTextChanged="DataBind_Click"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" class="btn blue" OnClick="DataBind_Click" />
                            <asp:CheckBox ID="chbox" runat="server"  Checked="false" Text="مكرر"/>
                        </div>
                    </div>
                    <div class="form-group row">
                    </div>
                    <div class="table table-hover table-bordered">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-hover" id="sample_editable_1 ">
                            <thead>
                                <tr>
                                    <th style="width: 5%;">م</th>
                                    <th style="width: 20%; text-align: center;">رقم الطالب</th>
                                    <th style="width: 20%; text-align: center;">اسم الطالب</th>
                                    <th style="width: 20%; text-align: center;">عدد المساقات</th>
     <%--                               <th style="width: 50%; text-align: center;">المساقات</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="lbStudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                            <td><%# Eval("RowNo") %></td>
                                            <td style="text-align: center"><%# Eval("StudentNo") %></td>
                                            <td style="text-align: center"><%# Eval("StudentName") %></td>
                                            <td style="text-align: center"><%# Eval("CourseCount") %></td>
                              <%--              <td style="text-align: center">

                                                <table class="table table-striped table-hover" id="sample_editable_1 ">
                                                    <tbody>
                                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource5">
                                                            <ItemTemplate>
                                                                <tr>
                                                                                                                                           <td style="text-align: center"><%# Eval("CourseName") %> </td>
                                                                    <td style="text-align: center"><%# Eval("RegistrationDate") %></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetDateRangeStdSectionRegistreInfo" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:Parameter Name="SemesterID" Type="Int32"></asp:Parameter>
                                                                <asp:ControlParameter ControlID="txtDateFrom" PropertyName="Text" DefaultValue="1900/01/01" Name="DateFrom" Type="String"></asp:ControlParameter>
                                                                <asp:ControlParameter ControlID="txtDateTo" PropertyName="Text" Name="DateTo" DefaultValue="1900/01/01" Type="String"></asp:ControlParameter>
                                                                <asp:ControlParameter ControlID="lbStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>

                                            </td>--%>

                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetDateRangeStdSectionRegistreStatistics" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtDateFrom" PropertyName="Text" Name="DateFrom" DefaultValue="1900/01/01" Type="String"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="txtDateTo" PropertyName="Text" Name="DateTo" DefaultValue="1900/01/01" Type="String"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="chbox" PropertyName="Checked" Name="IsDuplicate" Type="Int32" DefaultValue="0"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>

                        <div class="clearfix"></div>
                        <% }
                            else
                            {%>
                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                            <div class="col-xs-11" style="text-align: center">
                                <strong>لا يوجد بيانات للعرض</strong>
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

