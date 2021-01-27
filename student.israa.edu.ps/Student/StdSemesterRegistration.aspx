<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StdSemesterRegistration.aspx.cs" Inherits="Student_StdSemesterRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu3').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">التسجيل الفصلي
        </a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblSemesterID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN TAB PORTLET-->
            <div class="portlet box blue tabbable">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>التسجيل الفصلي</div>
                </div>
                <div class="portlet-body">
                    <div class=" portlet-tabs">
                        <ul class="nav nav-tabs">
                            <% if (DataAccess.IsAvailableRegistration(lblSemesterID.Text))
                               { %>
                            <li class="active"><a href="#portlet_tab1" data-toggle="tab">التسجيل الفصلي</a></li>
                            <% }
                               else
                               { %>
                            <li class="active"><a href="#portlet_tab2" data-toggle="tab">سحب المساقات</a></li>
                            <% } %>
                            <li><a href="#portlet_tab3" data-toggle="tab">المساقات المسجلة</a></li>
                        </ul>
                        <div class="tab-content">
                            <% if (DataAccess.IsAvailableRegistration(lblSemesterID.Text))
                               { %>
                            <div class="tab-pane active" id="portlet_tab1">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="row" style="min-height: 1px; height: 70px; overflow: hidden; width: 100%">
                                            <div class=" col-xs-12" style="overflow: hidden">
                                                <div id="divMsg" runat="server" class="alert alert-warning alert-dismissable" visible="true" style="font-size: 14px;">
                                                    <div class="col-xs-10">
                                                        <strong>
                                                            <asp:Label ID="lblMsg" runat="server" Text="التسجيل الفصلي"></asp:Label>
                                                        </strong>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button aria-hidden="true" data-dismiss="alert" class="close col-xs-2" style="margin-top: 4px;" type="button"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="portlet-body">
                                                    <div class="table-responsive">
                                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                            <ProgressTemplate>
                                                                <div class="divWaiting">
                                                                    <div class="alert alert-warning loading">
                                                                        <span class="glyphicon glyphicon-refresh glyphicon-spin"></span>
                                                                        <strong>جاري التحميل ...</strong>
                                                                    </div>
                                                                </div>
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>

                                                        <table class="table table-striped table-bordered">
                                                            <tbody>
                                                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource20">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td style="text-align: center; width: 40%; font-weight: bold;">المساقات المطروحة</td>
                                                                            <td style="text-align: center; width: 20%;"><span style="font-weight: bold;">ساعات مسجلة : </span>
                                                                                <span><%# Eval("CountOfRegisterHours") %></span></td>
                                                                            <td style="text-align: center; width: 20%;"><span style="font-weight: bold;">ساعات متبقية : </span>
                                                                            </td>
                                                                            <td style="text-align: center; width: 20%;"><span style="font-weight: bold;">الرصيد : </span>
                                                                                <span><%# Eval("Balance") %></span></td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                    SelectCommand="GetCountOfRegisterHours" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                                                        <asp:ControlParameter ControlID="lblSemesterID" Name="SemesterID" PropertyName="Text" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                                <tr>
                                                                    <td>
                                                                        <div style="text-align: center;">
                                                                            <div class="portlet-body">
                                                                                <div class="table-responsive">
                                                                                    <% if (ListView1.Items.Count > 0)
                                                                                       { %>
                                                                                    <table class="table table-condensed table-hover">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th style="text-align: center; width: 30%; border-top: none!important; font-size: 12px;">رقم المساق </th>
                                                                                                <th style="text-align: center; width: 55%; border-top: none!important; font-size: 12px;">اسم المساق</th>
                                                                                                <th style="text-align: center; width: 15%; border-top: none!important; font-size: 12px;"></th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="OfferdCourseID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="CourseArName" runat="server" Text='<%# Eval("CourseArName") %>' Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="NumOfHours" runat="server" Text='<%# Eval("NumOfHours") %>' Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="ExamDate" runat="server" Text='<%# Eval("ExamDate") %>' Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="ExamTime" runat="server" Text='<%# Eval("ExamTime") %>' Visible="false"></asp:Label>
                                                                                                    <tr>
                                                                                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                                                        <td>
                                                                                                            <asp:Button ID="btnView" runat="server" class="btn default btn-xs black" Text="عرض" OnClick="btnView_Click" /></td>
                                                                                                    </tr>
                                                                                                </ItemTemplate>
                                                                                            </asp:ListView>
                                                                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                                SelectCommand="GetStdOfferdCourse" SelectCommandType="StoredProcedure">
                                                                                                <SelectParameters>
                                                                                                    <asp:ControlParameter ControlID="lblStudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                                                                                                </SelectParameters>
                                                                                            </asp:SqlDataSource>
                                                                                        </tbody>
                                                                                    </table>
                                                                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager" style="float: none;">
                                                                                        <Fields>
                                                                                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                                                                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                                                                            <asp:NumericPagerField ButtonType="Link" />
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
                                                                                            <strong>لا يوجد مساقات للتسجيل</strong>
                                                                                            <div style="clear: both"></div>
                                                                                        </div>
                                                                                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                                                        <div style="clear: both"></div>
                                                                                    </div>
                                                                                    <% } %>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td colspan="3" style="text-align: center;">
                                                                        <% if (!divSections.Visible)
                                                                           { %>
                                                                        <div class="alert alert-info alert-dismissable" style="font-size: 14px; margin-top: 50px;">
                                                                            <div class="col-xs-11">
                                                                                <strong>إختر أحد المساقات المطروحة لعرض الشعب</strong>
                                                                                <div style="clear: both"></div>
                                                                            </div>
                                                                            <button aria-hidden="true" data-dismiss="alert" class="close col-xs-2" style="margin-top: 4px;" type="button"></button>
                                                                            <div style="clear: both"></div>
                                                                        </div>
                                                                        <% }
                                                                           else
                                                                           { %>
                                                                        <div class="portlet-body" id="divSections" runat="server" visible="false">
                                                                            <div class="table-responsive">
                                                                                <table style="width: 100%;">
                                                                                    <tr>
                                                                                        <td style="text-align: center; border-top: none!important"><span style="font-weight: bold;">اسم المساق : </span>
                                                                                            <asp:Label ID="lblCourseName" runat="server"></asp:Label></td>
                                                                                        <td style="text-align: center; border-top: none!important"><span style="font-weight: bold;">ساعات معتمدة : </span>
                                                                                            <asp:Label ID="lblNumOfHours" runat="server"></asp:Label></td>
                                                                                        <td style="text-align: center; border-top: none!important"><span style="font-weight: bold;">تاريخ الإمتحان : </span>
                                                                                            <asp:Label ID="lblExamDate" runat="server"></asp:Label></td>
                                                                                        <td style="text-align: center; border-top: none!important"><span style="font-weight: bold;">موعد الإمتحان : </span>
                                                                                            <asp:Label ID="lblExamTime" runat="server"></asp:Label></td>
                                                                                    </tr>
                                                                                </table>
                                                                                <hr />
                                                                                <table class="table table-condensed table-hover">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <td style="text-align: center; width: 10%; font-weight: bold">الشعبة</td>
                                                                                            <td style="text-align: center; width: 25%; font-weight: bold">المحاضر</td>
                                                                                            <td style="text-align: center; width: 10%; font-weight: bold"></td>
                                                                                            <td style="text-align: center; width: 45%;">
                                                                                                <table style="width: 100%">
                                                                                                    <tr style="padding: 0px">
                                                                                                        <td colspan="3" style="padding: 0px; font-weight: bold">الموعد</td>
                                                                                                    </tr>
                                                                                                    <tr style="padding: 0px">
                                                                                                        <td style="text-align: center; width: 38%; padding: 0px; font-weight: bold">القاعة </td>
                                                                                                        <td style="text-align: center; width: 24%; padding: 0px; font-weight: bold">اليوم</td>
                                                                                                        <td style="text-align: center; width: 38%; padding: 0px; font-weight: bold">التوقيت</td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td style="text-align: center; width: 10%; font-weight: bold"></td>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="OfferdCourseID" runat="server" Text='<%# Eval("OfferdCourseID") %>' Visible="false"></asp:Label>
                                                                                                <asp:Label ID="SectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                                                <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("StdSectionID").ToString() %>' Visible="false"></asp:Label>
                                                                                                <asp:Label ID="IsClosed" runat="server" Text='<%# Eval("IsClosed").ToString() %>' Visible="false"></asp:Label>
                                                                                                <tr <%# (Convert.ToInt32(Eval("StdSectionID").ToString())> 0)? "style='background-color:#F2F2F2'":"" %>>
                                                                                                    <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                                                                                    <td style="text-align: center;"><%# Eval("Employee") %></td>
                                                                                                    <td style="text-align: center;">نظري</td>
                                                                                                    <td style="text-align: center;">
                                                                                                        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                                                                                            <ItemTemplate>
                                                                                                                <table style="width: 100%; border: 0px;">
                                                                                                                    <tr style="padding: 0px; border: 0px;">
                                                                                                                        <td style="text-align: center; width: 38%; padding: 0px; border: 0px;"><%# Eval("Room") %> </td>
                                                                                                                        <td style="text-align: center; width: 24%; padding: 0px; border: 0px;"><%# Eval("CDay") %></td>
                                                                                                                        <td style="text-align: center; width: 38%; padding: 0px; border: 0px;"><%# Eval("FromToHour") %></td>
                                                                                                                    </tr>
                                                                                                                </table>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:Repeater>
                                                                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                                            SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                                                                            <SelectParameters>
                                                                                                                <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                                                                            </SelectParameters>
                                                                                                        </asp:SqlDataSource>
                                                                                                    </td>
                                                                                                    <td style="text-align: center;">
                                                                                                        <asp:Label ID="lblClosedSection" runat="server" CssClass="label label-default btn-xs" Text="شعبة مغلقة" Visible="false"></asp:Label>
                                                                                                        <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-success btn-xs" Text="تسجيل" Width="50px" OnClick="btnRegister_Click" Visible="false" />
                                                                                                        <asp:Button ID="btnRemove" runat="server" CssClass="btn btn-danger btn-xs" Text="إلغاء" Width="50px" OnClick="btnRemove_Click" Visible="false" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="SectionID2" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                                                        <tr <%# (Convert.ToInt32(Eval("StdSectionID").ToString())> 0)? "style='background-color:#F2F2F2'":"" %>>
                                                                                                            <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                                                                                            <td style="text-align: center;"><%# Eval("Employee") %></td>
                                                                                                            <td style="text-align: center;">مناقشة</td>
                                                                                                            <td style="text-align: center;">
                                                                                                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
                                                                                                                    <ItemTemplate>
                                                                                                                        <table style="width: 100%; border: 0px;">
                                                                                                                            <tr style="padding: 0px; border: 0px;">
                                                                                                                                <td style="text-align: center; width: 38%; padding: 0px; border: 0px;"><%# Eval("Room") %> </td>
                                                                                                                                <td style="text-align: center; width: 24%; padding: 0px; border: 0px;"><%# Eval("CDay") %></td>
                                                                                                                                <td style="text-align: center; width: 38%; padding: 0px; border: 0px;"><%# Eval("FromToHour") %></td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:Repeater>
                                                                                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                                                    SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                                                                                    <SelectParameters>
                                                                                                                        <asp:ControlParameter ControlID="SectionID2" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                                                                                    </SelectParameters>
                                                                                                                </asp:SqlDataSource>
                                                                                                            </td>
                                                                                                            <td style="text-align: center;">
                                                                                                                <input type="radio" value='<%# Eval("ID") %>' name='<%# "sec1" + ((Label)Container.Parent.Parent.FindControl("SectionID")).Text %>' <%# (Convert.ToInt32(Eval("StdSectionID").ToString())> 0)? "checked='checked'":"" %> />
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </ItemTemplate>
                                                                                                </asp:Repeater>
                                                                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                                    SelectCommand="GetStdDissSectionsBySectionID" SelectCommandType="StoredProcedure">
                                                                                                    <SelectParameters>
                                                                                                        <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                                                                    </SelectParameters>
                                                                                                </asp:SqlDataSource>
                                                                                                <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="SectionID3" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                                                        <tr <%# (Convert.ToInt32(Eval("StdSectionID").ToString())> 0)? "style='background-color:#F2F2F2'":"" %>>
                                                                                                            <td style="text-align: center;"><%# Eval("SectionNum") %></td>
                                                                                                            <td style="text-align: center;"><%# Eval("Employee") %></td>
                                                                                                            <td style="text-align: center;">معمل</td>
                                                                                                            <td style="text-align: center;">
                                                                                                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
                                                                                                                    <ItemTemplate>
                                                                                                                        <table style="width: 100%; border: 0px;">
                                                                                                                            <tr style="padding: 0px; border: 0px;">
                                                                                                                                <td style="text-align: center; width: 38%; padding: 0px; border: 0px;"><%# Eval("Room") %> </td>
                                                                                                                                <td style="text-align: center; width: 24%; padding: 0px; border: 0px;"><%# Eval("CDay") %></td>
                                                                                                                                <td style="text-align: center; width: 38%; padding: 0px; border: 0px;"><%# Eval("FromToHour") %></td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:Repeater>
                                                                                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                                                    SelectCommand="GetSectionLecture" SelectCommandType="StoredProcedure">
                                                                                                                    <SelectParameters>
                                                                                                                        <asp:ControlParameter ControlID="SectionID3" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                                                                                    </SelectParameters>
                                                                                                                </asp:SqlDataSource>
                                                                                                            </td>
                                                                                                            <td style="text-align: center;">
                                                                                                                <input type="radio" value='<%# Eval("ID") %>' name='<%# "sec2" + ((Label)Container.Parent.Parent.FindControl("SectionID")).Text %>' <%# (Convert.ToInt32(Eval("StdSectionID").ToString())> 0)? "checked='checked'":"" %> />
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </ItemTemplate>
                                                                                                </asp:Repeater>
                                                                                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                                    SelectCommand="GetStdLabSectionsBySectionID" SelectCommandType="StoredProcedure">
                                                                                                    <SelectParameters>
                                                                                                        <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                                                                    </SelectParameters>
                                                                                                </asp:SqlDataSource>
                                                                                            </ItemTemplate>
                                                                                        </asp:Repeater>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                        <% } %>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                            <% }
                               else
                               { %>
                            <div class="tab-pane active" id="portlet_tab2">
                                <div class="row" style="padding-top: 15px;">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%">كود المساق</th>
                                                <th style="width: 20%; text-align: center">المساق</th>
                                                <th style="width: 15%; text-align: center">رقم الشعبة</th>
                                                <th style="width: 15%; text-align: center">تاريخ الإمتحان</th>
                                                <th style="width: 20%; text-align: center">توقيت الإمتحان</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater10" runat="server" DataSourceID="SqlDataSource10">
                                                <ItemTemplate>
                                                    <tr>
                                                        <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                        <td><span><%# Eval("CourseCode") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("ArNameCourse") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("ExamDate", "{0:yyyy/MM/dd}") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("ExamTime") %></span></td>
                                                        <td>
                                                            <asp:LinkButton ID="lbRelay" runat="server" class="btn default btn-xs black" OnClick="lbRelay_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود سحب / انسحاب من المساق ؟');"><i class="fa fa-edit"></i> سحب / إنسحاب</asp:LinkButton></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStdRegisterdSections" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" Name="SemesterID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <% } %>

                            <div class="tab-pane" id="portlet_tab3">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <table class="table table-striped table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 8%; text-align: center; font-size: 11px">رقم المساق</th>
                                                        <th style="width: 15%; text-align: center; font-size: 11px">المساق</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">مدرس المساق</th>
                                                        <th style="width: 3%; text-align: center; font-size: 11px">شعبة</th>
                                                        <th style="width: 4%; text-align: center; font-size: 11px">قاعة</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">السبت</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">الأحد</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">الإثنين</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">الثلاثاء</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">الأربعاء</th>
                                                        <th style="width: 10%; text-align: center; font-size: 11px">الخميس</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource2">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Employee") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Room") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Saturday") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Sunday") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Monday") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Tuesday") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Wednesday") %></span></td>
                                                                <td style="text-align: center"><span><%# Eval("Thursday") %></span></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetStdStudyTable" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END TAB PORTLET-->
        </div>
    </div>
</asp:Content>

