<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="OfficeHourAddEdit.aspx.cs" Inherits="Academic_OfficeHourAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudyTable').addClass("active open");
            $('#StudyTable_13 a').css("background-color", "#575757");
            $('#StudyTable a span.arrow').addClass("open");
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
                <span>الساعات المكتبية</span> <i class="fa fa-angle-down"></i>
            </button>

        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblOfficeHourID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="EmpID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الساعات المكتبية لمحاضري الكليات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="col-md-2 control-label">المحاضر</label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="ddlInstructore" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource4" DataTextField="EmployeeName" DataValueField="EmployeeID" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlInstructore_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeInstructors" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>


                    </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 5%;">م</th>
                                <th style="width: 20%; text-align: center">رقم المحاضر</th>
                                <th style="width: 20%; text-align: center">المحاضر</th>
                                <th style="width: 15%; text-align: center">القاعة</th>
                                <th style="width: 15%; text-align: center">اليوم</th>
                                <th style="width: 15%; text-align: center">الوقت</th>
                                <th style="width: 10%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <td><span><%# Eval("RowNo") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("InstructorNo") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("InstructorName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("RoomName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("DayArName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Time") %></span></td>
                                        <td>
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i>   حذف</a></asp:LinkButton>

                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetOfficeHour" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlInstructore" PropertyName="SelectedValue" Name="InstructorID"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
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
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لم يتم إضافة ساعات مكتبية للمحاضر المُختار </strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>


        <div class="col-md-5">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل ساعات مكتبية لمحاضري الكليات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">

                            <div class="form-group">
                                <label class="col-md-2 control-label">المحاضر </label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlEmployeeID" runat="server" DataSourceID="SqlDataSource3" DataTextField="EmployeeName" DataValueField="EmployeeID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeInstructors" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">القاعة</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlRoom" runat="server" CssClass="select2_category form-control " DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT [ID], [Name] FROM [Room] union Select -1,N'اختر القاعة'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">اليوم</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlDay" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT [ID], [ArName] FROM [Day] union Select -1,N'اختر اليوم'"></asp:SqlDataSource>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-md-2 control-label">من </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtTimeFrom" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="14:00" Style="text-align: center;"></asp:TextBox>
                                </div>

                                <label class="col-md-2 control-label">الى </label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtTimeTo" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="14:00" Style="text-align: center;"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

