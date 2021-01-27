<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="Block.aspx.cs" Inherits="Affairs_Block" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="color: #b94a48; background-color: #f2dede; border-color: #eed3d7;">
                        <div>
                            <h4>
                                <asp:Label ID="title" runat="server" Style="color: #b94a48;"></asp:Label></h4>
                        </div>
                    </div>
                    <div class="modal-body" style="color: #31708f; border-color: #bce8f1;">
                        <h4>
                            <asp:Label ID="msg" runat="server" Style="color: #31708f;"></asp:Label></h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

