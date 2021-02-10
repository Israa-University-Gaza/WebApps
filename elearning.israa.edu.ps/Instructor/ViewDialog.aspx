<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" validateRequest="false" enableEventValidation="true" CodeFile="ViewDialog.aspx.cs" Inherits="Instructor_Dialog_" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
    
     <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span> الحوار الاسبوعي  </h4>
            <h4> <asp:Label ID="title" runat="server" Text=""></asp:Label> </h4>
            <p class="text-justify">
                 <asp:Label ID="det" runat="server" Text=""></asp:Label>
            </p>
        </div>
    </div>
    <div class="row">
    <asp:Repeater ID="Repeater" runat="server" >
                                <ItemTemplate>
            <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 14px;" class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server"><%# Eval("Name") %></asp:HyperLink> <span style="font-family:Tahoma;color:green;font-size:small"><%# Eval("EnterDate") %></span> <asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton1_Click" runat="server" Width="25px" Height="25px" ImageUrl="~/assets/del.png" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" />
                </h4>
                <p class="text-justify">
                   <%# Eval("det") %>- 
                </p>
            </div>
        </div>
                </ItemTemplate>
                            </asp:Repeater>

    </div>


    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span> اضافة رد   </h4>
           
                <<CKEditor:CKEditorControl ID="Editor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>

<asp:Button ID="Button1" CssClass="btn-primary" runat="server" Text="رد" OnClick="Button1_Click" />
        </div>
        
    </div>
    <hr />
    <br>
    <div class="row">

    
    <div class="well">
<h3><span style="font-size:18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;المشاهدات </h3>
<p class="text-center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [std_id], [name], [dt],  ROW_NUMBER() OVER (ORDER BY dt desc) row_num FROM [seen] WHERE (([typ] = @typ) AND ([re_id] = @re_id)) ORDER BY dt desc">
        <SelectParameters>
            <asp:Parameter DefaultValue="dia" Name="typ" Type="String" />
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
    
    </div>
</asp:Content>

