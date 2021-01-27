<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="BookSurvay.aspx.cs" Inherits="Library_BookSurvay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="form-group">
          <div class="col-md-6">
    <asp:Button ID="Button1" runat="server" Text="تصدير الى ملف Word"  OnClick="Button1_Click" CssClass="btn green"/>
   </div></div>
    <div class="clearfix"></div>
                <div class="form-body">
          <asp:GridView ID="mygrid" runat="server" Visible="true"  AutoGenerateColumns="False" AlternatingRowStyle-Height="5px" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="PublisherPlace" HeaderText="مكان النشر" ReadOnly="True" SortExpression="PublisherPlace"></asp:BoundField>
             <asp:BoundField DataField="PublisherYear" HeaderText="سنة النشر" ReadOnly="True" SortExpression="PublisherYear"></asp:BoundField>
             <asp:BoundField DataField="PublisherName" HeaderText="الناشر" ReadOnly="True" SortExpression="PublisherName"></asp:BoundField>
             <asp:BoundField DataField="Column1" HeaderText="المؤلف" ReadOnly="True" SortExpression="Column1"></asp:BoundField>
              <asp:BoundField DataField="BookTitle" HeaderText="عنوان الكتاب" SortExpression="BookTitle"></asp:BoundField>
              <asp:BoundField DataField="LibEntryDate" HeaderText="تاريخ الورود" SortExpression="LibEntryDate"></asp:BoundField>
              <asp:BoundField DataField="CategoryID" HeaderText="الرقم الخاص" SortExpression="CategoryID"></asp:BoundField>
             <asp:BoundField DataField="PublicID" HeaderText="الرقم العام" SortExpression="PublicID"></asp:BoundField>
             <asp:BoundField DataField="RowNumber" HeaderText=" مسلسل" SortExpression="RowNumber"></asp:BoundField>
        </Columns>
    </asp:GridView> 
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="BookSurvay" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</div>
</asp:Content>

