<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="PlanCourse.aspx.cs" Inherits="Academic_PlanCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                <span>مساقات الخطط الدراسية</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="#">عرض الخطط الدراسية</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblPlanID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>مساقات الخطة الدراسية</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <%--     <% if (Permissions.Contains("PlanCourseAdd"))
                           { %>--%>
                        <div class="row">
                            <asp:Label ID="lblPlanCourse" runat="server" Visible="false"></asp:Label>
                            <div class="form-group">
                                <label class="col-md-1 control-label isra-text-aling-right">المساق</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCourseID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ('(' + CourseCode +') - ' + ArName)as ArName FROM [Course] WHERE (([IsActive] = 1) AND ([IsDelete] = 0))  union select -1,N'إختر المساق'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label isra-text-aling-right">تصنيف المساق </label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlCourseCategoryID" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [CourseCategory]union select -1,N'إختر تصنيف المساق '"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label isra-text-aling-right">الفصل الدراسي</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCSemesterID" runat="server" DataSourceID="SqlDataSource8" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [ConstantDetails] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (ConstantID=6)) union select -1,N'إختر الفصل الدراسي'"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-1">
                                    <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                </div>
                            </div>
                        </div>
                        <%--  <% } %>--%>
                        <br />
                        <hr />
                        <div class="row">
                            <% if (Repeater1.Items.Count > 0)
                                { %>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <div class="col-md-6  isra-clear">
                                        <asp:Label ID="PlanID" runat="server" Text='<%# Eval("PlanID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="CSemesterID" runat="server" Text='<%# Eval("CSemesterID") %>' Visible="false"></asp:Label>
                                        <div class="portlet">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="fa fa-briefcase" style="width: 25px;"></i><span class="font-ha"><%# Eval("CSemester") %></span></div>
                                            </div>
                                            <div class="portlet-body">
                                                <div class="table-responsive">
                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 20%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>كود المساق</th>
                                                                <th style="width: 30%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>تصنيف المساق</th>
                                                                <th style="width: 15%; text-align: center"><i class="fa fa-clock-o" style="width: 20px;"></i>ع . س</th>
                                                                <th style="width: 15%;"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <asp:Label ID="PlanID" runat="server" Text='<%# Eval("PlanID") %>' Visible="false"></asp:Label>
                                                                        <asp:Label ID="PlanCourseID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                        <asp:Label ID="CourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="false"></asp:Label>
                                                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                         <td style="text-align: center"><span><%# Eval("CourseCategory") %></span></td>
                                                                        <td style="text-align: center"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                        <td style="text-align: center">
                                                                            <% if (Permissions.Contains("PlanCourseEdit"))
                                                                                { %>
                                                                            <asp:LinkButton ID="lbCode" runat="server" class="btn default btn-xs black" OnClick="lbCode_Click"><i class="fa fa-code"></i></asp:LinkButton>
                                                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                                                            <% } %>
                                                                            <% if (Permissions.Contains("PlanCourseDelete"))
                                                                                { %>
                                                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                                                            <% } %>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                SelectCommand="GetCSemesterPlanCourses" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="PlanID" PropertyName="Text" Name="PlanID" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                        <tfoot>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center" class="font-ln">مجموع الساعات</td>
                                                                <td style="text-align: center"><span><%# Eval("SumOfHours") %></span></td>
                                                                <td></td>
                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetPlanSemester" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblPlanID" PropertyName="Text" Name="PlanID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <% }
                                else
                                { %>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد مساقات للخطة</strong>
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

