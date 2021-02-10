<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Table.aspx.cs" Inherits="Instructor_Table" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style>
        table * {
            text-align: center;
        }
          </style>
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="dept" DataValueField="dept" AutoPostBack="True" OnDataBound="DropDownList1_DataBound"></asp:DropDownList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select * from dept where  id in (select d_id from dept_pre where emp=@emp)
union 
select * from dept where  coll_id in (select c_id from c_pre where emp=@emp) ">
        <SelectParameters>
            <asp:SessionParameter Name="emp" SessionField="log" />
        </SelectParameters>
     </asp:SqlDataSource>
    <br/>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" text-align="center"  OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSource2" Width="100%" AllowSorting="True" CellPadding="10" CellSpacing="3" ForeColor="#333333" HorizontalAlign="Center" CssClass="table-condensed" Height="220px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="day" HeaderText="اليوم" SortExpression="day" />
                <asp:BoundField DataField="crs_id" HeaderText="رقم المساق" SortExpression="crs_id" />
                <asp:BoundField DataField="crs_name" HeaderText="اسم المساق" SortExpression="crs_name" />
                <asp:BoundField DataField="section" HeaderText="الشعبة" SortExpression="section" />
                <asp:TemplateField HeaderText="mettingID" SortExpression="mettingID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("mettingID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div style="direction:initial">
   <asp:Label ID="Label1" runat="server" Text='<%# Bind("mettingID") %>'></asp:Label>
                        </div>
                     
                   
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="time" HeaderText="الساعة" SortExpression="time" />
                <asp:TemplateField HeaderText=" Zoom" SortExpression="url">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink8" runat="server" CssClass="bg-danger"  NavigateUrl='<%# Bind("url") %>'>الانتقال الى منصة  Zoom</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" Wrap="True" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>

      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT dbo.zoom.crs_name, dbo.zoom.url, dbo.zoom.mettingid, dbo.zoom.time, dbo.zoom.day, dbo.zoom.crs_id, dbo.zoom.section FROM dbo.days INNER JOIN dbo.zoom ON dbo.days.day = dbo.zoom.day INNER JOIN dbo.timee ON dbo.zoom.time = dbo.timee.time WHERE (dbo.zoom.dept = @dept) ORDER BY dbo.days.id, dbo.timee.id">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="dept" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br/>
    <br/>
    <br/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

