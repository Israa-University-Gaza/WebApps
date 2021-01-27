<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/MasterPage.master" AutoEventWireup="true" CodeFile="AttVariables.aspx.cs" Inherits="Attendance_AttVariables" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="../assets/datepicker/clockface.css" rel="stylesheet" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../assets/datepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="../assets/datepicker/datetimepicker.css" rel="stylesheet" />


<script type="text/javascript" src="../assets/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../assets/datepicker/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="../assets/datepicker/clockface.js"></script>
<script type="text/javascript" src="../assets/datepicker/moment.min.js"></script>
<script type="text/javascript" src="../assets/datepicker/daterangepicker.js"></script>
<script type="text/javascript" src="../assets/datepicker/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="../assets/datepicker/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

<script src="../assets/datepicker/quick-sidebar.js" type="text/javascript"></script>
<script src="../assets/datepicker/demo.js" type="text/javascript"></script>
<script src="../assets/datepicker/components-pickers.js"></script>
   <script>
       jQuery(document).ready(function () {

           QuickSidebar.init(); // init quick sidebar
           Demo.init(); // init demo features
           ComponentsPickers.init();

       });
    </script>
     <script type="text/javascript">
         $('document').ready(function () {
             $('.page-sidebar-menu li').removeClass("active");
             $('#menu7').addClass("active");
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="AttVariables.aspx" class="font-ha"> أنواع العطلات الرسمية و الاجازات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
    <div class="row">
        <div class="col-md-12">
            <div class="tabbable tabbable-custom boxless">
                <ul class="nav nav-tabs">
                     <% if (Permissions.Contains("HolidayView")){ %> <li id="li1" runat="server" class="active"><a href="#tab_1"  data-toggle="tab">انواع العطلات الرسمية</a></li><%} %>
                     <% if (Permissions.Contains("VacationTypeView")){ %> <li id="li2" runat="server" ><a href="#tab_2" data-toggle="tab">أنواع الاجازات </a></li><%} %>

                </ul>
                <div class="tab-content">
                        <% if (Permissions.Contains("HolidayView"))   { %>
                    <div class="tab-pane active" runat="server" id="tab_1" ClientIDMode="static">
                         <% if (Permissions.Contains("HolidayAdd") ||Permissions.Contains("HolidayEdit"))   { %>
                        <div class="col-md-6">

                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>أنواع العطلات الرسمية</div>
                                <div class="tools">
                                 <%--   <a href="javascript:;" class="collapse"></a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>--%>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-horizontal">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">اسم العطلة</label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtHolidayName" runat="server" placeholder="ادخل اسم العطلة الرسمية"  class="form-control form-control-inline input-medium"  type="text" value=""></asp:TextBox>
                                             
                                            </div>
                                        </div>
                                        <div class="form-group">


                                            <label class="col-md-3 control-label">تاريخ العطلة</label>
                                            <div class="col-md-6">

                                                              <div class="input-icon">
															<i class="fa fa-calendar"></i>
                                                <asp:TextBox ID="txtHolidayDate" runat="server" placeholder="ادخل تاريخ العطلة الرسمية" class="form-control form-control-inline input-medium date-picker"  type="text" value=""></asp:TextBox>
                                              
                                            </div>
                                        </div>   </div>
                                        <div class="form-group last">
                                            <label class="col-md-3 control-label">عدد أيام العطلة</label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtHolidayDays" runat="server" placeholder="ادخل عدد العطلة الرسمية" class="form-control form-control-inline input-medium" ></asp:TextBox>
                                              
                                            </div>
                                        </div>
                                    </div>
                                         <%} %>
                                    <div class="form-actions fluid">
                                        <div class="col-md-offset-3 col-md-9">
                                            <asp:Button ID="Button1" runat="server" Text="حفظ" class="btn  green" OnClick="Button1_Click" />

                                            <asp:Button ID="Button2" runat="server" Text="تفريغ الحقول" class="btn default"  OnClick="Button2_Click" />
                                        </div>
                                    </div>
                                </div>
                                <!-- END FORM-->
                            </div>
                        </div></div>
                        <div class="col-md-6">
                        <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> انواع العطلات </div>
                    <div class="tools">
<%--                        <a class="remove" href="javascript:;"></a>--%>
                         <a href="javascript:;" class="collapse"></a>
                                  
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 10%">اسم العطلة   </th>
                                    <th style="width: 10%">تاريخ العطلة 
                                    </th>
                                    <th style="width: 10%; text-align: center">عدد الايام</th>
                                  
                                   
                                    <th style="width: 20%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <asp:Label ID="HolidayID" runat="server" Text='<%# Eval("Holiday_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Holiday_Name") %></span></td>
                                            <td><span><%# Eval("Holiday_Date","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("NO_OF_Days") %></span></td>
                                           
                                            <td style="text-align: center">
                                                   <% if (Permissions.Contains("HolidayEdit"))
                                                      { %>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="HolilbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                      <%} %>
                                                  <% if (Permissions.Contains("HolidayDelete"))
                                                     { %> 
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="HolilbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                           <%} %>  </td>
                                            
                                       
                                            
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT * FROM [Holiday_Main] where IsDelete=0 ORDER BY [Holiday_ID] DESC">
                                    
                                </asp:SqlDataSource>
                           
                                 </tbody>
                        </table>
                    </div>
                </div>
            </div></div>


                    </div>
                    <%} %>
                     <% if (Permissions.Contains("VacationTypeView"))   { %>
                     
                    <div class="tab-pane" runat="server" id="tab_2" ClientIDMode="static">
                               <% if (Permissions.Contains("VacationTypeAdd") ||Permissions.Contains("VacationTypeEdit"))   { %>
                          <div class="col-md-6">
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>أنواع الاجازات </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                               <%--     <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>--%>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-horizontal">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">نوع الاجازة</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtVacationType" runat="server" class="form-control" placeholder="ادخل نوع الاجازة"></asp:TextBox>
                                             
                                            </div>
                                        </div>
                                           <div class="form-group">
                                            <label class="col-md-3 control-label">رمز الاجازة</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="VacSymbol" runat="server" class="form-control" placeholder="ادخل رمز الاجازة"></asp:TextBox>
                                               
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 control-label"> تصنيف الاجازة</label>
                                            <div class="col-md-4">

                                                <div class="radio-list">
                                                    <asp:RadioButtonList ID="IsPaid" runat="server" RepeatDirection="Horizontal" >
                                                        <asp:ListItem Value="True">مدفوعة</asp:ListItem>
                                                        <asp:ListItem Value="False">غير مدفوعة</asp:ListItem>
                                                    </asp:RadioButtonList>                                            </div>
                                        </div>
</div>
                                          <div class="clearfix"></div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">رصيد الاجازة</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="VacDays" runat="server" class="form-control" placeholder="ادخل رصيد الاجازة"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                           <div class="form-group">
                                            <label class="col-md-3 control-label">مستحقي الاجازة </label>
                                            <div class="col-md-4">
                                                 <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" DataSourceID="SqlDataSource4"   CssClass="select2_category form-control"  DataTextField="Ar_Name" DataValueField="Sub_Constant_ID"></asp:DropDownList>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT  Sub_Constant_ID,Ar_Name FROM [Emp_Sub_Constant] WHERE ([Constant_ID] = @Constant_ID) union select 0,N'  '">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="1025" Name="Constant_ID" Type="Int32"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                            </div>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                    </div>
                                     <%} %>
                                    <div class="form-actions fluid">
                                        <div class="col-md-offset-3 col-md-9">
                                            <asp:Button ID="Button3" runat="server" Text="حفظ" class="btn green" OnClick="Button3_Click" />

                                            <asp:Button ID="Button4" runat="server" Text="تفريغ الحقول" class="btn default"  OnClick="Button4_Click" />
                                        </div>
                                    </div>
                                </div>
                                <!-- END FORM-->
                            </div>
                        </div>
                         <div class="col-md-6">
                        <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> انواع الاجازات </div>
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
                                    <th style="width: 10%">نوع الاجازة </th>
                                    <th style="width: 10%">رمز الاجازة</th>
                                    <th style="width: 10%; text-align: center">عدد الايام</th>
                                     <th style="width: 10%; text-align: center">مدفوعة الاجر</th>
                                   
                                    <th style="width: 25%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="VacationTypeID" runat="server" Text='<%# Eval("Vacation_Type_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Vacation_Type") %></span></td>
                                            <td><span><%# Eval("Vacation_Symbol") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Vacation_Period") %></span></td>

                                             <td style="text-align: center">
                                            
                                                 <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("IsPaid") %>' />
                                            </td>


                                          
                                            <td style="text-align: center">
                                                 <% if (Permissions.Contains("VacationTypeEdit"))
                                                      { %>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="VaclbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                        <%} %>
                                                  <% if (Permissions.Contains("VacationTypeDelete"))
                                                     { %>  <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="VaclbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                         <%} %>    </td>
                                            
                                       
                                            
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT * FROM [Vacation_Type_TB] where IsDelete=0  ORDER BY [Vacation_Type_ID] DESC">
                                    
                                </asp:SqlDataSource>
                           
                                 </tbody>
                        </table>
                    </div>
                </div>
            </div></div>
                    </div>
                     
                    <%} %>

                    </div>
                </div>
            </div>
        </div>
</asp:Content>

