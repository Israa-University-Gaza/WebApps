<%@ page title="" language="C#" masterpagefile="~/Academic/MasterPage.master" autoeventwireup="true" codefile="OfferdCourseManage2.aspx.cs" inherits="Academic_OfferdCourseManage2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
</asp:content>
<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder2" runat="Server">

      <div class="row">
         
        <div class="col-md-12">
            <div class="portlet box blue">
                  
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>المساقات المطروحة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
                    <div class="row">
                        <label class="control-label col-md-2">الفصل الدراسي </label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="dataBind_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                        <label class="col-md-2 control-label">القسم</label>
                        <div class="col-md-5">
                                              <asp:DropDownList ID="ddlDepartment" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="ddlDepartments3" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>


                                </asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <label class="col-md-2 control-label">تصنيف المساق المطروح</label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlOfferdCourseType" runat="server" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="dataBind_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlOfferdCourseTypes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>

                        <label class="col-md-2 control-label">تصنيف المساق</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlCCourseType" runat="server" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="dataBind_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlCCourseTypes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                        <label class="col-md-1 control-label">المستوى</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlStudyLevel" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="dataBind_Click"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="ddlStudyLevels" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <label class="col-md-2 control-label">الكود</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtCourseCode" runat="server" CssClass="form-control" placeholder="الرجاء ادخال كود المساق"></asp:TextBox>
                        </div>
                        <label class="col-md-2 control-label">الإسم</label>
                        <div class="col-md-5">
                            <asp:TextBox ID="txtArName" runat="server" CssClass="form-control" placeholder="الرجاء ادخال اسم المساق بالعربي"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-offset-2 col-md-3">
                            <asp:Button ID="btnView" runat="server" Text="عرض" class="btn green" OnClick="dataBind_Click" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-condensed table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 2%; font-size: 12px;">م</th>
                                        <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">الكود</th>
                                        <th style="text-align: center; width: 15%; border-top: none!important; font-size: 12px;">اسم المساق</th>
                                        <th style="text-align: center; width: 13%; border-top: none!important; font-size: 12px;">القسم</th>
                                        <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">نوع المساق </th>
                                        <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">تصنيف المساق </th>
                                        <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">ع.شعب المساق </th>
                                        <th style="text-align: center; width: 10%; border-top: none!important; font-size: 12px;">ع.طلاب شعب المساق </th>
                                        <th style="text-align: center; width: 8%; border-top: none!important; font-size: 12px;">تاريخ الإمتحان</th>
                                        <th style="text-align: center; width: 8%; border-top: none!important; font-size: 12px;">وقت الإمتحان</th>
                                        <th style="text-align: center; width: 3%; border-top: none!important; font-size: 12px;"></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                            <asp:Label ID="OfferdCourseID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <tr>
                                                <td><span><%# Eval("RowNo") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("DepartmentArName") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("CourseType") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("CCourseType") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("SectionCount") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("StudentCount") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("ExamDate") %></span></td>
                                                <td style="text-align: center"><span><%# Eval("ExamTime") %></span></td>
                                                
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetFilterdOfferdCourses1" SelectCommandType="StoredProcedure">
                                        <SelectParameters>

                                            <asp:ControlParameter ControlID="ddlSemester" Name="SemesterID" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlCCourseType" Name="CourseCategoryID " PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                                            <asp:ControlParameter ControlID="ddlDepartment" Name="DepartmentID" PropertyName="SelectedValue" Type="Int32"/>
                                            <asp:ControlParameter ControlID="ddlOfferdCourseType" Name="OfferdCourseTypeID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                                            <asp:ControlParameter ControlID="ddlStudyLevel" Name="StudyLevelID" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                                            <asp:ControlParameter ControlID="txtCourseCode" Name="CourseCode" PropertyName="Text" Type="String" DefaultValue="%" />
                                            <asp:ControlParameter ControlID="txtArName" Name="CourseName" PropertyName="Text" Type="String" DefaultValue="%" />
                                            
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="50" PagedControlID="ListView1" class="pager">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                    <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                    <asp:NumericPagerField ButtonType="Link" ButtonCount="1" />
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
                                    <strong>لا يوجد مساقات مطروحة يمكن عرضها</strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <hr />
                  
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:content>

