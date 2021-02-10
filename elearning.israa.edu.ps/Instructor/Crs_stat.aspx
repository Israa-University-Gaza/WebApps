<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Crs_stat.aspx.cs" Inherits="Instructor_Crs_stat" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
         <div class="col-sm-12 col-md-12">
            <div class="well">
                <h4 ><span style="font-size: 18px;" class="glyphicon glyphicon-bell">
                   
                    </span>&nbsp;&nbsp;
              احصائيات المواد المطروحة
                </h4>
                
            </div>
        </div>

    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="dept" DataValueField="dept" OnDataBound="DropDownList1_DataBound" AutoPostBack="True"></asp:DropDownList>


         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select * from dept where  id in (select d_id from dept_pre where emp=@emp)
union 
select * from dept where  coll_id in (select c_id from c_pre where emp=@emp) 
       ">
             <SelectParameters>
                 <asp:SessionParameter Name="emp" SessionField="log" />
             </SelectParameters>
         </asp:SqlDataSource>


<div class="row">
 <%--   <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="up" runat="server">
    <ContentTemplate>--%>
    <asp:gridview runat="server" allowsorting="True" autogeneratecolumns="False" cssclass="table" OnRowDataBound="Unnamed1_RowDataBound" ID="gv">
        <Columns>
            <asp:TemplateField HeaderText="رقم_المساق" SortExpression="رقم_المساق">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("رقم_المساق") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                  <%--  <asp:Label ID="Label1" runat="server" Text='<%# Bind("رقم_المساق") %>'></asp:Label>--%>
                    <asp:HyperLink ID="HyperLink2"   Text='<%# Bind("رقم_المساق") %>' runat="server"></asp:HyperLink>
                </ItemTemplate>
                <HeaderStyle Width="87px" />
                <ItemStyle Width="87px" />
            </asp:TemplateField>
            <asp:BoundField DataField="الاسم" HeaderText="الاسم" SortExpression="الاسم" >
                 <HeaderStyle Width="112px" />
            <ItemStyle Width="112px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="المحاضر">
                <ItemTemplate>
                    <asp:Label ID="lec" runat="server" Text=""></asp:Label>
                </ItemTemplate>
                     <HeaderStyle Width="100px" />
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:BoundField DataField="القسم" HeaderText="القسم" SortExpression="القسم" >
                     <HeaderStyle Width="113px" />
            <ItemStyle Width="113px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="عدد الطلبة">
                <ItemTemplate>
                    <asp:Label ID="std_count" runat="server" ToolTip="عدد الطلبة"></asp:Label>
                </ItemTemplate>
                     <HeaderStyle Width="40px" />
                <ItemStyle Width="40px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ملفات" SortExpression="ملفات">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ملفات") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="files" runat="server" Text='<%# Bind("ملفات") %>' ToolTip="ملفات"></asp:Label>
                </ItemTemplate>
                     <HeaderStyle Width="49px" />
                <ItemStyle Width="49px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="إعلانات" SortExpression="إعلانات">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("إعلانات") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Anno" runat="server" Text='<%# Bind("إعلانات") %>' ToolTip="اعلانات"></asp:Label>
                </ItemTemplate>
                     <HeaderStyle Width="53px" />
                <ItemStyle Width="53px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="نقاشات" SortExpression="نقاشات">
                <EditItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("نقاشات") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="dialog" runat="server" Text='<%# Bind("نقاشات") %>' ToolTip="نقاشات"></asp:Label>
                </ItemTemplate>
                     <HeaderStyle Width="57px" />
                <ItemStyle Width="57px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="واجبات" SortExpression="واجبات">
                <EditItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("واجبات") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="hw" runat="server" Text='<%# Bind("واجبات") %>' ToolTip="واجبات"></asp:Label>
                </ItemTemplate>
                     <HeaderStyle Width="53px" />
                <ItemStyle Width="53px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="روابط" SortExpression="روابط">
                <EditItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("روابط") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="links" runat="server" Text='<%# Bind("روابط") %>' ToolTip="روابط"></asp:Label>
                </ItemTemplate>
                     <HeaderStyle Width="45px" />
                <ItemStyle Width="45px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="فيديو_داخلي" SortExpression="فيديو_داخلي">
                <EditItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("فيديو_داخلي") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="vi" runat="server" Text='<%# Bind("فيديو_داخلي") %>' ToolTip="فيديو داخلي"></asp:Label>
                </ItemTemplate>
                     <HeaderStyle Width="90px" />
                <ItemStyle Width="90px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="فيديو_خارجي" SortExpression="فيديو_خارجي">
                <EditItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("فيديو_خارجي") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="ve" runat="server" Text='<%# Bind("فيديو_خارجي") %>' ToolTip="فيديو خارجي"></asp:Label>
                </ItemTemplate>
                     <HeaderStyle Width="91px" />
                <ItemStyle Width="91px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="المجموع" SortExpression="tot">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tot") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="tot" runat="server" Text='<%# Bind("tot") %>' ToolTip="المجموع"></asp:Label>
                </ItemTemplate>
                     <HeaderStyle Width="63px" />
                <ItemStyle Width="63px" />
            </asp:TemplateField>
        </Columns>
    </asp:gridview>
      <%--   </ContentTemplate>
</asp:UpdatePanel>--%>

<%--<script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="../Scripts/ScrollableGridViewPlugin_ASP.NetAJAXmin.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#<%=gv.ClientID %>').Scrollable({
            ScrollHeight: 300,
            IsInUpdatePanel: true
        });
    });
</script>--%>
</div>
         <br />
    <asp:sqldatasource id="SqlDataSource3" runat="server" connectionstring="<%$ ConnectionStrings:conn %>" selectcommand="select crs_id رقم_المساق,dbo.calc_crs(crs_id) tot,crs_name الاسم,dept القسم, dbo.calc_files(crs_id)ملفات,dbo.calc_Announcements(crs_id)إعلانات,dbo.calc_dialog(crs_id)نقاشات,dbo.calc_HomeWork(crs_id)واجبات,dbo.calc_links(crs_id)روابط,dbo.calc_vids(crs_id,N'داخلي')فيديو_داخلي,dbo.calc_vids(crs_id,N'خارجي')فيديو_خارجي from crs_2020 where dept=@dept">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="dept" PropertyName="SelectedValue" />
        </SelectParameters>
         </asp:sqldatasource>

    <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:conn %>" selectcommand="select crs_id رقم_المساق,dbo.calc_crs(crs_id) tot,crs_name الاسم,dept القسم, dbo.calc_files(crs_id)ملفات,dbo.calc_Announcements(crs_id)إعلانات,dbo.calc_dialog(crs_id)نقاشات,dbo.calc_HomeWork(crs_id)واجبات,dbo.calc_links(crs_id)روابط,dbo.calc_vids(crs_id,N'داخلي')فيديو_داخلي,dbo.calc_vids(crs_id,N'خارجي')فيديو_خارجي from crs_2020"></asp:sqldatasource>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

</asp:Content>

