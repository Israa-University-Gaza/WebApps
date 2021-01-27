<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentSemesterRegisterStatistics.aspx.cs" Inherits="Admission_StudentSemesterRegisterStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إحصائيات التسجيل الفصلي للطلاب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <label class="col-md-1 control-label">الكلية</label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From College Where ID<>1 and IsDelete=0"></asp:SqlDataSource>
                        </div>
                        <label class="col-md-1 control-label">القسم</label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From Department Where ID<>1 and CollegeID=@CollegeID and IsDelete=0">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <label class="col-md-1 control-label">نوع الطالب</label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlStudentType" runat="server" CssClass="form-control" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From StudentTypes Where IsDelete=0 and IsActive=1"></asp:SqlDataSource>
                        </div>
                        <label class="col-md-1 control-label">الجنس</label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                <asp:ListItem Value="1">ذكر</asp:ListItem>
                                <asp:ListItem Value="2">أنثى</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <label class="col-md-1 control-label"></label>
                        <div class="col-md-3">
                            <asp:Button ID="btnView" runat="server" Text="عرض" CssClass="btn green" OnClick="btnView_Click" />
                        </div>
                    </div>
                    <hr />
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 15%; text-align: center;">رقم الطالب</th>
                                <th style="width: 21%; text-align: center;">اسم الطالب</th>
                                <th style="width: 16%; text-align: center;">ع.س.مسجلة</th>
                                <th style="width: 16%; text-align: center;">ع.س.معادلة</th>
                                <th style="width: 16%; text-align: center;">مجموع الساعات</th>
                                <th style="width: 16%; text-align: center;">الرصيد</th>
                                <th style="width: 20%; text-align: center;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr <%# ((int.Parse(Eval("CountOfRegisteredHours").ToString()) + int.Parse(Eval("CountOfTransHours").ToString()))!=int.Parse(Eval("CountOfTotalHours").ToString()))?"style='background-color:#F5F5F5'":"" %>>
                                        <asp:Label ID="StudentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <td style="text-align: center;"><span><%# Eval("StudentNo") %></span></td>
                                        <td style="text-align: center;"><span><%# Eval("StudentName") %></span></td>
                                        <td style="text-align: center;"><span><%# Eval("CountOfRegisteredHours") %></span></td>
                                        <td style="text-align: center;"><span><%# Eval("CountOfTransHours") %></span></td>
                                        <td style="text-align: center;"><span><%# int.Parse(Eval("CountOfRegisteredHours").ToString()) + int.Parse(Eval("CountOfTransHours").ToString())  %></span></td>
                                        <td style="text-align: center;"><span><%# Eval("Balance") %></span></td>
                                        <td style="text-align: center;">
                                            <asp:LinkButton ID="lbOpenStudent" runat="server" class="btn default btn-xs black" OnClick="lbOpenStudent_Click">فتح الملف</asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetStudentSemesterRegisterStatistics" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlStudentType" PropertyName="SelectedValue" Name="StudentTypeID" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlGender" PropertyName="SelectedValue" Name="Gender" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="50" PagedControlID="ListView1" class="pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                            <asp:NumericPagerField ButtonType="Link" />
                            <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
