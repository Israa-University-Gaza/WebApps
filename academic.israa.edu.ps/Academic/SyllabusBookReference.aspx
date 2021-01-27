<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="SyllabusBookReference.aspx.cs" Inherits="Academic_SyllabusBookReference" %>

<%@ Register Src="~/UserControl/SyllabusMenu.ascx" TagPrefix="uc1" TagName="SyllabusMenu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.steps li').removeClass("active");
            $('#SyllabusBookReference').addClass("active");
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
                <span>الكتب والمراجع</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblSyllabusID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblAccreditationDepartmentID" runat="server" Visible="false"></asp:Label>
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>كتب ومراجع مساق-
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
                                            <asp:Label ID="lblSyllabusBookID" runat="server" Text="" Visible="false"></asp:Label>
                                            <div class="form-group row">
                                                <label class="col-md-3 control-label">الكتاب</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="txtSyllabusBook" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions fluid row">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-8">
                                                    <asp:Button ID="btnSyllabusBookSave" runat="server" Text="حفظ الكتاب" CssClass="btn green" OnClick="btnSyllabusBookSave_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-body">
                                            <asp:Label ID="lblSyllabusReferenceID" runat="server" Text="" Visible="false"></asp:Label>
                                            <div class="form-group row">
                                                <label class="col-md-3 control-label">المرجع</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="txtSyllabusReference" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions fluid row">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-4">
                                                    <asp:Button ID="btnSyllabusReferenceSave" runat="server" Text="حفظ المرجع" CssClass="btn green" OnClick="btnSyllabusReferenceSave_Click" />
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

    <div class="row">
        <div class="col-md-6">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>كتب مساق-
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
                                <th style="width: 70%;">اسم الكتاب</th>
                                <th style="width: 30%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="SyllabusBookID" runat="server" Visible="false" Text='<%# Eval("ID") %>'></asp:Label>
                                        <td>
                                            <asp:Label ID="lblSyllabusBook" runat="server" Text='<%# Eval("BookName") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbSyllabusBookEdit" runat="server" CssClass="btn default btn-xs green" OnClick="lbSyllabusBookEdit_Click" Visible='<%# ((Eval("CanDepartmentEdit").ToString() == "1")) ? true:false %>'><i class="fa fa-edit"></i>تحرير</asp:LinkButton>
                                            <asp:LinkButton ID="lbSyllabusBookDelete" runat="server" CssClass="btn default btn-xs purple" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbSyllabusBookDelete_Click" Visible='<%# ((Eval("CanDepartmentEdit").ToString() == "1")) ? true:false %>'><i class="fa fa-trash-o"></i>حذف</asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetSyllabusBook" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblSyllabusID" PropertyName="Text" Name="SyllabusID"></asp:ControlParameter>
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
                            <strong>لم يتم إضافة كتب للمساق بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 7px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>مراجع مساق-
                    <asp:Label ID="lblCourseName2" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                    </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <% if (ListView2.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 70%;">اسم المرجع</th>
                                <th style="width: 30%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="SyllabusReferenceID" runat="server" Visible="false" Text='<%# Eval("ID") %>'></asp:Label>
                                        <td>
                                            <asp:Label ID="lblSyllabusReference" runat="server" Text='<%# Eval("Reference") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbSyllabusReferenceEdit" runat="server" CssClass="btn default btn-xs green" OnClick="lbSyllabusReferenceEdit_Click" Visible='<%# ( (Eval("CanDepartmentEdit").ToString() == "1")) ? true:false %>'><i class="fa fa-edit"></i>تحرير</asp:LinkButton>
                                            <asp:LinkButton ID="lbSyllabusReferenceDelete" runat="server" CssClass="btn default btn-xs purple" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbSyllabusReferenceDelete_Click" Visible='<%# ( (Eval("CanDepartmentEdit").ToString() == "1")) ? true:false %>'><i class="fa fa-trash-o"></i>حذف</asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetSyllabusReference" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblAccreditationDepartmentID" PropertyName="Text" Name="AccreditationDepartmentID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="lblSyllabusID" PropertyName="Text" Name="SyllabusID"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <% }
                        else
                        {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center;">
                            <strong>لم يتم إضافة مراجع للمساق بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 7px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

