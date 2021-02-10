<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="vote.aspx.cs" Inherits="Instructor_vote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField HeaderText="التصنيف" SortExpression="cat">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cat") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("cat") %>' Visible="False"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Font-Size="Large" ForeColor="Red" Text='<%# Eval("Text") %>'></asp:Label>
                    <br />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource1" OnRowDataBound="GridView2_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="الاجابة" SortExpression="ans">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ans") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ans") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="25%" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="total" HeaderText="العدد" ReadOnly="True" SortExpression="total" />
                            <asp:TemplateField HeaderText="النسبة">
                                <ItemTemplate>
                                    <strong>
                                    <asp:Label ID="Label3" runat="server" style="color: #009900; font-size: medium" Text="Label"></asp:Label>
                                    </strong>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select count(ans)/count(distinct qes_id) total,ans  from [dbo].[Eva_answer]
 WHERE  qes_id in (select id from eva_qes where cat = @c)
 group by  ans 
 order by ans ">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label1" Name="c" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT distinct cat,
CASE
    WHEN cat = 'A' THEN N'رضا الطلبة عن دائرة شؤون الطلبة:'
    WHEN  cat = 'B' THEN N'	رضا الطلبة عن دائرة القبول والتسجيل:'
    WHEN  cat = 'C' THEN N'‌رضا الطلبة عن الخدمات العامة التي تقدمها الجامعة:'
	  WHEN  cat = 'D' THEN N'	رضا الطلبة عن مرافق الجامعة:'
	    WHEN  cat = 'E' THEN N'	رضا الطلبة عن عمادة الكليات في الجامعة:'
		  WHEN  cat = 'F' THEN N'رضا الطلبة عن خدمات الأمن:'
		   WHEN  cat = 'G' THEN N'انتماء الطلبة إلى الجامعة:'
END AS Text
FROM eva_qes;"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

