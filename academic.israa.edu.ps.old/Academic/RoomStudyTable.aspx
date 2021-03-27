<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="RoomStudyTable.aspx.cs" Inherits="Academic_RoomStudyTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script type="text/javascript">
          $('document').ready(function () {
              $('.page-sidebar-menu li').removeClass("active").removeClass("open");
              $('.page-sidebar-menu li ul li').css("background-color", "");
              $('#menu1').addClass("active open");
              $('#menu1_3 a').css("background-color", "#575757");
              $('#menu1 a span.arrow').addClass("open");
          });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>أنواع القاعات الدراسية</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="Building.aspx">عرض المباني</a></li>
                <li class="font-ha"><a href="Room.aspx">عرض القاعات الدراسية</a></li>
                <li class="font-ha"><a href="RoomType.aspx">عرض أنواع القاعات الدراسية</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الجدول الدراسي للقاعة <asp:Label ID="RoomName" runat="server" Text="Label"></asp:Label></div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                     <asp:Label ID="lblRoomID" runat="server"  Visible="false"></asp:Label>
                    <% if (ListView1.Items.Count > 0)
                       { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 5%">رقم المساق</th>
                                <th style="width: 15%">اسم المساق</th>
                                <th style="width: 10%">المحاضر</th>
                                  <th style="width: 5%"> شعبة</th>
                                <th style="width: 5%">قاعة</th>
                                <th style="width: 10%; text-align: center">السبت</th>
                                 <th style="width: 10%; text-align: center">الأحد </th>
                                <th style="width: 10%; text-align: center">الاثنين </th>
                                 <th style="width: 10%; text-align: center">الثلاثاء </th>
                                <th style="width: 10%; text-align: center">الأربعاء</th>
                                 <th style="width: 10%; text-align: center">الخميس</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                 
                                    <tr>
                                        <td><span><%# Eval("CourseCode") %></span></td>
                                        <td><span><%# Eval("CourseArName") %></span></td>
                                        <td><span><%# Eval("Employee") %></span></td>
                                        <td><span><%# Eval("SectionNum") %></span></td>
                                        <td><span><%# Eval("Room") %></span></td>
                                        <td style="text-align: center"><span><%# Eval("Saturday") %></span></td>
                                         <td style="text-align: center"><span><%# Eval("Sunday") %></span></td>
                                         <td style="text-align: center"><span><%# Eval("Monday") %></span></td>
                                         <td style="text-align: center"><span><%# Eval("Tuesday") %></span></td>
                                         <td style="text-align: center"><span><%# Eval("Wednesday") %></span></td>
                                         <td style="text-align: center"><span><%# Eval("Thursday") %></span></td>
                                        <td style="text-align: center">
                                    
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="GetRoomStudyTable" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblRoomID" PropertyName="Text" Name="RoomID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                            <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
                            <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                    <div class="clearfix"></div>
                    <% }
                       else
                       {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لم يتم إضافة محاضرات بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
</asp:Content>

