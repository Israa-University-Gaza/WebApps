<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="HomeWorksReports.aspx.cs" Inherits="Instructor_HomeWorksReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>علامات الطلاب في الواجبات  </h4>
          <div style="
    position: fixed;
    left: 161px;
    top: 222px;
">
                <span style="color:brown">لم يتم تقييم الواجب من قبل المحاضر</span>
                <br>
                <span style="color:red">لم يتم تسليمة من قبل الطالب </span>
                  <br>
                <span style="color:blue">تم التسليم والتقييم</span>
            </div>
        </div>
    </div>
    <div class="col-sm-12 col-md-12">
        <div class="well">
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table">
            <Columns>
                  <asp:BoundField DataField="ROW" HeaderText="#" SortExpression="ROW" />
                <asp:BoundField DataField="studentNo" HeaderText="رقم الطالب" SortExpression="studentNo" />
                <asp:BoundField DataField="nameInfo" HeaderText="اسم الطالب" SortExpression="nameInfo" />
               
                <asp:TemplateField HeaderText="علامات الواجبات">
                    <ItemTemplate> 
                       
                        <asp:Label ID="studentNo" runat="server" Text='<%# Eval("studentNo") %>' Visible="False"></asp:Label>
                       
                       <div style="text-align: center">
                        <asp:DataList ID="DataList1" runat="server"  DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" GridLines="Vertical" Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="id" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                               
                                <asp:Label ID="grade" runat="server"   Text="N" Font-Names="Tahoma" Font-Size="Large"></asp:Label>
                            </ItemTemplate>
                        </asp:DataList>
                       </div>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [id] FROM [e_HomeWork] WHERE (([crs_id] = @crs_id) AND ([section] = @section) and sem=(select top 1 semester_id from e_semester ))">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="crs_id" QueryStringField="crs" Type="String" />
                                <asp:QueryStringParameter Name="section" QueryStringField="section" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                       
                    </ItemTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="المعدل">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#006600" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="المجموع">
                    <ItemTemplate>
                       <asp:Label ID="Label4" runat="server" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#006600" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
               <FooterStyle BackColor="White" ForeColor="#000066" />
               <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
               <RowStyle ForeColor="#000066" />
               <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
               <SortedAscendingCellStyle BackColor="#F1F1F1" />
               <SortedAscendingHeaderStyle BackColor="#007DBB" />
               <SortedDescendingCellStyle BackColor="#CAC9C9" />
               <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        </div>
        <hr/>
        <div style="  text-align: -webkit-center;margin-bottom: 28px;">
 <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text=" تحميل التقرير Excel" OnClick="Button1_Click1" />
    <br>
        </div>
     
    </div>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

