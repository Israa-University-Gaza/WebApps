<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Family_View.aspx.cs" Inherits="APP_HRM_Emp_Family_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> بيانات العائلة</div>
                    <div class="tools">

                         <a href="javascript:;" class="collapse"></a>
                                  
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 20%">الاسم </th>
                                  
                                    <th style="width: 10%; text-align: center">صلة القرابة</th>
                                    <th style="width: 10%; text-align: center">تاريخ الميلاد</th>
                                    <th style="width: 10%; text-align: center">الوظيفة</th>
                               <%--     <th style="width: 5%; text-align: center">فعال</th>--%>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="EmpFamilyID" runat="server" Text='<%# Eval("Emp_Family_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                     <td><span><%# Eval("F_Name") %> <%# Eval("S_Name") %> <span><%# Eval("Th_Name") %> <%# Eval("Family_Name") %></span></td>

                                            <td style="text-align: center"><span><%# Eval("Ar_Name") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Date_Of_Birth","{0:yyyy/MM/dd}") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("name") %></span></td>
                                           <%-- <td style="text-align: center">
                                                <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' />
                                            </td>--%>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT Emp_Family.*,Emp_Sub_Constant.Ar_Name,h.Ar_Name as name
       
                                    
                                     FROM [Emp_Family] 
                                    inner join [Emp_Sub_Constant] ON Emp_Family.Relative_Type_ID=Emp_Sub_Constant.Sub_Constant_ID
								inner join [Emp_Sub_Constant] as h ON Emp_Family.Job=h.Sub_Constant_ID
                                     where IsDelete=0 and Emp_ID=2 order by Emp_Family_ID DESC"></asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box yellow">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> بيانات الطوارئ</div>
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
                                    <th style="width: 20%">الاسم </th>
                                  
                                    <th style="width: 10%; text-align: center">صلة القرابة</th>
                                    <th style="width: 10%; text-align: center">رقم الهاتف </th>
                                    <th style="width: 10%; text-align: center">رقم الجوال</th>
                                  <%--  <th style="width: 5%; text-align: center">فعال</th>--%>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <asp:Label ID="EmergancyID" runat="server" Text='<%# Eval("Emergancy_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                  <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <span><%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>

                                            <td style="text-align: center"><span><%# Eval("Emergancy_Relative_ID") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Emergancy_Phone") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Emergancy_Mobile") %></span></td>
                                         <%--   <td style="text-align: center">
                                                <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' />
                                            </td>--%>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit2" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click2"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete2" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click2" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT Emergancy_TB.*,Emp_Sub_Constant.Ar_Name
                                    
                                     FROM Emergancy_TB  inner join Emp_Sub_Constant on Emergancy_TB.Emergancy_Relative_ID=Emp_Sub_Constant.Sub_Constant_ID
                                    
                                     where IsDelete=0 and Emp_ID=2  order by Emergancy_ID DESC"></asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="portlet box purple">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> بيانات المعرفين</div>
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
                                    <th style="width: 20%">الاسم </th>
                                
                                    <th style="width: 10%; text-align: center"> الوظيفة </th>
                                    <th style="width: 10%; text-align: center">رقم الهاتف </th>
                                    <th style="width: 10%; text-align: center">رقم الجوال</th>
                                <%--    <th style="width: 5%; text-align: center">فعال</th>--%>
                                    <th style="width: 15%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <asp:Label ID="RefID" runat="server" Text='<%# Eval("Ref_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                              <td><span><%# Eval("Ar_F_Name") %> <%# Eval("Ar_S_Name") %> <%# Eval("Ar_Th_Name") %> <%# Eval("Ar_Family_Name") %></span></td>

                                            <td style="text-align: center"><span><%# Eval("Ref_Job") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Ref_Phone") %></span></td>
                                            <td style="text-align: center"><span><%# Eval("Ref_Mobile") %></span></td>
                                         <%--   <td style="text-align: center">
                                                <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' />
                                            </td>--%>
                                            <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit3" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click3"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <asp:LinkButton ID="lbDelete3" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click3" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT * FROM [References] WHERE IsDelete=0 and Emp_ID=2 order by Ref_ID DESC"></asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

