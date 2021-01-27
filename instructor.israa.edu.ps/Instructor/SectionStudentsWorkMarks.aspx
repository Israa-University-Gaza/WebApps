<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="SectionStudentsWorkMarks.aspx.cs" Inherits="Instructor_SectionStudentsWorkMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#StudentMarks, #SectionStudentsWorkMarks').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>إدراج علامات أعمال الفصل للطلاب</span>
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
                                <span class="caption-subject font-red uppercase font-ha">إدراج علامات أعمال الفصل للطلاب</span>
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
                                        <label class="col-md-2 control-label">الفصل الدراسي</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                SelectCommand="GetSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 control-label">المساق</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="CourseName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                SelectCommand="GetTeacherOfferdCourses" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
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
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:Button ID="btnView" runat="server" Text="عرض" CssClass="btn green" OnClick="btnView_Click" />
                                        </div>
                                        <div class="col-md-3" style="text-align: left">
                                            <asp:Button ID="btnSaveMarks" runat="server" Text="حفظ العلامات" CssClass="btn green" OnClick="btnSaveMarks_Click" Enabled='<%# (Eval("status").ToString()=="0") ? true:false %>' />
                                            <asp:Button ID="btnMarkAccreditation" runat="server" Text="إعتماد العلامات" CssClass="btn green" OnClick="btnMarkAccreditation_Click" OnClientClick="return confirm('هل أنت متأكد من أنك تود إعتماد الدرجات ؟\n لا يمكنك تعديل الدرجات بعد الإعتماد !!!');" />
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-md-8">
                                            <span><strong>ملاحظات : </strong></span>
                                            <ul>
                                                <li><span>قم بإدخال درجات الطلاب للشعبة التي تم إختيارها حتي تاريخ 2017/05/13.</span></li>
                                                <li><span>في حال وجود توزيع درجات مختلف يرجى التواصل مع الشؤون الأكاديمية للتعديل.</span></li>
                                                <li><span>المقصود بالإمتحانات القصيرة هي كوزات سواء ورقية أو محوسبة أو شفوية.</span></li>
                                                <li><span>المقصود بالتعينات هي أنشطة وواجبات بيتية وتقارير وأبحاث وأخرى ذي علاقة بالمادة التعليمية.</span></li>
                                                <li><span>المقصود بالمشاركات هي تفاعل الطالب داخل المحاضرة وتشمل عروض تقديمية وعصف ذهني ومشاركة في المحاضرة وعرض تقرير زيارات ميدانية وأخرى ذي علاقة بالمادة التعليمية.</span></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-4">
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info">
                                                <div class="col-xs-12" style="text-align: center">
                                                    <span>قم بإدخال الدرجات ثم إضغط زر حفظ العلامات حتي تاريخ 2017/05/13</span><br />
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
                                            <%
                                                if (ListView1.Items.Count > 0)
                                                { %>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" style="width: 3%; text-align: center">رقم</th>
                                                        <th scope="col" style="width: 8%; text-align: center">رقم الطالب</th>
                                                        <th scope="col" style="width: 18%; text-align: center">اسم الطالب</th>
                                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource4">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMark1" runat="server" Text='<%# Eval("Mark1") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblMark2" runat="server" Text='<%# Eval("Mark2") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblMark3" runat="server" Text='<%# Eval("Mark3") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblMark4" runat="server" Text='<%# Eval("Mark4") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblMark5" runat="server" Text='<%# Eval("Mark5") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblMark6" runat="server" Text='<%# Eval("Mark6") %>' Visible="false"></asp:Label>
                                                                <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark1Visable")) %>'><%# Eval("Title1") + " ("+ Eval("Mark1")+ ")" %></th>
                                                                <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark2Visable")) %>'><%# Eval("Title2") + " ("+ Eval("Mark2")+ ")"  %></th>
                                                                <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark3Visable")) %>'><%# Eval("Title3") + " ("+ Eval("Mark3")+ ")"  %></th>
                                                                <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark4Visable")) %>'><%# Eval("Title4") + " ("+ Eval("Mark4")+ ")"  %></th>
                                                                <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark5Visable")) %>'><%# Eval("Title5") + " ("+ Eval("Mark5")+ ")"  %></th>
                                                                <th scope="col" style="width: 10%; text-align: center" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark6Visable")) %>'><%# Eval("Title6") + " ("+ Eval("Mark6")+ ")"  %></th>
                                                                <th scope="col" style="width: 5%; text-align: center">المجموع</th>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                            SelectCommand="GetWorkMarkTitle" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <th scope="col" style="width: 10%; text-align: center"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                                        <ItemTemplate>
                                                            <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("StdSectionID") %>' Visible="false"></asp:Label>
                                                            <tr>
                                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("RowNo") %></span></td>
                                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentNo") %></span></td>
                                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentName") %></span></td>
                                                                <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark1Visable"))%>'>
                                                                    <asp:TextBox ID="txtMark1" runat="server" CssClass="form-control mark" Style="height: 26px; text-align: center;" Text='<%# Eval("WorkMark1") %>' Enabled='<%# !Convert.ToBoolean(Eval("Mark1Disable")) && !Convert.ToBoolean(Eval("TeacherAccreditation1")) %>'></asp:TextBox></td>
                                                                <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark2Visable"))%>'>
                                                                    <asp:TextBox ID="txtMark2" runat="server" CssClass="form-control mark" Style="height: 26px; text-align: center;" Text='<%# Eval("WorkMark2") %>' Enabled='<%# !Convert.ToBoolean(Eval("Mark2Disable")) && !Convert.ToBoolean(Eval("TeacherAccreditation2")) %>'></asp:TextBox></td>
                                                                <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark3Visable"))%>'>
                                                                    <asp:TextBox ID="txtMark3" runat="server" CssClass="form-control mark" Style="height: 26px; text-align: center;" Text='<%# Eval("WorkMark3") %>' Enabled='<%# !Convert.ToBoolean(Eval("Mark3Disable")) && !Convert.ToBoolean(Eval("TeacherAccreditation3")) %>'></asp:TextBox></td>
                                                                <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark4Visable")) %>'>
                                                                    <asp:TextBox ID="txtMark4" runat="server" CssClass="form-control mark" Style="height: 26px; text-align: center;" Text='<%# Eval("WorkMark4") %>' Enabled='<%# !Convert.ToBoolean(Eval("Mark4Disable")) && !Convert.ToBoolean(Eval("TeacherAccreditation4")) %>'></asp:TextBox></td>
                                                                <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark5Visable"))%>'>
                                                                    <asp:TextBox ID="txtMark5" runat="server" CssClass="form-control mark" Style="height: 26px; text-align: center;" Text='<%# Eval("WorkMark5") %>' Enabled='<%# !Convert.ToBoolean(Eval("Mark5Disable")) && !Convert.ToBoolean(Eval("TeacherAccreditation5")) %>'></asp:TextBox></td>
                                                                <td style="padding: 6px 28px" runat="server" visible='<%# Convert.ToBoolean(Eval("Mark6Visable"))%>'>
                                                                    <asp:TextBox ID="txtMark6" runat="server" CssClass="form-control mark" Style="height: 26px; text-align: center;" Text='<%# Eval("WorkMark6") %>' Enabled='<%# !Convert.ToBoolean(Eval("Mark6Disable")) && !Convert.ToBoolean(Eval("TeacherAccreditation6")) %>'></asp:TextBox></td>
                                                                <td style="text-align: center;">
                                                                    <span><%# Eval("TotalWorkMark") %></span>
                                                                </td>
                                                                <td style="text-align: center;">
                                                                    <asp:Button ID="btnSaveMark" runat="server" Text="حفظ" CssClass="btn green" Style="height: 26px; padding: 0 15px" OnClick="btnSaveMark_Click" />
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                                        SelectCommand="GetSectionStudentsWorkMarks" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
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
        </div>
    </div>
</asp:Content>

