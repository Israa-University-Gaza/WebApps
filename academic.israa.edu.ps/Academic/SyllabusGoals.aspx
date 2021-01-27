<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="SyllabusGoals.aspx.cs" Inherits="Academic_SyllabusGoals" %>

<%@ Register Src="~/UserControl/SyllabusMenu.ascx" TagPrefix="uc1" TagName="SyllabusMenu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        $('document').ready(function () {
            $('.steps li').removeClass("active");
            $('#SyllabusGoals').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">توصيف المساق</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>أهداف المساق</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblSyllabusID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblAccreditationDepartmentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblSyllabusGoalID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>أهداف مساق-
                    <asp:Label ID="lblCourseName" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                </div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-wizard">
                            <div class="form-body">
                                <uc1:SyllabusMenu runat="server" ID="SyllabusMenu" />
                               <hr />
                                <div class="tab-content form">
                                    <div class="form-horizontal">
                                        <div class="form-body">
                                            <div class="form-group row">
                                                <label class="col-md-3 control-label">الهدف بالعربية</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="txtArGoal" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 control-label">الهدف بالإنجليزية</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="txtEnGoal" runat="server" CssClass="form-control" Style="text-align: left;"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-actions fluid row">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-4">
                                                    <asp:Button ID="btnSave" runat="server" Text="حفظ الهدف" CssClass="btn blue" OnClick="btnSave_Click" />
                                                </div>
                                                <div class="col-md-4 text-right">
                                                    <asp:LinkButton ID="lbPrev" runat="server" CssClass="btn default" OnClick="lbPrev_Click">السابق</asp:LinkButton>
                                                    <asp:LinkButton ID="lbNext" runat="server" CssClass="btn green" OnClick="lbNext_Click">التالي</asp:LinkButton>
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
    </div>
    <div class="col-md-12">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>أهداف مساق-
                    <asp:Label ID="lblCourseName1" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                </div>
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
                            <th style="width: 43%">الهدف بالعربية</th>
                            <th style="width: 43%; text-align: left">الهدف بالانجليزية</th>
                            <th style="width: 14%"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <tr>
                                    <asp:Label ID="SyllabusGoalID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <td><span><%# Eval("ArGoal") %></span></td>
                                    <td style="text-align: left;"><span><%# Eval("EnGoal") %></span></td>
                                    <td>
                                        <asp:LinkButton ID="lbSyllabusGoalEdit" runat="server" CssClass="btn default btn-xs green" OnClick="lbSyllabusGoalEdit_Click" Visible='<%# ( (Eval("CanDepartmentEdit").ToString() == "1")) ? true:false %>'> <i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                        <asp:LinkButton ID="lbSyllabusGoalDelete" runat="server" CssClass="btn default btn-xs purple" OnClick="lbSyllabusGoalDelete_Click" Visible='<%# ( (Eval("CanDepartmentEdit").ToString() == "1")) ? true:false %>' OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Isra %>' SelectCommand="GetSyllabusGoal" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblSyllabusID" PropertyName="Text" Name="SyllabusID" Type="Int32"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="lblAccreditationDepartmentID" PropertyName="Text" Name="AccreditationDepartmentID" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tbody>
                </table>
                <% }
                    else
                    {%>
                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                    <div class="col-xs-11" style="text-align: center;">
                        <strong>لم يتم إضافة أهداف للمساق بعد</strong>
                        <div style="clear: both"></div>
                    </div>
                    <button type="button" style="margin-top: 7px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                    <div style="clear: both"></div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</asp:Content>

