<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="Tax_Bracket_AddEdit.aspx.cs" Inherits="Finanical_Tax_Bracket_AddEdit" %>

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
            <a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Tax_Bracket_AddEdit.aspx" class="font-ha">الشرائح الضريبية</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
          <% if (Permissions.Contains("TaxBracketView"))
           { %>
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>  الشرائح الضريبية  </div>
                    <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                     

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width:20%">اسم الشريحة </th>
                                      <th style="width: 17%"> الحد الأدنى   </th>
                                       <th style="width: 17%"> الحد الأقصى   </th>
                                       <th style="width: 20%"> نسبة الضريبة  </th>
                                  
                                    <th style="width: 25%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="TaxBracketID" runat="server" Text='<%# Eval("Tax_Bracket_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Tax_Bracket_Name") %></span></td>
                                              <td><span><%# Eval("Tax_Bracket_Min_Yearly") %> </span></td>
                                             <td><span><%# Eval("Tax_Bracket_Max_Yearly") %> </span></td>
                                          
                                              <td><span><%# Eval("Tax_Bracket_Rate") %> </span></td>
                                           
                                            <td style="text-align: center">
                                                 <% if (Permissions.Contains("TaxBracketEdit"))
           { %>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                         <%} %>   <% if (Permissions.Contains("TaxBracketDelete"))
           { %>   
                                                  <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                           <%} %> </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="SELECT * From Tax_Bracket_TB
                                     where   Tax_Bracket_TB.IsDelete=0  order by Tax_Bracket_TB.[Tax_Bracket_ID] ">
                                   
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
          <% if (Permissions.Contains("TaxBracketAdd") || Permissions.Contains("TaxBracketEdit"))
           { %>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:TextBox ID="lblBracketID" runat="server" Text="" Visible="false"></asp:TextBox>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل الشرائح </div>
                    <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">اسم الشريحة</label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtName" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-md-3 control-label">الحد الأدنى</label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtMin" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                            </div>
                               <div class="form-group">
                                            <label class="col-md-3 control-label">الحد الأقصى</label>
                                            <div class="col-md-7">
                                                
                                                    <asp:TextBox ID="txtMax" runat="server" class="form-control" placeholder=""></asp:TextBox>
                                                 
                                            </div>
                                        </div>

                              <div class="form-body">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">نوع العملة</label>
                                            <div class="col-md-7">
                                                <asp:DropDownList ID="CurrType" class="form-control" CssClass="select2_category form-control"  placeholder="ادخل نوع العملة " runat="server" DataSourceID="SqlDataSource2" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name FROM [Currency_TB] union select 0,N'  '"></asp:SqlDataSource>
                                        
                                            </div>
                                        </div>


                                         

                                               <div class="clearfix"></div>
                              <div class="form-group">
                                            <label class="col-md-3 control-label"> نسبة الضريبة</label>
                                            <div class="col-md-7">
                                                
                                                    <asp:TextBox ID="txtRate" runat="server" class="form-control" placeholder="Enter text"></asp:TextBox>
                                                 
                                            </div>
                                        </div>
                          <%--  <div class="form-group">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-9">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>--%>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click"  />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <%} %>
        </div>
</asp:Content>

