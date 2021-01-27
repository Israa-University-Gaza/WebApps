<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="DelayNotification.aspx.cs" Inherits="Library_DelayNotification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-search"></i>تنبيهات المستعيرين المتأخرين</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
          
               <%-- <div class="form-group">
                    <asp:Button ID="print" runat="server" Text="طباعة تقرير" CssClass="btn green" OnClick="print_Click"  />
                    </div>--%>
                <div class="form-group">
                                      <% if (Repeater1.Items.Count > 0)
                               { %>       
                                <table class="table-bordered">
                                    <thead>
                                        <tr>
                                           <%-- <th style="width: 5%!important; text-align: center">#</th>--%>
                                            <th style="width: 18%!important; ">اسم المستعير </th>
                                            <th style="width: 18%!important; ">اسم الكتاب</th>
                                            <th style="width: 15%!important;">تاريخ الاعارة</th>
                                            <th style="width: 15%!important; ">تاريخ الارجاع الافتراضي</th>
                                               <th style="width: 10%!important; ">عدد أيام التأخير</th>
                                                        <th style="width: 8%!important; ">تنبيه أول</th>
                                                        <th style="width: 8%!important; ">تنبيه ثان</th>
                                                        <th style="width: 10%!important; "> تعطيل خدمة الاعارة</th>
                                           <%-- <th ></th>--%>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
                                      
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="ID" Visible="false" runat="server" Text=' <%# Eval("ID") %>'></asp:Label>
                                                    <td style="width: 18%!important;"><%# Eval("DisplayName") %></td>
                                                    <td style="width: 18%!important;"><%# Eval("BookTitle") %></td>
                                                    <td style="width: 15%!important;"><%# Eval("BorrowDate","{0:yyyy/MM/dd}") %></td>
                                                    <td style="width: 15%!important;"><%# Eval("ReturnDate","{0:yyyy/MM/dd}") %></td>
                                                        <td style="width: 10%!important;"><%# Eval("DiffDate") %></td>
                                                    <td  style="width: 8%!important; ">
                                                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged"
                                                             Checked=' <%# Convert.ToBoolean(Eval("FirstNotification")!= DBNull.Value) ? Convert.ToBoolean(Eval("FirstNotification")) : false %>' /></td>
                                                        <td  style="width: 8%!important; ">
                                                            <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox2_CheckedChanged" 
                                                                 Checked=' <%# Convert.ToBoolean(Eval("secondNotification")!= DBNull.Value) ? Convert.ToBoolean(Eval("SecondNotification")) : false %>'/></td>
                                                        <td  style="width: 10%!important; ">
                                                            <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox3_CheckedChanged"
                                                                 Checked=' <%# Convert.ToBoolean(Eval("FinallyNotification")!= DBNull.Value) ? Convert.ToBoolean(Eval("FinallyNotification")) : false %>'/></td>


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
                                    <strong> لا يوجد تنبيهات  </strong>
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

