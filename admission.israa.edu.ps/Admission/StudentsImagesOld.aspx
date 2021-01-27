<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsImagesOld.aspx.cs" Inherits="Admission_StudentsImagesOld" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i></div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 5%"></th>
                                <th style="width: 10%">رقم الطالب</th>
                                <th style="width: 20%">اسم الطالب</th>
                                <th style="width: 25%">الكلية - القسم</th>
                                <th style="width: 25%">صورة الطالب</th>
                                <th style="width: 20%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="StudentID" runat="server" Text='<%# Eval("ID") %>'></asp:Label></td>
                                        <td><span><%# Eval("StudentNo") %></span></td>
                                        <td><span><%# Eval("StudentName") %></span></td>
                                        <td><span><%# Eval("StudentCollege")  %> - <%# Eval("StudentDepartment") %></span></td>
                                        <td>
                                            <img src="stdimg.aspx?id=<%# Eval("ID") %>" /></td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lbIsValidImage" runat="server" class="btn default btn-xs purple" OnClick="lbIsValidImage_Click" Visible='<%# (Eval("IsValidImage").ToString()=="False") ? true:false %>'>تثبيت الصورة</a></asp:LinkButton>
                                            <asp:LinkButton ID="lbDeleteImage" runat="server" class="btn default btn-xs purple" OnClick="lbDeleteImage_Click" Visible='<%# (Eval("IsValidImage").ToString()=="False") ? true:false %>'>حذف الصورة</a></asp:LinkButton>
                                            <asp:Label ID="lbl" runat="server" Text="تم تثبيت الصورة" Visible='<%# (Eval("IsValidImage").ToString()=="True") ? true:false %>'></asp:Label>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetStudentsImage" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>

