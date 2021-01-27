<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsBlockException.aspx.cs" Inherits="Financial_StudentsBlockException" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

       <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentsBlockException').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">

            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>طلاب الاستثناء المالي
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>
                    <a href="" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group row">
                        <label class="control-label col-md-2">الفصل </label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="DataBind_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>

                        <label class="col-md-2 control-label isra-text-aling-right">اسم أو رقم الطالب</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtStudentName" runat="server" class="form-control" OnTextChanged="DataBind_Click"></asp:TextBox>
                        </div>

                    </div>

                    <br />
                    <hr />
                    <% if (ListView1.Items.Count > 0)
                        { %>

                    <%--                    <div class="form-group row">

                        <div class="col-md-4" style="text-align: center;">

                            <asp:LinkButton ID="lbActivateAll" runat="server" class="btn btn-block success" OnClick="lbActivateAll_Click"> <i class="fa fa-check"></i> تفعيل المحدد</asp:LinkButton>
                               
                               <asp:LinkButton ID="lbDeActivateAll" runat="server" class="btn btn-block success" OnClick="lbActivateAll_Click"> <i class="fa fa-check"></i> الغاء تفعيل المحدد</asp:LinkButton>
                        </div>--%>
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <%-- <th>
                                        <input type="checkbox" id="selectAll" />
                                    </th>--%>
                                <th style="width: 5%;">#</th>
                                <th style="width: 10%; text-align: center;">رقم الطالب </th>
                                <th style="width: 15%; text-align: center;">اسم الطالب</th>
                                <th style="width: 15%; text-align: center;">قسم الطالب</th>
                                <th style="width: 40%; text-align: center;">ملاحظات</th>
                                <th style="width: 10%; text-align: center;">فعال</th>
                                <th style="width: 5; text-align: center;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>

                                        <td><%# Eval("RowNo") %></td>

                                        <td style="text-align: center"><%# Eval("StudentNo") %></td>
                                        <td style="text-align: center;"><a href="Student.aspx?id=<%# Eval("StudentID") %>&tab=1" target="_blank"><%# Eval("StudentName") %></a></td>
                                        <td style="text-align: center"><%# Eval("StudentDepartment") %></td>

                                        <td style="text-align: center"><%# Eval("Notes") %></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="chActivate" runat="server" Checked='<%# Eval("IsActive") %>' AutoPostBack="true" OnCheckedChanged="chActivate_CheckedChanged" /></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i>  حذف</a></asp:LinkButton>
                                        </td>


                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:isra2 %>" SelectCommand="GetFilteredStudentBlockException" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="Text" Name="SemesterID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtStudentName" PropertyName="Text" Name="StudentName" Type="String" DefaultValue="%"></asp:ControlParameter>

                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>

                    <div class="clearfix"></div>
                    <div class="col-md-6" style="float: left!important; direction: ltr!important;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="50" PagedControlID="ListView1" class="pager col-md-12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                <asp:NumericPagerField ButtonType="Link" />
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
                            <strong>لا يوجد بيانات للعرض</strong>
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

  <%--  <script>
        $('#selectAll').click(function (e) {
            $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);

        });
    </script>--%>
</asp:Content>

