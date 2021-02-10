<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="VoteResult.aspx.cs" Inherits="Instructor_VoteResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
<div class="col-sm-12 col-md-12">
                          
                                
                                
                                <div style="background-color: #ffe9dc;border-color: #31708f;padding: 15px;
    margin-bottom: 20px;
    border: 1px solid ;
    border-radius: 4px;">
                                   <div>
       عدد الطلبة المصوتين :<strong><asp:Label ID="all" runat="server" Text="Label" style="font-size: medium"></asp:Label>

                                       </strong>

    </div>
                                </div>
                                
                              
                         
                        </div>
    </div>


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="#" InsertVisible="False" SortExpression="id" />
        <asp:BoundField DataField="qes" HeaderText="العبارة" SortExpression="qes" />
        <asp:TemplateField>
            <ItemTemplate>
                موافق بشدة:<asp:Label ID="a1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
                <br />
                موافق:<asp:Label ID="a2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF9900"></asp:Label>
                <br />
                محايد:<asp:Label ID="a3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#996633"></asp:Label>
                <br />
               غير موافق:<asp:Label ID="a4" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#0066FF"></asp:Label>
                <br /> 
                غير موافق بشدة: <asp:Label ID="a5" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#00CC66"></asp:Label>
               
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [eva_qes]"></asp:SqlDataSource>

    <div class="row" style="font-size: medium">
            <div   class="col-sm-6 col-md-6">
                      <strong>ثالثاً: ما أهم العقبات التي واجهتك داخل الحرم الجامعي:

                </div>

         <div   class="col-sm-6 col-md-6">

                    رابعاً: أي اقتراحات تطلبها من إدارة الجامعة:
                </strong>
                </div>
        </div>


<div class="row">
    
    <asp:DataList ID="DataList1" runat="server" CssClass="table" DataSourceID="SqlDataSource2" RepeatColumns="2" RepeatDirection="Horizontal">
        <ItemTemplate>
            &nbsp;<asp:Label ID="ansLabel" runat="server" style="font-size: small" Text='<%# Eval("ans") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [ans] FROM [Eva_answer1]"></asp:SqlDataSource>
    
</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    
</asp:Content>

