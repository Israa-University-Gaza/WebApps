<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Admission_Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>تقارير الطلاب</div>
                </div>
                <div class="portlet-body">
                    <asp:ListBox ID="ListBox1" runat="server">
                        <asp:ListItem Text="الرقم الجامعي" Value="1"></asp:ListItem>
                        <asp:ListItem Text="الإسم ثلاثي" Value="2"></asp:ListItem>
                        <asp:ListItem Text="رقم الهوية" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                    </asp:ListBox>
                    <asp:Button ID="btnReport" runat="server" Text="تشكيل التقرير" CssClass="btn green" OnClick="btnReport_Click" />
                    <br />
                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

