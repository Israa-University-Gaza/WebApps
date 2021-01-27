<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="SyllabusActivities.aspx.cs" Inherits="Instructor_Syllabus_SyllabusActivities" %>

<%@ Register Src="~/Instructor/Syllabus/UserControl/SyllabusMenu.ascx" TagPrefix="uc1" TagName="SyllabusMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.steps li').removeClass("active");
            $('#SyllabusActivities').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>توصيف المساق</span>
    <i class="fa fa-angle-left" style="font-size: 15px; padding: 0 5px;"></i>
    <span>الأنشطة التعليمية</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <asp:Label ID="lblSyllabusID" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">توصيف مساق
                                    <asp:Label ID="lblCourseName" runat="server"></asp:Label>
                                    - الأنشطة التعليمية</span>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div id="divMsg1" runat="server" class="alert alert-dismissable alert-top alert-success" visible="false">
                                <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;" Text=""></asp:Label>
                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-wizard">
                                <div class="form-body">
                                    <uc1:SyllabusMenu runat="server" ID="SyllabusMenu" />
                                    <div id="bar" class="progress progress-striped" role="progressbar">
                                        <div class="progress-bar progress-bar-success" style="width: 56%"></div>
                                    </div>
                                    <div class="tab-content form">
                                        <div class="form-horizontal">
                                            <asp:Label ID="lblSyllabusActivityID" runat="server" Text="" Visible="false"></asp:Label>
                                            <div class="form-body">
                                                <div class="form-group row">
                                                    <label class="col-md-3 control-label">النشاط التعليمي بالعربية</label>
                                                    <div class="col-md-8">
                                                        <asp:TextBox ID="txtArActivityName" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-md-3 control-label">النشاط التعليمي بالإنجليزية</label>
                                                    <div class="col-md-8">
                                                        <asp:TextBox ID="txtEnActivityName" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-actions fluid row">
                                                <div class="row">
                                                    <div class="col-md-offset-3 col-md-4">
                                                        <asp:Button ID="btnSave" runat="server" Text="حفظ النشاط التعليمي" CssClass="btn green" OnClick="btnSave_Click" />
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
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">توصيف المساق - النشاط التعليمي</span>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div id="divMsg2" runat="server" class="alert alert-dismissable alert-top alert-success" visible="false">
                                <asp:Label ID="lblMsg2" runat="server" Style="font-weight: bold; float: right;" Text=""></asp:Label>
                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 43%">النشاط التعليمي بالعربية</th>
                                        <th style="width: 43%">النشاط التعليمي بالانجليزية</th>
                                        <th style="width: 14%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <tr>
                                                <asp:Label ID="SyllabusActivityID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <td><span><%# Eval("ArActivityName") %></span></td>
                                                <td style="text-align:left;"><span><%# Eval("EnActivityName") %></span></td>
                                                <td>
                                                    <asp:LinkButton ID="lbSyllabusActivityEdit" runat="server" CssClass="btn default btn-xs green" OnClick="lbSyllabusActivityEdit_Click" Visible='<%# ( (Eval("InstructorAccreditSyllabus").ToString() == "0")) ? true:false %>'> <i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                    <asp:LinkButton ID="lbSyllabusActivityDelete" runat="server" CssClass="btn default btn-xs purple" OnClick="lbSyllabusActivityDelete_Click" Visible='<%# ( (Eval("InstructorAccreditSyllabus").ToString() == "0")) ? true:false %>' OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaAcademic %>' SelectCommand="GetSyllabusActivity" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblSyllabusID" PropertyName="Text" Name="SyllabusID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <% }
                                else
                                {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center;">
                                    <strong>لم يتم إضافة أنشطة تعليمية للمساق بعد</strong>
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
        </div>
    </div>
</asp:Content>
