<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="EvaluationChooseEmployee.aspx.cs" Inherits="Academic_EvaluationChooseEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
            <script type="text/javascript">
                $('document').ready(function () {
                    $('.page-sidebar-menu li').removeClass("active").removeClass("open");
                    $('.page-sidebar-menu li ul li').css("background-color", "");
                    $('#TeacherEvaluation').addClass("active open");
                    $('#Eval3 a').css("background-color", "#575757");
                    $('#TeacherEvaluation a span.arrow').addClass("open");
                });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha"> تقييم  الأكاديمين خلال الفصل</a>
            <i class="fa fa-angle-left"></i>
        </li>
   
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="row">
       <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>  تقييم  الأكاديمين خلال الفصل  </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
              
                <div class="portlet-body">
                     <div class="form-group row">
                         <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                                   <label class="col-md-1 control-label">الكلية</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="collage" runat="server" class="select2_category form-control" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>' SelectCommand="GetCollages" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                         </div>
                    
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 5%;">#</th>
                                            <th style="width: 30%; text-align: center"> المحاضر</th>
                                            <th style="width: 30%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" >
                                            <ItemTemplate>
                                                <tr>
                                                    <td><span><%# Eval("RowNo") %></span>
                                                        <asp:Label ID="EmpID" runat="server" Text='<%# Eval("EmployeeID") %>' Visible="false"></asp:Label></td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="Employee" runat="server" Text='<%# Eval("Employee") %>'></asp:Label></td>
                                                    <td>
                                                       <%-- <asp:Button ID="btnStartEvaluation" runat="server" Text='<%# (Convert.ToBoolean(Eval("IsEvaluated")))? " تم التقييم" : "بدء التقيم" %>' CssClass="btn green" Style="width: 80px; height: 26px; font-size: 12px;" OnClick="btnStartEvaluation_Click" Enabled='<%# (Convert.ToBoolean(Eval("IsEvaluated")))? false:true %>' />
                                                     <asp:Button ID="btnUpdateEvaluation" runat="server" Text=" اعادة التقييم"  CssClass="btn pruple" Style="width: 80px; height: 26px; font-size: 12px;" OnClick="btnUpdateEvaluation_Click" visible='<%# (!Convert.ToBoolean(Eval("IsAccreditedEvaluated")) && Convert.ToBoolean(Eval("IsEvaluated")))? true:false %>' />--%>
                                                     <asp:Button ID="btnUpdateEvaluation" runat="server" Text=" انتهى التقييم" Enabled="false" />
                                                     </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:IsraaEvaluation %>"
                                            SelectCommand="GetEmployeeSemester" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="collage" PropertyName="SelectedValue" Name="CollageID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                            </div>
                
           </div>
              </div>
         </div>
       
</asp:Content>

