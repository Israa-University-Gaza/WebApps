<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="MostRequestedBook.aspx.cs" Inherits="Library_MostRequestedBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-search"></i>الكتب والوثائق الأكثر طلبا خلال السنة</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
            <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">ادخل السنة</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="from" runat="server"  CssClass="form-control" ></asp:TextBox>
                            </div>
                          
                     <div class="col-md-2">
                                   
                                      <asp:Button ID="Button2" runat="server" Text="عرض" CssClass="btn green" />
                            </div>
                            </div>
                <div class="clearfix"></div>
                <div class="form-group">

                    <asp:Button ID="print" runat="server" Text="طباعة تقرير" CssClass="btn green" OnClick="print_Click"   />
                    </div>
                <div class="form-group">
                                    <% if (Repeater1.Items.Count > 0)
                               { %>        
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th style="width: 2%!important; text-align: center">#</th>
                                            <th style="width: 15%!important; ">الرقم العام </th>
                                            <th style="width: 15%!important; ">رقم التصنيف</th>
                                            <th style="width: 28%!important;">اسم الكتاب</th>
                                            <th style="width: 20%!important; ">اسم المؤلف</th>
                                               <th style="width: 20%!important; "> عدد مرات الاعارة</th>
                                            <th ></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
                                      
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <tr>
                                                  <td><asp:Label ID="ID" Visible="true" runat="server" Text=' <%# Eval("RowNumber") %>'></asp:Label></td>  
                                                    <td style="width: 15%!important;"><%# Eval("PublicID") %></td>
                                                    <td style="width: 15%!important;"><%# Eval("CategoryID") %></td>
                                                    <td style="width: 28%!important;"><%# Eval("Booktitle") %></td>
                                                    <td style="width: 20%!important;"><%# Eval("Author") %></td>
                                                        <td style="width: 20%!important;"><%# Eval("MostFrequent") %></td>


                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="MostFrequentBooksYearly" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="from" PropertyName="Text" Name="year" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
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
               </div>
                </div>
            </div>
         </div>
</asp:Content>

