<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="CollegePTHours.aspx.cs" Inherits="Academic_CollegePTHours" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#StudyTable').addClass("active open");
            $('#StudyTable_3 a').css("background-color", "#575757");
            $('#StudyTable a span.arrow').addClass("open");
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
                <span>الساعات المسموحة للكلية بنظام الساعة</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <% if (Permissions.Contains("CollegePTHours"))
        { %>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الساعات المسموحة للكلية بنظام الساعة</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        <label class="control-label col-md-2">الفصل الدراسي</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT top 1 ID, ArName FROM [Semester] ORDER BY ID DESC"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 20%">البرنامج  </th>
                                    <th style="width: 20%">الكلية  </th>
                                    <th style="width: 20%; text-align: center">عدد الساعات المسموحة</th>
                                     <th style="width: 20%; text-align: center">عدد الساعات المستخدمة</th>
                                    <th style="width: 20%; text-align: center"></th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>

                                        <tr  <%# Eval("IsUsed").ToString()=="1"? "style='color:red;'" : "" %>>
                                            <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="CollegeID" runat="server" Text='<%# Eval("CollegeID") %>' Visible="false"></asp:Label>

                                            <td><span><%# Eval("Program") %></span></td>
                                            <td><span><%# Eval("College") %></span></td>
                                            <td style="width: 20%; text-align: center">
                                                <asp:TextBox ID="txtPTHours" runat="server" CssClass="form-control" Text='<%# Eval("PTHours") %>'></asp:TextBox>
                                            </td>
                                           <td style="width: 20%; text-align: center"><span><%# Eval("CollegeUsedPTEHours") %></span></td>
                                              <td>
                                                <asp:Button ID="btnSave" runat="server" class="btn default btn-xs green" Text="حفظ" OnClick="btnSave_Click" />

                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:isra %>'
                                    SelectCommand="GetCollegePTEHours" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" DefaultValue="-1" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <div style="text-align: center;">
                            <asp:Button ID="Button1" runat="server" Text="حفظ الكل" class="btn green" OnClick="Button1_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div>
    <%} %>
</asp:Content>

