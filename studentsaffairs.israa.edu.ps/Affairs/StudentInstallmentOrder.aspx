<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="StudentInstallmentOrder.aspx.cs" Inherits="StudentInstallmentOrder" %>

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
                <span>عرض أقساط الطالب</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblOrderID" runat="server" Text="" Visible="false"></asp:Label>

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
                            <li><a href="StudentInstallment.aspx"><i class="fa fa-male"></i>طلب تقسيط رسوم دراسية</a></li>
                            <li><a href="StudentInstallmentOrder.aspx"><i class="fa fa-male"></i>طلبات التقسيط</a></li>

                        </ul>
                    </div>

                    <div style="width: 81%; float: right;">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">
                                    <h4>أقساط الطالب</h4>
                                </div>
                                <div class="col-md-9 isra-pl-0">
                                    <div id="divMsg" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                        <asp:Label ID="lblMsg" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="margin: 10px 0 15px 0" />
                            <div class="row">
                                <label class="col-md-3 control-label">الفصل الدراسي : </label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlSemesterID" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                </div>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                    SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsActive] = 1) And ([IsDelete] = 0) And Code<>'111111111') order by ID DESC"></asp:SqlDataSource>
                            </div>
                            <br />
                            <div class="row">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 15%; text-align: center">عدد ساعات التسجيل</th>
                                            <th style="width: 14%; text-align: center">المبلغ المدفوع</th>
                                            <th style="width: 14%; text-align: center">المبلغ المتبقي</th>
                                            <th style="width: 13%; text-align: center">عدد الأقساط</th>
                                            <th style="width: 13%; text-align: center">مجموع الأقساط</th>
                                            <th style="width: 5%; text-align: center">معتمد</th>
                                            <th style="width: 25%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource8">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="InstallmentOrderID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <td style="text-align: center"><span><%# Eval("NumOfHours") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("PaidAmount") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("RemainingAmount") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("CountofInstallments") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("SumOfInstallments") %></span></td>
                                                    <td style="text-align: center">
                                                        <asp:CheckBox ID="cbAccreditation" runat="server" Checked='<%# Eval("Accreditation") %>' Enabled="false" />
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:LinkButton ID="lbStudentInstallmentAdd" runat="server" class="btn default btn-xs green" OnClick="lbStudentInstallmentAdd_Click"> اضافة قسط</a></asp:LinkButton>
                                                        <asp:LinkButton ID="lbInstallmentOrderPDF" runat="server" class="btn default btn-xs blue" OnClick="lbInstallmentOrderPDF_Click"> PDF</a></asp:LinkButton>
                                                        <asp:LinkButton ID="lbInstallmentOrderPDF2" runat="server" class="btn default btn-xs blue" OnClick="lbInstallmentOrderPDF2_Click">تعهد</a></asp:LinkButton>
                                                        <asp:LinkButton ID="lbInstallmentOrderEdit" runat="server" class="btn default btn-xs black" OnClick="lbInstallmentOrderEdit_Click" Visible='<%# ((Convert.ToBoolean(Eval("Accreditation").ToString() ))) ? false:true %>'>تحرير </asp:LinkButton>
                                                        <asp:LinkButton ID="lbInstallmentOrderClosed" runat="server" class="btn default btn-xs purple" OnClick="lbInstallmentOrderClosed_Click" OnClientClick="return confirm('هل انت متاكد من عملية التوقيف؟')">توقيف</asp:LinkButton>
                                                        <asp:LinkButton ID="lbInstallmentOrderDelete" runat="server" class="btn default btn-xs purple" OnClick="lbInstallmentOrderDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetStudentInstallmentOrder" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlSemesterID" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>

                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                        <% if (ddlSemesterID.SelectedValue != "-1")
                                            { %>
                                        <strong>لا يوجد طلبات تقسيط للطالب</strong>
                                        <% }
                                            else
                                            { %>
                                        <strong>اختر الفصل الدراسي لعرض طلبات تقسيط الطالب</strong>
                                        <% } %>
                                        <div style="clear: both"></div>
                                    </div>
                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                    <div style="clear: both"></div>
                                </div>
                                <% } %>
                            </div>



                            <div class="row">
                                <% if (ListView3.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 25%; text-align: center">القسط</th>
                                            <th style="width: 10%; text-align: center">قيمة القسط</th>
                                            <th style="width: 15%; text-align: center">تاريخ الطلب</th>
                                            <th style="width: 15%; text-align: center">تاريخ السداد</th>
                                            <th style="width: 5%; text-align: center">معتمد</th>
                                            <th style="width: 5%; text-align: center">مسدد</th>
                                            <th style="width: 5%; text-align: center">موقوف</th>
                                            <th style="width: 10%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <asp:Label ID="StudentInstallmentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td style="text-align: center"><span><%# Eval("InstallmentName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("InstallmentValue") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("RequestDate") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("RepayDate") %></span></td>
                                                    <td style="text-align: center">
                                                        <asp:CheckBox ID="cbAcademicAccreditation" runat="server" Checked='<%# Eval("AcademicAccreditation") %>' Enabled="false" />
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:CheckBox ID="cbIsPaid" runat="server" Checked='<%# Eval("IsPaid") %>' Enabled="false" />
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:CheckBox ID="cbIsClosed" runat="server" Checked='<%# Eval("IsClosed") %>' Enabled="false" />
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:LinkButton ID="lbStudentInstallmentEdit" runat="server" class="btn default btn-xs black" OnClick="lbStudentInstallmentEdit_Click" Visible='<%# ((Convert.ToBoolean(Eval("AcademicAccreditation").ToString()))) ? false:true %>'>تحرير </asp:LinkButton>
                                                        <asp:LinkButton ID="lbStudentInstallmentDelete" runat="server" class="btn default btn-xs purple" OnClick="lbStudentInstallmentDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetStudentInstallmentBySemesterID" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlSemesterID" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                        <% if (ddlSemesterID.SelectedValue != "-1")
                                            { %>
                                        <strong>لا يوجد أقساط مالية علي الطالب</strong>
                                        <% }
                                            else
                                            { %>
                                        <strong>اختر الفصل الدراسي لعرض أقساط الطالب</strong>
                                        <% } %>
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

