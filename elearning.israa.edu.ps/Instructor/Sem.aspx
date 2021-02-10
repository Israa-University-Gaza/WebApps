<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="Sem.aspx.cs" Inherits="Instructor_Sem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
     <div class="col-sm-12 col-md-12">
        <div class="well">
            <a href="Default.aspx?sem=<%# Eval("semester_id") %> ">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-asterisk"></span>     <%# Eval("semester_name_ar") %> </h4>
            
        </div>
    </div>
                                    </a>
                                       </ItemTemplate>
                            </asp:Repeater>

  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [semester_id], [semester_name_ar] FROM [e_semester]"></asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

