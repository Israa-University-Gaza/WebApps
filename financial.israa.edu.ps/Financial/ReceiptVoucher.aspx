﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Financial/MasterPage.master" AutoEventWireup="true" CodeFile="ReceiptVoucher.aspx.cs" Inherits="Financial_ReceiptVoucher" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">مالية القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">سند قبض</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>سند قبض</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div style="margin: 0 auto; width: 800px;">
                            <asp:Label ID="lblDocumentID" runat="server" Text="8" Visible="true"></asp:Label>
                            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="737px">
                                <LocalReport ReportPath="Financial\Reports\GetReceiptVoucher.rdlc">
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                                    </DataSources>
                                </LocalReport>
                            </rsweb:ReportViewer>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetDocument" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblDocumentID" Name="DocumentID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
