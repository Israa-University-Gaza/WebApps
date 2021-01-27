<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Department.aspx.cs" Inherits="APP_HRM_Department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            <a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Department.aspx" class="font-ha">الدوائر</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
         <% if (Permissions.Contains("DepartmentView"))
           { %>
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>  الدوائر  </div>
                    <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <div class="input-group input-medium">
                            <asp:TextBox ID="txtNameFilter" runat="server" class="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btnFilter" runat="server" Text="تصفية" OnClick="btnFilter_Click" class="btn btn-primary" />

                            </span>
                        </div>

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width:20%">اسم الدائرة </th>
                              <%--        <th style="width: 20%"> مدير الدائرة </th>--%>
                                <%--    <th style="width: 20%">  الشئون التابع له </th>--%>
                                    <th style="width: 5%; text-align: center">فعال</th>
                                    <th style="width: 20%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="DepartmentID" runat="server" Text='<%# Eval("Department_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Ar_Name") %></span></td>
                                         <%--     <td><span><%# Eval("DisplayName") %> </span></td>--%>
                                  <%--           <td><span><%# Eval("Affairs_Name") %></span></td>--%>
                                            <td style="text-align: center">
                                               
                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("IsActive") %>' Enabled="false" />
                                                
                                            </td>
                                            <td style="text-align: center">
                                                  <% if (Permissions.Contains("DepartmentEdit"))
                                               { %>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                               <% } %>
                                                  <% if (Permissions.Contains("DepartmentDelete"))
                                               { %>
                                                 <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            <% } %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                          <%--      <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="SELECT Department_TB.*,Employee_TB.*,Affairs_TB.* FROM [Department_TB] 
                                    Inner Join [Employee_TB] On Department_TB.managerID = Employee_TB.Emp_ID
                                    Inner join [Affairs_TB] On Department_TB.Affairs_ID=Affairs_TB.Affairs_ID
                                     where  ([Ar_Name] like '%' + @Name + '%') and Department_TB.IsDelete=0  order by Department_TB.[Department_ID] DESC">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>--%>
                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="SELECT Department_TB.* FROM [Department_TB] 
                                   
                                     where  ([Ar_Name] like '%' + @Name + '%') and Department_TB.IsDelete=0  order by Department_TB.[Department_ID] ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtNameFilter" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
         <% if (Permissions.Contains("DepartmentAdd")||Permissions.Contains("DepartmentEdit"))
                                               { %>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:TextBox ID="lblDepID" runat="server" Text="" Visible="false"></asp:TextBox>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل الدائرة </div>
                    <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-5 control-label">اسم الدائرة باللغة العربية</label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="الرجاء ادخال اسم القسم"></asp:TextBox>
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-md-5 control-label"style="padding-left:0px;">اسم الدائرة باللغة الانجليزية</label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="الرجاء ادخال اسم القسم"></asp:TextBox>
                                </div>
                            </div>
                               <div class="form-group">
                                            <label class="col-md-5 control-label">مدير الدائرة </label>
                                          
                                                <div class="col-md-7">
                                    <asp:DropDownList ID="EmpName" class="form-control" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource19" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource19" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>

                                </div>
<%--                                                <asp:HiddenField ID="HiddenField1" runat="server" />--%>
                                            </div>
                                      
                            <div class="form-group">
                                <label class="col-md-5 control-label"></label>
                                <div class="col-md-7">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                                  <div class="form-group">
                                <label class="col-md-5 control-label"> التابع لها</label>
                                <div class="col-md-7">
                                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Ar_Name" DataValueField="Department_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [Department_ID], [Ar_Name] FROM [Department_TB] union select 0,N''">
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                              <div class="form-group">
                                <label class="col-md-5 control-label">  نوع الدائرة</label>
                                <div class="col-md-7">
                                    <asp:DropDownList ID="DepType" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT [ID], [Name] FROM [DepartmentType] union select 0,N''">
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-5 col-md-7">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="تفريغ الحقول" class="btn default" OnClick="btnCancel_Click"  />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
    </div>
</asp:Content>

