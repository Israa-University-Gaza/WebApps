﻿using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_DeanPlan : UserPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPermissionsContains("DeanPlan"))
        {
            lblEmployeeID.Text = EmployeeID;
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("PlanID")).Text;
        DataTable DT = DataAccess.PlanGet(id);
        txtPlanNum.Text = DT.Rows[0]["PlanNum"].ToString();
        if (DT.Rows.Count > 0)
        {
            ddlDepartmentID.DataBind();
            ddlDepartmentID.SelectedValue = DT.Rows[0]["DepartmentID"].ToString();
            txtYear.Text = DT.Rows[0]["Year"].ToString();
            lblPlanID.Text = id;
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("PlanID")).Text;

        if (DataAccess.PlanDelete(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtPlanNum, ddlDepartmentID, txtYear }))
        {
            if (DataAccess.PlanAddEdit(lblPlanID.Text, txtPlanNum.Text, ddlDepartmentID.SelectedValue, txtYear.Text,true,false, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblPlanID, txtPlanNum, ddlDepartmentID, txtYear });
                ListView1.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblPlanID, txtPlanNum, ddlDepartmentID, txtYear });
    }

    protected void lbAccrediation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("PlanID")).Text;
        DataTable DT = DataAccess.PlanAccreditation(id, EmployeeID, "2");
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void lbViewCourses_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["PlanID"] = ((Label)item.FindControl("PlanID")).Text;
        Response.Redirect("PlanCourse.aspx");
    }

    protected void lbPDF_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("PlanID")).Text;

        //ArrayList a1 = new ArrayList();
        //a1.Add("dsGetStdPlanReport");

        //ArrayList a2 = new ArrayList();
        //a2.Add(DataAccess.GetPlanReport(id));


        ArrayList a1 = new ArrayList();
        a1.Add("dsGetPlanSemester11Report");
        a1.Add("dsGetPlanSemester12Report");
        a1.Add("dsGetPlanSemester21Report");
        a1.Add("dsGetPlanSemester22Report");
        a1.Add("dsGetPlanSemester31Report");
        a1.Add("dsGetPlanSemester32Report");
        a1.Add("dsGetPlanSemester41Report");
        a1.Add("dsGetPlanSemester42Report");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetPlanSemester11Report(id));
        a2.Add(DataAccess.GetPlanSemester12Report(id));
        a2.Add(DataAccess.GetPlanSemester21Report(id));
        a2.Add(DataAccess.GetPlanSemester22Report(id));
        a2.Add(DataAccess.GetPlanSemester31Report(id));
        a2.Add(DataAccess.GetPlanSemester32Report(id));
        a2.Add(DataAccess.GetPlanSemester41Report(id));
        a2.Add(DataAccess.GetPlanSemester42Report(id));

        CreatePDF("StdPlan", @"Academic\Reports\Report.rdlc", a1, a2);
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

}