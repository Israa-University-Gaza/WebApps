<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="DelayBorrowView.aspx.cs" Inherits="Library_DelayBorrowView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="row">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-search"></i>قائمة المستعيرين المتاخرين</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
          
                <div class="form-group">
                    <asp:Button ID="print" runat="server" Text="طباعة تقرير" CssClass="btn green" OnClick="print_Click" />
                    </div>
                 <% if (Repeater1.Items.Count > 0)
                               { %>  
                                        
                                <table class="table">
                                    <thead>
                                        <tr>
                                           <%-- <th style="width: 5%!important; text-align: center">#</th>--%>
                                            <th style="width: 25%!important; ">اسم المستعير </th>
                                            <th style="width: 25%!important; ">اسم الكتاب</th>
                                            <th style="width: 20%!important;">تاريخ الاعارة</th>
                                            <th style="width: 20%!important; ">تاريخ الارجاع الافتراضي</th>
                                               <th style="width: 10%!important; ">عدد أيام التأخير</th>
                                            <th ></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
                                      
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="ID" Visible="false" runat="server" Text=' <%# Eval("ID") %>'></asp:Label>
                                                    <td style="width: 18%!important;"><%# Eval("DisplayName") %></td>
                                                    <td style="width: 18%!important;"><%# Eval("BookTitle") %></td>
                                                    <td style="width: 20%!important;"><%# Eval("BorrowDate","{0:yyyy/MM/dd}") %></td>
                                                    <td style="width: 20%!important;"><%# Eval("ReturnDate","{0:yyyy/MM/dd}") %></td>
                                                        <td style="width: 10%!important;"><%# Eval("DiffDate") %></td>


                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="DelayBorrow" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </tbody>
                                </table>
                 <% }
                               else
                               { %>

                       <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong> لا يوجد مستعيرين  متأخرين </strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                          <% } %>
               </div>
          
            </div>
         </div>
</asp:Content>

