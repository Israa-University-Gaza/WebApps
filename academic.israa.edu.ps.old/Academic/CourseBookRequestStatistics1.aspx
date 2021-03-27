<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="CourseBookRequestStatistics1.aspx.cs" Inherits="Academic_CourseBookRequestStatistics1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#courseBook').addClass("active open");
            $('#courseBook_3 a').css("background-color", "#575757");
            $('#courseBook a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <a href="CourseBookStatistics.aspx" class="font-ha">إحصائية  كتب المساقات</a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <asp:Label ID="lblSemesterID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="col-md-12 ">
        <div id="Div1" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">

                    <i class="fa fa-reorder"></i>إحصائية المساقات التي لها طلب كتاب 
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
                    <table class="table table-striped table-hover" id="sample_editable_1 ">
                        <thead>
                            <tr>
                                <th style="width: 2%;">رقم </th>
                                <th style="width: 20%; text-align: center;">رقم المساق</th>
                                <th style="width: 20%; text-align: center;">اسم المساق</th>
                                <th style="width: 20%; text-align: center;">القسم</th>
                                <th style="width: 20%; text-align: center;">الكلية</th>
                                <th style="width: 20%; text-align: center;">المحاضر</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("No") %></td>
                                        <td style="text-align: center;"><%# Eval("CourseCode") %></td>
                                        <td style="text-align: center;"><%# Eval("CourseName") %></td>
                                        <td style="text-align: center;"><%# Eval("DepartmentName") %></td>
                                        <td style="text-align: center;"><%# Eval("CollegeName") %></td>
                                        <td style="text-align: center;"><%# Eval("InstructorName") %></td>

                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="CourseBookRequestStatistics1" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblSemesterID" PropertyName="Text" Name="SemesterID" Type="Int32"></asp:ControlParameter>

                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>

                    <div class="clearfix"></div>
                    <% } %>
                    <%  else
                        { %>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجد بيانات للعرض  </strong>
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
</asp:Content>

