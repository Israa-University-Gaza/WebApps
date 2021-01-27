<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage.master" AutoEventWireup="true" CodeFile="AllUsers.aspx.cs" Inherits="Administrator_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server" style="direction:rtl">

    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowSorting="True" CssClass="table" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="رقم الهوية" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="Expr1" HeaderText="الاسم رباعي" ReadOnly="True" SortExpression="Expr1" />
            <asp:BoundField DataField="date_car" HeaderText="تاريخ الانشاء" SortExpression="date_car"  />
            <asp:BoundField DataField="last_log" HeaderText="اخر دخول"  SortExpression="last_log"/>
            <asp:TemplateField>
                <HeaderTemplate>
                    &nbsp;عدد المستخدمين:
                    <asp:Label ID="count0" runat="server" style="color: #FF0000" Text="Label"></asp:Label>
                    <br />
                    عدد المشتركين :<asp:Label ID="count" runat="server" style="color: #FF0000" Text="Label"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    
                   
                    <asp:HyperLink ID="HyperLink1" CssClass="btn blue" runat="server" NavigateUrl='<%# "ShowData.aspx?id="+Eval("id") %>'>عرض المعلومات</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT dbo.hr_emp.id, dbo.full_name(dbo.hr_emp.id) AS Expr1, 
        convert(datetime,dbo.hr_emp_users.date_car, 100)AS date_car, convert(datetime,dbo.hr_emp_users.last_log, 100) AS last_log FROM dbo.hr_emp INNER JOIN dbo.hr_emp_users ON dbo.hr_emp.id = dbo.hr_emp_users.emp_id WHERE (dbo.full_name(dbo.hr_emp.id) &lt;&gt; 'null')"></asp:SqlDataSource>

</asp:Content>

