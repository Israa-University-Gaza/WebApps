<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="EvaluationLecturerTotalResult.aspx.cs" Inherits="Academic_EvaluationLecturerTotalResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <script type="text/javascript">
             $('document').ready(function () {
                 $('.page-sidebar-menu li').removeClass("active").removeClass("open");
                 $('.page-sidebar-menu li ul li').css("background-color", "");
                 $('#TeacherEvaluation').addClass("active open");
                 $('#Eval2 a').css("background-color", "#575757");
                 $('#TeacherEvaluation a span.arrow').addClass("open");
             });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">احصائية تقييم الطلبة للمحاضر</a>
            <i class="fa fa-angle-left"></i>
        </li>
      
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
       <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> احصائية تقييم الطلبة للمحاضر خلال الفصل  </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                     <div class="form-group row">
                         <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                                <label class="col-md-1 control-label">المحاضر</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="DropDownList1" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource4"  DataTextField="Employee" DataValueField="EmployeeID" AutoPostBack="true"  ></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:israaEvaluation %>"
                                        SelectCommand="GetAllLecturerInSemester" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                          
                                            <asp:Parameter DefaultValue="11" Name="SemesterID" Type="Int32"></asp:Parameter>
                                           
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                           <label class="col-md-1 control-label">المساق</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="CourseName" DataValueField="CourseID"  AutoPostBack="true" ></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetTeacherOfferdCoursesEvaluation" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="EmployeeID" Type="Int32" />

                                            <asp:Parameter DefaultValue="11" Name="SemesterID" Type="Int32"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">الشعبة</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" AutoPostBack="true"  DataSourceID="SqlDataSource2" DataTextField="SectionNum" DataValueField="ID" ></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetTeacherOfferdCoursesSectionsEvaluation" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                              <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="EmployeeID" Type="Int32" />

                                            <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="CourseID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                         </div>
                        <div class="form-group row">
                               
                                <label class="col-md-1 control-label"> المجموعة</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="DropDownList2" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="GroupName" DataValueField="ID" AutoPostBack="true"  ></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:israaEvaluation %>"
                                        SelectCommand="SELECT [ID], [GroupName] FROM [EvaluationQuestionGroup] where GroupType=1 and ID=1">
                                    </asp:SqlDataSource>
                                </div>
                                  <label class="col-md-1 control-label">  السؤال</label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="DropDownList3" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="QuestionName" DataValueField="ID" AutoPostBack="true"  ></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:israaEvaluation %>"
                                        SelectCommand="SELECT [ID],[QuestionName] FROM [EvaluationQuestion] WHERE ([EvaluationQuestionGroupID] = @EvaluationQuestionGroupID) union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList2" PropertyName="SelectedValue" Name="EvaluationQuestionGroupID" Type="Int32"></asp:ControlParameter>

                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                         
                            </div>
                     <div class="form-group row">
                           <div class="col-md-2 ">
                         <asp:Button ID="Button1" runat="server" Text="تصدير لملف اكسل" CssClass="btn green"  OnClick="ExportToExcel"/>
                               </div>
                         </div>
                     <% if (Repeater2.Items.Count > 0)
                                   { %>
                    <table class="table table-striped table-bordered table-hover">
         
                                    <thead>
                                        <tr>
                                           
                                            
                                            <th style="width: 8%; text-align: center; font-size: 11px"> اسم المساق </th>
                                             <th style="width: 8%; text-align: center; font-size: 11px"> اسم المحاضر </th>
                                            <th style="width: 5%; text-align: center; font-size: 11px">رقم الشعبة</th>
                                            <th style="width: 5%; text-align: center; font-size: 11px">عدد المسجلين</th>
                                            <th style="width: 5%; text-align: center; font-size: 11px">عدد المقيمين</th>
                                             <th style="width: 5%; text-align: center; font-size: 11px"> نسبة التقييم </th>
                                             <th style="width: 10%; text-align: center; font-size: 11px"> التقييم الكلي للمحاضر(كل الشعب)  </th>
                                             <th style="width: 3%; text-align: center; font-size: 11px">عدد التقييمات</th>
                                            <th style="width: 3%; text-align: center; font-size: 11px">5 </th>
                                            <th style="width: 3%; text-align: center; font-size: 11px"> 4 </th>
                                            <th style="width: 3%; text-align: center; font-size: 11px"> 3</th>
                                             <th style="width: 3%; text-align: center; font-size: 11px"> 2</th>
                                             <th style="width: 3%; text-align: center; font-size: 11px"> 1</th>

                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource7" >
                                            <ItemTemplate>
                                                <tr>
                                                    

                                                    <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                     <td style="text-align: center"><span><%# Eval("Employee") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("SectionNum") %></span></td>
                                                     <td style="text-align: center"><span><%# Eval("NumOfRegisterd")%></span></td>
                                                    <td style="text-align: center"><span><%# Eval("NumOfStudent")%></span></td>
                                                    <td style="text-align: center"><span><%# Eval("Percentage")%></span>%</td>
                                                    <td style="text-align: center"><span><%# Eval("TotalPercentage")%></span>%</td>
                                                    <td style="text-align: center"><span><%# Eval("total")%></span></td>
                                                    <td style="text-align: center"><span><%# Eval("a5") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("a4") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("a3") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("a2") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("a1") %></span></td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>' SelectCommand="GetTotalEvaluationResult" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="CourseID" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" ></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="DropDownList2" PropertyName="SelectedValue" Name="EvaluationQuestionGroupID" Type="Int32" ></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="DropDownList3" PropertyName="SelectedValue" Name="EvaluationQuestionID" Type="Int32"></asp:ControlParameter>
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

