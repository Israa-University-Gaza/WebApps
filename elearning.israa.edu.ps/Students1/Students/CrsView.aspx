<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage.master" AutoEventWireup="true" CodeFile="CrsView.aspx.cs" Inherits="Students_CrsView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="Repeater" runat="server"  DataSourceID="SqlDataSource1" >
          <ItemTemplate>

           
               <div class="col-sm-4 col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 style="font-family:Tahoma"><span style="font-size: 18px;" class="glyphicon glyphicon-fullscreen"></span>&nbsp;&nbsp;
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("startdate") %>' />
                                  <asp:Label ID="Label1" runat="server" Text='to' ForeColor="Red" />
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("enddate") %>' />

                                 </h4>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                               <div class="col-xs-12" runat="server" id="r11" style="overflow-y: hidden; height: 200px;">
                                    <ul class="demo" runat="server" id="r1" style="overflow-y: hidden; height: 187px;">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">

                            <div class="clearfix">
                                <!--<ul class="pagination pull-left">
                                        <li><button href="#" class="all btn btn-default"><span class="glyphicon glyphicon-chevron-left"></span></button></li>
                                    </ul>-->
                            </div>
                        </div>
                    </div>
                </div>
            
        
        </ItemTemplate>
           </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [startdate], [enddate] FROM [e_crs_week]"></asp:SqlDataSource>
</asp:Content>

