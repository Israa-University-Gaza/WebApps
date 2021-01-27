<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rep.aspx.cs" Inherits="Administrator_rep" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: tahoma;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="direction:rtl">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" CellPadding="4" CssClass="auto-style1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="رقم_الوظيفة" HeaderText="رقم_الوظيفة" />
                <asp:BoundField DataField="#" HeaderText="#" />
                <asp:BoundField DataField="الوظيفة" HeaderText="الوظيفة" SortExpression="الوظيفة" />
                <asp:BoundField DataField="الاسم" HeaderText="الاسم" ReadOnly="True" SortExpression="الاسم" />
                <asp:BoundField DataField="رقم_الهوية" HeaderText="رقم_الهوية" SortExpression="رقم_الهوية" />
                <asp:BoundField DataField="العمر" HeaderText="العمر" SortExpression="العمر" />
                <asp:BoundField DataField="الجنس" HeaderText="الجنس" SortExpression="الجنس" />
                <asp:BoundField DataField="الجوال" HeaderText="الجوال" SortExpression="الجوال" />
                <asp:BoundField DataField="الؤهل" HeaderText="المؤهل" ReadOnly="True" SortExpression="الؤهل" />
                <asp:BoundField DataField="التخصص" HeaderText="التخصص" ReadOnly="True" SortExpression="التخصص" />
                <asp:BoundField DataField="معدل_التخصص" HeaderText="معدل_التخصص" />
                <asp:TemplateField HeaderText="الخبرة" SortExpression="الخبرة">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("الخبرة") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="exp_lab" runat="server" Text='<%# Bind("الخبرة") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="البلد" SortExpression="البلد">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("البلد") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("البلد") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="الجامعة">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Column1" HeaderText="سنة التخصص" ReadOnly="True" SortExpression="Column1" />
                <asp:BoundField DataField="العنوان" HeaderText="العنوان" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT  ROW_NUMBER() OVER(order by dbo.hr_jobs_emp.job) # ,     dbo.hr_jobs_emp.emp رقم_الهوية,dbo.full_name(hr_emp.id)الاسم ,dbo.cer_type(hr_emp.id) الؤهل,dbo.cer_name(hr_emp.id) التخصص,dbo.cer_gpa(hr_emp.id) معدل_التخصص,dbo.hr_emp.tel الجوال,dbo.calc_exp_degree(hr_emp.id,dbo.cer_type(hr_emp.id)) الخبرة,
dbo.hr_emp.gender الجنس,dbo.hr_emp.age العمر, dbo.hr_jobs_addv.job_name الوظيفة ,dbo.cer_cuntry(hr_emp.id) البلد,dbo.cer_to(hr_emp.id),convert(nvarchar,dbo.hr_jobs_addv.id) +'-'+'1/2019' رقم_الوظيفة, dbo.hr_emp.addres العنوان

FROM            dbo.hr_jobs_emp INNER JOIN
                         dbo.hr_jobs_addv ON dbo.hr_jobs_emp.job = dbo.hr_jobs_addv.id INNER JOIN
                         dbo.hr_emp ON dbo.hr_jobs_emp.emp = dbo.hr_emp.id
						 order by dbo.hr_jobs_emp.job"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
