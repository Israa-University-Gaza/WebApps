<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="Loans1.aspx.cs" Inherits="Affairs_Loans1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="Code" CssClass="form-control">
</asp:DropDownList>
<asp:Button ID="Button1" runat="server" CssClass="bg-green" Text="عرض" />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>" SelectCommand="SELECT [Code], [ArName] FROM [Semester] WHERE ([IsDelete] = @IsDelete) ORDER BY [ID] DESC">
    <SelectParameters>
        <asp:Parameter DefaultValue="False" Name="IsDelete" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table">
    <Columns>
        <asp:BoundField DataField="Row#" HeaderText="ID" SortExpression="Row#" />
        <asp:BoundField DataField="Studentno" HeaderText="رقم الطالب" SortExpression="Studentno" />
        <asp:BoundField DataField="name" HeaderText="اسم الطالب" SortExpression="name" ReadOnly="True" />
        <asp:BoundField DataField="Amount" HeaderText="القيمة" SortExpression="Amount" />
        <asp:BoundField DataField="ActionArName" HeaderText="اسم الحركة" SortExpression="ActionArName" />
        <asp:BoundField DataField="InsertDate" HeaderText="تاريخ الاضافة" SortExpression="InsertDate" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="select  ROW_NUMBER() OVER(ORDER BY GetSpecialFinancialTable.ID ASC) AS Row#, GetSpecialFinancialTable.*,[IsraaAcademic].[dbo].[GetStudentName](Student.id,3) name,Student.Studentno from GetSpecialFinancialTable inner join [IsraPermissions].[dbo].[Student] 
on GetSpecialFinancialTable.StudentID=[IsraPermissions].[dbo].[Student].[id]  where ActionArName=N'قروض خارجية' and SemesterCode=@SemesterCode
">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="SemesterCode" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
<br />
</asp:Content>


