<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rep1.aspx.cs" Inherits="Administrator_rep" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="direction:rtl">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowDataBound="GridView1_RowDataBound" AllowSorting="True" DataKeyNames="رقم_الهوية">
            <Columns>
                <asp:BoundField DataField="رقم_الهوية" HeaderText="رقم_الهوية" ReadOnly="True" SortExpression="رقم_الهوية" />
                <asp:BoundField DataField="الاسم" HeaderText="الاسم" SortExpression="الاسم" ReadOnly="True" />
                <asp:BoundField DataField="الؤهل" HeaderText="الؤهل" ReadOnly="True" SortExpression="الؤهل" />
                <asp:BoundField DataField="التخصص" HeaderText="التخصص" SortExpression="التخصص" ReadOnly="True" />
                <asp:BoundField DataField="الجوال" HeaderText="الجوال" SortExpression="الجوال" />
                <asp:TemplateField HeaderText="الخبرة" SortExpression="الخبرة">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("الخبرة") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="exp_lab" runat="server" Text='<%# Bind("الخبرة") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="الجنس" HeaderText="الجنس" SortExpression="الجنس" />
                <asp:BoundField DataField="العمر" HeaderText="العمر" SortExpression="العمر" />
                <asp:TemplateField HeaderText="البلد" SortExpression="البلد">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("البلد") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("البلد") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT       id رقم_الهوية,dbo.full_name(hr_emp.id)الاسم ,dbo.cer_type(hr_emp.id) الؤهل,dbo.cer_name(hr_emp.id) التخصص,dbo.hr_emp.tel الجوال,dbo.calc_exp_degree(hr_emp.id,dbo.cer_type(hr_emp.id)) الخبرة,
dbo.hr_emp.gender الجنس,dbo.hr_emp.age العمر,dbo.cer_cuntry(hr_emp.id) البلد,dbo.cer_to(hr_emp.id)

FROM            dbo.hr_emp 
where dbo.full_name(hr_emp.id) &lt;&gt; 'NULL' and dbo.cer_type(hr_emp.id)  &lt;&gt; 'NULL' 
and id not in (select emp from hr_jobs_emp)
order by dbo.cer_type(hr_emp.id)"></asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT       dbo.hr_jobs_emp.emp رقم_الهوية,dbo.full_name(hr_emp.id)الاسم ,dbo.cer_type(hr_emp.id) الؤهل,dbo.cer_name(hr_emp.id) التخصص,dbo.hr_emp.tel الجوال,dbo.calc_exp_degree(hr_emp.id,dbo.cer_type(hr_emp.id)) الخبرة,
dbo.hr_emp.gender الجنس,dbo.hr_emp.age العمر, dbo.hr_jobs_addv.job_name الوظيفة ,dbo.cer_cuntry(hr_emp.id) البلد,dbo.cer_to(hr_emp.id),convert(nvarchar,dbo.hr_jobs_addv.id) +'-'+'1/2019' رقم_الوظيفة

FROM            dbo.hr_jobs_emp INNER JOIN
                         dbo.hr_jobs_addv ON dbo.hr_jobs_emp.job = dbo.hr_jobs_addv.id INNER JOIN
                         dbo.hr_emp ON dbo.hr_jobs_emp.emp = dbo.hr_emp.id
						 order by dbo.hr_jobs_emp.job"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
