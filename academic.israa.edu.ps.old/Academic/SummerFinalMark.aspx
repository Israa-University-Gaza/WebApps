<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="SummerFinalMark.aspx.cs" Inherits="Academic_SummerWorkFinalMark" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#SummerFinalMark').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>علامات الصيفي الخاص </span><i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>علامات الطلاب</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">

                    <br />
                    <br />
                    <div class="row">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col" style="width: 5%;">رقم</th>
                                    <th scope="col" style="width: 20%; text-align: center">المساق</th>
                                    <th scope="col" style="width: 10%; text-align: center">رقم الطالب</th>
                                    <th scope="col" style="width: 15%; text-align: center">اسم الطالب</th>
                                    <th scope="col" style="width: 15%; text-align: center">كلية الطالب</th>
                                    <th scope="col" style="width: 15%; text-align: center">اسم المدرس</th>
                                    <th scope="col" style="width: 20%; text-align: center">العلامة</th>
                                    <th scope="col" style="width: 15%; text-align: center"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                    <ItemTemplate>
                                        <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>

                                        <tr>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("RowNo") %></span></td>
                                              <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("CourseName") %></span></td>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentNo") %></span></td>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentName") %></span></td>
                                            <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentCollege") %></span></td>

                                            <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("EmployeeName") %></span></td>
                                            <td>
                                                <asp:TextBox ID="txtTotalMark" runat="server" CssClass="form-control" Style="text-align: center; height: 34px; font-size: 12px; color: blue;" Text='<%#  Eval("TotalMark")%>'></asp:TextBox>

                                            </td>


                                            <td>
                                                <asp:Button ID="btnSave" runat="server" Text="حفظ واعتماد" CssClass="btn green" Style="height: 26px; padding: 0 15px" OnClick="btnSave_Click" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStudentsSummerMarks" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </tbody>
                        </table>
                        <% }
                            else
                            {%>
                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                            <div class="col-xs-11" style="text-align: center">
                                <strong>لا يوجد بيانات</strong>
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

