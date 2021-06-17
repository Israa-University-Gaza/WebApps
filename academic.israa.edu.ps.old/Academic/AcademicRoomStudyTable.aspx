﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="AcademicRoomStudyTable.aspx.cs" Inherits="Academic_AcademicSectionEmployee" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Teacher').addClass("active open");
            $('#Teacher_2 a').css("background-color", "#575757");
            $('#Teacher a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">المحاضر</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>تنسيب المحاضرين للشعب</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="TeacherStudyTable.aspx">جدول المحاضر الفصلي</a></li>
                <li class="font-ha"><a href="DeanSectionEmployee.aspx">تنسيب المحاضرين للشعب</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>المساقات المطروحة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                               { %>
                            <table class="table table-condensed table-hover">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">الكود</th>
                                        <th style="text-align: center; width: 20%; border-top: none!important; font-size: 12px;">اسم المساق</th>
                                        <th style="text-align: center; width: 15%; border-top: none!important; font-size: 12px;">القسم</th>
                                        <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">تاريخ الإمتحان</th>
                                        <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">توقيت الإمتحان</th>
                                        <th style="text-align: center; width: 8%; border-top: none!important; font-size: 12px;"></th>
                                        <th style="text-align: center; width: 27%; border-top: none!important; font-size: 12px;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource222">
                                        <ItemTemplate>
                                            <asp:Label ID="OfferdCourseID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <tr>
                                                <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("DepartmentArName") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("ExamDate") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("ExamTime") %></span></td>
                                                <td style="text-align: center"></td>
                                                <td style="text-align: center">
                                                    <asp:Button ID="btnView" runat="server" class="btn default btn-xs black" Text="عرض الشعب" OnClick="btnView_Click" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource222" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetAcademicOfferdCourses" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
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
                                    <strong>لا يوجد مساقات مطروحة يمكن عرضها</strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <hr />
                    <div class="row" id="divSections" runat="server" visible="false">
                        <% if (Repeater1.Items.Count > 0)
                           { %>
                        <table class="table table-condensed table-hover">
                            <thead>
                                <tr>
                                    <td style="text-align: center; width: 8%; font-weight: bold">الشعبة</td>
                                    <td style="text-align: center; width: 7%; font-weight: bold"></td>
                                    <td style="text-align: center; width: 50%; font-weight: bold">المحاضر</td>
                                    <td style="text-align: center; width: 20%; font-weight: bold">المواعيد</td>
                                    <td style="text-align: center; width: 10%; font-weight: bold">طلاب/طالبات</td>
                                    <td style="text-align: center; width: 5%; font-weight: bold">فعال</td>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                    <ItemTemplate>
                                        <asp:Label ID="OfferdCourseID" runat="server" Text='<%# Eval("OfferdCourseID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="SectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="EmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="PTEmployeeID" runat="server" Text='<%# Eval("PTEmployeeID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="IsClosed" runat="server" Text='<%# Eval("IsClosed").ToString() %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                            <td style="text-align: center;">نظري</td>
                                            <td style="text-align: center;">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="DisplayName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>" SelectCommand="GetEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <asp:Panel ID="divPTEmployee" runat="server" Visible="false">
                                                            <asp:DropDownList ID="ddlPTEmployee" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetPTEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="col-md-2" style="padding-top: 7px;">
                                                        <asp:LinkButton ID="lbSaveEmployee1" runat="server" class="btn default btn-xs black" OnClick="lbSaveEmployee1_Click"><i class="fa fa-edit"></i> حفظ</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </td>
                                            <td style="text-align: center;">
                                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                    <ItemTemplate>
                                                        <span><%# Eval("Room") %></span>
                                                        <span><%# Eval("CDay") %></span>
                                                        <span><%# Eval("FromToHour") %></span>
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                    SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td style="text-align: center;"><%# (Eval("Gender").ToString()=="1")? "طلاب" : "طالبات"  %></td>
                                            <td style="text-align: center;">
                                                <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" Enabled="false" Checked='<%# Eval("IsActive") %>' />
                                            </td>
                                        </tr>
                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater2_ItemDataBound">
                                            <ItemTemplate>
                                                <asp:Label ID="SectionID2" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="EmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="PTEmployeeID" runat="server" Text='<%# Eval("PTEmployeeID") %>' Visible="false"></asp:Label>
                                                <tr <%# (Convert.ToInt32(Eval("StdSectionID").ToString())> 0)? "style='background-color:#F2F2F2'":"" %>>
                                                    <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                                    <td style="text-align: center;">مناقشة</td>
                                                    <td style="text-align: center;">
                                                        <div class="row">
                                                            <div class="col-md-5">
                                                                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="DisplayName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged"></asp:DropDownList>
                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>" SelectCommand="GetEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <asp:Panel ID="divPTEmployee" runat="server" Visible="false">
                                                                    <asp:DropDownList ID="ddlPTEmployee" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetPTEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                                </asp:Panel>
                                                            </div>
                                                            <div class="col-md-2" style="padding-top: 7px;">
                                                                <asp:LinkButton ID="lbSaveEmployee2" runat="server" class="btn default btn-xs black" OnClick="lbSaveEmployee2_Click"><i class="fa fa-edit"></i> حفظ</asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="text-align: center;">
                                                        <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
                                                            <ItemTemplate>
                                                                <span><%# Eval("Room") %></span>
                                                                <span><%# Eval("CDay") %></span>
                                                                <span><%# Eval("FromToHour") %></span>
                                                                <br />
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="SectionID2" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td style="text-align: center;"><%# (Eval("Gender").ToString()=="1")? "طلاب" : "طالبات"  %></td>
                                                    <td style="text-align: center;">
                                                        <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" Enabled="false" Checked='<%# Eval("IsActive") %>' />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetDissSectionsBySectionID" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3" OnItemDataBound="Repeater3_ItemDataBound">
                                            <ItemTemplate>
                                                <asp:Label ID="SectionID3" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="EmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="PTEmployeeID" runat="server" Text='<%# Eval("PTEmployeeID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                                    <td style="text-align: center;">معمل</td>
                                                    <td style="text-align: center;">
                                                        <div class="row">
                                                            <div class="col-md-5">
                                                                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="DisplayName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged"></asp:DropDownList>
                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>" SelectCommand="GetEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <asp:Panel ID="divPTEmployee" runat="server" Visible="false">
                                                                    <asp:DropDownList ID="ddlPTEmployee" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetPTEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                                </asp:Panel>
                                                            </div>
                                                            <div class="col-md-2" style="padding-top: 7px;">
                                                                <asp:LinkButton ID="lbSaveEmployee3" runat="server" class="btn default btn-xs black" OnClick="lbSaveEmployee3_Click"><i class="fa fa-edit"></i> حفظ</asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="text-align: center;">
                                                        <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
                                                            <ItemTemplate>
                                                                <span><%# Eval("Room") %></span>
                                                                <span><%# Eval("CDay") %></span>
                                                                <span><%# Eval("FromToHour") %></span>
                                                                <br />
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="SectionID3" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td style="text-align: center;"><%# (Eval("Gender").ToString()=="1")? "طلاب" : "طالبات"  %></td>
                                                    <td style="text-align: center;">
                                                        <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" Enabled="false" Checked='<%# Eval("IsActive") %>' />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetLabSectionsBySectionID" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <% }
                           else
                           { %>
                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                            <div class="col-xs-11" style="text-align: center">
                                <strong>لا يوجد شعب مطروحة يمكن عرضها لهذا المساق</strong>
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