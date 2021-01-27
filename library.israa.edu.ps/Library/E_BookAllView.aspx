<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="E_BookAllView.aspx.cs" Inherits="Library_E_BookAllView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        <div class="row">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-search"></i>عرض الكتب الالكترونية</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
    <div class="form-group">
                                        <% if (Repeater1.Items.Count > 0)
                               { %> 
                                <table  class="table">
                                    <thead>
                                        <tr>
                                            <th style="width: 2%!important; text-align: center">#</th>
                                              <th style="width: 18%!important; ">الرقم العام  </th>
                                            <th style="width: 25%!important; ">اسم الكتاب </th>
                                            <th style="width: 25%!important; "> اسم المؤلف</th>
                                             <th style="width: 30%!important; "> التصنيف </th>
                            
                                            <th ></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
                                      
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <tr>
                                                  
                                                    <td style="width: 2%!important;"><%# Eval("RowNumber") %></td>
                                                      <td style="width: 18%!important;"><%# Eval("ISBN") %></td>
                                                    <td style="width: 25%!important;"><%# Eval("BookTitle") %></td>
                                                    <td style="width: 25%!important;"><%# Eval("AuhorName") %></td>
                                                      <td style="width: 30%!important;"><%# Eval("cat") %></td>
                                                 

                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="E_AllBookGetAll" SelectCommandType="StoredProcedure">
                                        
                                        </asp:SqlDataSource>
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
               </div></div></div></div>
</asp:Content>

