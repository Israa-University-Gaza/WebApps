<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StudentInstallmentAccreditation.aspx.cs" Inherits="Academic_StudentInstallmentAccreditation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>
    <script src="../assets/datepicker/components-pickers.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#InstructorAttendance').addClass("active open");
            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
        });
    </script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentScholarshipAccreditation').addClass("active open");
            $('#StudentScholarshipAccreditation_3 a').css("background-color", "#575757");
            $('#StudentScholarshipAccreditation a span.arrow').addClass("open");
        });
    </script>

    <script>
        function toggle(source) {
            checkboxes = document.getElementsByName('foo');
            for (var i = 0, n = checkboxes.length; i < n; i++) {
                checkboxes[i].checked = source.checked;
            }
        }
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
                <span>إعتماد أقساط الطلاب</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إعتماد أقساط الطلاب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group  col-md-6">
                        <label class="col-md-3 control-label">الفصل الدراسي : </label>
                        <div class="col-md-9">
                            <asp:DropDownList ID="ddlSemesterID" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                           SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsActive] = 1) And ([IsDelete] = 0) And Code<>'111111111') order by ID DESC"></asp:SqlDataSource>
                    </div>

                    <div class="form-group col-md-6">
                        <label class="control-label col-md-3">رقم الطالب : </label>
                        <div class="col-md-8">
                            <asp:TextBox ID="txtStudentNo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                   <%-- <div class="form-group col-md-6">
                        <label class="control-label col-md-3">تاريخ محدد : </label>
                        <div class="col-md-9">
                            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control date-picker"   placeholder="من تاريخ"></asp:TextBox>

                        </div>

                    </div>--%>
                    <div class="form-group col-md-6">
                        <label class="control-label col-md-3">إسم الطالب : </label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtArFirstName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtSecoundName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtArFamilyName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group col-md-6">

                        <label class="col-md-3 control-label">التاريخ</label>

                        <div class="col-md-4">
                            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control date-picker"   placeholder="من تاريخ"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control date-picker"  placeholder="حتى تاريخ"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group col-md-6">

                        <div class="  col-md-offset-8">
                            <asp:Button ID="btnFilter" runat="server" Text="بحث" class="btn green" OnClick="btnFilter_Click" />
                            <asp:Button ID="btnAccrediteStudentInstallment" runat="server" Text="إعتماد المحدد" class="btn green" OnClick="btnAccrediteStudentInstallment_Click" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <hr />
                    <div class="table">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th > <asp:CheckBox ID="cbCheckAll" OnCheckedChanged="cbStudentInstallment_CheckedChanged" AutoPostBack="true" runat="server" />
                                   </th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">رقم الطالب</th>
                                    <th style="text-align: center; width: 20%; padding: 8px 0px;">اسم الطالب</th>
                                    <th style="text-align: center; width: 15%; padding: 8px 0px;">البرنامج</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">عدد الأقساط</th>
                                    <th style="text-align: center; width: 15%; padding: 8px 0px;">التاريخ</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">نسبة المنحة %</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">آخر دفعة مالية</th>
                                    <th style="text-align: center;   padding: 8px 0px;">اعتماد صندوق الاقراض </th>
                                    <th style="text-align: center;   padding: 8px 0px;">اعتماد شؤون الطلبة</th>
                                    <th style="text-align: center;   padding: 8px 0px;">اعتماد النائب الأكاديمي</th>
                                    <th style="text-align: center;   padding: 8px 0px;">اعتماد النائب الاداري</th>


                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_OnItemDataBound">
                                    <ItemTemplate>
                                        <asp:Label ID="InstallmentOrderID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>

                                        <tr class= '<%# (Convert.ToBoolean(Eval("Accreditation").ToString()))? "success" : "" %>'>
                                            <td style="text-align: center;">
                                                <asp:CheckBox ID="cbStudentInstallment" Visible="False"  runat="server" />
                                            </td>
                                            <td style="text-align: center;"><%# Eval("StudentNo") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentName") %></td>
                                            <td style="text-align: center;"><%# Eval("Program") %></td>
                                            <td style="text-align: center;"><%# Eval("InstallmentCount") %></td>
                                            <td style="text-align: center;"><%# Eval("InsertDate") %></td>
                                            <td style="text-align: center;"><%# Eval("GrantPercentage") %></td>
                                            <td style="text-align: center;"><%# Eval("LastFinancialPayment") %></td>
                                            <td style="text-align: center;" >

                                                <asp:LinkButton ID="LinkButton1" Visible="False" runat="server" class="btn default btn-xs  green" OnClick="lbAccrediteStudentInstallment_Click" Enabled='<%# (!Convert.ToBoolean(Eval("LoansDivisionAccerdiation").ToString())) %>'><%# (!Convert.ToBoolean(Eval("LoansDivisionAccerdiation").ToString())) ? "إعتماد " : "تم " %></asp:LinkButton>
                                                <i runat="server" id="icheck1" Visible="False" class="fa fa-check green"></i>
                                                <i runat="server" id="iminus1" Visible="False" class="fa fa-minus"></i>
                                                <asp:Label ID="Label1" runat="server" Visible="False" Text='<%# Eval("LoansDivisionAccerdiation")%>'></asp:Label>

                                            </td>
                                            <td>

                                                <asp:LinkButton ID="LinkButton2" Visible="False" runat="server" class="btn default btn-xs green" OnClick="lbAccrediteStudentInstallment_Click" Enabled='<%# (!Convert.ToBoolean(Eval("AffairsManagerAccreditation").ToString())) %>'><%# (!Convert.ToBoolean(Eval("AffairsManagerAccreditation").ToString())) ? "إعتماد " : "تم " %></asp:LinkButton>
                                                <i runat="server" id="icheck2" Visible="False" class="fa fa-check green"></i>
                                                <i runat="server" id="iminus2" Visible="False" class="fa fa-minus"></i>
                                                <asp:Label ID="Label2" runat="server" Visible="False" Text='<%# Eval("AffairsManagerAccreditation")%>'></asp:Label>

                                            </td>
                                            <td>

                                                <asp:LinkButton ID="LinkButton3" Visible="False" runat="server" class="btn default btn-xs green" OnClick="lbAccrediteStudentInstallment_Click" Enabled='<%# (!Convert.ToBoolean(Eval("AcademicAccerdiation").ToString())) %>'><%# (!Convert.ToBoolean(Eval("AcademicAccerdiation").ToString())) ? "إعتماد " : "تم " %></asp:LinkButton>
                                                <i runat="server" id="icheck3" Visible="False" class="fa fa-check green"></i>
                                                <i runat="server" id="iminus3" Visible="False" class="fa fa-minus"></i>
                                                <asp:Label ID="Label3" Visible="False" runat="server" Text='<%# Eval("AcademicAccerdiation")%>'></asp:Label>
                                            </td>
                                            <td>


                                                <asp:LinkButton ID="LinkButton4" Visible="False" runat="server" class="btn default btn-xs green" OnClick="lbAccrediteStudentInstallment_Click" Enabled='<%# (!Convert.ToBoolean(Eval("ManagmentAccreditation").ToString())) %>'><%# (!Convert.ToBoolean(Eval("ManagmentAccreditation").ToString())) ? "إعتماد " : "تم " %></asp:LinkButton>
                                                <i runat="server" id="icheck4" Visible="False" class="fa fa-check green"></i>
                                                <i runat="server" id="iminus4" Visible="False" class="fa fa-minus"></i>
                                                <asp:Label ID="Label4" Visible="False" runat="server" Text='<%# Eval("ManagmentAccreditation")%>'></asp:Label>
                                            </td>

                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra3 %>"
                                    SelectCommand="GetSemesterStudentInstallment" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtStudentNo" DefaultValue="%" PropertyName="Text" Name="StudentNo" Type="String" />
                                        <asp:ControlParameter ControlID="txtArFirstName" DefaultValue="%" PropertyName="Text" Name="ArFirstName" Type="String" />
                                        <asp:ControlParameter ControlID="txtSecoundName" DefaultValue="%" PropertyName="Text" Name="ArSecoundName" Type="String" />
                                        <asp:ControlParameter ControlID="txtArFamilyName" DefaultValue="%" PropertyName="Text" Name="ArFamilyName" Type="String" />
                                        <asp:ControlParameter ControlID="ddlSemesterID" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                        <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                        <%--<asp:ControlParameter ControlID="txtDateFrom"  PropertyName="Text" Name="From" Type="String" />--%>
                                        <%--<asp:ControlParameter ControlID="txtDateTo"  PropertyName="Text" Name="To" Type="String" />--%>
                                        <%--<asp:Parameter DefaultValue="9" Name="SemesterID" Type="Int32" />--%>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="50" PagedControlID="ListView1" class="pager">
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
                            <div class="col-xs-11" style="text-align: center">
                                <strong>لا يوجد منح للإعتماد</strong>
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
