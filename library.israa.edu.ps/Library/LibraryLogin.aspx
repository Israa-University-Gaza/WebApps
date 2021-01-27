<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="LibraryLogin.aspx.cs" Inherits="Library_LibraryLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="glyphicon glyphicon-book"></i>تسجيل الدخول للمكتبة</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">رقم الطالب/الموظف</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="ID" runat="server" CssClass="form-control " placeholder="رقم الطالب" AutoPostBack="true" OnTextChanged="ID_TextChanged" ></asp:TextBox>
                            </div>
                           
                        
                            </div>

                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >
                            <ItemTemplate>
                                 <div class="form-group">
                        
                   
                                <label class="col-md-2 ">الاسم  </label>
                                  <div class="col-md-4">
                               <asp:Label ID="Label2"  runat="server" Text='<%#Eval("DisplayName") %>'></asp:Label> 

                                  </div>
                                 <label class="col-md-2 ">الفئة  </label>
                                  <div class="col-md-4">
                               <asp:Label ID="Label3"  runat="server" Text='<%#Eval("BorrowCatType") %>'></asp:Label> 
                               <asp:Label ID="BorrowCatID"  runat="server" Text='<%#Eval("BorrowCatID") %>' Visible="false"></asp:Label> 
                              
                            </div>

                           <div class="clearfix"></div>
                           
                            
                           </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="BorrowerDataGet" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ID" PropertyName="Text" Name="BorrowerNo"  Type="String"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                     
                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-2 col-md-9">
                            <asp:Button ID="btnSave" runat="server" Text="تسجيل دخول" CssClass="btn green" OnClick="btnSave_Click"  />
                            <asp:Button ID="btnCancel" runat="server" Text="تفريغ الحقول" CssClass="btn default" OnClick="btnCancel_Click"  />
                        </div>
                    </div>
                </div>
            </div>

           
        </div>

    <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-search"></i>عرض تسجيل دخول المكتبة</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">

    <div class="form-group">
                                        <% if (Repeater1.Items.Count > 0)
                               { %> 
                                <table  class="table">
                                    <thead>
                                        <tr>
                                            <th style="width: 2%!important; text-align: center">#</th>
                                              <th style="width: 18%!important; ">الاسم  </th>
                                            <th style="width: 25%!important; ">الرقم </th>
                                            <th style="width: 25%!important; "> التاريخ</th>
                                             <th style="width: 30%!important; "> الوقت </th>
                            
                                            <th ></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
                                      
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                            <ItemTemplate>
                                                <tr>
                                                  
                                                    <td style="width: 2%!important;"><%# Eval("RowNumber") %></td>
                                                      <td style="width: 18%!important;"><%# Eval("DisplayName") %></td>
                                                    <td style="width: 25%!important;"><%# Eval("ClientID") %></td>
                                                    <td style="width: 25%!important;"><%# Eval("LibDate","{0:yyyy/MM/dd}") %></td>
                                                      <td style="width: 30%!important;"><%# Eval("LibTime") %></td>
                                                 

                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="LibraryRegisterGet" SelectCommandType="StoredProcedure">
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
               </div></div></div>
</asp:Content>

