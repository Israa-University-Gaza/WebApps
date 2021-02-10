﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Stat_Departments.aspx.cs" Inherits="Instructor_Stat_Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
              <div class="col-sm-5 col-md-5">
            <div class="form-group">
                <label>الكلية </label>

                <asp:DropDownList ID="coll" CssClass="form-control" runat="server" OnDataBound="DropDownList1_DataBound" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select * from coll where id in (select coll_id from dept where id in (select d_id from dept_pre where emp=@emp))
union 
select * from coll where id in (select c_id from c_pre where emp=@emp)">
                    <SelectParameters>
                        <asp:SessionParameter Name="emp" SessionField="log" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="coll" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1"></asp:RequiredFieldValidator>
            </div>
                  </div>
            <div class="col-sm-5 col-md-5">
            <div class="form-group">
                <label>التخصص </label>

                <asp:DropDownList ID="dept" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="dept" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select * from dept where coll_id=@c and id in (select d_id from dept_pre where emp=@emp)
union 
select * from dept where coll_id=@c and coll_id in (select c_id from c_pre where emp=@emp) ">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="coll" Name="c" PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="emp" SessionField="log" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </div>
                  </div>
            <div class="col-sm-2 col-md-2">
            <div class="form-group">
                <asp:Button ID="Button1" CssClass="btn-success" runat="server" Text="عرض" OnClick="Button1_Click" />
            </div>
                  </div>
             
                </div>
     <br />
                        
                     


    <hr/>
    <br>
   <div class="row">
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" Font-Size="Smaller">
                         <Columns>
                             <asp:BoundField DataField="courseDepartment" HeaderText="القسم" SortExpression="courseDepartment" />
                           <%--  <asp:BoundField DataField="instructor" HeaderText="المحاضر" SortExpression="instructor" />--%>
                               <asp:TemplateField HeaderText="المحاضر">
                                 <ItemTemplate>
                                     <asp:HyperLink ID="HyperLink4" runat="server"><%# Eval("instructor") %></asp:HyperLink>
                                     </ItemTemplate>
                                   </asp:TemplateField>
                             <asp:TemplateField HeaderText="المساقات">
                                 <ItemTemplate>
                                     <asp:Label ID="Label3" runat="server" Text='<%# Eval("employeeNo") %>' Visible="False"></asp:Label>
                                     <div style="text-align:center">
                                         <asp:GridView text-align="Center" ID="g2" runat="server" Font-Size="10pt"  AutoGenerateColumns="False" OnRowDataBound="g2_RowDataBound" HorizontalAlign="Center">
                                         <Columns>
                                             <asp:BoundField DataField="courseCode" HeaderText="رقم المساق" SortExpression="courseCode" />
                                             <asp:BoundField DataField="courseArName" HeaderText="اسم المساق" SortExpression="courseArName" />
                                             <asp:BoundField DataField="sectionNum" HeaderText="الشعبة" SortExpression="sectionNum" />
                                             <asp:BoundField DataField="departmentArName" HeaderText="القسم" SortExpression="departmentArName" Visible="False" />
                                                  <asp:TemplateField HeaderText="ع.طلاب">
                                     <ItemTemplate>
                                         <asp:Label ID="sec" runat="server" Text="Label"></asp:Label>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="مشاهدات ">
                                     <ItemTemplate>
                                         <asp:Label ID="viwe" runat="server" Text="Label"></asp:Label>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                             <asp:TemplateField HeaderText="ملفات">
                                                 <ItemTemplate>
                                                     <asp:Label ID="files_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="واجبات">
                                                 <ItemTemplate>
                                                     <asp:Label ID="homework_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="اعلانات">
                                                 <ItemTemplate>
                                                     <asp:Label ID="Announcements_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="روابط">
                                                 <ItemTemplate>
                                                     <asp:Label ID="link_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="فيديوهات">
                                                 <ItemTemplate>
                                                     <asp:Label ID="vedio_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="مناقشات">
                                                 <ItemTemplate>
                                                     <asp:Label ID="dis_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="المجموع">
                                                 <ItemTemplate>
                                                     <asp:Label ID="total_t" runat="server" Text="Label"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         </Columns>
                                     </asp:GridView></div>
                                     
                                 </ItemTemplate>
                                 <ItemStyle Width="40%" />
                             </asp:TemplateField>
                             <asp:BoundField DataField="lastLogin" HeaderText="اخر تسجيل دخول" SortExpression="lastLogin" >
                             <ItemStyle Width="2%" />
                             </asp:BoundField>
                         </Columns>
                         </asp:GridView>
   </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

   
</asp:Content>

