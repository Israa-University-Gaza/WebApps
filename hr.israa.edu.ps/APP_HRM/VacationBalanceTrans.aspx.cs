using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_VacationBalanceTrans : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlEmpCategoryID.SelectedValue = "-1";
            ddlEmpCategoryID2.Visible = true;
            ddlEmpCategoryID2.SelectedValue = "2";
            Empstatus.SelectedValue = "1041";
        }

    }
    protected void date_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
        details.Visible = false;
    }
    protected void Empstatus_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (Empstatus.SelectedValue == "1041")
        {
            ddlEmpCategoryID2.DataBind();
            ddlEmpCategoryID2.Visible = true;
            ddlEmpTermenateReason.Visible = false;
            ddlEmpTermenateReason.SelectedValue = "-1";
        }
        else if (Empstatus.SelectedValue == "1043")

        {
            ddlEmpCategoryID2.Visible = false;
            ddlEmpCategoryID2.SelectedValue = "-1";
            ddlEmpTermenateReason.DataBind();
            ddlEmpTermenateReason.Visible = true;


        }

        else
        {
            ddlEmpCategoryID2.Visible = false;
            ddlEmpCategoryID2.SelectedValue = "-1";
            ddlEmpTermenateReason.Visible = false;
            ddlEmpTermenateReason.SelectedValue = "-1";
        }
        ListView1.DataBind();
        details.Visible = false;
    }
    protected void ddlEmpCategoryID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
        details.Visible = false;
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        details.Visible = false;
        lblID.Text = "";
        ListView1.DataBind();
    }
    protected void lbDetails_Click(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((LinkButton)sender).Parent;
        lblID.Text = ((Label)ri.FindControl("ID")).Text;
        details.Visible = true;
        ListView2.DataBind();
    }

    protected void BtnPrint_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlEmployeeName, DateFrom, DateTo }))
        {
            ArrayList a1 = new ArrayList();
            a1.Add("EmployeeVacationTransaction");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetEmployeeVacationTransaction(ddlEmployeeName.SelectedValue, "10", "2016"));
            CreatePDF("EmployeeVacationTransaction", @"Reports\EmployeeVacationTransaction.rdlc", a1, a2);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
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
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], DTArray[i]);
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

    protected void BtnAllBalanceReport_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { DateFrom, DateTo }))
        {
            ArrayList a1 = new ArrayList();
            a1.Add("EmployeesVacationTransactionMonthly");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetEmployeesVacationTransactionMonthly("10", "2016"));
            CreatePDF("EmployeesVacationTransactionMonthly", @"Reports\EmployeesVacationTransactionMonthly.rdlc", a1, a2);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    protected void ddlEmployeeName_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
        details.Visible = false;
    }
}