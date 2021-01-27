<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="PlanReport.aspx.cs" Inherits="Admission_PlanReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="PlanReport.aspx" class="font-ha"></a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i></div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">

                            <div class="form-group">
                                <label class="col-md-3 control-label">الكلية</label>
                                <div class="col-md-5">
                                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From College Where ID<>1 and IsDelete=0"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">التخصص</label>
                                <div class="col-md-5">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From Department Where ID<>1 and CollegeID=@CollegeID and IsDelete=0 ">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">رقم الخطة</label>
                                <div class="col-md-5">
                                    <asp:DropDownList ID="ddlPlan" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="PlanNum" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlPlan_SelectedIndexChanged" ></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,PlanNum From [Plan] Where DepartmentID=@DepartmentID and IsDelete=0  union select -1,N'إختر رقم الخطة'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <%--id="x" runat="server" visible="false"--%>
                            <div class="form-group" >
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4>الخطة الدراسية</h4>
                                                </div>
                                                <div class="col-md-9" style="text-align: left; font-size: 14px; padding: 9px;">
                                                    <asp:LinkButton ID="lbPDF" runat="server" OnClick="lbPDF_Click" >تصدير الى pdf</asp:LinkButton>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <% if (Repeater1.Items.Count > 0)
                                                   { %>
                                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
                                                    <ItemTemplate>
                                                        <div class="col-md-6 isra-clear">
                                                            <asp:Label ID="lblPlanID" runat="server" Text='<%# Eval("PlanID") %>' Visible="false"></asp:Label>
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
                                                                                    <th style="width: 15%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>الكود</th>
                                                                                    <th style="width: 35%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق</th>
                                                                                    <th style="width: 30%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>متطلب سابق</th>
                                                                                    <th style="width: 20%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . الساعات</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                                                            <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                                                                            <td style="text-align: center"><span><%# Eval("PreRequestCourse") %></span></td>
                                                                                            <td style="text-align: center"><span><%# Eval("CourseNumOfHours") %></span></td>
                                                                                        </tr>
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
                                                                                <tr>
                                                                                    <td colspan="3" style="text-align: center" class="font-ln">مجموع الساعات</td>
                                                                                    <td style="text-align: center"><span><%# Eval("SumOfHours") %></span></td>
                                                                                </tr>
                                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                                    SelectCommand="GetCSemesterPlanCourses" SelectCommandType="StoredProcedure">
                                                                                    <SelectParameters>
                                                                                        <asp:ControlParameter ControlID="lblPlanID" PropertyName="Text" Name="PlanID" Type="Int32" />
                                                                                        <asp:ControlParameter ControlID="CSemesterID" PropertyName="Text" Name="CSemesterID" Type="Int32" />
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
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                                    SelectCommand="GetPlanSemester" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="ddlPlan" PropertyName="SelectedValue" Name="PlanID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <% }
                                                   else
                                                   {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center;">
                                                        <strong>لم يتم تعبأة الخطة دراسية </strong>
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

