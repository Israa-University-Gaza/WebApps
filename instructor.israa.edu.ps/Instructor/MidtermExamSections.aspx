<%@ page title="" language="C#" masterpagefile="~/Instructor/MasterPage.master" autoeventwireup="true" codefile="MidtermExamSections.aspx.cs" inherits="Instructor_MidtermExamSections" %>


<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="/assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#AcademicMenu, #MidtermExamSections').addClass("active");
        });
    </script>
</asp:Content>

<asp:content id="Content3" contentplaceholderid="PageTitlePlaceHolder" runat="Server">
    <span>الشؤون الأكاديمية</span>
    <i class="fa fa-angle-left" style="font-size: 15px; padding: 0 5px;"></i>
    <span>جدول المراقبات النصفية</span>
</asp:content>

<asp:content id="Content4" contentplaceholderid="ContentPlaceHolder" runat="Server">
      <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">جدول المراقبات النصفية</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
						
												                                <a  href="../تعليمات المحاضر مراقبات.jpeg"> <h4 style="color: red">تعليمات خاصة بالطلبة في فترة الامتحانات النصفية</h4></a>
</br>

						
						
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col" style="width: 5%; text-align: center;">م</th>
                                        <th scope="col" style="width: 15%; text-align: center">التاريخ</th>
                                        <th scope="col" style="width: 10%; text-align: center">اليوم</th>
                                        <th scope="col" style="width: 15%; text-align: center">الوقت</th>
                                        <th scope="col" style="width: 15%; text-align: center">اسم المساق</th>
                                        <th scope="col" style="width: 10%; text-align: center">القاعة</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("RowNo") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("ExamDate") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("ExamDay") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("ExamTime") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("CourseName") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("Room") %></span></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                        SelectCommand="GetEmployeeMidtermExamSections" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="text" Name="EmployeeID" Type="Int32" />
											<asp:ControlParameter ControlID="lblSemesterID" PropertyName="text" Name="SemesterID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <% }
                                else
                                {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>الرجاء الحضور في موعد المحاضرات الى الجامعة والتوجه للجنة الامتحانات لمتابعة مراقبة الامتحانات النصفية</strong>
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
</asp:content>
