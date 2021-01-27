<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="LibraryBorrow.aspx.cs" Inherits="Student_LibraryBorrow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ul class="page-breadcrumb breadcrumb isra-contaner-heder font-ha">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#"> تنبيهات الكتب المعارة للمستعير </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <asp:Label ID="ID" runat="server" Visible="false"></asp:Label>
       <div class="row">
        <div class="portlet box blue">
            
          
            <div class="portlet-body">
             
   
           <h4 class="inlineh"><i class="fa fa-book" style="margin: 0 20px!important"></i> تنبيهات الكتب المعارة للمستعير </h4>
                                 <div class="clearfix"></div>
   
   <% if (Repeater1.Items.Count > 0)
                               { %>
                  <table class="table">

                        <thead>
                            <tr>
                                <th style="width: 15%;font-size:10pt">الرقم العام</th>
                                <th style="width: 20%;font-size:10pt">عنوان الكتاب</th>
                        
                                <th style="width: 15%;font-size:10pt">تاريخ الاعارة</th>
                                  <th style="width: 15%;font-size:10pt">تاريخ الارجاع</th>
                              <th style="width: 10%!important; ">تنبيه أول</th>
                              <th style="width: 10%!important; ">تنبيه ثان</th>
                               <th style="width: 15%!important; "> تعطيل  الاعارة</th>
                           
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="ID" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                                        <td><span><%#Eval("PublicID") %></span></td>
                                        <td><span><%#Eval("BookTitle") %></span></td>
                                       
                                        <td><span><%#Eval("BorrowDate","{0:yyyy/MM/dd}") %></span></td>
                                        <td><span><%#Eval("ReturnDate","{0:yyyy/MM/dd}") %></span></td>
                                   <td  style="width: 8%!important; ">
                                                        <asp:CheckBox ID="CheckBox1" runat="server"  Enabled="false"
                                                             Checked=' <%# Convert.ToBoolean(Eval("FirstNotification")!= DBNull.Value) ? Convert.ToBoolean(Eval("FirstNotification")) : false %>' /></td>
                                                        <td  style="width: 8%!important; ">
                                                            <asp:CheckBox ID="CheckBox2" runat="server"   Enabled="false"
                                                                 Checked=' <%# Convert.ToBoolean(Eval("secondNotification")!= DBNull.Value) ? Convert.ToBoolean(Eval("SecondNotification")) : false %>'/></td>
                                                        <td  style="width: 10%!important; ">
                                                            <asp:CheckBox ID="CheckBox3" runat="server"  Enabled="false" 
                                                                 Checked=' <%# Convert.ToBoolean(Eval("FinallyNotification")!= DBNull.Value) ? Convert.ToBoolean(Eval("FinallyNotification")) : false %>'/></td>


                                    </tr>

                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:isra4 %>' SelectCommand="StudentNotReturnBook" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ID" PropertyName="Text" Name="ClientID" Type="String"></asp:ControlParameter>
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
                                    <strong>لا يوجد تنبيهات</strong>
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

