<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="FinalEvaluateReport.aspx.cs" Inherits="Academic_FinalEvaluateReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script type="text/javascript">
            $('document').ready(function () {
                $('.page-sidebar-menu li').removeClass("active").removeClass("open");
                $('.page-sidebar-menu li ul li').css("background-color", "");
                $('#TeacherEvaluation').addClass("active open");
                $('#Eval6 a').css("background-color", "#575757");
                $('#TeacherEvaluation a span.arrow').addClass("open");
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">    التقرير النهائي للتقييم </a>
            <i class="fa fa-angle-left"></i>
            </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <div class="row">
       <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>  التقرير النهائي للتقييم  </div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                       <div class="form-group row">
                                <label class="col-md-2 control-label">الفصل الدراسي</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlSemester" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="Select ID, ArName From Semester Where ID<>1 and IsDelete=0"></asp:SqlDataSource>
                                </div>
                            </div>
                     <div class="form-group row">
                          <div class="col-md-2 ">
                         <asp:Button ID="Button1" runat="server" Text="طباعة التقرير  " CssClass="btn green" OnClick="Button1_Click"/>
                               </div>
                        </div>
                    <table class="table table-striped table-bordered table-hover">
         
                                    <thead>
                                        <tr>
                                          
                                           <th style="width: 5%; text-align: right; font-size: 11px"> اسم المحاضر </th>
                                             <th style="width: 5%; text-align: center; font-size: 11px">  نسبة تقييم الطلبة </th>
                                               <th style="width: 5%; text-align: center; font-size: 11px">  نسبة التقييم الأكاديمي المعتمد </th>
                                      
                                     
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource7" >
                                            <ItemTemplate>
                                                <tr>
                                                    
                                                    <td style="text-align: right">
                                                        <asp:Label ID="EmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="Employee" runat="server" Text='<%# Eval("Employee") %>'></asp:Label></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentEvaluatePercentage") %></span></td>
                                                      <td style="text-align: center"><span><%# Eval("AcadmicPercentage") %></span></td>
                                           
                                             
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>' SelectCommand="EvaluateFinalReport" SelectCommandType="StoredProcedure">

                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" DefaultValue="5" Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                 
                                    </tbody>
                                </table>
                    </div>
                </div>
           </div>
          </div>
</asp:Content>

