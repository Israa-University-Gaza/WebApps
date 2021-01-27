<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Evaluate_Bouns_Monthly.aspx.cs" Inherits="Finanical_Emp_Evaluate_Bouns_Monthly" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <script type="text/javascript">
           $('document').ready(function () {
               $('.page-sidebar-menu li').removeClass("active");
               $('#menu5').addClass("active");
           });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Emp_Evaluate_Bouns_Monthly.aspx" class="font-ha">اعتماد استحقاقات واستقطاعات الموظف</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <% if (Permissions.Contains("MotivationView") )
           { %>
     <div class="row">
        <div class="col-md-12">
    <div class="portlet box blue">
            <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>اعتماد استحقاقات واستقطاعات الموظف  </div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>

          <div class="portlet-body form">
                    <div class="form-horizontal">
        <div class="form-body">
                                   
                              <div class="form-group">


                                              <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="DropDownList8" AutoPostBack="true" class="form-control" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>

                                </div>


                               
                            </div> 
                         <%--        <div class="clearfix"></div> 
                 <div class="form-group">
                                            <label class="col-md-3 control-label">رقم الموظف </label>
                                            <div class="col-md-4">
                                                <div class="input-group" style="text-align: left">
                                                    <asp:TextBox ID="txtEmployee" runat="server" class="form-control" placeholder="Enter text"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button ID="Button1" runat="server" Text="فحص" class="btn green" OnClick="Week_Checker_Click2" />

                                                    </span>
                                                </div>
                                                <asp:Label ID="Label2" runat="server" class="help-block" Text="اسم الموظف"></asp:Label>
                                                <asp:HiddenField ID="HiddenField3" runat="server"   />
                                              
                                                 </div>
                                        </div>--%>

                                        <div class="clearfix"></div>
                                  <div class="form-group">
                                <label class="col-md-3 control-label">الشهر </label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" class="form-control" CssClass="select2_category form-control" placeholder="اختر الشهر "  >
                                       <asp:ListItem></asp:ListItem>
                                          <asp:ListItem Value="1">يناير</asp:ListItem>
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
                                  <%--  <asp:DropDownList ID="DropDownList2" runat="server" class="form-control"></asp:DropDownList>--%>
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                   <div class="form-group">
                                <label class="col-md-3 control-label">نوع الاحتساب </label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="true" class="form-control" CssClass="select2_category form-control"   DataSourceID="SqlDataSource1" DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Sub_Constant_ID], [Ar_Name] FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select 0,N'  '">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="1024" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                             
                            </div>
               <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                         <asp:Button ID="Button3" runat="server" Text="عرض مكافآت" class="btn green" OnClick="Button2_Click"/>
                                    <asp:Button ID="Button2" runat="server" Text="عرض جزاءات" class="btn green" OnClick="Button3_Click"/>
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default"  />
                            </div>
                        </div>
            
                                </div>
                        </div></div>
         </div>
            </div>
         </div>
    <%} %>
    <div id="row" class="row" runat="server" visible="false">
        <div class="col-md-12">
    <div class="portlet box red">
        <asp:HiddenField ID="HiddenField1" runat="server" />
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>مكافآت الموظف     </div>
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
                                    <th style="width: 20%">اسم الموظف </th>
                               
                                    <th style="width: 10%; text-align: center">النوع </th>
                                     <th style="width: 12%; text-align: center">رمز </th>
                                    <th style="width: 15%; text-align: center">تاريخ بدء الاحتساب</th>
                                     <th style="width: 10%; text-align: center">  النسبة </th>
                                     <th style="width: 10%; text-align: center">  القيمة </th>
                                    <th style="width: 15%; text-align: center"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" >
                                    <ItemTemplate>
                                        <asp:Label ID="MotivationID" runat="server" Text='<%# Eval("Motivation_ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Currancy_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Ar_F_Name") %> </span></td>
                                        
                                            <td style="text-align: center">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Motivation_Type") %>'></asp:Label></td>
                                            <td style="text-align: center"><asp:Label ID="Motivation_Code" runat="server" Text='<%# Eval("Code") %>'></asp:Label></td>
                                            <td style="text-align: center"><asp:Label ID="Motivation_S_Date" runat="server" Text='<%# Eval("Motivation_S_Date","{0:yyyy/MM/dd}") %>'></asp:Label></td>
                                             <td style="text-align: center"><asp:Label ID="Motivation_Value" runat="server" Text='<%# Eval("Motivation_Value") %>'></asp:Label></td>
                                             <td style="text-align: center"><asp:Label ID="Motivation_Rate" runat="server" Text='<%# Eval("Motivation_Rate") %>'></asp:Label></td>
                                             <td style="text-align: center"><asp:Label ID="M_description" runat="server" Text='<%# Eval("description") %>'></asp:Label></td>
                                            <td style="text-align: center">
                                            </td>
                                           <td style="text-align: center">
                                                 <% if (Permissions.Contains("MotivationView") )
           { %>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <%} %>
                                                 <% if (Permissions.Contains("MotivationAdopt"))
           { %>
                                               <asp:LinkButton ID="lbSubmit" runat="server" class="btn default btn-xs green" OnClick="lbSubmit_Click" OnClientClick="return confirm('هل انت متاكد من الاعتماد؟')"><i class="fa fa-trash-o"></i> اعتماد</a></asp:LinkButton>
                                         <%} %> </td>

                    
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="Emp_Evaluate_Motivation_Monthly" SelectCommandType="StoredProcedure">


                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList8" PropertyName="SelectedValue" Type="Int32" Name="Emp_ID"  ></asp:ControlParameter>

                                        <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" DefaultValue="" Name="Year" Type="Int32"  ></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Month" Type="Int32" ></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>


                            </tbody>
                        </table>
                    </div>
                </div>


          </div>
