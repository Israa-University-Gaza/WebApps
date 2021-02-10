<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" validateRequest="false" enableEventValidation="true" CodeFile="ViewDialog.aspx.cs" Inherits="Instructor_Dialog_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
    
     <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span> الحوار الاسبوعي  </h4>
            <h4> <asp:Label ID="title" runat="server" Text=""></asp:Label> </h4>
            <p class="text-justify">
                <asp:Label ID="det" runat="server" Text=""></asp:Label>
            </p>
        </div>
    </div>
    <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound" >
                                <ItemTemplate>
            <div class="col-sm-6 col-md-6">
            <div class="well">
                <h4><span style="font-size: 14px;" class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server"><%# Eval("Name") %></asp:HyperLink> <span style="font-family:Tahoma;color:green;font-size:small"><%# Eval("EnterDate") %></span> <asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton1_Click" runat="server" Width="25px" Height="25px" ImageUrl="~/assets/del.png" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" />
                </h4>
                <p class="text-justify">
                   <%# Eval("det") %>- 
                </p>
            </div>
        </div>
                </ItemTemplate>
                            </asp:Repeater>

    


    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span> اضافة رد   </h4>
           
             <asp:TextBox ID="Editor1" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
<asp:Button ID="Button1" CssClass="btn-primary" runat="server" Text="رد" OnClick="Button1_Click" />
        </div>
        
    </div>
    
    
</asp:Content>

