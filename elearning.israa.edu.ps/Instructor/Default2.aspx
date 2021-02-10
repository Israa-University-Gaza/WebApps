<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Instructor_Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:TemplateField HeaderText="crs_id" SortExpression="crs_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("crs_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "ss"+Eval("id")+"dd" %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="week_id" HeaderText="week_id" SortExpression="week_id" />
                <asp:BoundField DataField="path" HeaderText="path" SortExpression="path" />
                <asp:BoundField DataField="EnterDate" HeaderText="EnterDate" SortExpression="EnterDate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [e_files]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
