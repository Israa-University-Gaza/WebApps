<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="EvaluationEmpStatistics.aspx.cs" Inherits="Academic_EvaluationEmpStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script type="text/javascript">
            $('document').ready(function () {
                $('.page-sidebar-menu li').removeClass("active").removeClass("open");
                $('.page-sidebar-menu li ul li').css("background-color", "");
                $('#TeacherEvaluation').addClass("active open");
                $('#Eval4 a').css("background-color", "#575757");
                $('#TeacherEvaluation a span.arrow').addClass("open");
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">احصائية تقييم  الأكاديمين</a>
            <i class="fa fa-angle-left"></i>
        </li>
   
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        <div class="row">
            <div class="row">
       <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> احصائية تقييم الأكاديمين  خلال الفصل  </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                     <div class="form-group row">
                         <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                                <label class="col-md-1 control-label">المحاضر</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="DropDownList1" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="Employee" DataValueField="EmployeeID" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:israaEvaluation %>"
                                        SelectCommand="GetAllLecturerInSemester" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                              <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="-1" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                              <asp:Parameter DefaultValue="12" Name="SemesterID" Type="Int32"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                         <label class="col-md-2 control-label">نسبة التقييم الأكاديمي </label>
                                <div class="col-md-3">
                                    <asp:Label ID="FinalPercentage" runat="server" Text=""></asp:Label>
                                    </div>

                         </div>
         
       <div class="col-md-12">
    
                                  <% if (Repeater1.Items.Count > 0)
                                   { %>
              <table class="table table-striped table-bordered table-hover">
         
                                    <thead>
                                        <tr>
                                            <th style="width: 2%; text-align: right; font-size: 3px"> #</th>
                                            <th style="width: 8%; text-align: right; font-size: 11px"> السؤال</th>
                                            <th style="width: 5%; text-align: center; font-size: 11px"> 5 </th>
                                            <th style="width: 5%; text-align: center; font-size: 11px">4</th>
                                            <th style="width: 5%; text-align: center; font-size: 11px">3</th>
                                            <th style="width: 5%; text-align: center; font-size: 11px">2</th>
                                            <th style="width: 5%; text-align: center; font-size: 11px"> 1</th>
                                              <th style="width: 5%; text-align: center; font-size: 11px"> Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource3" >
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="text-align: right"><span><%# Eval("RowNo") %></span></td>
                                                    <td style="text-align: right"><span><%# Eval("GroupName") %></span></td>
                                                    <td style="text-align: center"><span><%#  Eval("a5")  %> </span></td>
                                                    <td style="text-align: center"><span><%#  Eval("a4") %> </span></td>
                                                    <td style="text-align: center"><span><%#  Eval("a3") %> </span></td>
                                                    <td style="text-align: center"><span><%#  Eval("a2")  %></td>
                                                    <td style="text-align: center"><span><%#  Eval("a1")  %> </td>
                                                      <td style="text-align: center"><span><%#  Eval("Total")  %> </td>
                                          
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>'
                                            SelectCommand="GetEmpEvaluationResultByQuestion" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="EmployeeID" Type="Int32" DefaultValue="91" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>

                             <% }
                                   else
                                   {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                       <strong>لا يوجد تقييم  </strong>
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

