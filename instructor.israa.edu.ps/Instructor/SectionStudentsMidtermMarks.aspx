﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="SectionStudentsMidtermMarks.aspx.cs" Inherits="Instructor_SectionStudentsMidtermMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#StudentMarks, #SectionStudentsMidtermMarks').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>علامات الطلاب</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">إدراج علامات الطلاب</span>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div id="divMsg" runat="server" class="alert alert-warning alert-top" visible="false">
                                <asp:Label ID="lblMsg" runat="server" Style="font-weight: bold; float: right;" ClientIDMode="Static"></asp:Label>
                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="form-horizontal">
                                <div class="form-body">
                                    <div class="form-group row">
                                        <label class="col-md-1 control-label">المساق</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="CourseName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                SelectCommand="GetTeacherOfferdCourses" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                    <%--<asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" Name="SemesterID" Type="Int32" />--%>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <label class="col-md-1 control-label">الشعبة</label>
                                        <div class="col-md-2">
                                            <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="SectionNum" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                SelectCommand="GetTeacherOfferdCoursesSections" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="OfferdCourseID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                    <asp:Parameter Name="SectionType" DefaultValue="1" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:Button ID="btnView" runat="server" Text="عرض" CssClass="btn green" OnClick="btnView_Click" />
                                        </div>
                                        <div class="col-md-offset-1 col-md-3" style="text-align: left">
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource6">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnSaveMarks" runat="server" Text="حفظ العلامات" CssClass="btn green" OnClick="btnSaveMarks_Click" Enabled='<%# (Eval("status").ToString()=="0") ? true:false %>' />
                                                    <asp:Button ID="btnMarkAccreditation" runat="server" Text='<%# (Eval("status").ToString()=="0") ? "إعتماد العلامات":"تم إعتماد العلامات" %>' CssClass="btn green" Enabled='<%# (Eval("status").ToString()=="0") ? true:false %>' OnClick="btnMarkAccreditation_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إعتماد الدرجات ؟\n لا يمكنك تعديل الدرجات بعد الإعتماد !!!');" />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                SelectCommand="MidtermMarkIsAccreditation" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                    <asp:Parameter Name="AccreditationType" DefaultValue="1" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                        </div>
                                    </div>
                                    <hr />
                                    <%
                                            if (ListView1.Items.Count > 0  )
                                        { %>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <span><strong>ملاحظات : </strong></span>
                                            <ul>
                                                <li><span>قم بإدخال درجات الطلاب للشعبة التي تم إختيارها.</span></li>
                                                <li><span>قم بإدخال الرمز N في حال عدم تقدم الطالب للإمتحان</span></li>
                                                <li><span>يمكنك تنزيل</span>
                                                    <asp:LinkButton ID="lbSectionStudentsMidtermMarksPDF" runat="server" OnClick="lbSectionStudentsMidtermMarksPDF_Click">كشف الدرجات النصفية من هنا</asp:LinkButton>
                                                    <span>و</span>
                                                    <asp:LinkButton ID="lbSectionStudentsMidtermEmptyMarksPDF" runat="server" OnClick="lbSectionStudentsMidtermEmptyMarksPDF_Click">كشف الدرجات النصفية فارغ من هنا</asp:LinkButton>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-md-6">
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-12" style="text-align: center">
                                                    <span>قم بإدخال الدرجات ثم إضغط زر حفظ العلامات</span><br />
                                                    <span>لتقديم العلامات لعمادة الكلية عليك الضغط علي اعتماد العلامات</span>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <div style="clear: both"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <br />
                                    <div class="row table-responsive">
                                        <div class="col-md-12">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" style="width: 5%; text-align: center">رقم</th>
                                                        <th scope="col" style="width: 10%; text-align: center">رقم الطالب</th>
                                                        <th scope="col" style="width: 20%; text-align: center">اسم الطالب</th>
                                                        <th scope="col" style="width: 10%; text-align: center">أعمال الفصل</th>
                                                        <th scope="col" style="width: 10%; text-align: center">النصفي</th>
                                                        <th scope="col" style="width: 10%; text-align: center">النهائي</th>
                                                        <th scope="col" style="width: 10%; text-align: center">العلامة</th>
                                                        <th scope="col" style="width: 10%; text-align: center"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:ListView ID="ListView1" runat="server">
                                                        <ItemTemplate>
                                                            <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("StdSectionID") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Container.DataItemIndex + 1 %></span></td>
                                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentNo") %></span></td>
                                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentName") %></span></td>
                                                                <td style="padding: 6px 28px">
                                                                    <asp:TextBox ID="txtWorkMark" runat="server" CssClass="form-control" Style="height: 26px; text-align: center;" Text="0" Enabled="false"></asp:TextBox></td>
                                                                <td style="padding: 6px 28px">
                                                                    <asp:TextBox ID="txtMidtermMark" runat="server" CssClass="form-control" Style="height: 26px; text-align: center;" Text='<%# (Convert.ToBoolean(Eval("IsMidtermIncomplete").ToString())) ? "غ . م" :  ((Convert.ToBoolean(Eval("IsMidtermNoMark").ToString()) &&  Eval("MidtermMark").ToString() == "0" ) ? "غياب" : Eval("MidtermMark")) %>' Enabled='<%#(!Convert.ToBoolean(Eval("midTeacherAccreditation").ToString())) ? true:false %>'></asp:TextBox></td>
                                                                <td style="padding: 6px 28px">
                                                                    <asp:TextBox ID="txtFinalMark" runat="server" CssClass="form-control" Style="height: 26px; text-align: center;" Text="0" Enabled="false"></asp:TextBox></td>
                                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("TotalMark") %></span></td>
                                                                <td>
                                                                    <asp:Button ID="btnSaveMark" runat="server" Text="حفظ" CssClass="btn green" Style="height: 26px; padding: 0 15px" OnClick="btnSaveMark_Click" Enabled='<%#(!Convert.ToBoolean(Eval("midTeacherAccreditation").ToString())) ? true:false %>' />
                                                                    <asp:Button ID="btnSaveMarkAndAccerdiate" runat="server" Text="حغظ واعتماد" CssClass="btn green" Style="height: 26px; padding: 0 15px" OnClick="btnSaveMarkAndAccerdiate_OnClick" Visible="False" />

                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                        SelectCommand="GetSectionStudentsMarks" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <% }
                                        else if (ddlSection.Items.Count == 0)
                                        { %>
                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                        <div class="col-xs-11" style="text-align: center">
                                            <strong>لم يتم إختيار الشعبة لعرض الطلاب</strong>
                                            <div style="clear: both"></div>
                                        </div>
                                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                    <% }
                                        else
                                        {%>
                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                        <div class="col-xs-11" style="text-align: center">
                                            <strong>لا يوجد طلاب مسجلين في الشعبة</strong>
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
</asp:Content>
