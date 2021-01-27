<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="Program.aspx.cs" Inherits="Academic_Program" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu2').addClass("active open");
            $('#menu2_1 a').css("background-color", "#575757");
            $('#menu2 a span.arrow').addClass("open");
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
                <span>البرنامج</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="Program.aspx">عرض البرامج</a></li>
                <li class="font-ha"><a href="College.aspx">عرض الكليات</a></li>
                <li class="font-ha"><a href="Department.aspx">عرض الأقسام</a></li>
                <li class="font-ha"><a href="Course.aspx">عرض المساقات</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("ProgramView"))
           { %>
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>البرنامج</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <% if (ListView1.Items.Count > 0)
                       { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 20%">رقم البرنامج </th>
                                <th style="width: 20%">إسم البرنامج</th>
                                <th style="width: 25%">عميد البرنامج</th>
                                <th style="width: 20%; text-align: center">مفتاح القبول </th>
                                <th style="width: 5%; text-align: center">فعال</th>
                                <th style="width: 10%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="ProgramID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr <%# (lblProgramID.Text==Eval("ID").ToString())?"style='background-color:#F5F5F5'":"" %>>
                                        <td><span><%# Eval("ProgramNum") %></span></td>
                                        <td><span><%# Eval("ArName") %></span></td>
                                        <td><span><%# Eval("Employee1Name") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Admissionkey") %></span></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' Enabled='<%# (Permissions.Contains("ProgramActivate"))? true:false %>' />
                                        </td>
                                        <td style="text-align: center">
                                            <% if (Permissions.Contains("ProgramEdit"))
                                               { %>
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <% } %>
                                            <%-- <% if (Permissions.Contains("ProgramDelete"))
                                               { %>--%>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                            <%-- <% } %>--%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>


                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetProgramsInfo" SelectCommandType="StoredProcedure">
                              
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
                            <strong>لم يتم إضافة برامج بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <% } %>
        <% if (Permissions.Contains("ProgramAdd") || Permissions.Contains("ProgramEdit"))
           { %>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:Label ID="lblProgramID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل برنامج</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">رقم البرنامج</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtProgramNum" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال رقم البرنامج "></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">إسم البرنامج</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtArName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم البرنامج بالعربي"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">إسم البرنامج</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtEnName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم البرنامج بالإنجليزية"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">مفتاح القبول </label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtAdmissionkey" runat="server" CssClass="form-control ratenumeric" placeholder="الرجاء ادخال مفتاح القبول"></asp:TextBox>
                                </div>
                            </div>

                           <div class="form-group">
                                <label class="col-md-3 control-label">عميد البرنامج</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlEmployeeID" runat="server" DataSourceID="SqlDataSource3" DataTextField="DisplayName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>" SelectCommand="GetEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>
                            </div>
                                 <div class="form-group">
                                <label class="col-md-3 control-label">نائب البرنامج </label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlEmployeeID2" runat="server" DataSourceID="SqlDataSource3" DataTextField="DisplayName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-9">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                    
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnEditSave" runat="server" Text="تعديل مع حفظ السابق" CssClass="btn green" OnClick="btnEditSave_Click" Visible="false" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</asp:Content>
