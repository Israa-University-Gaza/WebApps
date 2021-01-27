<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="EvaluationEmpTotalResult.aspx.cs" Inherits="Academic_EvaluationEmpTotalResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <script type="text/javascript">
             $('document').ready(function () {
                 $('.page-sidebar-menu li').removeClass("active").removeClass("open");
                 $('.page-sidebar-menu li ul li').css("background-color", "");
                 $('#TeacherEvaluation').addClass("active open");
                 $('#Eval5 a').css("background-color", "#575757");
                 $('#TeacherEvaluation a span.arrow').addClass("open");
             });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">احصائية التقييم الكلي  للأكاديمين خلال الفصل </a>
            <i class="fa fa-angle-left"></i>
            </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
       <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> احصائية التقييم الكلي  للأكاديمين خلال الفصل  </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                     <div class="form-group row">
                         <div class="col-md-9 isra-pl-0">
                        <div id="divMsg1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                            <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                         </div>
                     <div class="form-group row">
                         <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                             <%--      <label class="col-md-1 control-label">الكلية</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="collage" runat="server" class="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="Ar_Name" DataValueField="Department_ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>' SelectCommand="GetCollages" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>--%>
                                <label class="col-md-1 control-label">المحاضر</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="DropDownList1" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource4"  DataTextField="Employee" DataValueField="EmployeeID" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:israaEvaluation %>"
                                        SelectCommand="GetAllLecturerInSemester" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                       <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="-1" Name="EmployeeID" Type="Int32"></asp:ControlParameter>

                                           <asp:Parameter DefaultValue="12" Name="SemesterID" Type="Int32"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                    
                         </div>
                        <div class="form-group row">
                               
                                <label class="col-md-1 control-label"> المجموعة</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="DropDownList2" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="GroupName" DataValueField="ID" AutoPostBack="true" ></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:israaEvaluation %>"
                                        SelectCommand="SELECT [ID], [GroupName] FROM [EvaluationQuestionGroup] where GroupType=2 union select -1,N'الكل'">
                                    </asp:SqlDataSource>
                                </div>
                                  <label class="col-md-1 control-label">  السؤال</label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="DropDownList3" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="QuestionName" DataValueField="ID" AutoPostBack="true" ></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:israaEvaluation %>"
                                        SelectCommand="SELECT [ID],[QuestionName] FROM [EvaluationQuestion] WHERE ([EvaluationQuestionGroupID] = @EvaluationQuestionGroupID) union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList2" PropertyName="SelectedValue" Name="EvaluationQuestionGroupID" Type="Int32"></asp:ControlParameter>

                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
             <%--       <div class="form-group row">
                          <div class="col-md-2 ">
                         <asp:Button ID="Button1" runat="server" Text="تصدير لملف اكسل" CssClass="btn green"  OnClick="ExportToExcel"/>
                               </div>
                        </div>--%>
                  <%--   <div class="form-group row">
                        <asp:Button ID="BtnSaveAll" runat="server" CssClass="btn green" Text="اعتماد الشعب كعميد" OnClick="BtnSaveAll1_Click" />
                        <asp:Button ID="BtnSaveAll1" runat="server" CssClass="btn green" Text="اعتماد الشعب كنائب أكاديمي" OnClick="BtnSaveAll_Click" />
                    </div>--%>
                     <% if (Repeater2.Items.Count > 0)
                                   { %>
                    <table class="table table-striped table-bordered table-hover">
         
                                    <thead>
                                        <tr>
                                           <th style="width: 5%; text-align: center; font-size: 11px"> اسم المحاضر </th>
                                             <th style="width: 5%; text-align: center; font-size: 11px">عدد الاسئلة الكلي </th>
                                               <th style="width: 5%; text-align: center; font-size: 11px">  نسبة التقييم </th>
                                           <th style="width: 5%; text-align: center; font-size: 11px">كبيرة جدا </th>
                                           <th style="width: 5%; text-align: center; font-size: 11px">كبيرة </th>
                                           <th style="width: 5%; text-align: center; font-size: 11px">متوسطة</th>
                                           <th style="width: 5%; text-align: center; font-size: 11px"> قليلة</th>
                                           <th style="width: 5%; text-align: center; font-size: 11px"> قليلة جدا</th>
                                            <th  style="width: 5%; text-align: center;"></th>
                                       <%--      <th  style="width: 5%; text-align: center;"></th>--%>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource7" >
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="EmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="Employee" runat="server" Text='<%# Eval("Employee") %>'></asp:Label></td>
                                                    <td style="text-align: center"><span><%# Eval("total") %></span></td>
                                                      <td style="text-align: center"><span><%# Eval("Percentage") %>%</span></td>
                                                    <td style="text-align: center"><span><%# Eval("a5") %></span></td>
                                                   <td style="text-align: center"><span><%# Eval("a4") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("a3") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("a2") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("a1") %></span></td>
                                                     <td style="text-align: center">
                                            
                                        <%--     <asp:Button ID="lbAccept" runat="server" class="btn green" Text="اعتماد" Enabled='<%# !Convert.ToBoolean(Eval("AcademicAccreditation")) %>' OnClick="lbAccept_Click" ></asp:Button>
                                       --%> 

                                          <asp:Button ID="btnUpdateEvaluation" runat="server" Text=" انتهى التقييم" Enabled="false" />
                                                    
                                            
                                        </td>
                                       <%--             <td style="text-align: center;">
                                            <asp:Button ID="btnDeanAllAccreditation1" runat="server" Visible='<%# (Convert.ToBoolean(Eval("IsDean"))==false) ? true:false %>' Text='<%# (Convert.ToBoolean(Eval("DeanAccreditation"))==false) ? "إعتماد كعميد":"معتمد من العميد" %>' CssClass="btn green" Enabled='<%# (Convert.ToBoolean(Eval("DeanAccreditation"))==false) ? true:false %>' OnClick="btnDeanAllAccreditation1_Click"  OnClientClick="return confirm('هل أنت متأكد من أنك تود إعتماد العلامات ؟');" />
                                        </td>
                                        <td style="text-align: center;">
                                            <asp:Button ID="btnAcademicAllAccreditation" runat="server" Text='<%# (Convert.ToBoolean(Eval("AcademicAccreditation"))==false) ? "إعتماد أكاديمي":"معتمد من النائب الاكاديمي" %>' CssClass="btn green" Enabled='<%# (Convert.ToBoolean(Eval("AcademicAccreditation"))==false) ? true:false %>' OnClick="btnAcademicAllAccreditation_Click"  OnClientClick="return confirm('هل أنت متأكد من أنك تود إعتماد العلامات ؟');" />
                                        </td>--%>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>' SelectCommand="GetEmpTotalEvaluationResult" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                 <asp:Parameter DefaultValue="12" Name="SemesterID" Type="Int32"></asp:Parameter>
                                                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="EmployeeID" Type="Int32" DefaultValue="0"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="DropDownList2" PropertyName="SelectedValue" Name="EvaluationQuestionGroupID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="DropDownList3" PropertyName="SelectedValue" Name="EvaluationQuestionID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                 
                                    </tbody>
                                </table>
                     <% }
                                   else
                                   {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                       <strong>لا يوجد تقييم لهذا المحاضر</strong>
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
</asp:Content>

