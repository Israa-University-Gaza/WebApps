<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Courses_AddEdit.aspx.cs" Inherits="APP_HRM_Emp_Courses_AddEdit" %>

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
        <li><a href="#" class="font-ha">الدورات التدريبية</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <% if (Permissions.Contains("CoursesView"))

         { %>
      <div class="row">
        <div class="col-md-12">
              <% if (Permissions.Contains("CoursesAdd")||Permissions.Contains("CoursesEdit"))
                                               { %>

                        <div class="portlet box blue">
                                            <asp:TextBox ID="CourseID" runat="server" Text="" Visible="false"></asp:TextBox>

                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>ادخال الدورات التدريبية  </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                   <%-- <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>--%>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-horizontal">
                                    <div class="form-body">
                                           <div class="form-group">


                                              <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="DropDownList8" AutoPostBack="true"  placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>

                                </div>


                               
                            </div>  <div class="clearfix"></div>

                                    <%--    <div class="form-group" runat="server" id="check">
                                            <label class="col-md-3 control-label">رقم الموظف </label>
                                            <div class="col-md-4">
                                                <div class="input-group" style="text-align: left">
                                                    <asp:TextBox ID="txtEmp" runat="server" class="form-control" placeholder=" ادخل رقم الموظف"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button ID="Button3" runat="server" Text="فحص" class="btn green" OnClick="Username_Checker_Click2" />

                                                    </span>
                                                </div>
                                                <asp:Label ID="Label5" runat="server" class="help-block" Text="اسم الموظف"></asp:Label>
                                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                            </div>
                                        </div>--%>

                                           <div class="form-group">
                                            <label class="col-md-3 control-label">اسم الدورة</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtName" runat="server" Rows="3" class="form-control" placeholder="ادخل اسم الدورة"></asp:TextBox>
                                             
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 control-label">الجهة المنظمة</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtSubmit" runat="server" Rows="3" class="form-control" placeholder="ادخل الجهة المنظمة"></asp:TextBox>
                                             
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 control-label"> تاريخ بداية الدورة    </label>
                                            <div class="col-md-4">
                                                 <div class="input-icon">
															<i class="fa fa-calendar"></i>

                                                <asp:TextBox ID="txtSDate" runat="server" placeholder="ادخل تاريخ بداية الدورة" class="form-control form-control-inline input-large date-picker" type="text" value=""></asp:TextBox>
                                                <span class="help-block"> </span>
                                            </div>
                                        </div>
                                            </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label"> تاريخ نهاية الدورة    </label>
                                            <div class="col-md-4">
                                                 <div class="input-icon">
															<i class="fa fa-calendar"></i>
                                                <asp:TextBox ID="txtFDate" runat="server" placeholder="ادخل تاريخ نهاية الدورة"  class="form-control form-control-inline input-large date-picker" type="text" value=""></asp:TextBox>
                                           
                                            </div>
                                                </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">ملاحظات</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtNotes" runat="server" placeholder="ادخل ملاحظات" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                          
                                            </div>
                                        </div>

                                        


                                        <div class="form-actions fluid">
                                        <div class="col-md-offset-3 col-md-9">
                                            <asp:Button ID="Button12" runat="server" Text="حفظ" class="btn green" OnClick="Button12_Click" />

                                            <asp:Button ID="Button13" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel_Click2" />
                                        </div>
                                    </div>

                                          </div>
                        </div>



                       
                    </div>


                            </div>
                <%} %>

            <div class="portlet box red">
                <div class="portlet-title">

                    <div class="caption"><i class="fa fa-cogs"></i> بيانات دورات الموظف</div>
                    <div class="tools">
                       
                         <a href="javascript:;" class="collapse"></a>
                                  
                    </div>
                </div>

             <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                     <th style="width: 10%">اسم الموظف </th>
                                    <th style="width: 10%">اسم الدورة </th>
                                    <th style="width: 10%">الجهة المنظمة </th>
                                    <th style="width: 15%; text-align: center"> تاريخ البدء </th>
                                    <th style="width: 15%; text-align: center">تاريخ الانتهاء </th>
                                 <%--   <th style="width: 20%; text-align: center">ملاحظات</th>--%>
                                    <th style="width:20%;"></th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>

                                        <asp:Label ID="CourseID" runat="server" Text='<%# Eval("Course_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                              <td><span><%# Eval("Ar_F_Name") %>  <%# Eval("Ar_Family_Name") %></span></td>
                                            <td><span><%# Eval("Course_Name") %></span></td>
                                            <td><span><%# Eval("Course_Place") %></span></td>
                                        <%--    <td style="text-align: center"><span><%# Eval("Courses_Details") %></span></td>--%>
                                            <td style="text-align: center"><span><%# Eval("Course_From","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Course_To","{0:yyyy/MM/dd}")  %></span></td>
                                            <td style="text-align: center">
                                           </td>
                                            <td style="text-align: center"> 
                                                <% if (Permissions.Contains("CoursesEdit"))
                                                     { %>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                     <%} %>

                                                <% if (Permissions.Contains("CoursesDelete"))
                                                    { %>  <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                               <%} %> </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT  [Courses_TB].*,Employee_TB.* FROM  [Courses_TB] Inner Join [Employee_TB]
                                   on [Courses_TB].Emp_ID=Employee_TB.Emp_ID where  [Courses_TB].IsDelete=0 and Courses_TB.Emp_ID=@Emp_ID order by [Courses_TB].Course_ID DESC">
                                      <SelectParameters>
                                           <asp:ControlParameter ControlID="DropDownList8" Name="Emp_ID" PropertyName="SelectedValue" Type="Int16" />
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

