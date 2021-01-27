<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="UploaadEmpFiles.aspx.cs" Inherits="APP_HRM_UploaadEmpFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">رفع مستندات الموظف </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
     <div class="row">
        <div class="col-md-12">
         
         <%--    <% if (Permissions.Contains("JobTitleView"))
           { %>--%>
         
              <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> رفع مستندات الموظف </div>
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
                                 <label class="col-md-2 control-label" style="text-align: right">صورة الهوية </label>
                                <div class="col-md-4">
                                    <asp:FileUpload ID="SSNPhoto" runat="server" />
                                </div>
                            </div>
                            <div class="clearfix"></div>
                     <div class="form-group">
                                 <label class="col-md-2 control-label" style="text-align: right">شهادة الميلاد  </label>
                                <div class="col-md-4">
                                    <asp:FileUpload ID="BirthPhoto" runat="server" />
                                </div>
                            </div>
                                 <div class="clearfix"></div>
                             <h4 class="inlineh"><i  class="fa fa-file"  style="margin: 0 20px!important"></i>اقرار الحالة الاجتماعية</h4>
                       <div class="clearfix"></div>
                     <div class="form-group">
                                 <label class="col-md-2 control-label" style="text-align: right">عقد الزواج  </label>
                                <div class="col-md-4">
                                    <asp:FileUpload ID="MarriedPhoto" runat="server" />
                                </div>
                            </div>
                      <div class="clearfix"></div>
                     <div class="form-group">
                                 <label class="col-md-2 control-label" style="text-align: right">شهادات ميلاد الأبناء  </label>
                                <div class="col-md-4">
                                    <asp:FileUpload ID="SonsPhoto" AllowMultiple="true" runat="server" />
                                </div>
                            </div>
                      <div class="clearfix"></div>
                     <div class="form-group">
                                 <label class="col-md-2 control-label" style="text-align: right">مستندات أخرى  </label>
                                <div class="col-md-4">
                                    <asp:FileUpload ID="OthersPhoto" AllowMultiple="true" runat="server" />
                                </div>
                            </div>
                           <div class="clearfix"></div>
                                        <div class="form-actions fluid">
                                        <div class="col-md-offset-3 col-md-9">
                                        
                                            <asp:Button ID="UploadFiles" runat="server" Text="رفع الملفات" class="btn green" OnClick="UploadFiles_Click" />

                                            <asp:Button ID="EmptyFields" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="EmptyFields_Click"   />
                                        </div>
                                    </div>
                    </div>
                  </div>
                </div>

            <div class="col-md-12">
         <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> مستندات الموظفين </div>
                    <div class="tools">
                       
                    </div>
                </div>
                <div class="portlet-body">
                      <div class="input-group input-medium">
                            <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btn1Filter_Click" class="btn btn-primary" />

                            </span>
                        </div>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 10%">اسم الموظف</th>
                                    <th style="width: 10%; text-align: center"> صورة الهوية </th>

                                    <th style="width: 10%; text-align: center">شهادة الميلاد</th>
                                    <th style="width: 10%; text-align: center">عقد الزواج</th>
                                    <th style="width: 10%; text-align: center">شهادات ميلاد الأبناء </th>
                                 
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <tr>
                                  
                                            <td> <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="EmpID" runat="server" Text='<%# Eval("Emp_ID") %>' Visible="false"></asp:Label>
                                            <span> <%# Eval("DisplayName") %></span></td>
                                            <td style="text-align: center"> <asp:CheckBox ID="SSNPhoto" runat="server" Enabled="false" Checked='<%# (Eval("SSNPhoto")!="")?true:false %>' /></td>
                                            <td style="text-align: center">  <asp:CheckBox ID="BirthPhoto" runat="server" Enabled="false" Checked='<%# (Eval("BirthPhoto")!="")?true:false %>' /></td>
                                            <td style="text-align: center"> <asp:CheckBox ID="MarriedPhoto" runat="server" Enabled="false" Checked='<%# (Eval("MarriedPhoto")!="")?true:false %>' /></td>
                                             <td style="text-align: center"> <asp:CheckBox ID="SonsPhoto" runat="server" Enabled="false" Checked='<%# (Eval("SonsPhoto")!="")?true:false %>' /></td>
                                          

                                            <td style="text-align: center">
                                                  
                                                <asp:LinkButton ID="lbEdit2" runat="server" class="btn default btn-xs black" OnClick="lbEdit2_Click" ><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                           
                                                <%--  <asp:LinkButton ID="lbDelete2" runat="server" class="btn default btn-xs purple" OnClick="lbDelete2_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                              <asp:LinkButton ID="LbView" runat="server" class="btn default btn-xs black" OnClick="LbView_Click" ><i class="fa fa-edit"></i> عرض</asp:LinkButton>
                                              --%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="EmpFilesGetAll" SelectCommandType="StoredProcedure">
                                     <SelectParameters>
                                               <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />

                                         <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="" Name="Emp_ID" Type="Int32"></asp:ControlParameter>
                                     </SelectParameters>
                                </asp:SqlDataSource>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
       </div>
         </div>


</asp:Content>

