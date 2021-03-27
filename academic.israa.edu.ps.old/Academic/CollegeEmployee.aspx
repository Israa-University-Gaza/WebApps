﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="CollegeEmployee.aspx.cs" Inherits="Academic_CollegeEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudyTable').addClass("active open");
            $('#StudyTable_2 a').css("background-color", "#575757");
            $('#StudyTable a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha"></a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>محاضري الكليات</span><i class="fa fa-angle-left"></i>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>محاضري الكليات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="col-md-2 control-label">البرنامج</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlFilterProgram" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilteProgram_SelectedIndexChanged" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeePrograms" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <label class="col-md-2 control-label">الكلية</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlFilterCollege" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterCollege_SelectedIndexChanged" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeCollages" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlFilterProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                       { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 10%">البرنامج</th>
                                <th style="width: 20%">الكلية</th>
                                <th style="width: 20%; text-align: center">رقم المحاضر</th>
                                <th style="width: 20%; text-align: center">المحاضر</th>
                                <th style="width: 20%; text-align: center">المؤهل</th>
                                <th style="width: 20%; text-align: center">نوع الموظف</th>
                                <th style="width: 10%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="CollegeEmployeeID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <td><span><%# Eval("Program") %></span></td>
                                        <td><span><%# Eval("College") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("EmployeeNo") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Employee") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Qualification") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("EmployeeType") %></span></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                             <% if (Permissions.Contains("AcademicCollegeEmployeeAccredit"))
                                               { %>
                                            <asp:LinkButton ID="lbAccrediation" runat="server" Visible='<%# Convert.ToBoolean(Eval("AcademicAccreditation").ToString())==true? false : true %>' Text="اعتماد" class="btn default btn-xs green" OnClick="lbAccrediation_Click"></asp:LinkButton>
                                            <%} %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetCollegeEmployees" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlFilterProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlFilterCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                            <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
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
                            <strong>لم يتم إضافة محاضرين للكليات بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>


        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل محاضري الكلية</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-4 control-label">البرنامج</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlProgramID" runat="server" DataSourceID="SqlDataSource7" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlProgramID_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeePrograms" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">الكلية</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlCollegeID" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeCollages" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                            <asp:ControlParameter ControlID="ddlProgramID" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">المحاضر </label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlEmployeeID" runat="server" DataSourceID="SqlDataSource3" DataTextField="DisplayName" DataValueField="ID" CssClass="select2_category form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>" SelectCommand="GetAllEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">المؤهل</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlQualification" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="-1">اختر المؤهل</asp:ListItem>
                                        <asp:ListItem Value="1">بكالوريوس</asp:ListItem>
                                        <asp:ListItem Value="2">ماجستير</asp:ListItem>
                                        <asp:ListItem Value="3">دكتوراة</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-md-4 control-label">نوع الموظف</label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlEmployeeType" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="-1">اختر نوع الموظف</asp:ListItem>
                                        <asp:ListItem Value="1">دائم/عقد</asp:ListItem>
                                        <asp:ListItem Value="2">بالساعة</asp:ListItem>
                                        <asp:ListItem Value="3">متطوع</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-4 col-md-8">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

