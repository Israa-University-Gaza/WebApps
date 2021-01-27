<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="BookContainerCategoryStatistic.aspx.cs" Inherits="Library_NewLibrary_BookContainerCategoryStatistic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#new-library').addClass("active open");
            $('#new-library10 a').css("background-color", "#575757");
            $('#new-library a span.arrow').addClass("open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <li>
        <i class="fa fa-book"></i>
        <a href="BookContainerCategoryStatistic.aspx" class="font-ha">إحصائية كتب التصنيفات</a>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12 ">

            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">

                        <i class="fa fa-reorder"></i>إحصائية كتب التصنيفات 
                    </div>
                    <div class="tools">
                        <a href="" class="collapse"></a>
                        <a href="" class="remove"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-group row"></div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">من تاريخ </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDateFrom" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker"></asp:TextBox>
                        </div>
                        <label class="col-md-2 control-label isra-text-aling-right">الى تاريخ</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDateTo" runat="server" data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker"></asp:TextBox>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right"></label>
                        <div class="col-md-10">
                            <asp:Button ID="btnSearch" runat="server" Text="بحث" CssClass="btn green" OnClick="btnSearch_Click" />
                            <asp:Button ID="btnPDF" runat="server" Text="طباعة كشف إحصائية كتب التصنيفات " CssClass="btn blue" OnClick="btnPDF_Click" />
                        </div>
                    </div>


                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-striped table-hover" id="sample_editable_1">
                        <thead>
                            <tr>
                                <th style="width: 1%;">رقم </th>
                                <th style="width: 13%; text-align: center; font-size: 12px">التصنيف</th>
                                <th style="width: 9%; text-align: center; font-size: 12px">عدد العناوين</th>
                                <th style="width: 7%; text-align: center; font-size: 11px">عدد الكتب</th>
                                <th style="width: 10%; text-align: center; font-size: 11px">عدد الكتب العادية </th>
                                <th style="width: 10%; text-align: center; font-size: 12px">عدد الأجزاء </th>
                                <th style="width: 10%; text-align: center; font-size: 12px">عدد الطبعات  </th>
                                <th style="width: 14%; text-align: center; font-size: 12px">عدد نسخ الكتب </th>
                                <th style="width: 14%; text-align: center; font-size: 12px">عدد نسخ الاجزاء </th>
                                <th style="width: 16%; text-align: center; font-size: 12px">عدد نسخ الطبعات </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("RowNo") %></td>
                                        <td style="text-align: center;"><%# Eval("Name") %></td>
                                        <td style="text-align: center;"><%# Eval("ContainerCount") %></td>
                                        <td style="text-align: center;"><%# Eval("TotalBookCount") %></td>
                                        <td style="text-align: center;"><%# Eval("BookCount") %></td>
                                        <td style="text-align: center;"><%# Eval("PartCount") %></td>
                                        <td style="text-align: center;"><%# Eval("EditionCount") %></td>
                                        <td style="text-align: center;"><%# Eval("CopyBookCount") %></td>
                                        <td style="text-align: center;"><%# Eval("CopyPartCount") %></td>
                                        <td style="text-align: center;"><%# Eval("CopyEditionCount") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaLibrary%>' SelectCommand="GetBookContainerCategoryStatistics" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtDateFrom" PropertyName="Text" DbType="Date" Name="DateFrom" DefaultValue="1900/01/01"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtDateTo" PropertyName="Text" DbType="Date" Name="DateTo" DefaultValue="1900/01/01"></asp:ControlParameter>
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
                            <strong>لا يوجد بيانات للعرض</strong>
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

