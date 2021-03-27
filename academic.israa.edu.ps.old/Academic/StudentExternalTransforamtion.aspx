<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="StudentExternalTransforamtion.aspx.cs" Inherits="Academic_StudentExternalTransforamtion" %>

<%@ Register Src="~/Academic/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_1 a').css("background-color", "#575757");
            $('#Student a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
     <asp:Label ID="lblStdStatusID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStdTypeID" runat="server" Visible="true"></asp:Label>

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
                    <uc1:StudentSideBar ActiveTab="StudentExternalTransforamtion" runat="server" ID="StudentSideBar" />
                    <div style="width: 81%; float: right;">
                        <div class="tab-content">
                       <div class="row">
   
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h4 class="font-ha" style="padding: 0;">معادلة خارجية</h4>
                                            </div>
                                            <div class="col-md-9" style="font-size: 14px; padding: 0px; direction: ltr!important">
                                                <% if ((Permissions.Contains("UniversityDeanStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "1")) ||
                                                                                                           (Permissions.Contains("HeadStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "2")) ||
                                                                                                               (Permissions.Contains("DeanStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "3")) ||
                                                                                                               (Permissions.Contains("AcademicStudentExternalTransforamtion")))
                                                    { %>
                                                <asp:LinkButton ID="lbTransformationAccreditation" runat="server" OnClick="lbTransformationAccreditation_Click" CssClass="btn default green col-md-offset-4 col-md-3 font-ha">إعتماد المعادلة</asp:LinkButton>
                                                <% } %>
                                                <ul class="col-md-5" style="padding: 0px 15px 0 0; float: left">
                                                    <li class="dropdown sp blue" style="list-style: none">
                                                        <a href="#" class="stdropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down" style="float: left; line-height: 27px; margin-left: 5px;"></i>تقارير المعادلة </a>
                                                        <ul class="dropdown-menu ver-inline-menu tabbable margin-bottom-10 font-ha" role="menu" style="margin-right: 0px; width: 243px;">
                                                            <li>
                                                                <asp:LinkButton ID="lbUnAccrediteETransformation" runat="server" OnClick="lbUnAccrediteETransformation_Click" CssClass="btn  spa">كشف غير معتمد بالمساقات المعادلة</asp:LinkButton></li>
                                                            <li>
                                                                <asp:LinkButton ID="lbAccrediteETransformation" runat="server" OnClick="lbAccrediteETransformation_Click" CssClass="btn  spa">كشف معتمد بالمساقات المعادلة</asp:LinkButton></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <hr style="margin: 10px 0 15px 0" />
                                        <div class="row">
                                            <% if ((Permissions.Contains("UniversityDeanStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "1")) ||
                                                                                                           (Permissions.Contains("HeadStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "2")) ||
                                                                                                               (Permissions.Contains("DeanStudentExternalTransforamtion") && DataAccess.TransformationIsAccreditation(lblStudentID.Text, "3")) ||
                                                                                                               (Permissions.Contains("AcademicStudentExternalTransforamtion")))
                                                { %>
                                            <div class="row">
                                                <% if (Repeater5.Items.Count > 0)
                                                    { %>
                                                <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource6">
                                                    <ItemTemplate>
                                                        <div class=" isra-clear">
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
                                                                                    <th style="width: 10%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                                    <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                                    <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق المعادل</th>
                                                                                    <th style="width: 10%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . س</th>
                                                                                    <th style="width: 13%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع.س.م</th>
                                                                                    <th style="width: 27%; text-align: center"></th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblCourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="false"></asp:Label>
                                                                                        <asp:Label ID="TransformationID" runat="server" Text='<%# Eval("TransformationID") %>' Visible="false"></asp:Label>
                                                                                        <tr>
                                                                                            <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseCode") %></span></td>
                                                                                            <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseArName") %></span></td>
                                                                                            <td style="text-align: center;">
                                                                                                <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" Style="text-align: center; height: 30px; font-size: 12px;" Text='<%# Eval("TransCourseName") %>' Enabled='<%# Eval("CanTrans").ToString()=="1"? true :false %>'></asp:TextBox>
                                                                                            </td>
                                                                                            <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                                            <td style="text-align: center;">
                                                                                                <asp:TextBox ID="txtCourseHours" runat="server" CssClass="form-control" Style="text-align: center; height: 30px; font-size: 12px;" Text='<%# Eval("TransCourseHours") %>' Enabled='<%# !Convert.ToBoolean(Eval("IsTransformation").ToString()) && Eval("CanTrans").ToString()=="1"  %>'></asp:TextBox>
                                                                                            </td>
                                                                                            <td style="text-align: center;">
                                                                                                <asp:Panel ID="Panel1" runat="server" CssClass="row" Visible='<%# !Convert.ToBoolean(Eval("IsTransformation").ToString()) && Eval("CanTrans").ToString()=="1" %>'>
                                                                                                    <div class="col-md-12">
                                                                                                        <label class="control-label" style="float: right; margin-left: 10px;">الدرجة : </label>
                                                                                                        <div class="input-group">
                                                                                                            <asp:TextBox ID="txtMark" runat="server" CssClass="form-control" Style="text-align: center; height: 30px;"></asp:TextBox>
                                                                                                            <span class="input-group-btn">

                                                                                                                <asp:Button ID="btnExternalTransformation" runat="server" Text="معادلة" CssClass="btn green" OnClick="btnExternalTransformation_Click" />
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </asp:Panel>
                                                                                                <span><%# (Eval("CanTrans").ToString()=="0"? "نجح الطالب في المساق" : "")%></span>
                                                                                                <asp:Panel ID="Panel2" runat="server" Style="padding: 4px;" Visible='<%# Eval("IsTransformation" ) %>'>
                                                                                                    <span>تمت معادلة المساق</span>
                                                                                                    <asp:LinkButton ID="lbEditExternalTransformation" runat="server" CssClass="btn default btn-xs black" OnClick="lbEditExternalTransformation_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                                                                                    <asp:LinkButton ID="lbDeleteExternalTransformation" runat="server" CssClass="btn default btn-xs purple" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbDeleteExternalTransformation_Click"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                                                                </asp:Panel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
                                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                    SelectCommand="GetStdExternalCSemesterPlanCourses" SelectCommandType="StoredProcedure">
                                                                                    <SelectParameters>
                                                                                        <asp:ControlParameter ControlID="PlanID" PropertyName="Text" Name="PlanID" Type="Int32" />
                                                                                        <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
                                                                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                                    </SelectParameters>
                                                                                </asp:SqlDataSource>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                    SelectCommand="GetStdSemesterPlan" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <% }
                                                    else
                                                    { %>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <strong>لا يوجد مساقات للمعادلة</strong>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
                                            </div>
                                            <div class=" isra-clear">
                                                <asp:Label ID="PlanID" runat="server" Text='<%# Eval("PlanID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="CSemesterID" runat="server" Text='<%# Eval("CSemesterID") %>' Visible="false"></asp:Label>
                                                <% if (Repeater11.Items.Count > 0)
                                                    { %>

                                                <div class="portlet">
                                                    <div class="portlet-title">
                                                        <div class="caption"><i class="fa fa-briefcase" style="width: 25px;"></i><span class="font-ha">مساقات معادلة خارج الخطة</span></div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <div class="table-responsive">

                                                            <table class="table table-striped table-bordered table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                        <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                        <th style="width: 20%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق المعادل</th>
                                                                        <th style="width: 10%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . س</th>
                                                                        <th style="width: 13%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع.س.م</th>
                                                                        <th style="width: 27%; text-align: center"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <asp:Repeater ID="Repeater11" runat="server" DataSourceID="SqlDataSource14">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="TransformationID" runat="server" Text='<%# Eval("TransformationID") %>' Visible="false"></asp:Label>
                                                                            <tr>


                                                                                <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseCode") %></span></td>
                                                                                <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseArName") %></span></td>
                                                                                <td style="text-align: center;">
                                                                                    <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" Style="text-align: center; height: 30px; font-size: 12px;" Text='<%# Eval("TransCourseName") %>' Enabled='<%# !Convert.ToBoolean(Eval("IsTransformation").ToString()) %>'></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                                <td style="text-align: center;">
                                                                                    <asp:TextBox ID="txtCourseHours" runat="server" CssClass="form-control" Style="text-align: center; height: 30px; font-size: 12px;" Text='<%# Eval("TransCourseHours") %>' Enabled='<%# !Convert.ToBoolean(Eval("IsTransformation").ToString()) %>'></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: center;">
                                                                                    <asp:Panel ID="Panel1" runat="server" CssClass="row" Visible='<%# !Convert.ToBoolean(Eval("IsTransformation").ToString()) %>'>
                                                                                        <div class="col-md-12">
                                                                                            <label class="control-label" style="float: right; margin-left: 10px;">الدرجة : </label>
                                                                                            <div class="input-group">
                                                                                                <asp:TextBox ID="txtMark" runat="server" CssClass="form-control" Style="text-align: center; height: 30px;"></asp:TextBox>
                                                                                                <span class="input-group-btn">
                                                                                                    <asp:Button ID="btnExternalTransformation" runat="server" Text="معادلة" CssClass="btn green" OnClick="btnExternalTransformation_Click" />
                                                                                                </span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </asp:Panel>
                                                                                    <asp:Panel ID="Panel2" runat="server" Style="padding: 4px;" Visible='<%# Eval("IsTransformation") %>'>
                                                                                        <span>تمت معادلة المساق</span>
                                                                                        <asp:LinkButton ID="lbEditExternalTransformation" runat="server" CssClass="btn default btn-xs black" OnClick="lbEditExternalTransformation_Click1"><i class="fa fa-edit"></i></asp:LinkButton>
                                                                                        <asp:LinkButton ID="lbDeleteExternalTransformation" runat="server" CssClass="btn default btn-xs purple" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbDeleteExternalTransformation_Click1"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                                                    </asp:Panel>
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource14" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetStdExternalNotPlanCourses" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                                <% } %>
                                            </div>
                                            <% }
                                                else
                                                { %>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>تم إعتماد المعادلة الخارجية</strong>
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
            </div>
        </div>
    </div>
</asp:Content>

