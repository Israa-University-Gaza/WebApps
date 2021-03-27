<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="DeanCourse.aspx.cs" Inherits="Academic_DeanCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu2').addClass("active open");
            $('#menu2_5 a').css("background-color", "#575757");
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
                <span>المساقات</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="DeanCourse.aspx">عرض المساقات</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("DeanCourseAdd") || Permissions.Contains("DeanCourseEdit"))
           { %>
        <div class="col-md-12">
            <div class="portlet box blue">
                <asp:Label ID="lblCourseID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل مساق</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label">الكود</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtCourseCode" runat="server" CssClass="form-control" placeholder="الرجاء ادخال كود المساق"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">الإسم</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtArName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم المساق بالعربي"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">الإسم</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtEnName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم المساق بالإنجليزي"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">عدد الساعات</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtNumOfHours" runat="server" CssClass="form-control numeric" placeholder="الرجاء ادخال عدد ساعات المساق"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">القسم</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetDepartmentByDean" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-2 control-label">تصنيف المساق</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCCourseType" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [ConstantDetails] WHERE ((ConstantID = 5) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر نوع المساق'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">المتطلب السابق للمساق</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlPreRequest" runat="server" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Course] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر المساق'"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">نوع المساق</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCourseType" runat="server" CssClass="select2_category form-control">
                                        <asp:ListItem Value="1" Text="علمي"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="أدبي"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-4">
                                    <asp:CheckBox ID="cbHaveDiscussion" runat="server" Text="يوجد مناقشة" />
                                    <asp:CheckBox ID="cbHaveLab" runat="server" Text="يوجد عملي" />
                                </div>
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-4">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
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
        <% } %>
        <% if (Permissions.Contains("DeanCourseView"))
           { %>
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>المساقات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="input-group col-md-12">
                        <div class="input-group col-md-4">
                            <asp:TextBox ID="txtCourseSearchCode" runat="server" class="form-control" placeholder="الرجاء كود المساق" Style="font-family: Tahoma; font-size: 12px !important;"></asp:TextBox>
                        </div>
                        <div class="input-group col-md-4">
                            <asp:TextBox ID="txtCourseSearchName" runat="server" class="form-control" placeholder="الرجاء ادخال اسم المساق" Style="font-family: Tahoma; font-size: 12px !important;"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group-btn">
                                <asp:Button ID="btnCourseSearch" runat="server" Text="بحث" class="btn green col-md-9" OnClick="btnCourseSearch_Click" Style="height: 34px;" />
                            </div>
                        </div>
                    </div>
                    <br />
                    <% if (ListView1.Items.Count > 0)
                       { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 10%">الكود</th>
                                <th style="width: 20%; text-align: center">المساق</th>
                                <th style="width: 27%; text-align: center">القسم</th>
                                <th style="width: 10%; text-align: center">عدد الساعات</th>
                                <th style="width: 10%; text-align: center">يوجد مناقشة</th>
                                <th style="width: 10%; text-align: center">يوجد عملي</th>
                                <th style="width: 5%; text-align: center">فعال</th>
                                <th style="width: 8%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="CourseID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr <%# (lblCourseID.Text==Eval("ID").ToString())?"style='background-color:#F5F5F5'":"" %>>
                                        <td><span><%# Eval("CourseCode") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("ArName") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Department") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("NumOfHours") %></span></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("IsHaveDiscussion") %>' Enabled="false" /></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("IsHaveLab") %>' Enabled="false" /></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' Enabled='<%# (Permissions.Contains("DeanCourseActivate"))? true:false %>' /></td>
                                        <td style="text-align: center">
                                            <% if (Permissions.Contains("DeanCourseEdit"))
                                               { %>
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <% } %>
                                            <% if (Permissions.Contains("DeanCourseDelete"))
                                               { %>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                            <% } %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetCoursesByDean" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtCourseSearchCode" PropertyName="Text" DefaultValue="%" Name="CourseCode" Type="String" />
                                    <asp:ControlParameter ControlID="txtCourseSearchName" PropertyName="Text" DefaultValue="%" Name="CourseName" Type="String" />
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
                            <strong>
                                <asp:Label ID="lblCourseMsg" runat="server" Text="لم يتم إضافة مساقات بعد"></asp:Label></strong>
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
