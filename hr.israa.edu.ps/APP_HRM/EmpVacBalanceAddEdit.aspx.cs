using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_EmpVacBalanceAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { balance, SDate, FDate, ddlEmployeeName });
        bool IntValidate = IntValidateControls(new WebControl[] { balance ,Consumer});
        bool DateValidate = DateValidateControls(new WebControl[] { SDate, FDate });
        if (validate && IntValidate && DateValidate)
        {

            if (DataAccess.Vacation_Balance_AddEdit(lblID.Text, VacationTypeID.SelectedValue,
                SDate.Text, FDate.Text, Convert.ToInt16(Consumer.Text), Convert.ToInt16(balance.Text), Convert.ToInt16(PostPone.Text), Convert.ToInt16(ddlEmployeeName.SelectedValue), Convert.ToInt16(UserID)) > 0)
            {
               
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblID, balance, SDate, FDate, ddlEmployeeName, Consumer, PostPone });


            }
            else
            {
                ShowToast(this, "عذرًا موجود مسبقا.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected int Subtract(int item1, int item2)
    {
        return (item1 - item2);

    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((LinkButton)sender).Parent;
        lblID.Text = ((Label)ri.FindControl("VacationBalanceID")).Text;
        DataTable DT = DataAccess.Vacation_Balance_Get(lblID.Text);
        if (DT.Rows.Count > 0)
        {
            VacationTypeID.SelectedValue = DT.Rows[0]["Vacation_Type_ID"].ToString();
            PostPone.Text = DT.Rows[0]["PostPoneBalance"].ToString();
            balance.Text = DT.Rows[0]["Total_Balance"].ToString();
            Consumer.Text = DT.Rows[0]["Consumer_Balance"].ToString();
            if ((DT.Rows[0]["Balance_Start_Date"].ToString()) != "")
                SDate.Text = DT.Rows[0]["Balance_Start_Date1"].ToString();
            if ((DT.Rows[0]["Balance_End_Date"].ToString()) != "")
                FDate.Text = DT.Rows[0]["Balance_End_Date1"].ToString();
            ddlEmployeeName.SelectedValue = DT.Rows[0]["Emp_ID"].ToString();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblID, VacationTypeID, SDate, FDate, balance,Consumer });
       
    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("VacationBalanceID")).Text;

        if (DataAccess.Vacation_Balance_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }
    protected void ddlEmployeeName_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
        DataTable DT=DataAccess.PostPoneBalanceGet(ddlEmployeeName.SelectedValue);
        if (DT.Rows.Count > 0)
        {
            PostPone.Text = DT.Rows[0]["PostPoneBalance"].ToString();
        }
        else PostPone.Text = "";
    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {

        DataTable DT = DataAccess.GetExcelEmpVacationBalance(txtNameFilter.Text);
          ExportToExcel(DT);
           
    }
    public void ExportToExcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            string filename = "DownloadExcel.xls";
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

    protected void lbSurvay_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string EmployeeID = ((Label)li.FindControl("EmpID")).Text;
        string VacBalanceID = ((Label)li.FindControl("VacationBalanceID")).Text;


        ArrayList a1 = new ArrayList();
        a1.Add("EmployeeVacationSurvay");
        a1.Add("EmployeePatiantVacationSurvay");
        a1.Add("EmpVacationBalance");
        a1.Add("EmployeeUrgentVacationSurvay");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetEmployeeVacationSurvay(EmployeeID, VacBalanceID));
        a2.Add(DataAccess.GetEmployeePatiantVacationSurvay(EmployeeID));
        a2.Add(DataAccess.EmpVacationBalance(EmployeeID, VacBalanceID));
        a2.Add(DataAccess.GetEmployeeUrgentVacationSurvay(EmployeeID));
        CreatePDF("حصر اجازات الموظف", @"Reports\EmployeeVacationSurvay.rdlc", a1, a2);
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
}