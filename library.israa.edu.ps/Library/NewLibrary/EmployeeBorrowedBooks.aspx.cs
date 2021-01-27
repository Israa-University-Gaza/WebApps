﻿using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_EmployeeBorrowedBooks : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["EmployeeID"] != null)
            {
                txtDateFrom.Text = "2015/06/01";
                txtDateTo.Text = DateTime.Now.ToString("yyyy/MM/dd");
                lblEmployeeID.Text = Session["EmployeeID"].ToString();
                DataTable DT = NewDataAccess.EmployeePhoto_Get(lblEmployeeID.Text);
                if (DT.Rows.Count > 0)
                {
                    if (!Convert.IsDBNull(DT.Rows[0]["Emp_Picture"]))
                    {
                        byte[] imgBytes = (byte[])DT.Rows[0]["Emp_Picture"];
                        string imgString = Convert.ToBase64String(imgBytes);
                        image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    }
                }
            }
            else
            {
                Response.Redirect("Employees.aspx");
            }
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
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], (DataTable)DTArray[i]);
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
    protected void btnChechEmployee_Click(object sender, EventArgs e)
    {
        DataTable DT = NewDataAccess.CheckEmployee(txtEmployeeNo.Text);
        if (DT.Rows.Count > 0)
        {
            Session["EmployeeID"] = DT.Rows[0]["EmployeeID"].ToString();
            Response.Redirect("Employee.aspx");
        }
        else
        {
            ShowToast(this, "رقم الموظف غير صحيح", "", "error");
        }
    }

    protected void lbReturned_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string BorrowClientID = ((Label)li.FindControl("ID")).Text;
        DataTable DT = NewDataAccess.ReturnBorrowClient(BorrowClientID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void lbRenewed_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string BorrowClientID = ((Label)li.FindControl("ID")).Text;
        DataTable DT = NewDataAccess.RenewBorrowClient(BorrowClientID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetClientBorrowedBooks");
        a1.Add("dsGetClientInfo");
        ArrayList a2 = new ArrayList();
        a2.Add(NewDataAccess.GetClientBorrowedBooks(lblEmployeeID.Text, "1", txtDateFrom.Text, txtDateTo.Text));
        a2.Add(NewDataAccess.GetClientInfo(lblEmployeeID.Text, "1", txtDateFrom.Text, txtDateTo.Text));
        CreatePDF("EmployeeBorrowedBookReport", @"Library/NewLibrary/Reports/ClientBorrowedBooksReport.rdlc", a1, a2);
    }
}