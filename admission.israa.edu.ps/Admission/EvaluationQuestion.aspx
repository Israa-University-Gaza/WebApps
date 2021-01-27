<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="EvaluationQuestion.aspx.cs" Inherits="Admission_EvaluationQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            FormValidation.init();
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu1').addClass("active open");
            $('#menu1_1 a').css("background-color", "#575757");
            $('#menu1 a span.arrow').addClass("open");
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
                <span></span><i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="Block.aspx"></a></li>
            </ul>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>أسئلة التقيم</div>
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
                                <th style="width: 50%">السؤال</th>
                                <th style="width: 10%">نوعه</th>
                                <th style="width: 15%">مجموعته</th>
                                <th style="width: 10%; text-align: center">فعال</th>
                                <th style="width: 15%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="EvaluationQuestionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr>
                                        <td><span><%# Eval("QuestionName") %></span></td>
                                        <td><span><%# Eval("EvaluationQuestionType") %></span></td>
                                        <td><span><%# Eval("EvaluationQuestionGroup") %></span></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' />
                                        </td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i></a></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>"
                                SelectCommand="Select *, (Select TypeName From EvaluationQuestionType Where ID=EvaluationQuestionTypeID)as EvaluationQuestionType,(select GroupName From EvaluationQuestionGroup where ID=EvaluationQuestionGroupID) as EvaluationQuestionGroup From EvaluationQuestion Where IsDelete=0 order by ID DESC"></asp:SqlDataSource>
                        </tbody>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                            <asp:NumericPagerField ButtonType="Link" />
                            <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                    <div class="clearfix"></div>
                    <% }
                        else
                        {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center;">
                            <strong>لم يتم إضافة بعد</strong>
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
                <asp:Label ID="lblEvaluationQuestionID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل سؤال التقيم</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label">السؤال</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtQuestionName" runat="server" CssClass="form-control " placeholder="الرجاء ادخال إسم الحزمة"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">النوع</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlEvaluationQuestionType" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="TypeName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>" SelectCommand="SELECT ID, TypeName FROM [EvaluationQuestionType]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">المجموعة</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlEvaluationQuestionGroup" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="GroupName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaStudentAttendance %>" SelectCommand="SELECT ID, GroupName FROM [EvaluationQuestionGroup]"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-9">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
