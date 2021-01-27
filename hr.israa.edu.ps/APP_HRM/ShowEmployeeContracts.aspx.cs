using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_ShowEmployeeContracts : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
 protected void EmpName_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        ListView1.DataBind();
    }

    protected void Con_Type_ID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    private void CreatePDF(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
    {
        ReportViewer viwer = new ReportViewer();
        Warning[] warnings = null;
        string[] streamIds = null;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;
        string filetype = string.Empty;

        viwer.SizeToReportContent = true;
        viwer.LocalReport.ReportPath = reportpath;
        viwer.ProcessingMode = ProcessingMode.Local;

        for (int i = 0; i < dsNameArray.Count; i++)
        {
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], (System.Data.DataTable)DTArray[i]);
            viwer.LocalReport.DataSources.Add(rds1);
        }
        viwer.LocalReport.Refresh();

        byte[] bytes = viwer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
        Response.Buffer = true;
        Response.Clear();

        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file
        Response.Flush(); // send it to the client to download
    }
    protected void PDFEmployeeContract_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ContractID = ((Label)li.FindControl("Contract_ID")).Text;
        string ContractTypeID = ((Label)li.FindControl("ContractTypeID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsEmpContractGet");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.EmpContractGet(ContractID));
        if (ContractTypeID != "10")
        {
            CreatePDF("EmployeeContractReport", @"Reports\EmployeeContractReport.rdlc", a1, a2);
        }
        else CreatePDF("VolunteerReport", @"Reports\VolunteerContractReport.rdlc", a1, a2);

    }
    protected void PrintAppointment_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ContractID = ((Label)li.FindControl("Contract_ID")).Text;
        string EmpID = ((Label)li.FindControl("EmpID")).Text;
        
        
            ArrayList a1 = new ArrayList();
            a1.Add("AppointDecision");
            a1.Add("EmpQualGetAll");
            
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.AppointmentDecisionGet(ContractID));
            a2.Add(DataAccess.EmpQualGetAll(EmpID));
            CreatePDF("AppointDecision", @"Reports\AppointDecision.rdlc", a1, a2);
        

    }
    protected void PDFVolunteerREquest_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string EmpID = ((Label)li.FindControl("EmpID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetVolunteerPersonalInformation");
        a1.Add("dsGetVolunteerInformation");
        a1.Add("dsGetVolunteerSkillsInformation");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetVolunteerPersonalInformation(EmpID));
        a2.Add(DataAccess.GetVolunteerInformation(EmpID));
        a2.Add(DataAccess.GetVolunteerSkillsInformation(EmpID));
        CreatePDF("VolunteerRequestReport", @"Reports\VolunteerRequestReport.rdlc", a1, a2);



    }
    protected void PDFEmployeeContract2_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ContractID = ((Label)li.FindControl("Contract_ID")).Text;
        string ContractTypeID = ((Label)li.FindControl("ContractTypeID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsEmpContractGet");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.EmpContractGet(ContractID));
        if (ContractTypeID != "10")
        {
            CreatePDF("EmployeeContractReport", @"Reports\EmployeeContractReport2.rdlc", a1, a2);
        }
        else CreatePDF("VolunteerReport", @"Reports\VolunteerContractReport.rdlc", a1, a2);
    }
    protected void btnEmpNoContract_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("GetEmployeeWithoutActiveContract");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetEmployeeWithoutActiveContract());
        CreatePDF("NoContractsEmployees", @"Reports\NoContractsEmployees.rdlc", a1, a2);
    }
    protected void ddlContractStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void PrintRenewContract_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string ContractID = ((Label)ri.FindControl("Contract_ID1")).Text;
        string EmpID = ((Label)ri.FindControl("EmpID1")).Text;
        string ContractTypeID = ((Label)ri.FindControl("ContractTypeID")).Text;

        ArrayList a1 = new ArrayList();
        a1.Add("AppointDecision");
        a1.Add("EmpQualGetAll");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.AppointmentDecisionGet(ContractID));
        a2.Add(DataAccess.EmpQualGetAll(EmpID));
        if (ContractTypeID =="10")
        {
            CreatePDF("RenewContractDecision", @"Reports\RenewVolunteerContractDecision.rdlc", a1, a2);
        }
        else
        {
            CreatePDF("RenewContractDecision", @"Reports\RenewContractDecision.rdlc", a1, a2);
        }
        
    }
}