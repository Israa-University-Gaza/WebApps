<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="FinalExamSectionsEdit.aspx.cs" Inherits="Academic_FinalExamSectionsEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#FinalExamSectionsEdit').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">


    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>شعب الإمتحانات</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div style="width: 19%; float: right;">
                            <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                                <li>
                                    <label class="row control-label">اليوم :</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlExamDate" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="FinalExamDate" DataValueField="FinalExamDate" AutoPostBack="true"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetFinalExamDates" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" Name="SemesterID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <%--  <label class="row control-label">البرنامج :</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlProgram" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlEmployeePrograms" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />--%>

                                    <label class="row control-label">الكلية :</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlEmployeeCollages" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />

                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <label class="row control-label">القسم :</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Department] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND ([CollegeID] in (Select ID From College Where ID=@CollegeID))) union select -1,N'كل الأقسام'">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlCollege" Name="CollegeID" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <label class="row control-label">مساق :</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlCourse" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Course] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (DepartmentID=@DepartmentID) and ID in (Select CourseID From OfferdCourse Where SemesterID=@SemesterID)) union select -1,N'كل المساقات'">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                                <asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" Name="SemesterID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>

                                    <br />
                                    <label class="row control-label">الفرع :</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource7" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlBranches" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <br />
                                    <label class="row control-label">الجنس :</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="select2_category form-control">
                                            <asp:ListItem Value="-1" Text="الكل"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="طلاب"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="طالبات"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <br />
                                    <div class="row" style="text-align: center">
                                        <asp:Button ID="btnView" runat="server" Text="عرض" CssClass="btn green" OnClick="btnView_Click" />
                                    </div>
                                    <br />
                                </li>
                            </ul>
                        </div>
                        <div style="width: 81%; float: right;">
                            <div class="tab-content">
                                <div id="tab1" class="tab-pane active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4 class="font-ha">شعبة الإمتحان</h4>
                                                </div>
                                                <div class="col-md-9 isra-pl-0">
                                                    <div id="divMsg1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                                        <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <% if (Repeater1.Items.Count > 0)
                                                    { %>
                                                <div style="font-size: 14px;" class="alert alert-info alert-dismissable">
                                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
                                                        <ItemTemplate>
                                                            <asp:Label ID="CollegeID" runat="server" Text='<%# Eval("CollegeID") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="DepartmentID" runat="server" Text='<%# Eval("DepartmentID") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="CourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="Gender" runat="server" Text='<%# Eval("Gender") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="BranchID" runat="server" Text='<%# Eval("BranchID") %>' Visible="false"></asp:Label>
                                                            <div class="col-md-4">
                                                                <strong>الكلية : </strong><span><%# Eval("College") %></span><br />
                                                                <strong>القسم : </strong><span><%# Eval("Department") %></span><br />
                                                                <strong>الفرع : </strong><span><%# Eval("BranchName") %></span><br />
                                                            </div>
                                                            <div class="col-md-4" style="text-align: right;">
                                                                <strong>المساق : </strong><span><%# Eval("CourseName") %></span><br />
                                                                <strong>الجنس : </strong><span><%# Eval("GenderName") %></span><br />
                                                            </div>

                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                        SelectCommand="GetFinalExamSectionsStatistics" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                                            <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                                            <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="CourseID" Type="Int32" />
                                                            <asp:ControlParameter ControlID="ddlGender" PropertyName="SelectedValue" Name="Gender" Type="Int32" />
                                                            <asp:ControlParameter ControlID="ddlBranch" PropertyName="SelectedValue" Name="BranchID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% } %>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <% if (ListView1.Items.Count > 0)
                                                    { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" style="width: 2%; text-align: center">م</th>
                                                            <th scope="col" style="width: 12%; text-align: center">اسم المساق</th>
                                                            <th scope="col" style="width: 8%; text-align: center">الشعبة</th>
                                                            <th scope="col" style="width: 12%; text-align: center">التاريخ</th>
                                                            <th scope="col" style="width: 13%; text-align: center">الوقت</th>
                                                            <th scope="col" style="width: 8%; text-align: center">القاعة</th>
                                                            <th scope="col" style="width: 45%; text-align: center">المراقبين</th>
                                    
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5" OnItemDataBound="ListView1_ItemDataBound">
                                                            <ItemTemplate>
                                                                <asp:Label ID="FinalExamSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="EmployeeID1" runat="server" Text='<%# Eval("EmployeeID1") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="EmployeeID2" runat="server" Text='<%# Eval("EmployeeID2") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="RoomID" runat="server" Text='<%# Eval("RoomID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td style="text-align: center; font-size: 12px; padding: 5px;"><span><%# Eval("RowNo") %></span></td>
                                                                    <td style="text-align: center; font-size: 12px; padding: 5px;"><span><%# Eval("CourseName") %></span></td>
                                                                    <td style="text-align: center; font-size: 12px; padding: 5px;"><span><%# Eval("SectionNum") %></span></td>
                                                                    <td style="text-align: center; font-size: 12px; padding: 5px;"><span><%# Eval("ExamDate") %></span></td>
                                                                    <td style="text-align: center; font-size: 12px; padding: 5px;"><span><%# Eval("ExamTime") %></span></td>
                                                                    <td style="text-align: center; font-size: 12px; padding: 5px;"><span><%# Eval("Room") %></span></td>

                                                                    <td style="text-align: center; font-size: 12px; padding: 5px;">
                                                                        <div class="col-md-5">
                                                                            <asp:DropDownList ID="ddlEmployee1" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource12" DataTextField="EmployeeName" DataValueField="ID"></asp:DropDownList>

                                                                            <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetObservers" SelectCommandType="StoredProcedure">
                                                                                <%-- <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="ddlBranch" PropertyName="SelectedValue" Name="BranchID" Type="Int32" />
                                                                                </SelectParameters>--%>
                                                                            </asp:SqlDataSource>
                                                                        </div>
                                                                        <div class="col-md-5">
                                                                            <asp:DropDownList ID="ddlEmployee2" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="EmployeeName" DataValueField="ID"></asp:DropDownList>
                                                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                SelectCommand="GetObservers" SelectCommandType="StoredProcedure">
                                                                                <%-- <SelectParameters>
                                                                                    <asp:ControlParameter ControlID="ddlBranch" PropertyName="SelectedValue" Name="BranchID" Type="Int32" />
                                                                                </SelectParameters>--%>
                                                                            </asp:SqlDataSource>
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <asp:Button ID="btnSetEmployees" runat="server" Text="تعيين" class="btn green" OnClick="btnSetEmployees_Click" />
                                                                        </div>
                                                                    </td>

                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetFinalExamSections" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" Name="SemesterID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="ddlExamDate" PropertyName="SelectedValue" Name="ExamDate" Type="String" />
                                                                <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="CourseID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="ddlGender" PropertyName="SelectedValue" Name="Gender" Type="Int32" />
                                                                <asp:ControlParameter ControlID="ddlBranch" PropertyName="SelectedValue" Name="BranchID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                                <% }
                                                    else
                                                    {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center">
                                                        <strong>لا يوجد بيانات لعرضها</strong>
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
    </div>

</asp:Content>

