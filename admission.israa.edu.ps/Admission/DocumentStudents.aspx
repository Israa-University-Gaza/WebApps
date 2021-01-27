<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="DocumentStudents.aspx.cs" Inherits="Admission_DocumentStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../assets/plugins/ckeditor/ckeditor.js"></script>
    <script src="../assets/scripts/form-validation.js"></script>
     <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudentDocumentStatistic').addClass("active open");
            $('#StudentDocumentStatistic_2 a').css("background-color", "#575757");
            $('#StudentDocumentStatistic a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="ChangePassword.aspx" class="font-ha">احصائية طلاب المستند
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <asp:Label ID="lblPlanID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>بحث حسب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-1 control-label isra-text-aling-right">البرنامج</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlProgram" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Program] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1,N'الكل'"></asp:SqlDataSource>
                                </div>

                                <label class="col-md-1 control-label isra-text-aling-right">الكلية</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [College] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (ProgramID=@ProgramID or @ProgramID=-1)) union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <label class="col-md-1 control-label isra-text-aling-right">القسم</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Department] WHERE (([IsActive] = 1) AND ([IsDelete] = 0) AND (CollegeID=@CollegeID or @CollegeID=-1)) union select -1,N'الكل'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-1 control-label isra-text-aling-right">الجنس</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="-1">الكل</asp:ListItem>
                                        <asp:ListItem Value="1">ذكر</asp:ListItem>
                                        <asp:ListItem Value="2">أنثى</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <label class="col-md-1 control-label isra-text-aling-right">نوع الطالب</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlStudentType" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From StudentTypes Where IsDelete=0 and IsActive=1 union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label isra-text-aling-right">حالة الطالب</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlStudentStatus" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource8" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID,ArName From StudentStatus Where IsDelete=0 and IsActive=1 union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-1 control-label">الفصل الدراسي </label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlSemesterID" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="SELECT ID, ArName FROM [Semester] WHERE (([IsDelete] = 0) And Code<>'111111111') union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                                <label class="col-md-1 control-label">نوع المستند </label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlDocumentTypeID" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="Select ID , Name from [dbo].[StdDocumentType] Where IsDelete=0 and IsActive=1 union select -1,N'الكل'"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-1 col-md-9">
                                <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn blue" OnClick="btnSearch_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-reorder"></i>عرض مستندات الطلاب
                    </div>
                    <div class="tools">
                        <a href="" class="collapse"></a>
                        <a href="" class="remove"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-body">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 30%">رقم الطالب</th>
                                    <th style="width: 10%; text-align: center">اسم الطالب</th>
                                    <th style="width: 20%">المستند</th>
                                    <th style="width: 20%; text-align: center">تاريخ الرفع</th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource13">
                                    <ItemTemplate>
                                        <asp:Label ID="StdDocumentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("StudentNo") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                            <td><a href='http://admission.israa.edu.ps/Document/Student/<%# Eval("DocumentLink") %>' target="_blank"><%# Eval("StdDocumentType") %></a></td>
                                            <td style="text-align: center"><span><%# Eval("InsertDate","{0:yyyy/MM/dd}") %></span></td>

                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource13" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetStudentsDocument" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" DefaultValue="-1" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" DefaultValue="-1" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" DefaultValue="-1" Name="DepartmentID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlGender" PropertyName="SelectedValue" DefaultValue="-1" Name="GenderID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlStudentType" PropertyName="SelectedValue" DefaultValue="-1" Name="StudentTypeID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlStudentStatus" PropertyName="SelectedValue" DefaultValue="-1" Name="StudentStatusID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlSemesterID" PropertyName="SelectedValue" DefaultValue="-1" Name="RegisteredSemesterID" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="ddlDocumentTypeID" PropertyName="SelectedValue" Name="StdDocumentTypeID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="30" PagedControlID="ListView1" class="pager">
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
                                <strong>لم يتم إضافة مستندات بعد</strong>
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

</asp:Content>

