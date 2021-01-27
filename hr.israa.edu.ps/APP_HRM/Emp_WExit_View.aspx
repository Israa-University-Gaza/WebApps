<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_WExit_View.aspx.cs" Inherits="APP_HRM_Emp_WExit_View" %>

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
                    <li class="active"><a href="#tab_1" data-toggle="tab">  متابعة مهمات العمل للموظف</a></li>
                    <li><a href="#tab_2" data-toggle="tab">  عرض المهمات الخاصة للموظف</a></li>
               
                </ul>
                <div class="tab-content">

                     <div class="tab-pane active" id="tab_1">
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>عرض مهمات العمل</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                        
                                </div>
                            </div>

                                   <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 10%">وقت الخروج</th>
                                    <th style="width: 10%; text-align: center">وقت العودة </th>
                                    <th style="width: 10%; text-align: center">تفاصيل</th>
                                    <th style="width: 10%; text-align: center"> تاريخ تقديم الطلب</th>
                            
                                    <th style="width: 5%; text-align: center">حالة الطلب</th>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="WExitID" runat="server" Text='<%# Eval("Work_Exit_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                    
                                            <td><span><%# Eval("Exit_From_Hour") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Exit_To_Hour") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Work_Exit_Details") %></span></td>
                                        
                                            <td style="text-align: center"><span><%# Eval("Work_Exit_Date","{0:yyyy/MM/dd}") %></span></td>
                                          
                                            <td style="text-align: center">
                                                <span><%# Eval("Ar_Name","{0:yyyy/MM/dd}") %>
<%--                                                <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' />--%>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit2" runat="server" class="btn default btn-xs black" OnClick="lbEdit2_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete2" runat="server" class="btn default btn-xs purple" OnClick="lbDelete2_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <tr><asp:Button ID="Button2" runat="server"  class="btn default  green" Text="الغاء اخر طلب اذن" OnClick="Cancel_Request" /></tr>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT Work_Exit_Permission_TB.*,Emp_Sub_Constant.* FROM [Work_Exit_Permission_TB] 
                                    Inner Join Emp_Sub_Constant ON Work_Exit_Permission_TB.Exit_Status = Emp_Sub_Constant.Sub_Constant_ID
                                 and Work_Exit_Permission_TB.IsDelete=0   Order by Work_Exit_ID DESC ">
                                <%--    <SelectParameters>
                                        <asp:Parameter Name="Emp_ID" Type="Int32"  ></asp:Parameter>
                                    </SelectParameters>--%>
                                </asp:SqlDataSource>
                           
                                 </tbody>
                        </table>
                    </div>
                </div>

                            </div>
                         </div>

                          <div class="tab-pane " id="tab_2">
                              <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>عرض مهمات الخاصة</div>
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
                                    <th style="width: 10%">وقت الخروج</th>
                                    <th style="width: 10%; text-align: center">وقت العودة </th>
                                    <th style="width: 10%; text-align: center">تفاصيل</th>
                                    <th style="width: 10%; text-align: center"> تاريخ تقديم الطلب</th>
                            
                                    <th style="width: 5%; text-align: center">حالة الطلب</th>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <asp:Label ID="ExitID" runat="server" Text='<%# Eval("Exit_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                          <%--  <td><span><%# Eval("Exit_Type_ID") %></span></td>--%>
                                            <td><span><%# Eval("Exit_From") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Exit_To") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Exit_Details") %></span></td>
                                        
                                            <td style="text-align: center"><span><%# Eval("Exit_Date","{0:yyyy/MM/dd}") %></span></td>
                                          
                                            <td style="text-align: center">
                                                <span><%# Eval("Ar_Name","{0:yyyy/MM/dd}") %>
<%--                                                <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' />--%>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit2" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete2" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <tr><asp:Button ID="Button1" runat="server"  class="btn default  green" Text="الغاء اخر طلب اذن" OnClick="Cancel_Request" /></tr>

                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT Exit_Permission_TB.*,Emp_Sub_Constant.* FROM [Exit_Permission_TB] 
                                    Inner Join Emp_Sub_Constant ON Exit_Permission_TB.Exit_Status = Emp_Sub_Constant.Sub_Constant_ID
                                 and Exit_Permission_TB.IsDelete=0   Order by Exit_ID DESC ">
                                <%--    <SelectParameters>
                                        <asp:Parameter Name="Emp_ID" Type="Int32"  ></asp:Parameter>
                                    </SelectParameters>--%>
                                </asp:SqlDataSource>
                           
                                 </tbody>
                        </table>
                    </div>
                </div>

                            </div>
                        
                         </div>
                   </div>

                    </div>
    </div>
    </div>

</asp:Content>

