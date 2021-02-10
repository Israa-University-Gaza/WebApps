<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage.master" AutoEventWireup="true" CodeFile="TimeTable.aspx.cs" Inherits="Students_TimeTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div   class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;    جدول المحاضرات الافتراضية عبر تقنية ال zoom للفصل الدراسي الأول للعام الجامعي 2020/2021 </h4>
          
              <span style="color:red"> لجميع المساقات  Pass Code=123456 </span>
         <br/>
               <span style="color:green"> طلابنا الأعزاء جداول المحاضرات الافتراضية عبر تقنية الزوم هي نفسها لجميع الفصل الدراسي </span>
        </div>

          <div   class="col-sm-12 col-md-12">
        <div class="well">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" text-align="center"  OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSource1" Width="100%" AllowSorting="True" CellPadding="10" CellSpacing="3" ForeColor="#333333" HorizontalAlign="Center" CssClass="table-condensed" Height="220px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="day" HeaderText="اليوم" SortExpression="day" />
                <asp:BoundField DataField="courseCode" HeaderText="رقم المساق" SortExpression="courseCode" />
                <asp:BoundField DataField="crs_name" HeaderText="اسم المساق" SortExpression="crs_name" />
                <asp:TemplateField HeaderText="المحاضر">
                    <ItemTemplate>
                        <asp:Label ID="lec" runat="server" style="font-size: 10px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
                <asp:BoundField DataField="sectionNum" HeaderText="الشعبة" SortExpression="sectionNum" />
                <asp:BoundField DataField="sectionid" HeaderText="sectionid" SortExpression="sectionid" Visible="False" />
                <asp:TemplateField HeaderText=" Zoom" SortExpression="url">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink8" runat="server" CssClass="bg-danger" NavigateUrl='<%# Eval("url") %>'>الانتقال الى منصة  Zoom</asp:HyperLink>
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
            </div>
              </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT dbo.std_crs.courseCode, dbo.zoom.crs_name, dbo.zoom.url, dbo.zoom.mettingID, dbo.zoom.time, dbo.zoom.day, dbo.std_crs.sectionNum, dbo.std_crs.sectionid FROM dbo.days INNER JOIN dbo.zoom ON dbo.days.day = dbo.zoom.day INNER JOIN dbo.timee ON dbo.zoom.time = dbo.timee.time  INNER JOIN dbo.std_crs ON dbo.zoom.crs_id = dbo.std_crs.courseCode WHERE (dbo.std_crs.std_id = @std_id) ORDER BY dbo.days.id, dbo.timee.id">
            <SelectParameters>
                <asp:SessionParameter Name="std_id" SessionField="log" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <hr/>
</asp:Content>

