<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="EmpFilesView.aspx.cs" Inherits="APP_HRM_EmpFilesView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha"> مستندات الموظف </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="row">
        <div class="col-md-12">
         
         <%--    <% if (Permissions.Contains("JobTitleView"))
           { %>--%>
         
              <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>  مستندات الموظف </div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                         <a href="javascript:;" class="collapse"></a>
                                  
                    </div>
                </div>
                <div class="portlet-body">
                      <div class="form-group">
                                 <label class="col-md-2 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="EmpName"  placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource19" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" ></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource19" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] where IsDelete=0 and Emp_ID not in (1,2,3,5) union select 0,N'  '"></asp:SqlDataSource>

                                </div>
                            </div>
                      <div class="clearfix"></div>
                       <div class="form-group">
                                 <label class="col-md-2 control-label" style="text-align: right"> صورة الهوية</label>
                                <div class="col-md-4">
                    <asp:Image ID="SSNPhoto" runat="server" Width="400px" Height="400px" />
                                </div>
                            </div>
                      <div class="clearfix"></div>
                      <div class="form-group">
                                 <label class="col-md-2 control-label" style="text-align: right"> شهادة الميلاد </label>
                                <div class="col-md-4">
                    <asp:Image ID="BirthPhoto" runat="server" Width="400px" Height="400px" />
                                       </div>
                            </div>
                      <div class="clearfix"></div>
                      <div class="form-group">
                                 <label class="col-md-2 control-label" style="text-align: right"> عقد الزواج </label>
                                <div class="col-md-4">
                    <asp:Image ID="MarriedPhoto" runat="server" Width="400px" Height="400px" />
                                           </div>
                            </div>
                                      <div class="clearfix"></div>
                      <div class="form-group">
                                 <label class="col-md-2 control-label" style="text-align: right"> شهادات ميلاد الابناء </label>
                                <div id="sons" runat="server" class="col-md-4">
                                    
                   
                                           </div>
                            </div>
                         <div class="clearfix"></div>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                          <div class="form-group">
                                 <label class="col-md-2 control-label" style="text-align: right"> مستندات اخرى   </label>
                                <div id="Others" runat="server" class="col-md-4">
                                    
                   
                                           </div>
                            </div>
                         <div class="clearfix"></div>


                    </div>
                  </div>
            </div>
         </div>
    
</asp:Content>

