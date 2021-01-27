<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StdOfficeRegister.aspx.cs" Inherits="Admission_StdOfficeRegister" %>

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
                    
                    <uc1:StudentSideBar runat="server" ID="StudentSideBar" ActiveTab="StdOfficeRegister" />
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                            <div id="tab1" class="tab-pane active">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="row">
                                    <ContentTemplate>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>التسجيل المكتبي للطالب</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="divMsg2" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg2" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />

                                            </br>
                                                       <table class="table table-striped table-bordered">
                                                           <tbody>
                                                               <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                                                   <ItemTemplate>
                                                                       <tr>
                                                                           <td style="text-align: center; width: 13%;"><span style="font-weight: bold;">ع.س الخطة : </span>
                                                                               <span><%# Eval("StudentPlanHours") %></span></td>
                                                                           <td style="text-align: center; width: 13%;"><span style="font-weight: bold;">ع.س مسجلة : </span>
                                                                               <span><%# Eval("StudentRegisteredHours") %></span></td>
                                                                           <td style="text-align: center; width: 16%;"><span style="font-weight: bold;">ع.س مكتبية فصلية : </span>
                                                                               <span><%# Eval("SemesterStdOfficeRegister") %></span></td>
                                                                           <td style="text-align: center; width: 12%;"><span style="font-weight: bold;">ع.س مكتبية : </span>
                                                                               <span><%# Eval("StdOfficeRegister") %></span></td>
                                                                           <td style="text-align: center; width: 12%;"><span style="font-weight: bold;">ع.س نجاح : </span>
                                                                               <span><%# Eval("StudentPlanSucceedHour") %></span></td>
                                                                           <td style="text-align: center; width: 13%;"><span style="font-weight: bold;">ع.س متبقية : </span>
                                                                               <span><%# Eval("RemainHour") %></span></td>
                                                                           <td style="text-align: center; width: 17%;"><span style="font-weight: bold;">الرصيد : </span>
                                                                               <span><%# Eval("Balance") %></span></td>
                                                                       </tr>
                                                                   </ItemTemplate>
                                                               </asp:Repeater>
                                                               <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetCountOfRegisterHours" SelectCommandType="StoredProcedure">
                                                                   <SelectParameters>
                                                                       <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                                                       <asp:ControlParameter ControlID="lblSemesterID" Name="SemesterID" PropertyName="Text" Type="Int32" />
                                                                   </SelectParameters>

                                                               </asp:SqlDataSource>
                                                           </tbody>
                                                       </table>
                                            </br>
                                            <div class="form-group row">
                                                <%--     <label class="col-md-1 control-label"></label>--%>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="txtCourseCode" runat="server" class="form-control" placeholder="كود المساق" AutoPostBack="true" OnTextChanged="txtCourseCode_TextChanged"></asp:TextBox>
                                                </div>
                                                <%--          <label class="col-md-1 control-label"></label>--%>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="txtCourseName" runat="server" class="form-control" placeholder="اسم المساق" AutoPostBack="true" OnTextChanged="txtCourseName_TextChanged"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:Button ID="btnSearch" runat="server" Text="بحث" class="btn green" OnClick="btnSearch_Click" />
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <% if (ListView1.Items.Count > 0)
                                                    { %>
                                                <table class="table table-condensed table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 7%; border-top: none!important; font-size: 12px;">م</th>
                                                            <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">رقم المساق </th>
                                                            <th style="text-align: center; width: 25%; border-top: none!important; font-size: 12px;">اسم المساق</th>
                                                            <th style="text-align: center; width: 8%; border-top: none!important; font-size: 12px;">ع.س</th>
                                                            <th style="text-align: center; width: 10%; border-top: none!important; font-size: 11px;">حالة المساق</th>
                                                            <th style="text-align: center; width: 20%; border-top: none!important; font-size: 12px;"></th>
                                                            <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;"></th>
                                                            <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                                            <ItemTemplate>
                                                                <asp:Label ID="CourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("StdSectionID") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="SectionID" runat="server" Text='<%# Eval("SectionID") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="CourseArName" runat="server" Text='<%# Eval("CourseName") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td><span><%# Eval("RowNo") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                                                    <td style="text-align: center"><span><%# Eval("CourseHour") %></span></td>

                                                                    <td style="text-align: center">
                                                                        <span><%# (Eval("IsNotRegisterd").ToString()=="1")? "<img src='../assets/img/icons/remain.jpg' width='18' height='18' />": "" %></span>
                                                                        <span <%# (Eval("CourseStatusID").ToString()=="1") ? "" : "style='display:none;'" %>>
                                                                            <img src='../assets/img/icons/11693605_10153855864475809_1372216708_n.gif' width='18' height='18' title='<%# Eval("RegistrationDate") %> ' /></span>
                                                                        <span><%# (Eval("CourseStatusID").ToString()=="3")? "<img src='../assets/img/icons/w.png' width='18' height='18' />": "" %></span>
                                                                        <span><%# (Eval("CourseStatusID").ToString()=="6")? "<img src='../assets/img/icons/12207740_10153855864445809_964486009_n.jpg' width='18' height='18' />": "" %></span>
                                                                        <span><%# (Eval("CourseStatusID").ToString()=="9") ? "الغاء تسجيل" : "" %></span>
                                                                        <span><%# (Eval("CourseStatusID").ToString()=="11") ? "م.ك" : "" %></span>
                                                                    </td>
                                                                    <td>
                                                                        <span><%# (Eval("IsOfficeRegisterd").ToString()=="1") ? "مدرس المساق :" : "" %> <span><%# (Eval("IsOfficeRegisterd").ToString()=="1") ? Eval("InstructorName") : "" %></span>
                                                                        </span>
                                                                        <span><%# (Eval("IsOfficeRegisterd").ToString()=="1") ? "تاريخ الامتحان :" : "" %> <span><%# (Eval("IsOfficeRegisterd").ToString()=="1") ? Eval("FinalExamDate") + " _ "+ Eval("FinalExamTime"): "" %></span>
                                                                        </span>

                                                                    </td>
                                                                    <td style="text-align: center">

                                                                        <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-success btn-xs" Text="تسجيل" Width="50px" OnClick="btnRegister_Click" Enabled='<%# ((Convert.ToInt32(Eval("IsOfficeRegisterd").ToString()) == 0)) %>' />
                                                                    </td>
                                                                    <td style="text-align: center">
                                                                        <asp:Button ID="btnRemove" runat="server" CssClass="btn btn-danger btn-xs" Text="إلغاء" Width="50px" OnClick="btnRemove_Click" Enabled='<%# (Convert.ToInt32(Eval("IsOfficeRegisterd").ToString()) ==1) %>' />
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetStdOfficeOfferdCourse" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                                                <asp:ControlParameter ControlID="txtCourseCode" PropertyName="Text" DefaultValue="%" Name="CourseCode" Type="String"></asp:ControlParameter>
                                                                <asp:ControlParameter ControlID="txtCourseName" PropertyName="Text" DefaultValue="%" Name="CourseName" Type="String"></asp:ControlParameter>
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                                <%--          <asp:DataPager ID="DataPager1" runat="server" PageSize="30" PagedControlID="ListView1" class="pager" style="float: none;">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                                        <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                                        <asp:NumericPagerField ButtonType="Link" />
                                                        <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                                    </Fields>
                                                </asp:DataPager>--%>
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
