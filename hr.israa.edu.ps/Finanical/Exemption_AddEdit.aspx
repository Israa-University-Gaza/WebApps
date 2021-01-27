<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="Exemption_AddEdit.aspx.cs" Inherits="Finanical_Exemption_AddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script type="text/javascript">
         $('document').ready(function () {
             $('.page-sidebar-menu li').removeClass("active");
             $('#menu7').addClass("active");
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Exemption_AddEdit.aspx" class="font-ha">الاعفاءات الضريبية</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("ExemptionView"))
           { %>
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>الاعفاءات الضريبية  </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">


                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 20%">نوع الاعفاء </th>
                                    <th style="width: 17%">قيمة الاعفاء   </th>
                                    <th style="width: 17%">نوع العملة   </th>


                                    <th style="width: 25%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="ExemptionTypeID" runat="server" Text='<%# Eval("Exemption_Type_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Exemption_Type") %></span></td>
                                            <td><span><%# Eval("Exemption_Value_Yearly") %> </span></td>
                                            <td><span><%# Eval("Cur_Ar_Name") %> </span></td>

                                            <td style="text-align: center">
                                                <% if (Permissions.Contains("ExemptionEdit"))
                                                   { %>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <%} %>
                                                <% if (Permissions.Contains("ExemptionDelete"))
                                                   { %>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                                <%} %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="SELECT Currency_TB.*, Exemption_Type_TB.* From Exemption_Type_TB inner join Currency_TB on Exemption_Type_TB.Currancy_ID=Currency_TB.Cur_ID
                                     where   Exemption_Type_TB.IsDelete=0  order by Exemption_Type_TB.[Exemption_Type_ID] Desc"></asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
        <% if (Permissions.Contains("ExemptionAdd") && Permissions.Contains("ExemptionEdit"))
           { %>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:TextBox ID="lblExemptionID" runat="server" Text="" Visible="false"></asp:TextBox>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل الاعفاءات </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">نوع الاعفاء</label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">قيمة الاعفاء</label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtValue" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-md-3 control-label">نوع العملة</label>
                                <div class="col-md-7">
                                    <asp:DropDownList ID="CurrType" class="form-control"  CssClass="select2_category form-control" placeholder="ادخل نوع العملة " runat="server" DataSourceID="SqlDataSource2" DataTextField="Cur_Ar_Name" DataValueField="Cur_ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Cur_ID,Cur_Ar_Name  FROM [Currency_TB] union select 0,N'  ' "></asp:SqlDataSource>

                                </div>
                            </div>




                            <div class="clearfix"></div>


                            <%--      <div class="form-group">
                                            <label class="col-md-3 control-label"> نسبة الضريبة</label>
                                            <div class="col-md-7">
                                                
                                                    <asp:TextBox ID="txtRate" runat="server" class="form-control" placeholder="Enter text"></asp:TextBox>
                                                 
                                            </div>
                                        </div>--%>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
    </div>
</asp:Content>

