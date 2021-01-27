<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Accept_Emp_Exit.aspx.cs" Inherits="APP_HRM_Accept_Emp_Exit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu3').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">نشاطات عامة</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">


    <div class="row">
        <div class="col-md-12">
            <div class="tabbable tabbable-custom boxless">
                <ul class="nav nav-tabs">
                    <% if (Permissions.Contains("WExitManagerFollowView"))
                       { %>
                    <li id="li1" runat="server" class="active"><a href="#tab_1" data-toggle="tab">اعتماد أذونات مهام العمل</a></li>
                    <%} %>
                    <% if (Permissions.Contains("ExitManagerFollowView"))
                       { %>
                    <li id="li2" runat="server"><a href="#tab_5" data-toggle="tab">اعتماد الأذونات الخاصة </a></li>
                    <%} %>
                </ul>

                <div class="tab-content">

                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                    <% if (Permissions.Contains("WExitManagerFollowView"))
                       { %>

                    <div runat="server" class="tab-pane active" id="tab_1" clientidmode="Static">

                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>اعتماد طلبات مهام العمل الموظفين </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>

                                </div>
                            </div>

                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%">اسم الموظف  </th>
                                                <th style="width: 12%">تاريخ بدء الاذن</th>
                                                <th style="width: 12%">وقت بدء الاذن</th>
                                                <th style="width: 12%">تاريخ انتهاء الاذن</th>
                                                <th style="width: 12%">وقت انتهاء الاذن</th>

                                                <th style="width: 10%; text-align: center">قبول   رفض</th>
                                                <th style="width: 12%">سبب الرفض </th>
                                                <th style="width: 17%; text-align: center">(الشئون الادارية)  قبول  رفض</th>
                                                <th style="width: 5%; text-align: center"></th>


                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                <ItemTemplate>
                                                    <asp:Label ID="WExitID" runat="server" Text='<%# Eval("Work_Exit_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("DisplayName") %>  </span></td>
                                                        <td style="text-align: center"><span><%# Eval("Work_Exit_From","{0:yyyy/MM/dd}") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Exit_From_Hour") %></span></td>

                                                        <td style="text-align: center"><span><%# Eval("Work_Exit_To","{0:yyyy/MM/dd}") %></span></td>

                                                        <td style="text-align: center"><span><%# Eval("Exit_To_Hour") %></span></td>


                                                        <td style="text-align: center">
                                                            <div class="radio-list">

                                                                <label class="radio-inline">
                                                                    <asp:RadioButton ID="Accept" Enabled="false" runat="server" class="radio-inline" GroupName="status"
                                                                        Checked=' <%# Convert.ToBoolean(Eval("AcceptStatus")!= DBNull.Value) ? Convert.ToBoolean(Eval("AcceptStatus")) : false %>' />
                                                                </label>
                                                                <label class="radio-inline">
                                                                    <asp:RadioButton ID="Refused" Enabled="false" runat="server" class="radio-inline" GroupName="status"
                                                                        AutoPostBack="true" OnCheckedChanged="Refused1_CheckedChanged"
                                                                        Checked=' <%# Convert.ToBoolean(Eval("AcceptStatus")!= DBNull.Value) ? !Convert.ToBoolean(Eval("AcceptStatus")) : false %>' />
                                                                </label>

                                                            </div>
                                                        </td>
                                                        <td style="text-align: center">
                                                            <asp:TextBox ID="TextBox2" runat="server" Enabled="false" CssClass="form-control input-xsmall" Text='<%# Eval("Refuse_Reason") %>'></asp:TextBox>
                                                        </td>



                                                        <% if (Permissions.Contains("WExitManagerAdoptFollow"))
                                                           { %>
                                                        <td>
                                                            <div class="radio-list">

                                                                <label class="radio-inline">
                                                                    <asp:RadioButton ID="RadioButton1" runat="server" class="radio-inline" GroupName="Adopt" />

                                                                    <asp:RadioButton ID="RadioButton2" runat="server" class="radio-inline" GroupName="Adopt" />
                                                                </label>

                                                            </div>
                                                        </td>
                                                        <td style="text-align: center">
                                                            <asp:Button ID="AdoptHRM1" runat="server" class="btn default btn-xs green" Text="اعتماد" OnClick="AdoptHRM1_Click" />
                                                            <%} %>  </td>
                                                    </tr>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="AcceptEmpWExitGet" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> عرض الطلبات المعتمدة حديثا</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                         <a href="javascript:;" class="collapse"></a>
                                  
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 10%">اسم الموظف  </th>
                                    <th style="width: 10%">التاريخ </th>
                                    <th style="width: 10%">وقت الخروج</th>
                                    <th style="width: 10%; text-align: center">وقت العودة</th>
                                    <th style="width: 5%; text-align: center"></th> 
                                
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <asp:Label ID="WExitID" runat="server" Text='<%# Eval("Work_Exit_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                             <td><span><%# Eval("DisplayName") %> </span></td>
                                            <td><span><%# Eval("Work_Exit_Date","{0:yyyy/MM/dd}") %></span></td>
                                            <td><span><%# Eval("Exit_From1") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Exit_To1") %></span></td>
                                           
                                        <%--    <% if (Permissions.Contains("ExitManagerAdoptFollow"))
                                                     { %>--%>
                                            <td style="text-align: center"> <asp:Button ID="PrintRequest2" runat="server" class="btn default btn-xs green"   Text="طباعة الطلب" OnClick="PrintRequest2_Click" />
                                           <%--  <%} %>--%>  </td>
                                       </tr>
                                            
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="WExitAdoptRequestGet" SelectCommandType="StoredProcedure">
                                    
                                </asp:SqlDataSource>
                           
                                 </tbody>
                        </table>
                    </div>
                </div>
            </div>

                    </div>
                    <%} %>
                    <% if (Permissions.Contains("ExitManagerFollowView"))
                       { %>
                    <div runat="server" id="tab_5" class="tab-pane" clientidmode="Static">
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>اعتماد طلبات الاذونات الخاصة الموظفين </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>
                            </div>

                            <div class="portlet-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%">اسم الموظف  </th>
                                                <th style="width: 15%; text-align: center">وقت بدء الاذن</th>
                                                <th style="width: 15%; text-align: center">وقت انتهاء الاذن</th>
                                                <th style="width: 15%; text-align: center">تاريخ تقديم الطلب</th>
                                                <th style="width: 10%; text-align: center">قبول     رفض</th>
                                                <th style="width: 20%; text-align: center">سبب الرفض </th>
                                                <th style="width: 17%; text-align: center">(الشئون الادارية)  قبول  رفض</th>
                                                <th style="width: 5%; text-align: center"></th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <asp:Label ID="ExitID" runat="server" Text='<%# Eval("Exit_ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td><span><%# Eval("DisplayName") %> </span></td>
                                                        <td style="text-align: center"><span><%# Eval("Exit_From") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("Exit_To") %></span></td>

                                                        <td style="text-align: center"><span><%# Eval("Exit_Date","{0:yyyy/MM/dd}") %></span></td>


                                                        <td style="text-align: center">
                                                            <div class="radio-list">

                                                                <label class="radio-inline">
                                                                    <asp:RadioButton ID="Accept" Enabled="false" runat="server" class="radio-inline" GroupName="status" AutoPostBack="true" Checked=' <%# Convert.ToBoolean(Eval("AcceptStatus")!= DBNull.Value) ? Convert.ToBoolean(Eval("AcceptStatus")) : false %>' />
                                                                </label>
                                                                <label class="radio-inline">
                                                                    <asp:RadioButton ID="Refused" Enabled="false" runat="server" class="radio-inline" GroupName="status" AutoPostBack="true" OnCheckedChanged="Refused_CheckedChanged" Checked=' <%# Convert.ToBoolean(Eval("AcceptStatus")!= DBNull.Value) ? !Convert.ToBoolean(Eval("AcceptStatus")) : false %>' />
                                                                </label>

                                                            </div>
                                                        </td>
                                                        <td style="text-align: center">
                                                            <asp:TextBox ID="TextBox1" runat="server" Enabled="false" CssClass="form-control input-xsmall" Text='<%# Eval("Refuse_Reason") %>'></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <div class="radio-list">

                                                                <label class="radio-inline">
                                                                    <asp:RadioButton ID="RadioButton1" runat="server" class="radio-inline" GroupName="Adopt" />

                                                                    <asp:RadioButton ID="RadioButton2" runat="server" class="radio-inline" GroupName="Adopt" />
                                                                </label>

                                                            </div>
                                                        </td>

                                                        <% if (Permissions.Contains("ExitManagerAdoptFollow"))
                                                           { %>

                                                        <td style="text-align: center">
                                                            <asp:Button ID="AdoptHRM" runat="server" class="btn default btn-xs green" Text="اعتماد" OnClick="AdoptHRM_Click" />
                                                            <%} %> </td>
                                                    </tr>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                                SelectCommand="AcceptEmpExitGet" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                      
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> عرض الطلبات المعتمدة حديثا</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                         <a href="javascript:;" class="collapse"></a>
                                  
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 10%">اسم الموظف  </th>
                                    <th style="width: 10%">التاريخ </th>
                                    <th style="width: 10%">وقت الخروج</th>
                                    <th style="width: 10%; text-align: center">وقت العودة</th>
                                    <th style="width: 5%; text-align: center"></th> 
                                
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <asp:Label ID="ExitID" runat="server" Text='<%# Eval("Exit_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                             <td><span><%# Eval("DisplayName") %> </span></td>
                                            <td><span><%# Eval("Exit_Date","{0:yyyy/MM/dd}") %></span></td>
                                            <td><span><%# Eval("Exit_From1") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Exit_To1") %></span></td>
                                           
                                        <%--    <% if (Permissions.Contains("ExitManagerAdoptFollow"))
                                                     { %>--%>
                                            <td style="text-align: center"> <asp:Button ID="PrintRequest" runat="server" class="btn default btn-xs green"   Text="طباعة الطلب" OnClick="PrintRequest_Click" />
                                           <%--  <%} %>--%>  </td>
                                       </tr>
                                            
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="ExitAdoptRequestGet" SelectCommandType="StoredProcedure">
                                    
                                </asp:SqlDataSource>
                           
                                 </tbody>
                        </table>
                    </div>
                </div>
            </div>
     

                    </div>


                    <%} %>
                </div>

            </div>

        </div>
    </div>

</asp:Content>

