<%@ Page Title="" Language="C#" MasterPageFile="~/APP_HRM/MasterPage.master" AutoEventWireup="true" CodeFile="Currancy_AddEdit.aspx.cs" Inherits="APP_HRM_Currancy_AddEdit" %>

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
            <i class="fa fa-home"></i><a href="Emp_Info_AddEdit.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Currancy_AddEdit.aspx" class="font-ha">العملات</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="row">
           <% if (Permissions.Contains("CurrancyView"))
           { %>
        <div class="col-md-7">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>  اضافة العملات </div>
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
                                    <th style="width:30%"> اسم العملة باللغة العربية  </th>
                                    <th style="width:30%">اسم العملة باللغة الانجليزية </th>
                              
                                    <th style="width: 30%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="CurID" runat="server" Text='<%# Eval("Cur_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td  style="text-align:center;"><span><%# Eval("Cur_Ar_Name") %></span></td>
                                              <td  style="text-align:center;"><span><%# Eval("Cur_En_Name") %> </span></td>
                                           
                                            <td style="text-align: center">
                                                 <% if (Permissions.Contains("CurrancyEdit"))
           { %>
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                <%} %>
                                                 <% if (Permissions.Contains("CurrancyDelete"))
           { %>
                                                <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                          <%} %>
                                                  </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:HumanResources %>"
                                    SelectCommand="select * from [dbo].[Currency_TB] where IsDelete=0 order by [Cur_ID] desc">
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
           <% if (Permissions.Contains("CurrancyAdd") ||Permissions.Contains("CurrancyEdit") )
           { %>
        <div class="col-md-5">
            <div class="portlet box blue">
                <asp:TextBox ID="lblCurID" runat="server" Text="" Visible="false"></asp:TextBox>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل العملة  </div>
                    <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-5 control-label">اسم العملة باللغة العربية</label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="الرجاء ادخال اسم العملة"></asp:TextBox>
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-md-5 control-label"style="padding-left:0px;">اسم العملة باللغة الانجليزية</label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="الرجاء ادخال اسم العملة"></asp:TextBox>
                                </div>
                            </div>
                           
                              <div class="form-group">
                                <label class="col-md-5 control-label">عدد الأرقام العشرية</label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="الرجاء ادخال عدد الارقام العشرية"></asp:TextBox>
                                </div>
                            </div>

                              <div class="form-group">
                                <label class="col-md-5 control-label">اسم الأرقام العشرية</label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="الرجاء ادخال اسم الارقام العشرية"></asp:TextBox>
                                </div>

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
