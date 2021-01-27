<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportView.aspx.cs" Inherits="ReportView" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="../assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script lang="JavaScript">
        $('document').ready(function () {
          
            $('.w').click(function () {
                //$('.w').hide();
                window.print();
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
       <asp:Button class="s" ID="Button1" runat="server" Text="pdf" OnClick="Button1_Click1" />
        
     <%--   <input class="w" type="button" value="طباعة" onclick="x()">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Visible="false" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1000px" Height="600px" ShowBackButton="False"
             ShowCredentialPrompts="False" ShowDocumentMapButton="False" ShowExportControls="False" ShowFindControls="False"
             ShowPageNavigationControls="False" ShowParameterPrompts="False" ShowPrintButton="False" ShowPromptAreaButton="False"
             ShowRefreshButton="False" ShowZoomControl="False" ShowToolBar="False">
      

               <LocalReport ReportPath="Reports\CalculateSalary.rdlc" EnableExternalImages="True" >
                <DataSources>
                  
           
                      <rsweb:ReportDataSource Name="CalculateSalary" DataSourceId="CalculateSalary"></rsweb:ReportDataSource>
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>

      <rsweb:ReportViewer ID="ReportViewer2" runat="server" Visible="false" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)"
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1000px" Height="600px" ShowBackButton="False"
             ShowCredentialPrompts="False" ShowDocumentMapButton="False" ShowExportControls="False" ShowFindControls="False"
             ShowPageNavigationControls="False" ShowParameterPrompts="False" ShowPrintButton="False" ShowPromptAreaButton="False"
             ShowRefreshButton="False" ShowZoomControl="False" ShowToolBar="False">
            <LocalReport ReportPath="Reports\Report.rdlc" EnableExternalImages="True">
                <DataSources>
                  
                    <rsweb:ReportDataSource Name="DataSet1" DataSourceId="SqlDataSource1"></rsweb:ReportDataSource>
                      
                </DataSources>
            </LocalReport>
          
         

               
        </rsweb:ReportViewer>
     
                <rsweb:ReportViewer ID="ReportViewer3" runat="server" Visible="false" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)"
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1000px" Height="600px" ShowBackButton="False"
             ShowCredentialPrompts="False" ShowDocumentMapButton="False" ShowExportControls="False" ShowFindControls="False"
             ShowPageNavigationControls="False" ShowParameterPrompts="False" ShowPrintButton="False" ShowPromptAreaButton="False"
             ShowRefreshButton="False" ShowZoomControl="False" ShowToolBar="False">
            <LocalReport ReportPath="Reports\SalaryForm.rdlc" EnableExternalImages="True">
                <DataSources>
                  
                    <rsweb:ReportDataSource Name="Salary" DataSourceId="Salary" ></rsweb:ReportDataSource>
                    <rsweb:ReportDataSource Name="Plus" DataSourceId="PlusSalaryForm"></rsweb:ReportDataSource>
                 <rsweb:ReportDataSource Name="Differences" DataSourceId="DifferencesSalaryForm"></rsweb:ReportDataSource>

                     <rsweb:ReportDataSource Name="Discount"  DataSourceId="DiscountSalaryForm"></rsweb:ReportDataSource>
                      <rsweb:ReportDataSource Name="Employee"  DataSourceId="SqlDataSource1"></rsweb:ReportDataSource>
                </DataSources>
            </LocalReport>
          
         

               
        </rsweb:ReportViewer>
        
        
        <asp:SqlDataSource ID="CalculateSalary" runat="server" ConnectionString="<%$ ConnectionStrings:HumanResources %>"
            SelectCommand="SalaryGet" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Emp_ID" Type="Int32" QueryStringField="Emp_ID" DefaultValue="1" />
                <asp:QueryStringParameter Name="Month" Type="Int16" QueryStringField="Month" DefaultValue="3" />
                <asp:QueryStringParameter QueryStringField="Year" DefaultValue="2015" Name="Year" Type="Int16"></asp:QueryStringParameter>
            </SelectParameters>

        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1"  runat="server" ConnectionString="<%$ ConnectionStrings:HumanResources %>"
            SelectCommand="EmployeeDetailsGet" SelectCommandType="StoredProcedure">
        <SelectParameters>
          
           <asp:QueryStringParameter Name="Emp_ID" Type="Int16" QueryStringField="Emp_ID"  />
       </SelectParameters>

        </asp:SqlDataSource>

        <asp:SqlDataSource ID="PlusSalaryForm"  runat="server" ConnectionString="<%$ ConnectionStrings:HumanResources %>"
            SelectCommand="PlusSalaryForm" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Emp_ID" Type="Int16" QueryStringField="Emp_ID"  />
                <asp:QueryStringParameter Name="Month" Type="Int16" QueryStringField="Month1"  />
                <asp:QueryStringParameter Name="Year" Type="Int16" QueryStringField="Year1"  />
       </SelectParameters>

        </asp:SqlDataSource>

        <asp:SqlDataSource ID="DiscountSalaryForm" runat="server" ConnectionString="<%$ ConnectionStrings:HumanResources %>"
            SelectCommand="DiscountSalaryForm" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Emp_ID" Type="Int16" QueryStringField="Emp_ID"  />
                <asp:QueryStringParameter Name="Month" Type="Int16" QueryStringField="Month1"  />
                <asp:QueryStringParameter Name="Year" Type="Int16" QueryStringField="Year1"  />
       </SelectParameters>

        </asp:SqlDataSource>


        <asp:SqlDataSource ID="DifferencesSalaryForm" runat="server" ConnectionString="<%$ ConnectionStrings:HumanResources %>"
            SelectCommand="DifferencesSalaryForm" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Emp_ID" Type="Int16" QueryStringField="Emp_ID"  />
                <asp:QueryStringParameter Name="Month" Type="Int16" QueryStringField="Month1"  />
                <asp:QueryStringParameter Name="Year" Type="Int16" QueryStringField="Year1"  />
       </SelectParameters>

        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Salary" runat="server" ConnectionString="<%$ ConnectionStrings:HumanResources %>"
            SelectCommand="Salary" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Emp_ID" Type="Int16" QueryStringField="Emp_ID"  />
                <asp:QueryStringParameter Name="Month" Type="Int16" QueryStringField="Month1"  />
                <asp:QueryStringParameter Name="Year" Type="Int16" QueryStringField="Year1"  />
       </SelectParameters>

        </asp:SqlDataSource>



        <rsweb:ReportViewer ID="ReportViewer4" runat="server" Visible="false" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)"
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1000px" Height="600px" ShowBackButton="False"
             ShowCredentialPrompts="False" ShowDocumentMapButton="False" ShowExportControls="False" ShowFindControls="False"
             ShowPageNavigationControls="False" ShowParameterPrompts="False" ShowPrintButton="False" ShowPromptAreaButton="False"
             ShowRefreshButton="False" ShowZoomControl="False" ShowToolBar="False">
            <LocalReport ReportPath="Reports\Attendance.rdlc" EnableExternalImages="True">
                <DataSources>
                  
                    <rsweb:ReportDataSource Name="EmpAttendance"  DataSourceId="Empattendance"></rsweb:ReportDataSource>
                    <rsweb:ReportDataSource Name="calculateAttendance" DataSourceId="calculateAttendance"></rsweb:ReportDataSource>
       
                </DataSources>
            </LocalReport>
          
         

               
        </rsweb:ReportViewer>

      
      
        <asp:ObjectDataSource ID="calculateAttendance" runat="server"  SelectMethod="GetData" TypeName="DataSetTableAdapters.calculateAttendance_TBTableAdapter" >
          
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="Emp_ID2" DefaultValue="1" Name="Emp_ID" Type="Int32"></asp:QueryStringParameter>
                <asp:QueryStringParameter QueryStringField="Year2" DefaultValue="2015" Name="Year" Type="Int32"></asp:QueryStringParameter>
                <asp:QueryStringParameter QueryStringField="Month2" DefaultValue="4" Name="month" Type="Int32"></asp:QueryStringParameter>
            </SelectParameters>
            
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="Empattendance" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataSetTableAdapters.EmpAttendanceTableAdapter">



            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="Emp_ID2" DefaultValue="1" Name="Emp_ID" Type="Int32"></asp:QueryStringParameter>
                <asp:QueryStringParameter QueryStringField="Year2" DefaultValue="2015" Name="Year" Type="Decimal"></asp:QueryStringParameter>
                <asp:QueryStringParameter QueryStringField="Month2" DefaultValue="4" Name="Month" Type="Decimal"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        

            <rsweb:ReportViewer ID="ReportViewer5" runat="server" Visible="false" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)"
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1000px" Height="600px" ShowBackButton="False"
             ShowCredentialPrompts="False" ShowDocumentMapButton="False" ShowExportControls="False" ShowFindControls="False"
             ShowPageNavigationControls="False" ShowParameterPrompts="False" ShowPrintButton="False" ShowPromptAreaButton="False"
             ShowRefreshButton="False" ShowZoomControl="False" ShowToolBar="False">
            <LocalReport ReportPath="Reports\allSalary.rdlc" EnableExternalImages="True">
                <DataSources>
                  
                    <rsweb:ReportDataSource Name="Emp_ID"  DataSourceId="Emp_ID"></rsweb:ReportDataSource>
  <%--             <rsweb:ReportDataSource Name="Salary" DataSourceId="Salary"></rsweb:ReportDataSource>
                    <rsweb:ReportDataSource Name="Plus" DataSourceId="PlusSalaryForm"></rsweb:ReportDataSource>
                 <rsweb:ReportDataSource Name="Differences" DataSourceId="DifferencesSalaryForm"></rsweb:ReportDataSource>

                     <rsweb:ReportDataSource Name="Discount"  DataSourceId="DiscountSalaryForm"></rsweb:ReportDataSource>
                      <rsweb:ReportDataSource Name="Employee"  DataSourceId="SqlDataSource1"></rsweb:ReportDataSource>--%>
                </DataSources>
            </LocalReport>
         
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="Emp_ID" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataSetTableAdapters.Salary_Transaction_TB1TableAdapter">



            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="month11" DefaultValue="3" Name="month" Type="Int32"></asp:QueryStringParameter>
                <asp:QueryStringParameter QueryStringField="year11" DefaultValue="2015" Name="year" Type="Int32"></asp:QueryStringParameter>
          

            </SelectParameters>
        </asp:ObjectDataSource>

       

    </form>
</body>
</html>
