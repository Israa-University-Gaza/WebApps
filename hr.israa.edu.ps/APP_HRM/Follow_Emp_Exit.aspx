<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Follow_Emp_Exit.aspx.cs" Inherits="APP_HRM_Follow_Emp_Exit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script type="text/javascript">
          $('document').ready(function () {
              $('.page-sidebar-menu li').removeClass("active");
              $('#menu3').addClass("active");
          });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">نشاطات عامة</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">


     <div class="row">
        <div class="col-md-12">
            <div class="tabbable tabbable-custom boxless">
                <ul class="nav nav-tabs">
                    <% if (Permissions.Contains("WExitManagerFollowView")) { %>  <li  id="li1" runat="server" class="active"><a href="#tab_1" data-toggle="tab"> متابعة أذونات مهام العمل</a></li>   <%} %> 
                     <% if (Permissions.Contains("ExitManagerFollowView")) { %> <li id="li2" runat="server" ><a href="#tab_5" data-toggle="tab">  متابعة الأذونات الخاصة </a></li>   <%} %> 
             
               
                </ul>

                 <div class="tab-content">

                     <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
       <% if (Permissions.Contains("WExitManagerFollowView"))

         { %>

                       <div  runat="server" class="tab-pane active" id="tab_1"  ClientIDMode="Static">

                           <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>متابعة طلبات مهام العمل الموظفين </div>
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
                                    <th style="width: 15% ;text-align: center"">تاريخ بدء الاذن</th>
                                    <th style="width: 15% ;text-align: center"">وقت بدء الاذن</th>
                                    <th style="width: 15%; text-align: center">تاريخ انتهاء الاذن</th>
                                      <th style="width: 15% ;text-align: center"">وقت انتهاء الاذن</th>
                            
                                  <th style="width: 10%; text-align: center">  قبول     رفض</th> 
                                     <th style="width: 15%; text-align: center">  سبب الرفض </th> 
                                    
                                
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <asp:Label ID="WExitID" runat="server" Text='<%# Eval("Work_Exit_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                             <td><span><%# Eval("DisplayName") %>  </span></td>
                                            <td style ="text-align: center"><span><%# Eval("Work_Exit_From","{0:yyyy/MM/dd}") %></span></td>
                                           <td style ="text-align: center"><span><%# Eval("Exit_From_Hour") %></span></td>

                                              <td style ="text-align: center"><span><%# Eval("Work_Exit_To","{0:yyyy/MM/dd}") %></span></td>

                                            <td style="text-align: center"><span><%# Eval("Exit_To_Hour") %></span></td>
                                        
                                          
                                              <td style="text-align: center">
                                                    <div class="radio-list">
                                        
                                               <label class="radio-inline">
											<asp:RadioButton ID="Accept"  runat="server" class="radio-inline"  GroupName="status"
                                                 Checked=' <%# Convert.ToBoolean(Eval("AcceptStatus")!= DBNull.Value) ? Convert.ToBoolean(Eval("AcceptStatus")) : false %>'   /> 
											</label>
											<label class="radio-inline">
											<asp:RadioButton ID="Refused" runat="server" class="radio-inline" GroupName="status"
                                                           Checked=' <%# Convert.ToBoolean(Eval("AcceptStatus")!= DBNull.Value) ? !Convert.ToBoolean(Eval("AcceptStatus")) : false %>'
                                                />
											</label>
											
                                             </div>
                                            </td >
                                       <td style="text-align: center"> <asp:TextBox ID="TextBox2" runat="server" Enabled="true" CssClass="form-control input-xsmall" Text='<%# Eval("Refuse_Reason") %>' ></asp:TextBox>
                                           </td>
                                         <%--       <% if (Permissions.Contains("WExitManagerAdoptFollow"))
                                                     { %>--%>
                                            <td style="text-align: center"> <asp:Button ID="Button1" runat="server" class="btn default btn-xs green"   Text="حفظ" OnClick="Reason1_Changed" />
                                       <%--   <%} %> --%>  </td>
                                       </tr>
                                            
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="FollowEmpWExitGet" SelectCommandType="StoredProcedure">

                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
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
                         <div  runat="server" id="tab_5" class="tab-pane"  ClientIDMode="Static">
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>متابعة طلبات الاذونات الخاصة الموظفين </div>
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
                                    <th style="width: 15%; text-align: center"> تاريخ تقديم الطلب</th>
                        
                                  <th style="width: 10%; text-align: center">  قبول     رفض</th> 
                                     <th style="width: 20%; text-align: center">  سبب الرفض </th> 
                                    
                                
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
											<asp:RadioButton ID="Accept"  runat="server" class="radio-inline"  GroupName="status" 
                                                 Checked=' <%# Convert.ToBoolean(Eval("AcceptStatus")!= DBNull.Value) ? Convert.ToBoolean(Eval("AcceptStatus")) : false %>'   /> 
											</label>
											<label class="radio-inline">
											<asp:RadioButton ID="Refused" runat="server" class="radio-inline" GroupName="status"
                                                  Checked=' <%# Convert.ToBoolean(Eval("AcceptStatus")!= DBNull.Value) ? !Convert.ToBoolean(Eval("AcceptStatus")) : false %>'/>
											</label>
											
                                             </div>
                                            </td >
                                       <td style="text-align: center"> <asp:TextBox ID="TextBox1" runat="server" Enabled="true" CssClass="form-control input-xsmall" Text='<%# Eval("Refuse_Reason") %>' ></asp:TextBox>
                                           </td>
                                           <%--   <% if (Permissions.Contains("ExitManagerAdoptFollow"))
                                                     { %>
                                            --%>
                                            <td style="text-align: center"> <asp:Button ID="Button1" runat="server" class="btn default btn-xs green"   Text="حفظ" OnClick="Reason_Changed" />
                                          <%--   <%} %>--%> </td>
                                       </tr>
                                            
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="FollowEmpExitGet" SelectCommandType="StoredProcedure">

                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
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

