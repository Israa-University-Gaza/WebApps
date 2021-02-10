<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="All.aspx.cs" Inherits="Instructor_All" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" OnSorting="GridView1_Sorting1">
        <Columns>
            <asp:BoundField DataField="رقم الموظف" HeaderText="رقم الموظف" SortExpression="رقم الموظف" />
            <asp:BoundField DataField="الاسم"       HeaderText="الاسم" SortExpression="الاسم" />
            <asp:BoundField DataField="عدد المساقات" HeaderText="عدد المساقات" SortExpression="عدد المساقات" />
            <asp:BoundField DataField="نقاش"          HeaderText="نقاش" ReadOnly="True" SortExpression="نقاش" />
            <asp:BoundField DataField="فيديو_داخلي"  HeaderText ="فيديو_داخلي" ReadOnly="True" SortExpression="فيديو_داخلي" />
            <asp:BoundField DataField="فيديو_خارجي" HeaderText="فيديو_خارجي" ReadOnly="True" SortExpression="فيديو_خارجي" />
            <asp:BoundField DataField="واجبات" HeaderText="واجبات" ReadOnly="True" SortExpression="واجبات" />
            <asp:BoundField DataField="ملفات"  HeaderText="ملفات" ReadOnly="True" SortExpression="ملفات" />
            <asp:BoundField DataField="اعلانات" HeaderText="اعلانات" ReadOnly="True" SortExpression="اعلانات" />
            <asp:BoundField DataField="روابط"  HeaderText="روابط" ReadOnly="True" SortExpression="روابط" />
            <asp:BoundField DataField="كل_المصادر" HeaderText="كل_المصادر" ReadOnly="True" SortExpression="كل_المصادر" />
        </Columns>
    </asp:GridView>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

