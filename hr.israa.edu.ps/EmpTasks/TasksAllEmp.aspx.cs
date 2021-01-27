using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.Reporting.WebForms;
using System.Collections;

public partial class EmpTasks_TasksAllEmpView : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EmpID.Text = UserID;

        if (EmpID.Text == "5110" || EmpID.Text == "5009" || EmpID.Text == "5034")
        {
            EmpID.Text = "5014";
            NoTasks.Visible = true;
        }
        //if (!Permissions.Contains("TasksAllEmpView"))
        //{
        //    Response.Redirect("~/Login.aspx");
        //}

        DataTable DT = DataAccessTasks.GetManger(EmpID.Text);
        if (DT.Rows[0]["Manger"].ToString() != "1")
        {
            Response.Redirect("~/Login.aspx");
        }

        if (!IsPostBack)
        {
            FromDate.Text = DateTime.Now.AddDays(-7).ToString("yyyy/MM/dd");
            ToDate.Text = DateTime.Now.ToString("yyyy/MM/dd");

        }


    }

    protected void Unite_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void DDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }


    protected void Department_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void section_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void Employee_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void FromDate_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void ToDate_TextChanged(object sender, EventArgs e)
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

    protected void CompletePrintTasks_Click(object sender, EventArgs e)
    {
        int c = Convert.ToInt16(Employee.SelectedValue);
        if (c == -1)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("DepartmentCompleteTasksView");
            a1.Add("GetDepartmentName");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccessTasks.PrintCompleteTasks(Employee.SelectedValue, EmpID.Text, Unite.SelectedValue, DDL.SelectedValue, Department.SelectedValue, section.SelectedValue, FromDate.Text, ToDate.Text));
            a2.Add(DataAccessTasks.GetDepartmentName(EmpID.Text, Unite.SelectedValue, DDL.SelectedValue, Department.SelectedValue, section.SelectedValue));
            CreatePDF("DepartmentCompleteTasks", @"Reports\CompleteTasksView1.rdlc", a1, a2);

        }
        else
        {
            ArrayList a1 = new ArrayList();
            a1.Add("EmployeeCompleteTasksView");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccessTasks.PrintEmployeeCompleteTasks(Employee.SelectedValue, FromDate.Text, ToDate.Text));
            CreatePDF("EmployeeCompleteTasks", @"Reports\CompleteTasksEmpView.rdlc", a1, a2);
        }

    }
    protected void InCompletePrintTasks_Click(object sender, EventArgs e)
    {
        int i = Convert.ToInt16(Employee.SelectedValue);
        if (i == -1)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("DepartmentInCompleteTasksView");
            a1.Add("GetDepartmentName");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccessTasks.PrintInCompleteTasks(Employee.SelectedValue, EmpID.Text, Unite.SelectedValue, DDL.SelectedValue, Department.SelectedValue, section.SelectedValue, FromDate.Text, ToDate.Text));
            a2.Add(DataAccessTasks.GetDepartmentName(EmpID.Text, Unite.SelectedValue, DDL.SelectedValue, Department.SelectedValue, section.SelectedValue));
            CreatePDF("DepartmentInCompleteTasks", @"Reports\InCompleteTasksView1.rdlc", a1, a2);

        }
        else
        {
            ArrayList a1 = new ArrayList();
            a1.Add("EmployeeInCompleteTasksView");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccessTasks.PrintEmployeeInCompleteTasks(Employee.SelectedValue, FromDate.Text, ToDate.Text));
            CreatePDF("EmployeeInCompleteTasks", @"Reports\InCompleteTasksEmpView.rdlc", a1, a2);

        }
    }
    protected void Reject_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        DataTable DT = DataAccessTasks.RejectTask(id, UserID);

        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
    protected void Accreditation_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        DataTable DT = DataAccessTasks.AccreditationTask(id, UserID);

        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();

    }

    protected void NoTasks_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("NoTasks");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccessTasks.NoTasks(FromDate.Text, ToDate.Text));
        CreatePDF("NoTasks", @"Reports\No tasks.rdlc", a1, a2);
        Response.Redirect("~/ReportView.aspx?From5=" + FromDate.Text + "&&To5=" + ToDate.Text);
    }
}
