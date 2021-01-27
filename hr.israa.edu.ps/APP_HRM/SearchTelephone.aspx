<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="SearchTelephone.aspx.cs" Inherits="SearchTelephone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            $('#Telephone').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">دليل الهاتف</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>بحث عن هاتف </span>
            </button>
           
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
    <div class="col-md-12 ">
             
    <div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-reorder"></i> بحث عن هاتف
							</div>
							<div class="tools">
								<a href="" class="collapse"></a>
								
								<a href="" class="remove"></a>

							</div>
						</div>
      

   <div class="portlet-body form">
	<div class="form-body">

                                    
     <div class="clearfix"></div>


     <div class="col-md-6 ">
        <asp:Label ID="EmployeeName" runat="server" Text="اختر اسم الموظف" CssClass="col-md-3 cotrol-label"></asp:Label>
       <div class="col-md-9">
           <asp:DropDownList ID="Employee" CssClass="select2_category form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Employee_SelectedIndexChanged"  DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="Emp_ID">
           </asp:DropDownList>
           <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Emp_ID], [DisplayName] FROM [Employee_TB]  where IsDelete=0 and Emp_ID not in (1,2,3,5) union select -1,N'الكل'"></asp:SqlDataSource>
      
            </div>
      
   </div>



   
        <div class="col-md-4 ">
        <asp:Label ID="Label4" runat="server" Text="رقم الهاتف:" CssClass= "col-md-5 control-label"></asp:Label>
        <div class="col-md-7">
        <asp:TextBox ID="TelephoneNum" runat="server" placeholder="ادخل رقم الهاتف" CssClass="form-control" AutoPostBack="true" OnTextChanged="TelephoneNum_TextChanged"></asp:TextBox>
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
        </div>
   <div class="col-md-12 ">
    <div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-reorder"></i>  عرض هواتف الموظفين
							</div>
							<div class="tools">
								<a href="" class="collapse"></a>
								
								<a href="" class="remove"></a>
							</div>
						</div>

      

   			<div class="portlet-body form">
						
								<div class="form-body">
                                    <% if (ListView1.Items.Count > 0)
                                       { %>
        <table  class="table table-striped table-hover" id="sample_editable_1 " >
             <thead>
                  <tr> 
                     
                      <th style="width: 30%; /*text-align: center;*/"">اسم الموظف </th> 
                  
                      <th  style="width: 30%; text-align: center;"> رقم الهاتف </th> 
                      <th style="width: 10%; text-align: center;"> فعال </th> 
                      <th style="width: 5%; text-align: center;"></th> 
                      <th style="width: 5%; text-align: center;"></th> 
                   
                   
                     
               </tr> 

             </thead> 
            <tbody>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <tr>
                            
                                <asp:Label ID="id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                            <td> <%# Eval("EmployeeName") %></td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                            <td style="text-align: center"><%# Eval("TelephoneNum") %></td>
                            <td style="text-align: center">
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("IsActive") %>' Enabled="false"></asp:CheckBox></td>
                            <td>
                             <td>
                                   <%  if (Permissions.Contains("AddTelephone"))
                                    { %>
                                            <asp:LinkButton ID="Edit" runat="server" class="btn default btn-xs black"  OnClick="Edit_Click">تحرير</asp:LinkButton></td>
                                       <%} %>  <td>
                                              <%  if (Permissions.Contains("AddTelephone"))
                                    { %>
                                            <asp:LinkButton ID="Delete" runat="server" class="btn default btn-xs purple"   OnClick="Delete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                             <%} %>
                                        </td>
                                  
                    </ItemTemplate>
                </asp:ListView>




                   <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Telephone %>' SelectCommand="TelephoneSearch" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TelephoneNum" PropertyName="Text" DefaultValue="%" Name="TelephoneNum" Type="String"></asp:ControlParameter>
                        <asp:ControlParameter ControlID="Employee" PropertyName="SelectedValue" DefaultValue="-1" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </tbody>
       
       

        
             </table>
</div>
          <div class="form-actions fluid">
                    
                         <div class="col-md-12" style="text-align: center;">
     <asp:Button ID="print" runat="server" Text="طباعة البيانات " OnClick="print_Click" CssClass="btn green"  />
 </div>
                <div class="col-md-12">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="30" PagedControlID="ListView1" class="pager">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link"
                                    PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false"
                                    ShowPreviousPageButton="true" />
                                <asp:NumericPagerField ButtonType="Link" />
                                <asp:NextPreviousPagerField ButtonType="Link" NextPageText=" التالي" ShowFirstPageButton="false"
                                    ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                            </Fields>

                        </asp:DataPager>
                                                 
           </div> 
              </div>

         
              
                  <div class="clearfix"></div>
                                    <% } %>
                    <%  else
                                       { %>

                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center">
                            <strong>لا يوجد هواتف للعرض  </strong>
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

