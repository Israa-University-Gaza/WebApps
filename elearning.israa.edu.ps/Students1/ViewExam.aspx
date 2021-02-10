<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage.master" AutoEventWireup="true" validateRequest="false" CodeFile="ViewExam.aspx.cs" Inherits="Instructor_ViewFile" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-sm-12 col-md-12">
<div class="well">
<h3><span style="font-size:18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text=""></asp:Label> </h3>
<p class="text-center">
   <asp:Label ID="det" runat="server" Text=""></asp:Label>
   
</p>
</div>
             <div style="/* align-content:center */text-align: -webkit-center;" >
            <asp:Label ID="pass" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#006600"></asp:Label>
</div>
<div style="/* align-content:center */text-align: -webkit-center;" >
    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn-danger active" Font-Size="XX-Large">لتقديم الإمتحان اضغط هنا </asp:HyperLink>
</div>



           <div class="well" runat="server" id="gen">
<h5><span style="font-size:18px;" class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp; الأشخاص الذين شاهدوا هذا المحتوى </h5>
<p class="text-center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [std_id], [name], [dt],  ROW_NUMBER() OVER (ORDER BY dt desc) row_num FROM [seen] WHERE (([typ] = @typ) AND ([re_id] = @re_id)) ORDER BY dt desc">
        <SelectParameters>
            <asp:Parameter DefaultValue="exm" Name="typ" Type="String" />
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

        
</div>
</asp:Content>

