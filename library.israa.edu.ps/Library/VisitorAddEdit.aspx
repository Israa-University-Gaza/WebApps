<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="VisitorAddEdit.aspx.cs" Inherits="Library_VisitorAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="row">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="glyphicon glyphicon-book"></i>إضافة زائر جديد</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">الاسم رباعي</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="FullName" runat="server" CssClass="form-control " placeholder="الاسم"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">رقم الهوية</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="SSN" runat="server" CssClass="form-control " placeholder="رقم الهوية"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">رقم الجوال</label>
                            <div class="col-md-4">
                          
                                <asp:TextBox ID="Mobile" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">البريد الالكتروني</label>
                            <div class="col-md-4">
                         <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">رقم الهاتف</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="Phone" runat="server" CssClass="form-control " placeholder="رقم الهاتف"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">العنوان </label>
                            <div class="col-md-4">
                                <asp:TextBox ID="address" runat="server" CssClass="form-control " placeholder="العنوان "></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                       <div class="form-group">
                            <label class="col-md-2 control-label">ملاحظات </label>
                            <div class="col-md-10">
                                <asp:TextBox ID="Notes" TextMode="MultiLine" Rows="1" runat="server" CssClass="form-control " placeholder="ملاحظات"></asp:TextBox>
                            </div>
                        </div>
                              <div class="clearfix"></div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-2 col-md-9">
                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="تفريغ الحقول" CssClass="btn default" OnClick="btnCancel_Click"  />
                        </div>
                    </div>
                </div>
            </div>
        </div>


         <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-search"></i> عرض زوار المكتبة</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                 
                <div class="form-group">
                                        <% if (Repeater1.Items.Count > 0)
                               { %>  
                                <table id="sample_editable_13">
                                    <thead>
                                        <tr>
                                        <%--    <th  style="width: 5%!important; text-align: center">#</th>--%>
                                            <th style="width: 18%!important; text-align: center">الاسم </th>
                                            <th style="width: 18%!important; text-align: center">رقم الهوية</th>
                                            <th style="width: 30%!important; text-align: center">الجوال</th>
                                            <th style="width: 30%!important; text-align: center">العنوان</th>
                                            <th ></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
                                      
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <tr>
                                                
                                                    <td style="width: 18%!important; text-align: center"><%# Eval("FullName") %> <asp:Label ID="ID" Visible="false" runat="server" Text=' <%# Eval("ID") %>'></asp:Label></td>
                                                    <td style="width: 18%!important; text-align: center"><%# Eval("SSN") %></td>
                                                    <td style="width: 30%!important; text-align: center"><%# Eval("Mobile") %></td>
                                                    <td style="width: 30%!important; text-align: center"><%# Eval("Address") %></td>

                                                    <td>
                                                        <asp:Button ID="lbEdit" runat="server" Text="تحرير" class="btn default btn-xs black" OnClick="lbEdit_Click" /></td>
                                                    <td>
                                                        <asp:Button ID="lbDelete" runat="server" Text="حذف" class="btn default btn-xs purple" OnClick="lbDelete_Click" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>

                                        </asp:Repeater>

                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT * FROM [Visitor] where IsDelete=0 order by ID desc"></asp:SqlDataSource>
                                    </tbody>
                                </table>

                     <% }
                               else
                               { %>

                       <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong> لا يوجد نتائج للبحث  </strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                          <% } %>
               </div></div>
            </div>
    </div>
</asp:Content>

