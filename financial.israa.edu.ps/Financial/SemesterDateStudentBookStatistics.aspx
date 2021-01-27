<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="SemesterDateStudentBookStatistics.aspx.cs" Inherits="Financial_SemesterDateStudentBookStatistics" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#SemesterDateStudentBookStatistics').addClass("active open");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">إحصائيات الواردات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إحصائيات الواردات</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body" style="width: 100%; margin: 0 auto;">
                            <div class="form-group row">
                                <label class="col-md-2 control-label">الفصل الدراسي</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="Select ID, ArName From Semester Where ID<>1 and IsActive=1 and IsDelete=0 Order By ID DESC"></asp:SqlDataSource>
                                </div>
                                         <label class="col-md-2 control-label">الفرع</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlBranches" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                         SelectCommand="ddlBranches" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 control-label">التاريخ</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDate" runat="server" class="form-control date-picker"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-offset-2 col-md-9">
                                    <asp:Button ID="btnFilter" runat="server" class="btn green" Text="جلب البيانات" OnClick="btnFilter_Click" />
                                    <asp:Button ID="btnPdf" runat="server" class="btn green" Text="pdf" OnClick="btnPdf_Click" />
                                </div>
                            </div>
                            <hr />
                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 25%; text-align: center">الكتاب</th>
                                            <th scope="col" style="width: 25%; text-align: center">عدد الكتب المباعة</th>
                                            <th scope="col" style="width: 25%; text-align: center">سعر الكتاب بالشيكل</th>
                                            <th scope="col" style="width: 25%; text-align: center">ع.ك × س.ك بالشيكل</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><span><%# Eval("BookName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("CountOfBooks") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("Price") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("BookTotalPrice") %></span></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetSemesterDateStudentBookStatistics" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlBranches" PropertyName="SelectedValue" Name="BranchID" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtDate" PropertyName="Text" Name="Date" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:ListView ID="ListView2" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><strong>المجموع</strong></td>
                                                    <td style="text-align: center"><strong><%# Eval("SumOfBooks") %></strong></td>
                                                    <td style="text-align: center"></td>
                                                    <td style="text-align: center"><strong><%# Eval("SumOfBookTotalPrice") %></strong></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetSemesterDateStudentBookTotalStatistics" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlBranches" PropertyName="SelectedValue" Name="BranchID" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtDate" PropertyName="Text" Name="Date" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>

                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center">
                                        <strong>لا يوجد كتب تم بيعها في اليوم والفصل الدراسي الذي تم إختيارهما</strong>
                                        <div style="clear: both"></div>
                                    </div>
                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                    <div style="clear: both"></div>
                                </div>
                                <% } %>
                            </div>
                            <div class="row table-responsive">
                                <% if (ListView3.Items.Count > 0)
                                    { %>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 25%; text-align: center">الكتاب</th>
                                            <th scope="col" style="width: 25%; text-align: center">عدد الكتب المباعة</th>
                                            <th scope="col" style="width: 25%; text-align: center">سعر الكتاب بالشيكل</th>
                                            <th scope="col" style="width: 25%; text-align: center">ع.ك × س.ك بالشيكل</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView3" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><span><%# Eval("BookName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("CountOfBooks") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("Price") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("BookTotalPrice") %></span></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetSemesterDateStudentBookDeleteStatistics" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlBranches" PropertyName="SelectedValue" Name="BranchID" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtDate" PropertyName="Text" Name="Date" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:ListView ID="ListView4" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><strong>المجموع</strong></td>
                                                    <td style="text-align: center"><strong><%# Eval("SumOfBooks") %></strong></td>
                                                    <td style="text-align: center"></td>
                                                    <td style="text-align: center"><strong><%# Eval("SumOfBookTotalPrice") %></strong></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetSemesterDateStudentBookDeleteTotalStatistics" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlBranches" PropertyName="SelectedValue" Name="BranchID" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtDate" PropertyName="Text" Name="Date" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>

                                <div class="clearfix"></div>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center">
                                        <strong>لا يوجد كتب تم حذفها في اليوم والفصل الدراسي الذي تم إختيارهما</strong>
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
        </div>
    </div>
</asp:Content>
