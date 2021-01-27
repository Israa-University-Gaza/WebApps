<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="ExternalTransformation.aspx.cs" Inherits="Student_ExternalTransformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#ExternalTransformation').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">المساقات المعادلة</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>المساقات المعادلة</div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <% if (Repeater1.Items.Count > 0)
                           { %>
                        <table class="table table-striped table-bordered table-advance table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 6%; text-align: center"><i class="fa fa-barcode" style="width: 20px;"></i>#</th>
                                    <th style="width: 32%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>المساق المعادل</th>
                                    <th style="width: 15%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . س . م</th>
                                    <th style="width: 32%; text-align: center"><i class="fa fa-book" style="width: 20px;"></i>معادل بـ</th>
                                    <th style="width: 15%; text-align: center"><i class="fa  fa-clock-o" style="width: 20px;"></i>ع . س . م</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <tr>
                                            <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("CourseArName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("CourseNumOfHours") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("ETransWithCourseName") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("ETransWithCourseHours") %></span></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetAccrediteETransformation" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <% }
                           else
                           {%>
                        <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                            <div class="col-xs-11" style="text-align: center;">
                                <strong>لا يوجد مساقات معادلة تم إعتمادها</strong>
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

