<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage.master" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="Instructor_Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script runat="server" language="C#">
 
           </script>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="لا يوجد رسائل في بريدكم الوارد" AllowSorting="True">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl="https://cdn3.iconfinder.com/data/icons/education-2-2/256/Student_Reading-512.png" />
                   
                      </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="عنوان الرسالة" SortExpression="title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("title") %>'></asp:Label> 
                     <asp:Label ID="dt_s" runat="server" Font-Size="Small" ForeColor="Red" Text='<%# Bind("r_dt") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="to_name" HeaderText="الى" />
            <asp:BoundField DataField="sender_name" HeaderText="من" />
            <asp:BoundField DataField="dt" HeaderText="التاريخ" SortExpression="dt" />
            <asp:TemplateField>
                <ItemTemplate>

                    <asp:Button ID="show" runat="server" CssClass="btn-info"  Height="33px" Text="معاينة" data-toggle="modal"  data-target='<%# "#exampleModal"+Eval("id") %>' Width="63px" />
                    <div class="modal fade" id= '<%# "exampleModal"+Eval("id") %>' tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><%# Eval("title") %></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <span> <%# Eval("det") %></span>
          <asp:Label ID="Label2" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
          <hr/>
           <span style="color:green">الردود</span>
          <br/>
             <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    
                                     <span style="color:blue"> <%# Eval("r_name") %></span>: <span style="color:brown;font-size:small"> <%# Eval("dt") %></span> 
                                     <span > <%# Eval("replay") %></span>
                                      <br/>
                                    </ItemTemplate>
                                    </asp:Repeater>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM   Messege_Replays where  ([m_id] = @m_id)">
                <SelectParameters>
               <asp:ControlParameter ControlID="Label1" Name="m_id" PropertyName="Text" Type="Int32" />
            </SelectParameters>
          </asp:SqlDataSource>

          <br/>
           <br/>
          <span style="color:red">رد على الرسالة </span>
          <hr/>
          <asp:TextBox ID="TextBox1" Width="95%" TextMode="MultiLine"  runat="server"></asp:TextBox>
          <asp:Label ID="Label1" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn-danger" onclick="msg(<%# Eval("id") %>)"  data-dismiss="modal">إغلاق</button>

          <asp:Button ID="Button1" CssClass="btn-primary" OnClick="Button1_Click" CommandArgument='<%# Eval("Row#") %>' runat="server" Text="رد" />
      </div>
    </div>
  </div>
</div>
                    &nbsp;<asp:Button ID="show0" runat="server" CommandArgument='<%# Eval("id") %>' CssClass="btn-danger"  Height="33px" OnClick="show0_Click" OnClientClick="return confirm(&quot;هل انت متأكد ؟؟&quot;)" Text="حذف" Width="63px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand="SELECT  ROW_NUMBER() OVER(ORDER BY id desc) AS Row#,[title], [seen], [to_name], [dt],[det], [id],[sender_name], [sender_id],replay, r_dt FROM [masseges] WHERE ([sender_id] = @to_id and isdelet=0) or  ([to_id] = @to_id and isdelet=0)  ORDER BY id desc">
        <SelectParameters>
            <asp:SessionParameter Name="to_id" SessionField="log" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <script>
        function msg(serNo) {
    var win = window.open('seen.aspx?id=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=1,height=1');
}
</script>
</asp:Content>


