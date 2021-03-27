<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="SectionStudentsMarks.aspx.cs" Inherits="Academic_SectionStudentsMarks" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .sale-summary li .sale-num {
            color: #169ef4;
            font-family: hasanin;
            font-size: 14px;
            font-weight: 100;
            float: left;
        }

        .sale-summary li .sale-info {
            color: #646464;
            float: right;
            font-family: hasanin;
            font-size: 12px;
            text-transform: uppercase;
        }

        .sale-summary li {
            border-top: none;
            overflow: hidden;
            padding: 1.9px 0;
        }

        .dropdown-menu li > a {
            clear: both;
            color: #333;
            display: block;
            font-weight: normal;
            line-height: 18px;
            padding: 0;
            text-decoration: none;
            white-space: nowrap;
        }

        .dropdown.open .dropdown-toggle {
            background: #e0eaf0 !important;
            color: #121212;
        }

        .sp > a {
            height: 30px;
            width: 242px;
            text-align: right;
            color: #fff !important;
            background-color: #169ef4 !important;
            display: inline-block;
            line-height: 29px;
            font-family: hasanin;
            padding: 0 10px 0 0;
        }

        .sp .dropdown-menu li > a {
            clear: both;
            color: #fff;
            display: block;
            font-weight: normal;
            line-height: 22px;
            padding: 0;
            text-decoration: none;
            white-space: nowrap;
            height: 30px !important;
            display: inline-block;
            width: 100%;
        }

        .sp .dropdown.open .dropdown-toggle {
            background: #fff !important;
            color: #4b8df8 !important;
        }

        .spa {
            background: #fff !important;
            color: #4b8df8 !important;
            border: none !important;
            text-align: right;
            padding: 0 15px !important;
        }

            .spa:hover {
                background-color: #4b8df8 !important;
                color: #fff !important;
            }
    </style>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#SectionStudentsMarks').addClass("active open");
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
                <span>علامات الطلاب</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>علامات الطلاب</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div style="width: 19%; float: right;">
                            <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                                <li>
                                    <label class="row control-label">المساق :</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlCourse" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="CourseArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetAcademicOfferdCourses" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <label class="row control-label">الشعبة :</label>
                                    <div class="row">
                                        <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="SectionNum" DataValueField="ID"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetOfferdCourseAccreditationSections" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlCourse" PropertyName="SelectedValue" Name="OfferdCourseID" Type="Int32" />
                                                <asp:Parameter Name="AccreditationType" DefaultValue="4" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <div class="row" style="text-align: center">
                                        <asp:Button ID="btnView" runat="server" Text="عرض" CssClass="btn green" OnClick="btnView_Click" />
                                    </div>
                                </li>
                                <li class="active"><a data-toggle="tab" href="#tab1"><i class="fa fa-home"></i>علامات الطلاب</a></li>
                                <li><a data-toggle="tab" href="#tab2"><i class="fa fa-book"></i>إحصائيات العلامات</a></li>
                            </ul>
                        </div>
                        <div style="width: 81%; float: right;">
                            <div class="tab-content">
                                <div id="tab1" class="tab-pane active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4 class="font-ha">علامات الطلاب</h4>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <% if (ListView1.Items.Count > 0)
                                                   { %>
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" style="width: 10%; text-align: center">رقم</th>
                                                            <th scope="col" style="width: 20%; text-align: center">رقم الطالب</th>
                                                            <th scope="col" style="width: 30%; text-align: center">اسم الطالب</th>
                                                            <th scope="col" style="width: 40%; text-align: center">العلامة النصفية</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                                            <ItemTemplate>
                                                                <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("StdSectionID") %>' Visible="false"></asp:Label>
                                                                <tr>
                                                                    <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("RowNo") %></span></td>
                                                                    <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentNo") %></span></td>
                                                                    <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("StudentName") %></span></td>
                                                                    <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# ((Eval("IsMidtermNoMark").ToString()=="1") ? "غائب" : Eval("MidtermMark").ToString()) %></span></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetSectionStudentsMarks" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </tbody>
                                                </table>
                                                <% }
                                                   else if (ddlSection.SelectedIndex == 0)
                                                   { %>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center">
                                                        <strong>لم يتم إختيار الشعبة لعرض طلابها</strong>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                                    <div style="clear: both"></div>
                                                </div>
                                                <% }
                                                   else
                                                   {%>
                                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                                    <div class="col-xs-11" style="text-align: center">
                                                        <strong>لا يوجد طلاب مسجلين في الشعبة</strong>
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
                                <div id="tab2" class="tab-pane">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <h4 class="font-ha">إحصائيات العلامات</h4>
                                                </div>
                                            </div>
                                            <hr style="margin: 10px 0 15px 0" />
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="portlet sale-summary">
                                                        <div class="portlet-body">
                                                            <ul class="list-unstyled">
                                                                <li>
                                                                    <span class="sale-info">العلامة الأعلى : </span>
                                                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource6">
                                                                        <ItemTemplate>
                                                                            <span class="sale-num"><%# Eval("MidtermMark") %></span>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetSectionStudentsMarksStatistics1" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </li>
                                                                <li>
                                                                    <span class="sale-info">العلامة الأدنى : </span>
                                                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource7">
                                                                        <ItemTemplate>
                                                                            <span class="sale-num"><%# Eval("MidtermMark") %></span>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetSectionStudentsMarksStatistics2" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </li>
                                                                <li>
                                                                    <span class="sale-info">عدد الناجحين : </span>
                                                                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource8">
                                                                        <ItemTemplate>
                                                                            <span class="sale-num"><%# Eval("CountOfStudent") %></span>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetSectionStudentsMarksStatistics5" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </li>
                                                                <li>
                                                                    <span class="sale-info">عدد الراسبين : </span>
                                                                    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource9">
                                                                        <ItemTemplate>
                                                                            <span class="sale-num"><%# Eval("CountOfStudent") %></span>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource9" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetSectionStudentsMarksStatistics6" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </li>
                                                                <li>
                                                                    <span class="sale-info">نسبة النجاح : </span>
                                                                    <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource13">
                                                                        <ItemTemplate>
                                                                            <span class="sale-num"><%# Eval("PercentageOfPassStudent") %> %</span>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource13" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetSectionStudentsMarksStatistics9" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </li>
                                                                <li>
                                                                    <span class="sale-info">عدد الغياب : </span>
                                                                    <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource10">
                                                                        <ItemTemplate>
                                                                            <span class="sale-num"><%# Eval("CountOfStudent") %></span>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetSectionStudentsMarksStatistics7" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </li>
                                                                <li>
                                                                    <span class="sale-info">عدد إحتساب من 70 : </span>
                                                                    <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource11">
                                                                        <ItemTemplate>
                                                                            <span class="sale-num"><%# Eval("CountOfStudent") %></span>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetSectionStudentsMarksStatistics8" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </li>
                                                                <li>
                                                                    <span class="sale-info">متوسط العلامات : </span>
                                                                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource12">
                                                                        <ItemTemplate>
                                                                            <span class="sale-num"><%# Eval("Mean") %></span>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:SqlDataSource ID="SqlDataSource12" runat="server"
                                                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                                                        SelectCommand="GetSectionStudentsMarksStatistics3" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-9" style="text-align: left;">
                                                    <div class="row">
                                                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource" Width="545px">
                                                            <Series>
                                                                <asp:Series Name="Series1" ChartType="Line" XValueMember="MidtermMark" YValueMembers="CountOfMidtermMark" IsValueShownAsLabel="True"></asp:Series>
                                                            </Series>
                                                            <ChartAreas>
                                                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                            </ChartAreas>
                                                        </asp:Chart>

                                                        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetSectionStudentsMarksStatistics4" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="ddlSection" PropertyName="SelectedValue" Name="SectionID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

