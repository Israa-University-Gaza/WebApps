<%@ Page Title="" Language="C#" MasterPageFile="~/EmpTasks/MasterPage.master" AutoEventWireup="true" CodeFile="TasksAFromTo.aspx.cs" Inherits="EmpTasks_TasksAllEmpView" %>

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
            $('#Task').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">ملف المهمات</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>عرض مهمات الموظفين</span>
            </button>

        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="EmpID" runat="server" Text="Label" Visible="false"></asp:Label>
    <div class="col-md-12 ">
        <div id="loginResponse" runat="server" class="alert alert-danger" clientidmode="Static" visible="false">
            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
            <button class="close" data-close="alert"></button>
        </div>
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>البحث حسب التاريخ  
                </div>
                <div class="tools">
                    <a href="" class="collapse"></a>

                    <a href="" class="remove"></a>
                </div>
            </div>


            <div class="portlet-body form">
                <div class="form-body">
                    <div class="form-group row">
            <label class="col-md-2 control-label">من تاريخ </label>
            <div class="col-md-4">
            <asp:TextBox ID="FromDate" runat="server" OnTextChanged="Date_TextChanged" AutoPostBack="true"  data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>

            </div>
            <label class="col-md-2 control-label">الى تاريخ </label>
            <div class="col-md-4">
                <asp:TextBox ID="ToDate" runat="server" OnTextChanged="TextBox1_TextChanged1" AutoPostBack="true"  data-date-format="yyyy/mm/dd" CssClass="form-control form-control-inline input-meduim date-picker" MaxLength="50"></asp:TextBox>
            </div>
        </div>
                    
                    <div class="clearfix"></div>
                    <div class="form-group">
                    </div>
                    <div class="clearfix"></div>

                    <div class="form-group">
                             <label class="col-md-2 control-label">اسم الموظف </label>
            <div class="col-md-4">
                             <asp:DropDownList ID="DropDownList2" CssClass="select2_category form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"   DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="Emp_ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="Employee_TB_GetAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                             </div>
                     <label class="col-md-2 control-label">حالة المهمة</label>
            <div class="col-md-4">
                <asp:DropDownList ID="status" CssClass="select2_category form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID"></asp:DropDownList>

                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:EmployeeTasks %>' SelectCommand="SELECT [ID], [Name] FROM [TaskStatus] union select 0,N'الكل'"></asp:SqlDataSource>
            </div>
                     

                    </div>




                    <div class="clearfix"></div>
                    <div class="form-group">
                    </div>
                    <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    <div class="col-md-12 ">
    <div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-reorder"></i>  عرض  مهمات الموظف
							</div>
							<div class="tools">
								<a href="" class="collapse"></a>
								
								<a href="" class="remove"></a>
							</div>
						</div>

      

   			<div class="portlet-body form">
						
								<div class="form-body">
                                         <% if(ListView1.Items.Count>0) { %>
        <table  class="table table-striped table-hover" id="sample_editable_1 " >
             <thead>
                 <tr>
                                <th></th>
                                <th style="width: 10%">اليوم</th>
                                <th style="width: 15%; text-align: center;">التاريخ </th>
                                <th style="width: 50%">المهمة</th>
                                <th style="width: 15%; text-align: center;">حالة المهمة  </th>
                                <th style="width: 5%; text-align: center;"></th>
                                <th style="width: 5%; text-align: center;"></th>
                            </tr>

             </thead> 
            <tbody>
           
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label></td>
                            <td><%# Eval("dayNameARABIC") %></td>
                            <td style="text-align:center"><%# Eval("Date","{0:yyyy/MM/dd}") %></td>
                            <td><%# Eval("TaskText") %></td>
                           <td style="text-align:center"> <%# Eval("status") %></td>
                          <td></td>
                            <td></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

           


                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:EmployeeTasks %>' SelectCommand="TasksAllFromTo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" PropertyName="SelectedValue" Name="EmployeeId" Type="Int32"></asp:ControlParameter>
                        <asp:ControlParameter ControlID="FromDate" PropertyName="Text" Name="FromDate" DbType="Date"></asp:ControlParameter>
                        <asp:ControlParameter ControlID="ToDate" PropertyName="Text" Name="ToDate" DbType="Date"></asp:ControlParameter>
                        <asp:ControlParameter ControlID="status" PropertyName="SelectedValue" Name="TaskStatusID" Type="Int32"></asp:ControlParameter>

                    </SelectParameters>
                </asp:SqlDataSource>
            </tbody>
       
       

        
             </table>


<div class="clearfix"></div>
         
       <div class="col-md-4" style="float: left!important; direction: ltr!important;">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager col-md-6">
                 <Fields> 
                <asp:NextPreviousPagerField ButtonType="Link"
                          PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false"
                          ShowPreviousPageButton="true" /> <asp:NumericPagerField ButtonType="Link" />
                 <asp:NextPreviousPagerField ButtonType="Link" NextPageText=" التالي" ShowFirstPageButton="false"
                      ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
             </Fields>
                 
            </asp:DataPager> </div>                          
<div class="clearfix"></div>
                                         <% } %>
                 <%  else { %>
                   
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong> لا يوجد مهمات لهذا الموظف  </strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                   
                 <%  } %>

    </div>
    </div>
    </div>
    </div>
</asp:Content>

