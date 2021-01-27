<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentSemesterRegistration.aspx.cs" Inherits="Admission_StudentSemesterRegistration" %>

<%@ Register Src="~/Admission/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .dropdown-menu li > a {
            clear: both;
            color: #333;
            display: block;
            font-weight: normal;
            line-height: 18px;
            padding: 0;
            text-decoration: none;
            white-space: nowrap;
        }

        .dropdown.open .dropdown-toggle {
            background: #e0eaf0 !important;
            color: #121212;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ChangePassword.aspx" class="font-ha">الطالب
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblSemesterID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStdStatusID" runat="server" Visible="false"></asp:Label>
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
                    <uc1:StudentSideBar runat="server" ID="StudentSideBar" ActiveTab="StudentSemesterRegistration" />

                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div id="tab1" class="tab-pane active">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="row" style="min-height: 1px; height: 70px; overflow: hidden; width: 100%">
                                            <div class="col-xs-12" style="overflow: hidden">
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
                                                                            <td style="text-align: center; width: 15%;"><span style="font-weight: bold;">ساعات مسجلة : </span>
                                                                                <span><%# Eval("CountOfRegisterHours") %></span>
                                                                            </td>
                                                                            <td style="text-align: center; width: 15%;"><span style="font-weight: bold;">ساعات مكتبية : </span>
                                                                                <span><%# Eval("SemesterStdOfficeRegister") %></span>
                                                                            </td>
                                                                            <td style="text-align: center; width: 15%;"><span style="font-weight: bold;">ساعات إثرائية : </span>
                                                                                <span><%# Eval("RichnessHour") %></span>
                                                                            </td>
                                                                            <td style="text-align: center; width: 15%;"><span style="font-weight: bold;">الرصيد : </span>
                                                                                <span><%# Eval("Balance") %></span>
                                                                            </td>
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
                                                                                    <div class="row">
                                                                                        <asp:TextBox ID="txtCourseCode" runat="server" class="form-control" placeholder="كود المساق" Style="font-family: Tahoma; font-size: 12px !important; width: 29%; float: right; margin-left: 2%"></asp:TextBox>
                                                                                        <asp:TextBox ID="txtCourseName" runat="server" class="form-control" placeholder="اسم المساق" Style="font-family: Tahoma; font-size: 12px !important; width: 49%; float: right; margin-left: 2%"></asp:TextBox>
                                                                                        <asp:Button ID="btnSearch" runat="server" Text="بحث" class="btn green" OnClick="btnSearch_Click" Style="font-family: Tahoma; font-size: 12px !important; width: 18%; float: right; height: 34px;" />
                                                                                    </div>
                                                                                    <% if (ListView1.Items.Count > 0)
                                                                                        { %>
                                                                                    <table class="table table-condensed table-hover">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;"></th>

                                                                                                <th style="text-align: center; width: 22%; border-top: none!important; font-size: 12px;">رقم المساق </th>
                                                                                                <th style="text-align: center; width: 42%; border-top: none!important; font-size: 12px;">اسم المساق</th>
                                                                                                <th style="text-align: center; width: 22%; border-top: none!important; font-size: 12px;">حالة المساق </th>
                                                                                                <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;"></th>
                                                                                                <th style="text-align: center; width: 15%; border-top: none!important; font-size: 12px;"></th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <asp:ListView ID="ListView1" runat="server">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="OfferdCourseID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="CourseArName" runat="server" Text='<%# Eval("CourseArName") %>' Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="NumOfHours" runat="server" Text='<%# Eval("NumOfHours") %>' Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="MidtermExamDate" runat="server" Text='<%# Eval("MidtermExamDate") %>' Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="MidtermExamTime" runat="server" Text='<%# Eval("MidtermExamTime") %>' Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="FinalExamDate" runat="server" Text='<%# Eval("FinalExamDate") %>' Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="FinalExamTime" runat="server" Text='<%# Eval("FinalExamTime") %>' Visible="false"></asp:Label>
                                                                                                    <tr <%# (Eval("ID").ToString()==lblCourseID.Text)? "style='background-color:#F2F2F2'":"" %>>
                                                                                                        <td>
                                                                                                            <span><%# (Eval("IsStudentCourseNotAccredit").ToString()=="1")? "<img src='/images/icon/add.png' width='18' height='18' />": "" %></span>
                                                                                                            <span><%# (Eval("IsStudentCourseAccredit").ToString()=="1")? "<img src='/images/icon/done.png' width='18' height='18' />": "" %></span>
                                                                                                        </td>

                                                                                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                                                        <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                                                        <td><span><%# (Eval("IsPlanCourse").ToString() == "1") ? "داخل" : "خارج " %></span></td>
                                                                                                        <td style="text-align: center">
                                                                                                            <span <%# (Eval("IsRegisterd").ToString()=="1") ? "" : "style='display:none;'" %>>
                                                                                                                <img src='../assets/img/icons/11693605_10153855864475809_1372216708_n.gif' width='18' height='18' title='<%# Eval("RegistrationDate") %> ' /></span>
                                                                                                            <span><%# (Eval("IsSuccessfulCourse").ToString()=="1")? "<img src='../assets/img/icons/12226411_10153855864455809_1009013865_n.jpg' width='18' height='18' />": "" %></span>
                                                                                                            <span><%# (Eval("IsFailureCourse").ToString()=="1")? "<img src='../assets/img/icons/12207740_10153855864445809_964486009_n.jpg' width='18' height='18' />": "" %></span>
                                                                                                            <span><%# (Eval("IsExternalTransformationCourse").ToString()=="1")? "<img src='../assets/img/icons/12036176_10153855864495809_1572926047_n.gif' width='18' height='18' />": "" %></span>
                                                                                                            <span><%# (Eval("IsInternalTransformationCourse").ToString()=="1")?"<img src='../assets/img/icons/InternalTrans.png' width='18' height='18' />": "" %></span>
                                                                                                            <td style="text-align: center">
                                                                                                                <span <%# (Eval("IsWithdrawCourse").ToString()=="1") ? "" : "style='display:none;'" %>>
                                                                                                                    <img src='../assets/img/icons/w.png' width='18' height='18' title='<%# Eval("ChangeStatusDate") %> ' /></span>


                                                                                                                <td>
                                                                                                                    <asp:Button ID="btnView" runat="server" class="btn default btn-xs black" Text="عرض" OnClick="btnView_Click" /></td>
                                                                                                    </tr>
                                                                                                </ItemTemplate>
                                                                                            </asp:ListView>
                                                                                        </tbody>
                                                                                    </table>
                                                                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="60" PagedControlID="ListView1" class="pager" style="float: none;">
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
                                                                    <td colspan="4" style="text-align: center;">
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
                                                                                        <td style="text-align: center; border-top: none!important"><span style="font-weight: bold;">اسم المساق</span>
                                                                                            <br />
                                                                                            <asp:Label ID="lblCourseID" runat="server" Visible="false"></asp:Label>
                                                                                            <asp:Label ID="lblCourseName" runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td style="text-align: center; border-top: none!important"><span style="font-weight: bold;">ساعات معتمدة</span>
                                                                                            <br />
                                                                                            <asp:Label ID="lblNumOfHours" runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td style="text-align: center; border-top: none!important"><span style="font-weight: bold;">الإمتحان النصفي</span>
                                                                                            <br />
                                                                                            <asp:Label ID="lblMidtermExamDate" runat="server"></asp:Label>
                                                                                            <span>|</span>
                                                                                            <asp:Label ID="lblMidtermExamTime" runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td style="text-align: center; border-top: none!important"><span style="font-weight: bold;">الإمتحان النهائي</span>
                                                                                            <br />
                                                                                            <asp:Label ID="lblFinalExamDate" runat="server"></asp:Label>
                                                                                            <span>|</span>
                                                                                            <asp:Label ID="lblFinalExamTime" runat="server"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <hr />
                                                                                <table class="table table-condensed table-hover">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <td style="text-align: center; width: 20%; font-weight: bold">الشعبة</td>
                                                                                            <td style="text-align: center; width: 28%; font-weight: bold">المحاضر</td>
                                                                                            <td style="text-align: center; width: 12%; font-weight: bold"></td>
                                                                                            <td style="text-align: center; width: 40%;">
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
                                                                                        <asp:Repeater ID="Repeater2" runat="server">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="StudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
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
                                                                                                        <asp:Label ID="lblClosedSection" runat="server" CssClass="label label-default btn-xs" Text="شعبة مغلقة" Visible='<%# (Eval("IsClosed").ToString()=="1") %>'></asp:Label>
                                                                                                        <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-success btn-xs" Text="تسجيل" Width="50px" OnClick="btnRegister_Click" Visible='<%# ((Convert.ToInt32(Eval("StdSectionID").ToString()) == 0) && (Eval("IsClosed").ToString()=="0")) %>' />
                                                                                                        <asp:Button ID="btnRemove" runat="server" CssClass="btn btn-danger btn-xs" Text="إلغاء" Width="50px" OnClick="btnRemove_Click" Visible='<%# (Convert.ToInt32(Eval("StdSectionID").ToString()) > 0) %>' />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="OfferdCourseID" runat="server" Text='<%# Eval("OfferdCourseID") %>' Visible="false"></asp:Label>
                                                                                                        <asp:Label ID="SectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                                                        <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("StdSectionID").ToString() %>' Visible="false"></asp:Label>
                                                                                                        <asp:Label ID="IsClosed" runat="server" Text='<%# Eval("IsClosed").ToString() %>' Visible="false"></asp:Label>
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
                                                                                                                        <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                                                                                    </SelectParameters>
                                                                                                                </asp:SqlDataSource>
                                                                                                            </td>
                                                                                                            <td style="text-align: center;">
                                                                                                                <asp:Label ID="lblClosedSection" runat="server" CssClass="label label-default btn-xs" Text="شعبة مغلقة" Visible='<%# (Eval("IsClosed").ToString()=="1") %>'></asp:Label>
                                                                                                                <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-success btn-xs" Text="تسجيل" Width="50px" OnClick="btnRegister_Click" Visible='<%# ((Convert.ToInt32(Eval("StdSectionID").ToString()) == 0) && (Eval("IsClosed").ToString()=="0")) %>' />
                                                                                                                <asp:Button ID="btnRemove" runat="server" CssClass="btn btn-danger btn-xs" Text="إلغاء" Width="50px" OnClick="btnRemove_Click" Visible='<%# (Convert.ToInt32(Eval("StdSectionID").ToString()) > 0) %>' />
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </ItemTemplate>
                                                                                                </asp:Repeater>
                                                                                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                                    SelectCommand="GetStdLabSectionsBySectionID" SelectCommandType="StoredProcedure">
                                                                                                    <SelectParameters>
                                                                                                        <asp:ControlParameter ControlID="SectionID" Name="SectionID" PropertyName="Text" Type="Int32" />
                                                                                                        <asp:ControlParameter ControlID="StudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
