<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage.master" AutoEventWireup="true" validateRequest="false" enableEventValidation="true" CodeFile="ViewAnnouncements.aspx.cs" Inherits="Instructor_ViewAnnouncements" %>

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
            <div class="well">
<h5><span style="font-size:18px;" class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp; الأشخاص الذين شاهدوا هذا المحتوى </h5>
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
            <asp:BoundField DataField="name" HeaderText="الاسم" SortExpression="name" />
           
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
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span> اضافة تعليق   </h4>
           
          <asp:TextBox ID="Editor1" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
<asp:Button ID="Button1" CssClass="btn-primary" runat="server" Text="ارسال" OnClick="Button1_Click" />
        </div>
        
    </div>
</div>
</asp:Content>

