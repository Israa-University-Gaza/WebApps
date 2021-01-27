<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="SemesterAgenda.aspx.cs" Inherits="Admission_SemesterAgenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha"> القبول و التسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="SemesterAgenda.aspx" class="font-ha">الأجندة الفصلية</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الأجندة الفصلية</div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="control-label col-md-3">الفصل الدراسي</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlSemester" runat="server" DataSourceID="SqlDataSource3" CssClass="select2_category form-control" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="select top(1) * From [dbo].[Semester] where ID not in(select ID from [dbo].[Semester] where Code='111111111' and IsDelete=0)" >
                                        <%--<SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                        </SelectParameters>--%>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10" style="margin-right: 8.4%!important; margin-top: 30px!important;">
                            <div>
                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" CssClass="col-md-6">
                                            <ItemTemplate>
                                                <table class="table table-striped table-hover">
                                                    <thead>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 50%">بداية التسجيل</td>
                                                            <td style="width: 20%"><span><%# Eval("RegisterBeginning","{0:dddd}") %></span></td>
                                                            <td style="width: 30%"><span><%# Eval("RegisterBeginning","{0: yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>بداية الدراسة</td>
                                                            <td><span><%# Eval("StudyBeginning","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("StudyBeginning","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>بداية الإضافة</td>
                                                            <td><span><%# Eval("AddBeginning","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("AddBeginning","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>نهاية السحب</td>
                                                            <td><span><%# Eval("DelayEnd","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("DelayEnd","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>بداية الإمتحانات النهائية</td>
                                                            <td><span><%# Eval("StartFinalExams","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("StartFinalExams","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </ItemTemplate>
                                        </asp:FormView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT * FROM [Semester] WHERE (([ID] = @ID) AND ([IsDelete] = 0))">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSemester" Name="ID" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div>

                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource1" CssClass="col-md-6">
                                            <ItemTemplate>
                                                <table class="table table-striped table-hover">
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 50%">نهاية التسجيل</td>
                                                            <td style="width: 20%"><span><%# Eval("RegisterEnd","{0:dddd}") %></span></td>
                                                            <td style="width: 30%"><span><%# Eval("RegisterEnd","{0:yyyy/MM/dd}") %></span></td>

                                                        </tr>
                                                        <tr>
                                                            <td>نهاية الدراسة</td>
                                                            <td><span><%# Eval("StudyEnd","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("StudyEnd","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>نهاية الإضافة</td>
                                                            <td><span><%# Eval("AddEnd","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("AddEnd","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>نهاية الإنسحاب</td>
                                                            <td><span><%# Eval("WithdrawEnd","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("WithdrawEnd","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>نهاية الإمتحانات النهائية</td>
                                                            <td><span><%# Eval("EndFinalExams","{0:dddd}") %></span></td>
                                                            <td><span><%# Eval("EndFinalExams","{0:yyyy/MM/dd}") %></span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </ItemTemplate>
                                        </asp:FormView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT * FROM [Semester] WHERE (([ID] = @ID) AND ([IsDelete] = 0))">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSemester" Name="ID" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
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

