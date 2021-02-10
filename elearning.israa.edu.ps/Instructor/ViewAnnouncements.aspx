<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" validateRequest="false" CodeFile="ViewAnnouncements.aspx.cs" Inherits="Instructor_ViewAnnouncements" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="col-sm-12 col-md-12">
<div class="well">
<h3><span style="font-size:18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text=""></asp:Label> </h3>
<p class="text-center">
    
    

   
    <div class="form-group" style="text-align: center">
            
      <div>
          <asp:Label ID="det" runat="server" Text="Label"></asp:Label>
             </div>
       
        </div>
    

  
   
</p>
</div>
            <hr/>
              
   <div class="well">
<h3><span style="font-size:18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;المشاهدات </h3>
<p class="text-center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [std_id], [name], [dt],  ROW_NUMBER() OVER (ORDER BY dt desc) row_num FROM [seen] WHERE (([typ] = @typ) AND ([re_id] = @re_id)) ORDER BY dt desc">
        <SelectParameters>
            <asp:Parameter DefaultValue="ann" Name="typ" Type="String" />
            <asp:QueryStringParameter Name="re_id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </p>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table" EmptyDataText="لا يوجد مشاهدات">
        <Columns>
            <asp:BoundField DataField="row_num" HeaderText="#" SortExpression="row_num"></asp:BoundField>
            <asp:BoundField DataField="std_id" HeaderText="رقم الطالب" SortExpression="std_id" />
            <asp:BoundField DataField="name" HeaderText="الاسم" SortExpression="name" />
            <asp:BoundField DataField="dt" HeaderText="اخر زيارة" SortExpression="dt" />
        </Columns>
    </asp:GridView>
       </div>
             <hr/>
              <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound" >
                                <ItemTemplate>
            <div class="col-sm-12 col-md-12">
            <div class="well">
                <h4><span style="font-size: 14px;" class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server"><%# Eval("Name") %></asp:HyperLink> <span style="font-family:Tahoma;color:green;font-size:small"><%# Eval("dt") %></span> <asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton1_Click" runat="server" Width="25px" Height="25px" ImageUrl="~/assets/del.png" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" />
                </h4>
                <p class="text-justify">
                   <%# Eval("comment") %>- 
                </p>
            </div>
        </div>
                </ItemTemplate>
                            </asp:Repeater>
            <hr>
            <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span> اضافة رد   </h4>
           
              <<CKEditor:CKEditorControl ID="Editor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>

          
<asp:Button ID="Button1" CssClass="btn-primary" runat="server" Text="رد" OnClick="Button1_Click" />
        </div>
        
    </div>
</div>
</asp:Content>

