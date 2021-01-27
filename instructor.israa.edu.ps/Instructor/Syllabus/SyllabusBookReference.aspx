<%@ page title="" language="C#" masterpagefile="~/Instructor/MasterPage.master" autoeventwireup="true" codefile="SyllabusBookReference.aspx.cs" inherits="Instructor_Syllabus_SyllabusBookReference" %>

<%@ register src="~/Instructor/Syllabus/UserControl/SyllabusMenu.ascx" tagprefix="uc1" tagname="SyllabusMenu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.steps li').removeClass("active");
            $('#SyllabusBookReference').addClass("active");
        });
    </script>
</asp:Content>
<asp:content id="Content3" contentplaceholderid="PageTitlePlaceHolder" runat="Server">
    <span>توصيف المساق</span>
    <i class="fa fa-angle-left" style="font-size: 15px; padding: 0 5px;"></i>
    <span>الكتب والمراجع</span>
</asp:content>
<asp:content id="Content4" contentplaceholderid="ContentPlaceHolder" runat="Server">
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
                                    - الكتب والمراجع</span>
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
                                        <div class="progress-bar progress-bar-success" style="width: 30.5%"></div>
                                    </div>
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
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">كتب المساق</span>
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
                                        <th style="width: 80%;">اسم الكتاب</th>
                                        <th style="width: 20%"></th>
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
                                                    <asp:LinkButton ID="lbSyllabusBookEdit" runat="server" CssClass="btn default btn-xs green" OnClick="lbSyllabusBookEdit_Click" Visible='<%# ((Eval("InstructorAccreditSyllabus").ToString() == "0")) ? true:false %>'><i class="fa fa-edit"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="lbSyllabusBookDelete" runat="server" CssClass="btn default btn-xs purple" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbSyllabusBookDelete_Click" Visible='<%# ((Eval("InstructorAccreditSyllabus").ToString() == "0")) ? true:false %>'><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaAcademic %>' SelectCommand="GetSyllabusBook" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
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
            </div>
        </div>
        <div class="col-md-6">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">مراجع المساق</span>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div id="divMsg3" runat="server" class="alert alert-dismissable alert-top alert-success" visible="false">
                                <asp:Label ID="lblMsg3" runat="server" Style="font-weight: bold; float: right;" Text=""></asp:Label>
                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView2.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 80%;">اسم المرجع</th>
                                        <th style="width: 20%"></th>
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
                                                    <asp:LinkButton ID="lbSyllabusReferenceEdit" runat="server" CssClass="btn default btn-xs green" OnClick="lbSyllabusReferenceEdit_Click" Visible='<%# ( (Eval("InstructorAccreditSyllabus").ToString() == "0")) ? true:false %>'><i class="fa fa-edit"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="lbSyllabusReferenceDelete" runat="server" CssClass="btn default btn-xs purple" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')" OnClick="lbSyllabusReferenceDelete_Click" Visible='<%# ( (Eval("InstructorAccreditSyllabus").ToString() == "0")) ? true:false %>'><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IsraaAcademic %>' SelectCommand="GetSyllabusReference" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
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
        </div>
    </div>
</asp:content>
