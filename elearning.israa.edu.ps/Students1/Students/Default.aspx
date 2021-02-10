<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp; اهلا
                <asp:Label ID="f_name" runat="server" Text=""></asp:Label>
                ! </h4>
            <p class="text-justify">
                يمكنكم مشاهدة الانشطة التي تم وضعها من قبل المحاضرين بالضغط على المواد الدراسية في القائمة           
            </p>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink3" runat="server">الكلية</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="coll" runat="server" Text=""></asp:Label>
                </p>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server">القسم</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="dept" runat="server" Text=""></asp:Label>
                </p>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-flag"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server">البرنامج</asp:HyperLink>
                </h4>
                <p class="text-justify">
                    <asp:Label ID="prod" runat="server" Text=""></asp:Label>
                </p>
            </div>
        </div>
        <div class="col-sm-3 col-md-3">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink7" runat="server">المعدل</asp:HyperLink>
                </h4>
                <p class="text-justify">


                    <asp:Label ID="gpa" runat="server" Text=""></asp:Label>
                </p>
            </div>
        </div>

    </div>

    <div class="col-sm-12 col-md-12">
        <div class="well">
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp; محاضرين الفصل الدراسي  الحالي </h4>

        </div>
        <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
            <ItemTemplate>
                <div class="col-sm-4 col-md-4">
                    <div class="well">
                        <h4><span style="font-size: 14px;" class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server"><%# Eval("arName") %></asp:HyperLink>
                        </h4>
                        <p class="text-justify">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="~/assets/mmm.png" ImageWidth="40px" Text="مراسلة" ToolTip="ارسال رسالة"></asp:HyperLink>
<%--          <span style="font-size: 18px; color:red"   class="glyphicon glyphicon-send"><asp:HyperLink ID="HyperLink5" runat="server"></asp:HyperLink></span> --%>

                             
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <div class="col-sm-3 col-md-3">
        <div class="well">
            <h4>&nbsp;&nbsp;
            </h4>
            <p class="text-justify">
               
            </p>
        </div>
    </div>
    <script>
                    function openDetailsWindow2(serNo) {
                       
                        
                        var win = window.open('SendMassege.aspx?id=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=800,height=570');
                       
                    }
                    $(document).ready(function () {
                        $('#example').dataTable(); setColumnLabel('example');
                    });
                </script>



</asp:Content>

