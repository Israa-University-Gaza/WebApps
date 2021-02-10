<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hw.aspx.cs" Inherits="hw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="studentNo" HeaderText="studentNo" SortExpression="studentNo" />
                <asp:BoundField DataField="nameInfo" HeaderText="nameInfo" SortExpression="nameInfo" />
                <asp:TemplateField>
                    <ItemTemplate> 
                       
                        <asp:Label ID="studentNo" runat="server" Text='<%# Eval("studentNo") %>'></asp:Label>
                        <br />
                       
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <asp:Label ID="id" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                -<asp:Label ID="grade" runat="server" ForeColor="Red" Text="N"></asp:Label>
                            </ItemTemplate>
                        </asp:DataList>
                       
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [id] FROM [e_HomeWork] WHERE (([crs_id] = @crs_id) AND ([section] = @section))">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="crs_id" QueryStringField="crs" Type="String" />
                                <asp:QueryStringParameter Name="section" QueryStringField="sec" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                    </ItemTemplate>
                    
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [test]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
