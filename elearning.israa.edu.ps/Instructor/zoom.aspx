<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="zoom.aspx.cs" Inherits="Instructor_zoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="crs_id" HeaderText="كود المساق" SortExpression="crs_id" />
            <asp:BoundField DataField="crs_name" HeaderText="اسم المساق" SortExpression="crs_name" />
            <asp:TemplateField HeaderText="اليوم" SortExpression="day">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource11" DataTextField="day" DataValueField="day" SelectedValue='<%# Bind("day") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [day] FROM [days]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("day") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الوقت" SortExpression="time">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource12" DataTextField="time" DataValueField="time" SelectedValue='<%# Bind("time") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [time] FROM [timee]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("time") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="section" HeaderText="الشعبة" SortExpression="section" />
            <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" />
            <asp:BoundField DataField="mettingid" HeaderText="mettingid" SortExpression="mettingid" />
            <asp:BoundField DataField="dept" HeaderText="القسم" SortExpression="dept" ReadOnly="True" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" CssClass="bg-danger" OnClientClick="return confirm('هل انت متأكد من حذف الشعبة')" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        DeleteCommand="DELETE FROM [zoom] WHERE [ID] = @original_ID " InsertCommand="INSERT INTO [zoom] ([crs_id], [crs_name], [url], [mettingid], [day], [time], [section], [dept], [coll]) VALUES (@crs_id, @crs_name, @url, @mettingid, @day, @time, @section, @dept, @coll)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [zoom] ORDER BY [dept], [coll]" 
        UpdateCommand="UPDATE [zoom] SET [crs_id] = @crs_id, [crs_name] = @crs_name, [url] = @url, [mettingid] = @mettingid, [day] = @day, [time] = @time, [section] = @section WHERE [ID] = @original_ID ">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_crs_id" Type="String" />
            <asp:Parameter Name="original_crs_name" Type="String" />
            <asp:Parameter Name="original_url" Type="String" />
            <asp:Parameter Name="original_mettingid" Type="String" />
            <asp:Parameter Name="original_day" Type="String" />
            <asp:Parameter Name="original_time" Type="String" />
            <asp:Parameter Name="original_section" Type="Double" />
            <asp:Parameter Name="original_dept" Type="String" />
            <asp:Parameter Name="original_coll" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="crs_id" Type="String" />
            <asp:Parameter Name="crs_name" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="mettingid" Type="String" />
            <asp:Parameter Name="day" Type="String" />
            <asp:Parameter Name="time" Type="String" />
            <asp:Parameter Name="section" Type="Double" />
            <asp:Parameter Name="dept" Type="String" />
            <asp:Parameter Name="coll" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="crs_id" Type="String" />
            <asp:Parameter Name="crs_name" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="mettingid" Type="String" />
            <asp:Parameter Name="day" Type="String" />
            <asp:Parameter Name="time" Type="String" />
            <asp:Parameter Name="section" Type="Double" />
            <asp:Parameter Name="dept" Type="String" />
            <asp:Parameter Name="coll" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_crs_id" Type="String" />
            <asp:Parameter Name="original_crs_name" Type="String" />
            <asp:Parameter Name="original_url" Type="String" />
            <asp:Parameter Name="original_mettingid" Type="String" />
            <asp:Parameter Name="original_day" Type="String" />
            <asp:Parameter Name="original_time" Type="String" />
            <asp:Parameter Name="original_section" Type="Double" />
            <asp:Parameter Name="original_dept" Type="String" />
            <asp:Parameter Name="original_coll" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

