<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Experiance_AddEdit.aspx.cs" Inherits="APP_HRM_Emp_Experiance_AddEdit" %>

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
        <li><a href="Emp_Experiance_AddEdit.aspx" class="font-ha">الخبرات العملية</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <% if (Permissions.Contains("ExperiencesView"))
         { %>
    <div class="row">
        <div class="col-md-12">
            <% if (Permissions.Contains("ExperiencesAdd")||Permissions.Contains("ExperiencesEdit"))
                                               { %>

            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>ادخال الخبرات السابقة </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                        <%-- <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>--%>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                  
                        <div class="form-body">
                               <div class="form-group">


                                              <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="DropDownList8" AutoPostBack="true" class="form-control" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>

                                </div>


                               
                            </div>  <div class="clearfix"></div>

                            <%--<div class="form-group" runat="server" id="check">
                                <label class="col-md-3 control-label">رقم الموظف </label>
                                <div class="col-md-4">
                                    <div class="input-group" style="text-align: left">
                                        <asp:TextBox ID="txtEmp" runat="server" class="form-control" placeholder="Enter text"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <asp:Button ID="Button3" runat="server" Text="فحص" class="btn green" OnClick="Username_Checker_Click2" />

                                        </span>
                                    </div>
                                    <asp:Label ID="Label5" runat="server" class="help-block" Text="اسم الموظف"></asp:Label>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                </div>
                            </div>--%>

                               <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">الوظيفة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="JobName" runat="server" placeholder="ادخل اسم الوظيفة" Rows="3" class="form-control"></asp:TextBox>

                                </div>
                            </div>
                               <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">تفاصيل الوظيفة</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="JobDetailes" placeholder="ادخل تفاصيل الوظيفة" runat="server" Rows="3" class="form-control" TextMode="MultiLine"></asp:TextBox>

                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">العمل السابق</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="CompName" runat="server" placeholder="ادخل  العمل السابق" Rows="3" class="form-control"></asp:TextBox>

                                </div>
                            </div>
                               <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">مجال العمل السابق</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="ScopeName" placeholder="ادخل  مجال العمل السابق" runat="server" Rows="3" class="form-control"></asp:TextBox>

                                </div>
                            </div>
                               <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">تاريخ بداية العمل    </label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="From_Date" placeholder="ادخل تاريخ بداية العمل" runat="server" class="form-control form-control-inline input-large date-picker" type="text" value=""></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                               <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">تاريخ نهاية العمل    </label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-calendar"></i>
                                        <asp:TextBox ID="To_Date" runat="server" placeholder="ادخل تاريخ نهاية العمل" class="form-control form-control-inline input-large date-picker" type="text" value=""></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                               <div class="clearfix"></div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">أسباب ترك العمل</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="LeaveReason" placeholder="ادخل أسباب ترك العمل" runat="server" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>

                                </div>
                            </div>


                               <div class="clearfix"></div>
                            <div class="form-actions fluid">
                                <div class="col-md-offset-3 col-md-9">
                                    <asp:Button ID="Button12" runat="server" Text="حفظ" class="btn green" OnClick="Button12_Click" />

                                    <asp:Button ID="Button13" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel_Click2" />
                                </div>
                            </div>

                        </div>
                    </div>




              


            </div>
            <%} %>
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>بيانات خبرات الموظف</div>
                    <div class="tools">
                        <%--  <a class="remove" href="javascript:;"></a>--%>
                        <a href="javascript:;" class="collapse"></a>

                    </div>
                </div>

                <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 20%">اسم الموظف</th>
                                    <th style="width: 20%">الوظيفة السابقة</th>
                                    <th style="width: 20%">مجال العمل السابق </th>
                                    <th style="width: 20%; text-align: center">مجال العمل</th>

                                    <th style="width: 20%;"></th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="Experince_ID" runat="server" Text='<%# Eval("Experince_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Ar_F_Name") %>  <%# Eval("Ar_Family_Name") %></span></td>
                                            <td><span><%# Eval("Job_Name") %></span></td>
                                            <td><span><%# Eval("Company_Name") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Company_Work_Scope") %></span></td>


                                            <td style="text-align: center">
                                                <% if (Permissions.Contains("ExperiencesEdit"))
                                                     { %>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <%} %>

                                                <% if (Permissions.Contains("ExperiencesDelete"))
                                                    { %>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                   <%} %>

                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand=" SELECT  [Experience_TB].*,Employee_TB.* FROM  [Experience_TB] Inner Join [Employee_TB]
                                   on [Experience_TB].Emp_ID=Employee_TB.Emp_ID where  [Experience_TB].IsDelete=0 and Experience_TB.Emp_ID=@Emp_ID
                                     order by [Experience_TB].Experince_ID DESC">

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

