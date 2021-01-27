<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="OverTimeAdopt.aspx.cs" Inherits="Attendance_OverTimeAdopt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="OverTimeAdopt.aspx" class="font-ha">مصادقة المدير على الساعات الاضافية</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <% if (Permissions.Contains("WorkOverTimeView"))
           { %>
    <div class="row">
        <div class="col-md-12">
    <div class="portlet box blue">
            <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>مصادقة المدير على الساعات الاضافية  </div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>

          <div class="portlet-body form">
                   
        <div class="form-body">
                                   
                              <div class="form-group">


                                              <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="EmpName" class="form-control" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>

                                </div>


                               
                            </div> 
                            

                                        <div class="clearfix"></div>
                                  <div class="form-group">
                                <label class="col-md-3 control-label">الشهر </label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" class="form-control" placeholder="اختر الشهر"  CssClass="select2_category form-control" >
                                          <asp:ListItem></asp:ListItem>   <asp:ListItem Value="1">يناير</asp:ListItem>
                                        <asp:ListItem Value="2">فبراير</asp:ListItem>
                                        <asp:ListItem Value="3">مارس</asp:ListItem>
                                        <asp:ListItem Value="4">ابريل</asp:ListItem>
                                           <asp:ListItem Value="5">مايو</asp:ListItem>
                                        <asp:ListItem Value="6">يونيو</asp:ListItem>
                                        <asp:ListItem Value="7">يوليو</asp:ListItem>
                                        <asp:ListItem Value="8">أغسطس</asp:ListItem>
                                           <asp:ListItem Value="9">سبتمبر</asp:ListItem>
                                        <asp:ListItem Value="10">أكتوبر</asp:ListItem>
                                        <asp:ListItem Value="11">نوفمبر</asp:ListItem>
                                        <asp:ListItem Value="12">ديسمبر</asp:ListItem>
                                   
                                    </asp:DropDownList>
                              
                                </div>
                             

                               
                                <label class="col-md-3 control-label">السنة </label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                 <div class="clearfix"></div>
               <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                         <asp:Button ID="Button3" runat="server" Text="عرض " class="btn green"/>
                        
                            </div>
                        </div>
            
                                </div>
                        </div>
         </div>
            </div>
         
 <div class="col-md-12">
    <div class="portlet box red">
      
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i> ساعات العمل الاضافي     </div>
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
                                    <th style="width: 10%">التاريخ  </th>
                               
                                    
                                     <th style="width: 10%; text-align: center">من الساعة  </th>
                                    <th style="width: 10%; text-align: center">إلى الساعة  </th>
                                     <th style="width: 10%; text-align: center">  جملة الساعات </th>
                                     <th style="width: 10%; text-align: center">  ساعات الاستراحة </th>
                                     <th style="width: 10%; text-align: center">  ساعات العمل الرسمية </th>

                                      <th style="width: 10%; text-align: center">  جملة الساعات الاضافية  </th>
                                     <th style="width: 10%; text-align: center">  بيان لعمل الموظف ساعات اضافية</th>
                                           <th style="width: 10%; text-align: center"> عدد الساعات المستحقة</th>
                                    <th style="width: 20%; text-align: center">مصادقة المسؤول</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3" >
                                    <ItemTemplate>
                                        <asp:Label ID="ID" runat="server"  Visible="false" Text='<%# Eval("ID") %>'></asp:Label>

                                        <tr>
                                          
                                        
                                          
                                            <td ><asp:TextBox ID="date" runat="server" CssClass="form-control input-small" Text='<%# Eval("Date","{0:yyyy/MM/dd}") %>' ></asp:TextBox></td>
                                            <td style="text-align: center"> <asp:TextBox  ID="from" CssClass="form-control input-sm" runat="server" Text='<%# Eval("Time_From") %>' ></asp:TextBox></td>
                                             <td style="text-align: center"><asp:TextBox ID="to" runat="server" CssClass="form-control input-sm" Text='<%# Eval("Time_To") %>' ></asp:TextBox></td>
                                             <td style="text-align: center"><asp:TextBox ID="TotalHour" runat="server" CssClass="form-control input-sm" Text='<%# Eval("Total_Hour") %>' ></asp:TextBox></td>
                                            <td style="text-align: center"><asp:TextBox ID="RestHour" runat="server" CssClass="form-control input-sm" Text='<%# Eval("Rest_Hour") %>'></asp:TextBox></td>
                                              <td style="text-align: center"><asp:TextBox ID="WorkHour" runat="server" CssClass="form-control input-sm" Text='<%# Eval("Formal_Hour") %>' ></asp:TextBox></td>
                                             <td style="text-align: center"><asp:TextBox ID="TotalOverHour" runat="server" CssClass="form-control input-sm" Text='<%# Eval("Total_OverTime") %>'></asp:TextBox></td>
                                            <td style="text-align: center"><asp:TextBox ID="notes" runat="server" CssClass="form-control input-sm" Text='<%# Eval("Notes") %>'></asp:TextBox></td>
                                              <td style="text-align: center"><asp:TextBox ID="acceptedHour" runat="server" CssClass="form-control input-sm" Text='<%# Eval("Accepted_Hour") %>' ></asp:TextBox></td>
                                         
                                           
                                            
                                           
                                           <td style="text-align: center">
                                                 <% if (Permissions.Contains("WorkOverTimeAddEdit"))
           { %>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click" ><i class="fa fa-edit"></i> حفظ</asp:LinkButton>
                                                  <%} %>
                                               
                                                <% if (Permissions.Contains("WorkOverTimeAdopt"))
           { %>
                                                <asp:LinkButton ID="lbSubmit" runat="server" class="btn default btn-xs green" OnClick="lbSubmit_Click"  OnClientClick="return confirm('هل انت متاكد من الاعتماد؟')"><i class="fa fa-trash-o"></i> اعتماد</a></asp:LinkButton>
                                         <%} %> </td>

                    
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT * FROM [Work_OverTime_TB] WHERE (([Year] = @Year) AND ([Month] = @Month) AND ([Emp_ID] = @Emp_ID))">


                                    <SelectParameters>

                                        <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="Year" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Month" Type="Int32"></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="EmpName" PropertyName="SelectedValue" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>


                            </tbody>
                        </table>
                    </div>
                </div>


          </div>
     </div>
    </div>
    <%} %>
</asp:Content>

