<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="Library_search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-search"></i>البحث</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
          <div class="form-group">
              <label class="col-md-2 control-label">نوع الموضوع</label>
                            <div class="col-md-4">
                                <asp:DropDownList class="select2_category form-control" ID="DDType" runat="server"  DataSourceID="SqlDataSource8" DataTextField="SubConstantName" DataValueField="SubConstantID" ></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT SubConstantID,SubConstantName FROM [SubConstantTB] WHERE ([ConstantID] = @ConstantID) union select 0,N''">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
          </div>
                       <div class="clearfix"></div>
                <div class="form-group">
                    <label class="col-md-2 control-label">حدد نوع البحث</label>
                    <div class="col-md-9">
                        <div class="checkbox-list">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                <asp:ListItem Value="1" Selected="True">بحث مفتوح</asp:ListItem>
                                <asp:ListItem Value="2">بحث بالعنوان</asp:ListItem>
                                <asp:ListItem Value="3">بحث بالموضوع</asp:ListItem>
                                <asp:ListItem Value="4">بحث باسم المؤلف او المترجم ..</asp:ListItem>
                            </asp:RadioButtonList>
                           
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="form-group">
                    <label class="col-md-2 control-label">ادخل كلمة او جملة البحث</label>
                    <div class="col-md-4" style="margin-bottom: 30px!important">
                        <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control " placeholder="ادخل كلمة او جملة البحث"></asp:TextBox>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-4" style="margin-bottom: 30px!important">
                        <asp:Button ID="btnSave" runat="server" Text="بحث" CssClass="btn green col-md-4 font-ha" OnClick="btnSave_Click" />
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>

    </div>

    
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-search"></i>نتائج البحث</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                    <% if (Repeater1.Items.Count > 0)
                               { %>
                <div class="form-group">
                                        
                                <table id="sample_editable_13">
                                    <thead>
                                        <tr>
                                           <%-- <th style="width: 5%!important; text-align: center">#</th>--%>
                                            <th style="width: 18%!important; ">الرقم العام </th>
                                            <th style="width: 18%!important; ">رقم التصنيف</th>
                                            <th style="width: 30%!important;">عنوان الكتاب</th>
                                            <th style="width: 30%!important; ">مكان وجوده</th>
                                            <th ></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
                                      
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="ID" Visible="false" runat="server" Text=' <%# Eval("ID") %>'></asp:Label>
                                                    <td style="width: 18%!important;"><%# Eval("PublicID") %></td>
                                                      <td style="width: 18%!important; "><%# Eval("CategoryID") %></td>
                                                      <td style="width: 30%!important; "><%# Eval("BookTitle") %>= <%# Eval("BookTitle2") %>: <%# Eval("BookTitle3") %></td>
                                                     <td style="width: 30%!important;"><%# Eval("BookPlace") %></td>
                                                    <td>   <asp:Button ID="View" runat="server" Text="عرض" class="btn default btn-xs green" OnClick="View_Click" />
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="lbEdit" runat="server" Text="تحرير" class="btn default btn-xs black" OnClick="lbEdit_Click"  /></td>
                                                      <td>   <asp:Button ID="lbDelete" runat="server" Text="حذف" class="btn default btn-xs purple" OnClick="lbDelete_Click" />
                                                    </td>
                                          </tr>
                                                     </ItemTemplate>

                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="BookSearchTitle" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DDType" PropertyName="SelectedValue" Name="BookType" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="TextBox14" PropertyName="Text" Name="SearchWord" Type="String"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="BookSearchSubject" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="TextBox14" PropertyName="Text" Name="SearchWord" Type="String"></asp:ControlParameter>
                                           <asp:ControlParameter ControlID="DDType" PropertyName="SelectedValue" Name="BookType" Type="Int32"></asp:ControlParameter>

                                                 </SelectParameters>
                                        </asp:SqlDataSource>

                                               <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="BookSearchAuthor" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                           <asp:ControlParameter ControlID="DDType" PropertyName="SelectedValue" Name="BookType" Type="Int32"></asp:ControlParameter>

                                                 <asp:ControlParameter ControlID="TextBox14" PropertyName="Text" Name="SearchWord" Type="String"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                         <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="BookSearch" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                             <asp:ControlParameter ControlID="DDType" PropertyName="SelectedValue" Name="BookType" Type="Int32"></asp:ControlParameter>

                                                <asp:ControlParameter ControlID="TextBox14" PropertyName="Text" Name="SearchWord" Type="String"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
               </div>


                
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
          
</asp:Content>

