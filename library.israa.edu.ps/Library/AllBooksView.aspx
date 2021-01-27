<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="AllBooksView.aspx.cs" Inherits="Library_AllBooksView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
        <Columns>

            <asp:BoundField DataField="PublicID" SortExpression="PublicID" HeaderText="الرقم العام"></asp:BoundField>
            <asp:BoundField DataField="CategoryID" SortExpression="CategoryID" HeaderText="رقم التصنيف"></asp:BoundField>

            <asp:BoundField DataField="BookTitle" SortExpression="BookTitle" HeaderText="عنوان الكتاب"></asp:BoundField>
     <asp:BoundField DataField="BookTitle3" SortExpression="BookTitle3" HeaderText="العنوان الشارح"></asp:BoundField>
            <asp:BoundField DataField="BookTitle2" SortExpression="BookTitle2" HeaderText="العنوان الموازي"></asp:BoundField>
       


            <asp:BoundField DataField="SubjectHead" SortExpression="SubjectHead" HeaderText="رؤوس الموضوعات"></asp:BoundField>
            <asp:BoundField DataField="BookPlace" SortExpression="BookPlace" HeaderText="مكان وجوده"></asp:BoundField>

            <asp:BoundField DataField="Tdmak" SortExpression="Tdmak" HeaderText="الرقم الدولي"></asp:BoundField>



        </Columns>
        <FooterStyle BackColor="#CCCCCC"></FooterStyle>

        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="AllBookGet" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="UserID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

