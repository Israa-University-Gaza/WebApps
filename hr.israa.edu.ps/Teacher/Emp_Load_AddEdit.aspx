<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Load_AddEdit.aspx.cs" Inherits="Teacher_Emp_Load_AddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">العبء الدراسي </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <div class="row">
        <div class="col-md-12">
                        <div class="portlet box blue">
                                            <asp:TextBox ID="CourseID" runat="server" Text="" Visible="false"></asp:TextBox>

                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>ادخال العبء الدراسي للمدرسين  </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                              
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-horizontal">
                                    <div class="form-body">
                                        
                              <div class="form-group">


                                              <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="DropDownList8"   AutoPostBack="true" class="form-control"  placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName  FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>

                                </div>


                               
                            </div> 
                                 <div class="clearfix"></div>
                                      

                                           <div class="form-group">
                                            <label class="col-md-3 control-label">الحد الأقصى للعبء الدراسي </label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtName" runat="server" Rows="3" class="form-control" placeholder="ادخل الحد الأقصى للعبء الدراسي"></asp:TextBox>
                                          
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 control-label">سعر الساعة </label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtSubmit" runat="server" Rows="3" class="form-control" placeholder="ادخل سعر الساعة "></asp:TextBox>
                                            </div>
                                        </div>

                                       <div class="form-group">
                                            <label class="col-md-3 control-label">الفصل الدراسي </label>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="DropDownList1" runat="server"  class="form-control"  CssClass="select2_category form-control"  DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource2"
                                                    ConnectionString='<%$ ConnectionStrings:university3ConnectionString %>' SelectCommand="SELECT [ID], [ArName] FROM [Semester] union select 0,N'  '"></asp:SqlDataSource>
                                            </div>
                                        </div>

                                        <div class="form-actions fluid">
                                        <div class="col-md-offset-3 col-md-9">
                                            <asp:Button ID="Button12" runat="server" Text="حفظ" class="btn green" OnClick="Button12_Click" />

                                            <asp:Button ID="Button13" runat="server" Text="نفريغ الحقول" class="btn default" OnClick="btnCancel_Click2" />
                                        </div>
                                    </div>

                                          </div>
                        </div>



                       
                    </div>


                            </div>


            <div class="portlet box red">
                <div class="portlet-title">

                    <div class="caption"><i class="fa fa-cogs"></i>العبء الدراسي  </div>
                    <div class="tools">
                       
                         <a href="javascript:;" class="collapse"></a>
                                  
                    </div>
                </div>

             <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                     <th style="width: 25%">اسم الموظف </th>
                                    <th style="width: 25%">الحد الاقصى للعبء الدراسي </th>
                                    <th style="width: 25%"> سعر الساعة </th>
                                    
                                    <th style="width:25%;"></th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>

                                        <asp:Label ID="LoadID" runat="server" Text='<%# Eval("Load_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                              <td><span><%# Eval("Ar_F_Name") %>  <%# Eval("Ar_Family_Name") %></span></td>
                                            <td><span><%# Eval("Max_Load") %></span></td>
                                            <td><span><%# Eval("Hour_Price") %></span></td>
                                       
                                            <td style="text-align: center">
                                           </td>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT  [Emp_Load_TB].*,Employee_TB.* FROM  Emp_Load_TB Inner Join [Employee_TB]
                                   on Emp_Load_TB.Emp_ID=Employee_TB.Emp_ID where  Emp_Load_TB.IsDelete=0 order by Emp_Load_TB.Load_ID DESC"></asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
        






    </div>


            </div>
                        </div>
                          
</asp:Content>



