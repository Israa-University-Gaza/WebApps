<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage.master" AutoEventWireup="true" CodeFile="~/Administrator/UserJobs.aspx.cs" Inherits="Administrator_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                     
                    <span id="tit" runat="server" class="caption-subject bold uppercase"> </span>
                 
                </div>

            </div>
            <div class="portlet-body form" style="padding-bottom: 181px;">


                <form runat="server" style="direction:rtl">
        
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="emp" DataSourceID="SqlDataSource1" AllowSorting="True" CssClass="table" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="رقم الهوية" SortExpression="emp">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("emp") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "stat.aspx?id="+Eval("emp") %>' Text='<%# Eval("emp") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="name" HeaderText="الاسم رباعي" ReadOnly="True" SortExpression="name" />
            <asp:TemplateField HeaderText="المؤهل العلمي" SortExpression="cer">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("cer") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <div>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("cer") %>'></asp:Label>
                        &nbsp;(
                        <asp:Label ID="Label3" runat="server" style="color: #0099FF" Text='<%# Bind("التخصص") %>'></asp:Label>
                        )</div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="البلد" HeaderText="البلد" />
            <asp:TemplateField HeaderText="حالة_الطلب" SortExpression="حالة_الطلب">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("حالة_الطلب") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("حالة_الطلب") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الخبرة">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("الخبرة") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="exp_lab" runat="server" Text='<%# Bind("الخبرة") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="dat" HeaderText="تاريخ التقديم" SortExpression="dat" />
            <asp:TemplateField>
                <HeaderTemplate>
                   
                  
                    عدد المتقدمين :<%--<asp:Label ID="count" runat="server" style="color: #FF0000" Text=""></asp:Label>--%><asp:HyperLink ID="count" runat="server" style="color: #FF0000" >عدد المتقدمين</asp:HyperLink>
                </HeaderTemplate>
                <ItemTemplate>
                    
                   
                    <asp:HyperLink ID="HyperLink1" CssClass="btn blue" runat="server" NavigateUrl='<%# "ShowData.aspx?id="+Eval("emp") %>'>عرض المعلومات</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("id") %>' CssClass="btn-warning" OnClick="Button1_Click" OnClientClick="return confirm (&quot;هل انت متأكد ؟؟&quot;)" Text="حذف" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT emp, dbo.full_name(emp) AS name, dbo.cer_type(emp) AS cer, dbo.cer_name(emp) AS التخصص, dbo.cer_cuntry(emp) AS البلد, dbo.calc_exp_degree(emp, dbo.cer_type(emp)) AS الخبرة, CONVERT (nvarchar(30), dat, 103) AS dat, dbo.job_emp_stat(emp, job) AS حالة_الطلب, id FROM dbo.hr_jobs_emp WHERE (job = @job)">
        <SelectParameters>
            <asp:QueryStringParameter Name="job" QueryStringField="id" />
        </SelectParameters>
                         
    </asp:SqlDataSource>
    </form>

                
                



             

            </div>
        </div>

    
    

</asp:Content>

