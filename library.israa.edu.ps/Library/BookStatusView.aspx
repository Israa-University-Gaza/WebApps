<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="BookStatusView.aspx.cs" Inherits="Library_BookStatusView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-search"></i>كشف بحالة الكتب</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
            <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">حالة الكتاب</label>
                            <div class="col-md-2">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="SubConstantName" DataValueField="SubConstantID"></asp:RadioButtonList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT [SubConstantID], [SubConstantName] FROM [SubConstantTB] WHERE ([ConstantID] = @ConstantID)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="6" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                         
                     <div class="col-md-2">
                                   
                                      <asp:Button ID="Button2" runat="server" Text="عرض" CssClass="btn green" OnClick="Button2_Click"  />
                            </div>
                            </div>
                <div class="clearfix"></div>
                <div class="form-group">

                    <asp:Button ID="print" runat="server" Text="طباعة تقرير" CssClass="btn green"  OnClick="print_Click"  />
                    </div>
                <div class="form-group">
                                   <% if (Repeater1.Items.Count > 0)
                               { %>     
                                <table  class="table">
                                    <thead>
                                        <tr>
                                           <%-- <th style="width: 5%!important; text-align: center">#</th>--%>
                                              <th style="width: 5%!important; ">رقم  </th>
                                            <th style="width: 60%!important; ">اسم الكتاب </th>
                                            <th style="width: 35%!important; ">مكان وجوده</th>
                            
                                            <th ></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
                                      
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="ID" Visible="false" runat="server" Text=' <%# Eval("ID") %>'></asp:Label>
                                                    <td style="width: 18%!important;"><%# Eval("RowNumber") %></td>
                                                    <td style="width: 18%!important;"><%# Eval("BookTitle") %></td>
                                                    <td style="width: 20%!important;"><%# Eval("bookPlace") %></td>
                                                 

                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="BookStatusView" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="RadioButtonList1" PropertyName="SelectedValue" Name="BookStatus" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>

                    
                                             <div class="clearfix"></div>
                            <% }
                               else
                               { %>

                       <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد نتائج للبحث</strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                <div style="clear: both"></div>
                            </div>
                          <% } %>
               </div>
                </div>
            </div>
         </div>
</asp:Content>

