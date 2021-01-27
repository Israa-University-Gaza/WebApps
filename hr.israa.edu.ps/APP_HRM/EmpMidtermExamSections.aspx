<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="EmpMidtermExamSections.aspx.cs" Inherits="APP_HRM_EmpMidtermExamSections" %>

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
            $('#EmpFinalExamSections').addClass("active open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">لجنة الإمتحانات النصفية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>جدول مراقبات الموظف</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>جدول مراقبات الموظف</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
						                                <a  href="../تعليمات المحاضر مراقبات.jpeg"> <h4 style="color: red">تعليمات خاصة بالطلبة في فترة الامتحانات النصفية</h4></a>
</br>
                            <% if (ListView1.Items.Count > 0)
                                { %>
           <%--                 <div class="row" >
                                <div style="font-size: 14px;" class="alert alert-info alert-dismissable">
                                    <div class="col-md-4">
                                    </div>
                                    <div class="col-md-4" style="text-align: center;">
                                    </div>
                                    <div class="col-md-4" style="text-align: center;">
                                        <asp:LinkButton ID="lbEmployeeFinalExamSectionsPDF" runat="server" OnClick="lbEmployeeFinalExamSectionsPDF_Click">جدول مراقبات الموظف</asp:LinkButton><br />
                                    </div>
                                    <div style="clear: both"></div>
                                </div>
                            </div>--%>
                            <br />
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col" style="width: 5%; text-align: center;">م</th>
                                        <th scope="col" style="width: 15%; text-align: center">التاريخ</th>
                                        <th scope="col" style="width: 10%; text-align: center">اليوم</th>
                                        <th scope="col" style="width: 15%; text-align: center">الوقت</th>
                                        <th scope="col" style="width: 15%; text-align: center">اسم المساق</th>
										<th scope="col" style="width: 15%; text-align: center">الاستلام والتسليم - الكلية </th>
                                        <th scope="col" style="width: 10%; text-align: center">القاعة</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("RowNo") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("ExamDate") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("ExamDay") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("ExamTime") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("CourseName") %></span></td>
												<td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("CollegeName") %></span></td>
                                                <td style="text-align: center; font-size: 12px; padding: 10px;"><span><%# Eval("Room") %></span></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetEmployeeMidtermExamSections" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="text" Name="EmployeeID" Type="Int32" />
                                            <asp:Parameter Name="SemesterID" DefaultValue="12" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <% }
                                else
                                {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد مراقبات لعرضها</strong>
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
</asp:Content>
