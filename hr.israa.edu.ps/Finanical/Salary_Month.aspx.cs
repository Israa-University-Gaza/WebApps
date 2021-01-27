using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_Salary_Month : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { ddlYear , ddlMonth });
        if (validate)
        {

            DataTable DT = DataAccess.CalculatedSalaryAddEdit(ddlMonth.SelectedValue, ddlYear.SelectedValue,ddlEmployeeName.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { ddlYear, ddlMonth });
                ListView1.DataBind();
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnDinar_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth}))
        {
            ArrayList a1 = new ArrayList();
            a1.Add("GetEmployessBankSalaryWithCurrency");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetEmployessBankSalaryWithCurrency(ddlMonth.SelectedValue, ddlYear.SelectedValue, "1",ddlBank.SelectedValue));
            CreatePDF("SalaryReport", @"Reports\SalaryReport.rdlc", a1, a2);
            //CreateExcel("SalaryReportDinar", @"Reports\ExcelSalaryReport.rdlc", a1, a2);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    protected void btnshikel_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            ArrayList a1 = new ArrayList();
            a1.Add("GetEmployessBankSalaryWithCurrency");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetEmployessBankSalaryWithCurrency(ddlMonth.SelectedValue, ddlYear.SelectedValue, "3", ddlBank.SelectedValue));
            CreatePDF("SalaryReport", @"Reports\SalaryReport.rdlc", a1, a2); 
           // CreateExcel("SalaryReportshikel", @"Reports\ExcelSalaryReport.rdlc", a1, a2);
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
    private void CreateExcel(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
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


        byte[] bytes = viwer.LocalReport.Render("Excel", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
        Response.Buffer = true;
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file
        Response.Flush(); // send it to the client to download
    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            ArrayList a1 = new ArrayList();
            a1.Add("GetTotalEmployeesSalary");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetTotalEmployeesSalary(ddlMonth.SelectedValue, ddlYear.SelectedValue,ddlBank.SelectedValue));
            if (ddlBank.SelectedValue == "2039")
            {
                CreatePDF("  صرف رواتب البنك الاسلامي العربي لشهر" + ddlMonth.SelectedItem.Text + "لسنة " + ddlYear.SelectedValue, @"Reports\TotalEmployeesSalary.rdlc", a1, a2);
            }
            else if (ddlBank.SelectedValue == "2124")
            {
                CreatePDF(" صرف رواتب البنك الاسلامي الوطني لشهر " + ddlMonth.SelectedItem.Text+ "لسنة " + ddlYear.SelectedValue, @"Reports\TotalEmployeesSalary2.rdlc", a1, a2);
            }
           
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
 protected void btnExcel_Click(object sender, EventArgs e)
    {
      if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
          
        DataTable DT = DataAccess.GetEmployeeUnivSalary(ddlMonth.SelectedValue, ddlYear.SelectedValue);
        ExportToExcel(DT);
        }
      else
      {
          ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
      }
    }
    public void ExportToExcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            string filename = "DownloadExcel.xls";
            Response.ContentEncoding = System.Text.Encoding.Unicode;
            Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            DataGrid dgGrid = new DataGrid();
            dgGrid.DataSource = dt;
            dgGrid.DataBind();
           	//dt.Rows.Add("اسم الموظف", "رقم الموظف","راتب الصندوق","عملة الصندوق","راتب محول","عملة المحول","خصم شئون موظفين","خصم محول","تسليم صندوق","عملة التسليم");
            //Get the HTML for the control.
            dgGrid.RenderControl(hw);
            //Write the HTML back to the browser.
            //Response.ContentType = application/vnd.ms-excel;
            Response.ContentType = "application/vnd.ms-excel";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
            this.EnableViewState = false;
            Response.Write(tw.ToString());
            Response.End();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { ddlYear, ddlMonth });
        if (validate)
        {

            DataTable DT = DataAccess.CancelCalculateSalary("-1",ddlMonth.SelectedValue, ddlYear.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { ddlYear, ddlMonth });
                ListView1.DataBind();
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnReCalculate_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { ddlYear, ddlMonth });
        if (validate)
        {

            DataTable DT = DataAccess.ReCalculatedSalary(ddlMonth.SelectedValue, ddlYear.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] {});
                ListView1.DataBind();
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnUniv_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            ArrayList a1 = new ArrayList();
            a1.Add("GetEmployeeUnivSalary");
            a1.Add("TotalUnivSalaryStatistics");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetEmployeeUnivSalary(ddlMonth.SelectedValue, ddlYear.SelectedValue));
            a2.Add(DataAccess.GetTotalUnivSalaryStatistics(ddlMonth.SelectedValue, ddlYear.SelectedValue));
            CreatePDF("GetEmployeeUnivSalary", @"Reports\EmployeeUnivSalary.rdlc", a1, a2);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void lbReCalculate_Click(object sender, EventArgs e)
    {
        ListViewItem Li = (ListViewItem)((LinkButton)sender).Parent;
        string EmployeeID = ((Label)Li.FindControl("lblEmployeeID")).Text;
        bool validate = ValidateControls(new WebControl[] { ddlYear, ddlMonth });
        if (validate)
        {
            
            DataTable DT = DataAccess.ReEmployeeCalculatedSalary(ddlMonth.SelectedValue, ddlYear.SelectedValue,EmployeeID, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] {});
                ListView1.DataBind();
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnMotivation_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            ArrayList a1 = new ArrayList();
            a1.Add("SalayVolunteerMotivation");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetSalayVolunteerMotivation(ddlMonth.SelectedValue, ddlYear.SelectedValue));
            CreatePDF("GetSalayVolunteerMotivation", @"Reports\SalaryMotivationVolunteer.rdlc", a1, a2);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnTotal_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            ArrayList a1 = new ArrayList();
            a1.Add("TotalSalariesStatistics");
            a1.Add("TotalBankSalaryStatistics");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetTotalSalariesStatistics(ddlMonth.SelectedValue, ddlYear.SelectedValue));
            a2.Add(DataAccess.GetTotalBankSalaryStatistics(ddlMonth.SelectedValue, ddlYear.SelectedValue));
            CreatePDF("TotalSalariesStatistics", @"Reports\TotalSalariesStatistics.rdlc", a1, a2);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnExcelDinar_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            DataTable DT = DataAccess.GetExcelEmployessBankSalaryWithCurrency(ddlMonth.SelectedValue, ddlYear.SelectedValue, "1",ddlBank.SelectedValue);
            ExportToExcel(DT);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnExcelShikel_Click(object sender, EventArgs e)
    {

        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            DataTable DT = DataAccess.GetExcelEmployessBankSalaryWithCurrency(ddlMonth.SelectedValue, ddlYear.SelectedValue, "3",ddlBank.SelectedValue);
            ExportToExcel(DT);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnDollar_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            ArrayList a1 = new ArrayList();
            a1.Add("GetEmployessBankSalaryWithCurrency");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetEmployessBankSalaryWithCurrency(ddlMonth.SelectedValue, ddlYear.SelectedValue, "2", ddlBank.SelectedValue));
            CreatePDF("SalaryReport", @"Reports\SalaryReport.rdlc", a1, a2);
         
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnExcelDollar_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            DataTable DT = DataAccess.GetExcelEmployessBankSalaryWithCurrency(ddlMonth.SelectedValue, ddlYear.SelectedValue, "2", ddlBank.SelectedValue);
            ExportToExcel(DT);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
}
   
    
  

   