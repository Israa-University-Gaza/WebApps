<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="DepartmentNotUsedFileNumbers.aspx.cs" Inherits="Admission_DepartmentNotUsedFileNumbers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">القبول و التسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>أرقام الملفات غير المحجوزة</span>
            </button>

        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">



    <div class="col-md-12">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>كلية الحقوق</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="form-group">
                        <label class="col-md-3 control-label isra-text-aling-right">البرنامج</label>
                        <div class="col-md-9">
                            <asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetPrograms" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label isra-text-aling-right">الكلية</label>
                        <div class="col-md-9">
                            <asp:DropDownList ID="ddlCollege" runat="server" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetProgramCollages" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 100%">الرقم</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <td><span><%# Eval("num") %></span></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetDepartmentNotUsedFileNumbers" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlCollege" Name="CollegeID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <% }
                        else
                        {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجد أرقام</strong>
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
    <%--    <div class="col-md-4">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>كلية المهن الصحية</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <% if (ListView1.Items.Count > 0)
                    { %>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="width: 100%">الرقم</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <tr>
                                    <td><span><%# Eval("num") %></span></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                            ConnectionString="<%$ ConnectionStrings:isra %>"
                            SelectCommand="GetDepartmentNotUsedFileNumbers" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter Name="CollegeID" DefaultValue="3" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
                <% }
                    else
                    {%>
                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                    <div class="col-xs-11" style="text-align: center">
                        <strong>لا يوجد أرقام</strong>
                        <div style="clear: both"></div>
                    </div>
                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                    <div style="clear: both"></div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>كلية العلوم الإدارية والمالية</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <% if (ListView1.Items.Count > 0)
                    { %>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="width: 100%">الرقم</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3">
                            <ItemTemplate>
                                <tr>
                                    <td><span><%# Eval("num") %></span></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                            ConnectionString="<%$ ConnectionStrings:isra %>"
                            SelectCommand="GetDepartmentNotUsedFileNumbers" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter Name="CollegeID" DefaultValue="4" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
                <% }
                    else
                    {%>
                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                    <div class="col-xs-11" style="text-align: center">
                        <strong>لا يوجد أرقام</strong>
                        <div style="clear: both"></div>
                    </div>
                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                    <div style="clear: both"></div>
                </div>
                <% } %>
            </div>
        </div>
    </div>--%>
</asp:Content>