</div></div>

    <div id="Div1" class="row" runat="server" visible="false">
        <div class="col-md-12">
    <div class="portlet box red">
        <asp:HiddenField ID="HiddenField2" runat="server" />
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>جزاءات الموظف     </div>
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
                                    <th style="width: 20%">اسم الموظف </th>
                               
                                    <th style="width: 10%; text-align: center">النوع </th>
                                     <th style="width: 12%; text-align: center">رمز  </th>
                                    <th style="width: 15%; text-align: center">تاريخ بدء الاحتساب</th>
                                     <th style="width: 10%; text-align: center">  النسبة </th>
                                     <th style="width: 10%; text-align: center">  القيمة </th>
                                     <th style="width: 10%; text-align: center">  الوصف </th>
                                    <th style="width: 15%; text-align: center"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3" >
                                    <ItemTemplate>
                                        <asp:Label ID="DeductionID" runat="server" Text='<%# Eval("Deduction_ID") %>' Visible="false"></asp:Label>
                                       <asp:Label ID="Label5" runat="server" Text='<%# Eval("Currancy_ID") %>' Visible="false"></asp:Label>

                                        <tr>
                                            <td><span><%# Eval("Ar_F_Name") %> </span></td>
                                        
                                            <td style="text-align: center">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Deduction_Type") %>'></asp:Label></td>
                                            <td style="text-align: center"><asp:Label ID="Deduction_Code" runat="server" Text='<%# Eval("Code") %>'></asp:Label></td>
                                            <td style="text-align: center"> <asp:Label ID="Deduction_Start_Date" runat="server" Text='<%# Eval("Deduction_Start_Date","{0:yyyy/MM/dd}") %>'></asp:Label></td>
                                             <td style="text-align: center"><asp:Label ID="Deduction_Value" runat="server" Text='<%# Eval("Deduction_Value") %>'></asp:Label></td>
                                             <td style="text-align: center"><asp:Label ID="Deduction_Rate" runat="server" Text='<%# Eval("Deduction_Rate") %>'></asp:Label></td>
                                            <td style="text-align: center"><asp:Label ID="description" runat="server" Text='<%# Eval("description") %>'></asp:Label></td>
                                            <td style="text-align: center">
                                            </td>
                                           <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                   <% if (Permissions.Contains("MotivationAdopt"))
           { %>
                                                <asp:LinkButton ID="lbSubmit" runat="server" class="btn default btn-xs green" OnClick="lbSubmit_Click2" OnClientClick="return confirm('هل انت متاكد من الاعتماد؟')"><i class="fa fa-trash-o"></i> اعتماد</a></asp:LinkButton>
                                         <%} %> </td>

                    
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="Emp_Evaluate_Deduction_Monthly" SelectCommandType="StoredProcedure">


                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList8" PropertyName="SelectedValue" Type="Int32" Name="Emp_ID"  ></asp:ControlParameter>

                                        <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" DefaultValue="" Name="Year" Type="Int32"  ></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Month" Type="Int32" ></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>


                            </tbody>
                        </table>
                    </div>
                </div>


          </div>
</div></div>
</asp:Content>

