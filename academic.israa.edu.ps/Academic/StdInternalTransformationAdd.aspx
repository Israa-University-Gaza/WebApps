<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" ClientIDMode="AutoID" CodeFile="StdInternalTransformationAdd.aspx.cs" Inherits="Academic_StdInternalTransformationAdd" %>

<%@ Register Src="~/Academic/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .ddl2 {
            margin-top: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>

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

                    <uc1:StudentSideBar ActiveTab="StdInternalTransformationAdd" runat="server" ID="StudentSideBar" />
                    <div style="width: 81%; float: right;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4 class="font-ha" style="padding: 0;">معادلة داخلية</h4>
                                    </div>

                                </div>

                                <hr style="margin: 10px 0 15px 0" />
                                    <asp:UpdatePanel runat="server" UpdateMode="Always" ID="UpdatePanel1">
                                    <ContentTemplate>
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0">
                                            <ProgressTemplate>
                                                <div id="loading">
                                                    <div id="loading-center">
                                                        <div id="loading-center-absolute">
                                                            <div class="object" id="object_one"></div>
                                                            <div class="object" id="object_two"></div>
                                                            <div class="object" id="object_three"></div>
                                                            <div class="object" id="object_four"></div>
                                                            <div class="object" id="object_five"></div>
                                                            <div class="object" id="object_six"></div>
                                                            <div class="object" id="object_seven"></div>
                                                            <div class="object" id="object_eight"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                <div class="row">
                                                                        <div class="row">
                                        <div class=" isra-clear">
                                            <div class="portlet">

                                                <div class="portlet-body">

                                                    <%--                                                      <% if ((Permissions.Contains("UniversityDeanStudentExternalTransforamtion") && DataAccess.InternalTransformationIsAccreditation(lblStudentID.Text, "1")) ||
                                                                                             (Permissions.Contains("HeadStudentExternalTransforamtion") && DataAccess.InternalTransformationIsAccreditation(lblStudentID.Text, "1")) ||
                                                                                                 (Permissions.Contains("DeanStudentExternalTransforamtion") && DataAccess.InternalTransformationIsAccreditation(lblStudentID.Text, "2")) ||
                                                                                                 (Permissions.Contains("AcademicStudentExternalTransforamtion")))
                                                        { %>--%>
                                                    <div class="form-group row">
                                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                                            <ItemTemplate>
                                                                <h4 class="font-ha" style="padding: 0;">توقعات عملية المعادلة :</h4>
                                                                <div class=" row alert alert-info">
                                                                    <div class="row">
                                                                        <div class="col-md-4">
                                                                            المعدل التراكمي ( قبل) : <%# Eval("PrevGPAUniversity") %></br>
                                           المعدل التراكمي ( بعد) : <%# Eval("GPAUniversity") %>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            المعدل التراكمي (خريج قبل) : <%# Eval("PrevGPAGraduate") %> </br>
                                           المعدل التراكمي (خريج بعد) : <%# Eval("GPAGraduate") %>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            ساعات نجاح ضمن الخطة ( قبل) : <%# Eval("PrevPlanSucceedHour") %> </br>
                                    ساعات نجاح ضمن الخطة ( بعد  ) :  <%# Eval("PlanSucceedHour") %>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">

                                                                        <div class="col-md-4">
                                                                            ساعات نجاح  ( قبل) : <%# Eval("PrevSucceedHour") %> </br>
                                    ساعات نجاح  ( بعد  ) :  <%# Eval("SucceedHour") %>
                                                                        </div>

                                                                        <div class="col-md-4">
                                                                            ساعات دراسة  ( قبل) : <%# Eval("PrevStudiedHour") %> </br>
                                    ساعات دراسة  ( بعد  ) :  <%# Eval("StudiedHour") %>
                                                                        </div>

                                                                        <div class="col-md-4">
                                                                            عدد ساعات المعادلة الداخلية  : <%# Eval("InternalTransformationHours") %></br>


                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="row"></br></div>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </div>

                                                    <% if (listview2.Items.Count > 0)
                                                        { %>
                                                    <div class="form-group row">
                                                        <label class="col-md-10 control-label isra-text-aling-right"></label>
                                                        <div class="col-md-2">

                                                            <div class="btn-group">
                                                                <a class="btn btn-group-lg btn-default" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" runat="server">خيارات المعادلة
                                                                        </a>
                                                                <ul class="dropdown-menu pull-right">

                                                                    <% if (Permissions.Contains("DeanTransforamtionAccreditation"))
                                                                        { %>

                                                                    <li runat="server" id="liSaveAll" visible="false">
                                                                        <asp:LinkButton ID="lbSaveAll" runat="server" OnClick="lbSaveAll_Click" CssClass="btn btn-sm btn-default ">معادلة الكل   <i class="fa  fa-check-square-o pull-right"></i></asp:LinkButton>

                                                                    </li>
                                                                    <li runat="server" id="liDeanAccreditAll" visible="false">
                                                                        <asp:LinkButton ID="lbDeanAccreditAll" runat="server" OnClick="lbDeanAccreditAll_Click" CssClass="btn btn-sm btn-success ">اعتماد الكل  <i class="fa fa-check pull-right"></i></asp:LinkButton>

                                                                    </li>

                                                                    <li runat="server" id="liDeanUnAccreditAll" visible="false">
                                                                        <asp:LinkButton ID="lbDeanUnAccreditAll" runat="server" OnClick="lbDeanUnAccreditAll_Click" CssClass="btn btn-sm btn-danger ">الغاء اعتماد الكل  <i class="fa fa-ban pull-right"></i> </asp:LinkButton>
                                                                    </li>

                                                                    <% } %>
                                                                    <% if (Permissions.Contains("TransforamtionAccreditation"))
                                                                        { %>
                                                                    <li runat="server" id="liAcademicAccreditAll" visible="false">
                                                                        <asp:LinkButton ID="lbAcademicAccreditAll" runat="server" OnClick="lbAcademicAccreditAll_Click" CssClass="btn btn-sm btn-success "> اعتماد الكل  <i class="fa fa-check pull-right"></i></asp:LinkButton>

                                                                    </li>
                                                                    <li runat="server" id="liAcademicUnAccreditAll" visible="false">
                                                                        <asp:LinkButton ID="lbAcademicUnAccreditAll" runat="server" OnClick="lbAcademicUnAccreditAll_Click" CssClass="btn btn-sm btn-danger ">الغاء اعتماد الكل <i class="fa fa-ban pull-right"></i> </asp:LinkButton>
                                                                    </li>
                                                                    <% } %>
                                                                </ul>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="table-responsive">
                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                                                                                <th>
                                                                    <input type="checkbox" id="selectAll" />
                                                                </th>
                                                                <th style="width: 2%;">رقم</th>
                                                                <th style="width: 8%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                <th style="width: 25%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق </th>
                                                                <th style="width: 35%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق المعادل به</th>
                                                                <%--                                                                         <th style="width: 10%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>طبيعة المعادلة</th>--%>
                                                                <%--     <th style="width: 10%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . س</th>--%>
                                                                <th style="width: 10%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع.س.م</th>
                                                                <th scope="col" style="width: 15%; text-align: center">إعتمادات</th>
                                                                <th style="width: 5%; text-align: center"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:ListView ID="listview2" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="listview2_ItemDataBound">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblStdInternalTransformationID" runat="server" Text='<%# Eval("StdInternalTransformationID") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblIsTransformation" runat="server" Text='<%# Eval("IsTransformation") %>' Visible="false"></asp:Label>
                                                                     <asp:Label ID="lblIsAllTransformation" runat="server" Text='<%# Eval("IsAllTransformation") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblAllDeanAccreditation" runat="server" Text='<%# Eval("AllDeanAccreditation") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblAllAcademicAccreditation" runat="server" Text='<%# Eval("AllAcademicAccreditation") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblExistDeanAccreditation" runat="server" Text='<%# Eval("ExistDeanAccreditation") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblExistAcademicAccreditation" runat="server" Text='<%# Eval("ExistAcademicAccreditation") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblITransWithCourseID" runat="server" Text='<%# Eval("ITransWithCourseID") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblITransWithCourseID2" runat="server" Text='<%# Eval("ITransWithCourseID2") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblTransformationReasonID" runat="server" Text='<%# Eval("TransformationReasonID") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblIsDeanAccreditation" runat="server" Text='<%# Eval("IsDeanAccreditation") %>' Visible="false"></asp:Label>

                                                                    <tr <%# Eval("IsPlanCourse").ToString()=="0"? "style='color:red;'" : "" %>>
                                                                        <td style="text-align: center">
                                                                            <asp:CheckBox ID="cbAdopt" runat="server" Checked="false" /></td>
                                                                        <td><span><%# Eval("RowNo") %></span></td>
                                                                        <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseCode") %></span></td>
                                                                        <td style="text-align: center; line-height: 30px;"><span><%# Eval("CourseArName") %></span></td>
                                                                        <td style="text-align: end;">
                                                                            <a class="btn btn-circle btn-icon-only " style=" width: 12%; padding-left: 0px;padding-right: 0px;" onclick='ShowDDL(<%# Eval("ID") %>)'>
                                                                                <i class="fa fa-plus-circle" style="font-size: 18px; color: orange; " runat="server" id="iplus"></i>
                                                                            </a>
                                                                            <asp:DropDownList ID="ddlCourses" Font-Size="11px" Width="85%" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="CourseID" AutoPostBack="true" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged" Enabled='<%#Eval("CanEdit").ToString()== "1"%>'></asp:DropDownList>
                                                                            <asp:DropDownList ID="ddlCourses2" Font-Size="11px" Width="85%" runat="server" CssClass='<%# "ddl2 " + Eval("ID")+ " select2_category form-control pull-right "+((string.IsNullOrEmpty(Eval("ITransWithCourseID2").ToString()))?"hide ":" ")  %>' DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="CourseID" AutoPostBack="true" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged" Enabled='<%#Eval("CanEdit").ToString()== "1"%>'></asp:DropDownList>

                                                                            <td style="text-align: center;">
                                                                                <asp:TextBox ID="txtCourseHours" runat="server" CssClass="form-control" Style="text-align: center; height: 34px; font-size: 12px; color: blue;" Text='<%# Convert.ToInt32(Eval("ITransWithCourseHours")) > 0 ?  Eval("ITransWithCourseHours"): "" %>' Enabled='<%#Eval("CanEdit").ToString()== "1"%>'></asp:TextBox>
                                                                                <asp:TextBox ID="txtCourseHours2" runat="server" CssClass='<%#  " form-control pull-right "+((string.IsNullOrEmpty(Eval("ITransWithCourseID2").ToString()))?"hide ":" ")+" ddl2 " + Eval("ID") %>' Style="text-align: center; height: 34px; font-size: 12px; color: blue;" Text='<%# Convert.ToInt32(Eval("ITransWithCourseHours")) > 0 ?  Eval("ITransWithCourseHours"): "" %>' Enabled='<%#Eval("CanEdit").ToString()== "1"%>'></asp:TextBox>
                                                                            </td>
                                                                            <td style="text-align: center; font-size: 12px; padding: 10px;">
                                                                                <%--  <span><%# (Convert.ToBoolean(Eval("IsHeadAccreditation")))?"(رئيس قسم" + " : " + Eval("HeadAccreditation") +")" : ""%></span>--%>
                                                                                <span><%# (Convert.ToBoolean(Eval("IsHeadAccreditation")))?"رئيس قسم" : ""%></span>
                                                                                <br />
                                                                                <%--<span><%# (Convert.ToBoolean(Eval("IsDeanAccreditation"))) ? "(عميد" + " : " + Eval("DeanAccreditation") +")" : "" %></span>--%>
                                                                                <span><%# (Convert.ToBoolean(Eval("IsDeanAccreditation")))?"عميد" : ""%></span>
                                                                                <br />
                                                                                <span><%# (Convert.ToBoolean(Eval("IsAcademicAccreditation")))?"نائب أكاديمي": ""%></span>
                                                                                <%--<span><%# (Convert.ToBoolean(Eval("IsAcademicAccreditation"))) ? "(نائب أكاديمي" + " : " + Eval("AcademicAccreditation") +")" : "" %></span>--%>
                                                                                </td>

                                                                            <td style="text-align: center;">
                                                                                <% if (Permissions.Contains("DeanTransforamtionAccreditation"))
                                                                                    { %>
                                                                                <asp:Button ID="btnSave" runat="server" Text="معادلة" CssClass="btn btn-sm btn-default " ForeColor="Black" BorderColor="Black" Width="50px" Enabled="false" Visible='<%#Eval("CanEdit").ToString()== "1" %>' OnClick="btnSave_Click" />
                                                                                <asp:Button ID="btnDeanAccredit" runat="server" Text="اعتماد " Width="50px" Visible='<%# Eval("IsTransformation").ToString()== "1" && Eval("IsDeanAccreditation").ToString()== "0" %>' CssClass="btn btn-sm btn-success" OnClick="btnDeanAccredit_Click" />
                                                                                <asp:Button ID="btnDelete" runat="server" Text="حذف" Width="50px" Visible='<%# Eval("IsTransformation").ToString()=="1" && Eval("IsDeanAccreditation").ToString()== "0" &&  Eval("IsAcademicAccreditation").ToString()== "0" %>' CssClass="btn btn-sm btn-danger" OnClick="btnDelete_Click" />
                                                                                <asp:Button ID="btnCancelDeanAccredit" runat="server" Text="الغاء" ToolTip="الغاء الاعتماد" Width="50px" Visible='<%# Eval("IsTransformation").ToString()=="1" && Eval("IsDeanAccreditation").ToString()== "1" &&  Eval("IsAcademicAccreditation").ToString()== "0" %>' CssClass="btn btn-sm btn-danger" OnClick="btnCancelDeanAccredit_Click" />
                                                                                <% } %>
                                                                                <% if (Permissions.Contains("TransforamtionAccreditation"))
                                                                                    { %>
                                                                                <asp:Button ID="btnAcademicAccredit" runat="server" Text="اعتماد " Width="50px" Visible='<%#  Eval("IsTransformation").ToString()== "1" && Eval("IsDeanAccreditation").ToString()== "1"   &&  Eval("IsAcademicAccreditation").ToString()== "0"%>' CssClass="btn btn-sm btn-success" OnClick="btnAcademicAccredit_Click" />

                                                                                <asp:Button ID="btnCancelAcademicAccredit" runat="server" Text="الغاء" ToolTip="الغاء الاعتماد" Width="50px" Visible='<%# Eval("IsTransformation").ToString()=="1" && Eval("IsDeanAccreditation").ToString()== "1" &&  Eval("IsAcademicAccreditation").ToString()== "1" %>' CssClass="btn btn-sm btn-danger" OnClick="btnCancelAcademicAccredit_Click" />
                                                                                <% } %>
                                                                                </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:ListView>

                                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                SelectCommand="StdInternalTransExpectations" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>

                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                SelectCommand="GetStdCoursesNotInPlan" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>

                                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>

                                                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlStudentPlanCourses" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>

                                                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlStudentPlanCourses" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


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

                                         </ContentTemplate>

                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="listview2" />
                                    </Triggers>

                                </asp:UpdatePanel>



                                <%-- <% }  else
                                                { %>
                                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                <div class="col-xs-11" style="text-align: center;">
                                                    <strong>تم إعتماد المعادلة الداخلية</strong>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                <div style="clear: both"></div>
                                            </div>
                                                <% } %>--%>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script>
        $('#selectAll').click(function (e) {
            $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);

        });

        function ShowDDL(id) {
            $("." + id).toggle();
            $("." + id).toggleClass("hide");

        }


    </script>
</asp:Content>


