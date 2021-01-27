<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="ViewBook.aspx.cs" Inherits="Library_ViewBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption font-ha"><i class="fa fa-search"></i>بيانات الكتاب</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="70%" AutoGenerateRows="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
             
                    <AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>

                    <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></EditRowStyle>
                    <Fields>
                         <asp:BoundField DataField="PublicID" HeaderText="الرقم العام" SortExpression="PublicID"></asp:BoundField>

                        <asp:BoundField DataField="CategoryID" HeaderText="رقم التصنيف" SortExpression="CategoryID"></asp:BoundField>
                        <asp:BoundField DataField="BarcodeID" HeaderText="الباركود" SortExpression="BarcodeID"></asp:BoundField>
                    
                        <asp:BoundField DataField="BookTitle" HeaderText="عنوان الكتاب" SortExpression="BookTitle"></asp:BoundField>
                         <asp:BoundField DataField="BookTitle2" HeaderText="العنوان الموازي" SortExpression="BookTitle2"></asp:BoundField>
                        <asp:BoundField DataField="BookTitle3" HeaderText="العنوان الشارح" SortExpression="BookTitle3"></asp:BoundField>
                         <asp:BoundField DataField="BookType1" HeaderText="نوع الموضوع" ReadOnly="True" SortExpression="BookType1"></asp:BoundField>
       <asp:BoundField DataField="PersonName" HeaderText="المؤلف" SortExpression="PersonName"></asp:BoundField>
                        <asp:BoundField DataField="Author" HeaderText="النوع" ReadOnly="True" SortExpression="Author"></asp:BoundField>
                      
                   
                        <asp:BoundField DataField="CopyCount" HeaderText="عدد النسخ" SortExpression="CopyCount"></asp:BoundField>
                        <asp:BoundField DataField="SubjectHead" HeaderText="رؤوس الموضوعات" SortExpression="SubjectHead"></asp:BoundField>
                        <asp:BoundField DataField="BookPlace" HeaderText="مكان وجوده" SortExpression="BookPlace"></asp:BoundField>
                        <asp:BoundField DataField="BStatus" HeaderText="وضع الكتاب" SortExpression="BookStatus"></asp:BoundField>
                        <asp:BoundField DataField="Tdmak" HeaderText="الرقم الدولي" SortExpression="Tdmak"></asp:BoundField>
                        <asp:BoundField DataField="Lang" HeaderText="اللغة" SortExpression="BookLanguage"></asp:BoundField>
                  
                       
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC"></FooterStyle>

                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>
                </asp:DetailsView>

                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="BookDetailsGet" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="ID" Name="ID" Type="Int32" ></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            </div>
        </div>
</asp:Content>

