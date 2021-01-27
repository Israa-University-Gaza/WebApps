<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsNotRegisterdStdSection.aspx.cs" Inherits="Admission_StudentsNotRegisterdStdSection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_7 a').css("background-color", "#575757");
            $('#Student a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الغاء تسجيل فصل دراسي</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">

                    <div class="row">
                        <label class="control-label col-md-2">الفصل الدراسي </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="dataBind_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                        <label class="col-md-2 control-label">حالة الفصل</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlSemesterStatus" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="dataBind_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlSemesterStatuses" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                    <br />

                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-striped table-hover" id="sample_editable_1 ">
                                <thead>
                                    <tr>
                                        <th style="width: 2%; font-size: 12px;">م</th>
                                        <th style="text-align: center; width: 9%; border-top: none!important; font-size: 12px;">رقم الطالب</th>
                                        <th style="text-align: center; width: 17%; border-top: none!important; font-size: 12px;">اسم الطالب</th>
                                        <th style="text-align: center; width: 14%; border-top: none!important; font-size: 12px;">رصيد الطالب</th>
                                        <th style="text-align: center; width: 30%; border-top: none!important; font-size: 12px;">اسم الفصل الدراسي</th>
                                        <th style="text-align: center; width: 14%; border-top: none!important; font-size: 12px;">حالة الفصل </th>
                                        <th style="text-align: center; width: 11%; border-top: none!important; font-size: 12px;">مدفوع خدمات</th>

                                        <th style="text-align: center; width: 3%; border-top: none!important; font-size: 12px;"></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                        <ItemTemplate>
                                            <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <tr <%# Eval("SemesterStatusID").ToString()=="1" ? "style='color:red;'" : Eval("SemesterStatusID").ToString()=="4" ? "style='color:green;'" : "" %>>
                                                <td><span><%# Eval("RowNo") %></span></td>
                                                <td style="text-align: center;"><a href="StudentFinancialProfile.aspx?id=<%# Eval("StudentID") %>" target="_blank"><%# Eval("StudentNo") %></a></td>
                                                <td style="text-align: center;"><a href="StudentFinancialProfile.aspx?id=<%# Eval("StudentID") %>" target="_blank"><%# Eval("StudentName") %></a></td>
                                                <td style="text-align: center"><span><%# Eval("StudentBalance") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("SemesterName") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("SemesterStatus") %></span></td>
                                                <td style="text-align: center;">
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#Convert.ToBoolean(Eval("ISPaid")) %>' Enabled="false" />
                                                </td>

                                                <td style="text-align: center">
                                                    <asp:Button ID="btnCancel" runat="server" Text="الغاء تسجيل الفصل" Visible='<%# Eval("SemesterStatusID").ToString()=="1" %>' CssClass="btn btn-sm btn-danger" OnClick="btnCancel_Click" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetStudentsNotRegisterdStdSection" SelectCommandType="StoredProcedure">
                                        <SelectParameters>

                                            <asp:ControlParameter ControlID="ddlSemester" Name="SemesterID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                                            <asp:ControlParameter ControlID="ddlSemesterStatus" Name="SemesterStatusID " PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="100" PagedControlID="ListView1" class="pager">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                    <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                    <asp:NumericPagerField ButtonType="Link" ButtonCount="1" />
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
                                    <strong>لا يوجد بيانات لعرضها</strong>
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
</asp:Content>

