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
public partial class APP_HRM_LoadHoursContractAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    ddlFilterEmployee.SelectedValue = "-1";
        //}

    }

    protected void EmpName_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.LoadHoursGet(EmpName.SelectedValue, ddlSemester.SelectedValue);
        if (DT.Rows.Count > 0)
        {
            lblJobTitleID.Text = DT.Rows[0]["Emp_Job_Title_ID"].ToString();
            lblDepartmentID.Text = DT.Rows[0]["Department_ID"].ToString();
            JobTitle.Text = DT.Rows[0]["JobTitleName"].ToString();
            LoadHours.Text = DT.Rows[0]["LoadHours"].ToString();
            TotalLoad.Text = (Convert.ToInt16(DT.Rows[0]["LoadHours"].ToString()) * 14).ToString();
        }
    }
    protected void HourPrice_TextChanged(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ActualLoadHours, HourPrice }))
        {
            PaidAmount.Text = (Convert.ToDecimal(ActualLoadHours.Text) * Convert.ToDecimal(HourPrice.Text)).ToString();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlContractType, ddlSemester, EmpName, ActualLoadHours, HourPrice, ddlCurrencyID, ContractDate }))
        {
            DataTable DT = DataAccess.LoadHoursContractAddEdit(lblID.Text, ddlContractType.SelectedValue, ddlSubContractType.SelectedValue, EmpName.SelectedValue, ddlSemester.SelectedValue, lblJobTitleID.Text, lblDepartmentID.Text, ActualLoadHours.Text, HourPrice.Text, ddlCurrencyID.SelectedValue, ContractDate.Text, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblID, ddlContractType, ddlSemester, EmpName, lblDepartmentID, lblJobTitleID, JobTitle, LoadHours, TotalLoad, ActualLoadHours, HourPrice, PaidAmount, ddlCurrencyID, ContractDate });
                ListView1.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblID, ddlSemester, EmpName, lblDepartmentID, lblJobTitleID, JobTitle, LoadHours, TotalLoad, ActualLoadHours, HourPrice, PaidAmount, ddlCurrencyID, ContractDate });

    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem Li = (ListViewItem)((LinkButton)sender).Parent;
        lblID.Text = ((Label)Li.FindControl("ID")).Text;
        DataTable DT = DataAccess.LoadHoursContractGet(lblID.Text);
        if (DT.Rows.Count > 0)
        {
            ddlSemester.SelectedValue = DT.Rows[0]["SemesterID"].ToString();
            EmpName.SelectedValue = DT.Rows[0]["Emp_ID"].ToString();
            lblDepartmentID.Text = DT.Rows[0]["DepartmentID"].ToString();
            lblJobTitleID.Text = DT.Rows[0]["JobTitleID"].ToString();
            JobTitle.Text = DT.Rows[0]["JobTitleName"].ToString();
            LoadHours.Text = DT.Rows[0]["LoadHours"].ToString();
            TotalLoad.Text = DT.Rows[0]["TotalLoadHours"].ToString();
            ActualLoadHours.Text = DT.Rows[0]["Actualhours"].ToString();
            HourPrice.Text = DT.Rows[0]["HourPrice"].ToString();
            PaidAmount.Text = DT.Rows[0]["PaidAmount"].ToString();
            ddlCurrencyID.SelectedValue = DT.Rows[0]["CurrencyID"].ToString();
            ContractDate.Text = DT.Rows[0]["ContractDate"].ToString();
            ddlSubContractType.SelectedValue= DT.Rows[0]["SubContractTypeID"].ToString();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem Li = (ListViewItem)((LinkButton)sender).Parent;
        lblID.Text = ((Label)Li.FindControl("ID")).Text;

        if (DataAccess.LoadHoursContractDelete(lblID.Text, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        }
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
        ListView2.DataBind();
    }
    protected void lbPrint_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;



        ArrayList a1 = new ArrayList();
        a1.Add("LoadHoursContractReportGet");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.LoadHoursContractReportGet(ID));
        CreatePDF("LoadHoursContractReportGet", @"Reports\LoadHoursContractReport.rdlc", a1, a2);
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        foreach (ListViewItem item in ListView1.Items)
        {
            ListView inner = (ListView)item.FindControl("ListView2");

            string TotalHours = ((Label)inner.Items[0].FindControl("lblTotalHours")).Text;
            DataAccess.UpdateLoadHoursContract(((Label)item.FindControl("EmpID")).Text, ((Label)item.FindControl("SemesterID")).Text, TotalHours);
        }
        ListView1.DataBind();
        ListView2.DataBind();
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
    protected void btnExcel_Click(object sender, EventArgs e)
    {

        DataTable DT = DataAccess.ExcelLoadHourContractGetAll(ddlFilterSemester.SelectedValue, ddlFilterEmployee.SelectedValue, ddlFilterContractType.SelectedValue,ddlFilterDepartment.SelectedValue);
        ExportToExcel(DT);

    }
    public void ExportToExcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            string filename = "LoadHourContract.xls";
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            DataGrid dgGrid = new DataGrid();
            dgGrid.DataSource = dt;
            dgGrid.DataBind();
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

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.AddSemesterLoadHourContract(ddlFilterSemester.SelectedValue,UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        {
            ListView1.DataBind();
            ListView2.DataBind();
        }
    }

    protected void Empstatus_SelectedIndexChanged(object sender, EventArgs e)
    {//اذا كان على راس عمله تظهر قائمة معفي وغير معفي من التوقيع
        ddlEmpSubStatus.Visible = true;
        if (Empstatus.SelectedValue == "1041")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource22";
        }
        else if (Empstatus.SelectedValue == "1043")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource34";

        }
        else if (Empstatus.SelectedValue == "2122")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource5";
        }
        else
        {
            ddlEmpSubStatus.Visible = false;
        }
    }

}