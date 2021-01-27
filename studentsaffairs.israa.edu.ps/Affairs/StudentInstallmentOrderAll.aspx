<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="StudentInstallmentOrderAll.aspx.cs" Inherits="Affairs_StudentInstallmentOrderAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu20').addClass("active open");
            $('#menu20 a').css("background-color", "#575757");
            $('#menu20 a span.arrow').addClass("open");
            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">شؤون الطلاب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>تقديم طلب تقسيط شامل</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

       <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i> طلب تقسيط شامل</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                
                     <div class="row">
                        <div class="col-md-12">
                           
                                <div class="row">
                                    <asp:Button ID="btnOrder" runat="server" OnClick="btnOrder_Click" CssClass="btn red" Text="تقديم طلب تقسيط للجميع" />
                                </div>
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 5%; text-align: center">#</th>
                                             <th style="width: 15%; text-align: center">رقم الطالب</th>
                                            <th style="width: 15%; text-align: center">إسم الطالب</th>
                                           
                                            <th style="width: 25%; text-align: center">الفصل</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource8">
                                            <ItemTemplate>
                                                <tr>
                                                    
                                                    <td style="text-align: center"><span><%# Eval("RowNo") %></span></td>
                                                    
                                                    <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("Semester") %></span></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra2 %>"
                                            SelectCommand="GetStdsSemesterBySemesterID" SelectCommandType="StoredProcedure">
                                          
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>

                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                      
                                        <strong>لا يوجد طلاب غير مقسطين</strong>
                                       
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

