<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="HelpRequest.aspx.cs" Inherits="Affairs_HelpRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">شئون الطلبة  </a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">طلبات المساعدة</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلبات المساعدة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-2 control-label">الفصل الدراسي</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                        SelectCommand="Select ID, ArName From Semester Where ID<>1 and IsDelete=0"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label">نوع المساعدة</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlHelpType" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                        SelectCommand="Select ID, ArName From ConstantDetails Where ConstantID=21 and IsDelete=0"></asp:SqlDataSource>
                                </div>
                            </div>

                            <hr />
                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 5%; text-align: center">#</th>
                                            <th scope="col" style="width: 12%; text-align: center">رقم الطالب</th>
                                            <th scope="col" style="width: 17%; text-align: center">اسم الطالب</th>
                                            <th scope="col" style="width: 10%; text-align: center">رقم الجوال</th>
                                            <th scope="col" style="width: 25%; text-align: center">العنوان</th>
                                            <th scope="col" style="width: 10%; text-align: center">تاريخ الطلب</th>
                                            <th scope="col" style="width: 5%; text-align: center">استفاد</th>
                                            <th scope="col" style="width: 20%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="StudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                                    <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentMobile") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentAddress") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>
                                                    <td style="text-align: center">
                                                        <asp:CheckBox ID="cbIsBenefit" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsBenefit_CheckedChanged" Checked='<%# Eval("IsBenefit") %>' /></td>
                                                    <td style="text-align: center">
                                                        <asp:LinkButton ID="lbEdit" runat="server" OnClick="lbEdit_Click" class="btn default btn-xs gray">تحرير </asp:LinkButton>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" class="btn default btn-xs green">طباعة الطلب</asp:LinkButton>
                                                        <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetSemesterHelpRequest" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                                <asp:Parameter DefaultValue="83" Name="TypeRequestID" Type="Int32"></asp:Parameter>
                                                <asp:ControlParameter ControlID="ddlHelpType" PropertyName="SelectedValue" Name="HelpType" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center">
                                        <strong>لا يوجد طلبات مساعدة في هذا الفصل الدراسي المختار</strong>
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
</asp:Content>

