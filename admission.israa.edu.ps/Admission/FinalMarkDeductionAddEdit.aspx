<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="FinalMarkDeductionAddEdit.aspx.cs" Inherits="Admission_FinalMarkDeductionAddEdit" %>

<%@ Register Src="~/Admission/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_2 a').css("background-color", "#575757");
            $('#Student a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>عقوبة خصم علامة للطالب</span>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblFinalMarkDeductionID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStdStatusID" runat="server" Visible="false"></asp:Label>

    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
            <div class="tools">
                <a class="remove" href="javascript:;"></a>
            </div>
        </div>
        <div class="portlet-body">
            <div class="row">

                <uc1:StudentSideBar runat="server" ID="StudentSideBar" ActiveTab="FinalMarkDeductionAddEdit" />

                <div style="width: 81%; float: right;">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-10">
                                <h4>إضافة /تعديل عقوبة خصم علامة للطالب</h4>
                            </div>
                        </div>
                        <hr style="margin: 10px 0 15px 0" />

                        <div class="form-group row">
                            <label class="col-md-2 control-label">الفصل الدراسي : </label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlSemester" runat="server" class="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            </div>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="Select ID, ArName From Semester Where Code<>'111111111' and IsActive=1 and IsDelete=0 Order by ID DESC"></asp:SqlDataSource>

                            <label class="col-md-2 control-label isra-text-aling-right">المساق</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="CourseNameCode" DataValueField="ID"></asp:DropDownList>

                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetSemesterStudentCourses" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group row">

                            <label class="col-md-2 control-label isra-text-aling-right">نوع الخصم</label>

                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlDeductionMarkType" runat="server" AutoPostBack="true" CssClass="select2_category form-control">
                                    <asp:ListItem Value="-1" Selected="True">اختر نوع الخصم</asp:ListItem>
                                    <asp:ListItem Value="1">نصفي</asp:ListItem>
                                    <asp:ListItem Value="2">نهائي</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <label class="col-md-2 control-label isra-text-aling-right">قيمة الخصم</label>

                            <div class="col-md-4">
                                <asp:TextBox ID="txtDeductionValue" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">

                            <label class="col-md-2 control-label isra-text-aling-right">ملاحظات</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtNotes" runat="server" class="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 15px;">
                            <div class="form-group row">

                                <label class="col-md-2 control-label isra-text-aling-right"></label>
                                <div class="col-md-10">
                                    <asp:Button ID="btnSave" runat="server" Text="حفظ" OnClick="btnSave_Click" CssClass="btn green" />
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-3">
                                <h4>عقوبات الطالب</h4>
                            </div>
                        </div>
                        <hr style="margin: 10px 0 15px 0" />

                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-hover" id="sample_editable_1 ">
                            <thead>
                                <tr>
                                    <th style="width: 2%;">م</th>
                                    <th style="width: 25%; text-align: center;">الفصل الدراسي</th>
                                    <th style="width: 15%; text-align: center;">اسم المساق</th>
                                    <th style="width: 30%; text-align: center;">سبب الخصم</th>
                                    <th style="width: 12%; text-align: center;">نوع الخصم </th>
                                    <th style="width: 12%; text-align: center;">تصنيف الخصم </th>
                                    <th style="width: 10%; text-align: center;">الخصم</th>
                                    <th style="width: 3%; text-align: center;">منفذ</th>
                                    <th style="width: 3%; text-align: center;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <td><%# Eval("RowNo") %></td>
                                            <td style="text-align: center"><%# Eval("SemesterName") %></td>
                                            <td style="text-align: center"><%# Eval("CourseName") %></td>
                                            <td style="text-align: center"><%# Eval("Notes") %></td>
                                            <td style="text-align: center"><%# Eval("DeductionMarkType") %></td>
                                            <td style="text-align: center"><%# Eval("DeductionType") %></td>
                                            <td style="text-align: center"><%# Eval("DeductionValue") %></td>
                                            <td style="text-align: center">
                                                <asp:CheckBox ID="cbIsActive" runat="server" Checked='<%# Eval("IsDone") %>' Enabled="false" /></td>
                                            <td>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click" Visible='<%# ( (Eval("CanEditDelete").ToString() == "1")) ? true:false %>'><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" Visible='<%# ( (Eval("CanEditDelete").ToString() == "1")) ? true:false %>' OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i>  حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetMarkDeduction" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <div class="clearfix"></div>
                        <div class="col-md-12">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                    <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                    <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                                    <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                    <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                        <div class="clearfix"></div>
                        <% } %>
                        <%  else
                            { %>
                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                            <div class="col-xs-11" style="text-align: center">
                                <strong>لا يوجد عقوبات خصم علامات للعرض  </strong>
                                <div style="clear: both"></div>
                            </div>
                            <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                            <div style="clear: both"></div>
                        </div>
                        <%  } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

