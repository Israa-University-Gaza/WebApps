<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="Department.aspx.cs" Inherits="Academic_Department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu2').addClass("active open");
            $('#menu2_3 a').css("background-color", "#575757");
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
                <span>الأقسام</span> <i class="fa fa-angle-down"></i>
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
        <% if (Permissions.Contains("DepartmentAdd") || Permissions.Contains("DepartmentEdit"))
           { %>
        <div class="col-md-12">
            <div class="portlet box blue">
                <asp:Label ID="lblDepartmentID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل تخصص</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label">رقم القسم</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDepartmentNum" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال رقم القسم"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">الإسم بالعربية</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtArName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم التخصص بالعربي"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">الإسم بالإنجليزية</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtEnName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم التخصص "></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">الكلية</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCollege" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [College] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر الكلية'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">رئيس القسم</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlEmployeeID" runat="server" DataSourceID="SqlDataSource3" DataTextField="DisplayName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>" SelectCommand="GetEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>
                              
                            </div>
                              <div class="form-group">
                               <label class="col-md-2 control-label">معدل القبول1</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtAcceptanceRate" runat="server" CssClass="form-control ratenumeric" placeholder="الرجاء ادخال معدل القبول"></asp:TextBox>
                                </div>
                                       <label class="col-md-2 control-label">معدل القبول2</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtAcceptanceRate2" runat="server" CssClass="form-control ratenumeric" placeholder="الرجاء ادخال معدل القبول"></asp:TextBox>
                                </div>
                                  </div>
                            <div class="form-group">

                                <label class="col-md-2 control-label">سعر ساعة التخصص</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtHourCost" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال سعر ساعة التخصص"></asp:TextBox>
                                </div>

                                <label class="col-md-2 control-label">سعة القسم (طلاب)</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtStdMCapacity" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال سعة القسم"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-4">
                                  
                                </div>

                                <label class="col-md-2 control-label">سعة القسم (طالبات)</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtStdFMCapacity" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال سعة القسم"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">علامة النجاح</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtMarkOfSuccess" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال علامة نجاح القسم"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">ساعات متطلب جامعة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtUniversityHour" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال عدد س متطلبات الجامعة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">ساعات متطلب كلية</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtCollegeHour" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال عدد ساعات الكلية"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">ساعات تخصص</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDepartmentHour" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال عدد ساعات التخصص"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">ساعات اختيارية</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtOptionalHour" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال عدد الساعات الإختيارية"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-4">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-9">
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
        <% if (Permissions.Contains("DepartmentView"))
           { %>
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>التخصصات</div>
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
                                <th style="width: 5%">الرقم</th>
                                <th style="width: 15%">التخصص</th>
                                <th style="width: 18%">الكلية</th>
                                <th style="width: 10%; text-align: center">معدل القبول</th>
                                <th style="width: 8%; text-align: center">س.م.جامعة</th>
                                <th style="width: 8%; text-align: center">س.م.كلية</th>
                                <th style="width: 12%; text-align: center">ساعات تخصص</th>
                                <th style="width: 12%; text-align: center">ساعات اختيارية</th>
                                <th style="width: 5%; text-align: center">فعال</th>
                                <th style="width: 7%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="DepartmentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr <%# (lblDepartmentID.Text==Eval("ID").ToString())?"style='background-color:#F5F5F5'":"" %>>
                                        <td><span><%# Eval("DepartmentNum") %></span></td>
                                        <td><span><%# Eval("ArName") %></span></td>
                                        <td><span><%# Eval("College") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("AcceptanceRate1") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("UniversityHour") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("CollegeHour") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("DepartmentHour") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("OptionalHour") %></span></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' Enabled='<%# (Permissions.Contains("DepartmentActivate"))? true:false %>' /></td>
                                        <td style="text-align: center">
                                            <% if (Permissions.Contains("DepartmentEdit"))
                                               { %>
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <% } %>
                                            <% if (Permissions.Contains("DepartmentDelete"))
                                               { %>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                            <% } %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="SELECT *,(Select ArName From [College] Where ID=CollegeID) as College FROM [Department] where [IsLast]=1 and [IsDelete]=0 order by [DepartmentNum]"></asp:SqlDataSource>
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
                            <strong>لم يتم إضافة أقسام بعد</strong>
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
    </div>
</asp:Content>

