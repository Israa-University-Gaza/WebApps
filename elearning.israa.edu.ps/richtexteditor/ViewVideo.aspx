﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage.master" AutoEventWireup="true" CodeFile="ViewVideo.aspx.cs"  validateRequest="false" Inherits="Instructor_ViewAnnouncements" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="col-sm-12 col-md-12">
<div class="well">
<h3><span style="font-size:18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text=""></asp:Label> </h3>
<p class="text-center">
    
    

   
    <div class="form-group" style="text-align: center">
            
      <div>
          <asp:hyperlink id="h1" runat="server">مشاهدة الفيديو </asp:hyperlink>
             </div>
       
        </div>
     <iframe runat="server" id="fram" width="100%" height="315" src="https://www.youtube.com/embed/k4c1TkZZCbQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
   
</p>
</div>
               <hr/>
              <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound" >
                                <ItemTemplate>
            <div class="col-sm-12 col-md-12">
            <div class="well">
                <h4><span style="font-size: 14px;" class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server"><%# Eval("Name") %></asp:HyperLink> <span style="font-family:Tahoma;color:green;font-size:small"><%# Eval("dt") %></span> <asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("id")%>' OnClick="ImageButton1_Click" runat="server" Width="25px" Height="25px" ImageUrl="~/assets/del.png" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" />
                </h4>
                <p class="text-justify">
                   <%# Eval("comment") %>- 
                </p>
            </div>
        </div>
                </ItemTemplate>
                            </asp:Repeater>
            <hr>
            <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span> اضافة رد   </h4>
           
          <asp:ScriptManager ID="ScriptManager1" runat="server" />
        
        <cc1:Editor 
            ID="Editor1" 
            Width="100%"  
            Height="200px"
            runat="server"/>
<asp:Button ID="Button1" CssClass="btn-primary" runat="server" Text="رد" OnClick="Button1_Click" />
        </div>
        
    </div>
</div>
</asp:Content>

