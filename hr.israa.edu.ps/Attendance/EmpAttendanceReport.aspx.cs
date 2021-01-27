using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_EmpAttendanceReport : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Empstatus.SelectedValue = "1041";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] {FromDate,ToDate,ddlEmployee });
        if (validate)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("EmpAttendanceBetweenTwoDates");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.EmpAttendanceBetweenTwoDates(ddlEmployee.SelectedValue,FromDate.Text,ToDate.Text));
            CreatePDF("Attendance", @"Reports\AttendanceBetweenTwoDates.rdlc", a1, a2);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        }
    protected void Button2_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { FromDate, ToDate, ddlEmployee });
        if (validate)
        {
            //Response.Redirect("../ReportView.aspx?month2=" + DropDownList1.SelectedValue + "&year2=" + TextBox1.Text + "&Emp_ID2=" + DropDownList2.SelectedValue + "&Late=1");
            ArrayList a1 = new ArrayList();
            a1.Add("EmpAttendanceLate");
            a1.Add("EmpAttendanceLateHours");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.EmpAttendanceLate(ddlEmployee.SelectedValue,FromDate.Text,ToDate.Text));
            a2.Add(DataAccess.EmpAttendanceLateHours(ddlEmployee.SelectedValue, FromDate.Text, ToDate.Text));
            CreatePDF("AttendanceLate", @"Reports\AttendanceLate.rdlc", a1, a2);
        }

        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { FromDate, ToDate, ddlEmployee });
        if (validate)
        {
           // Response.Redirect("../ReportView.aspx?ExitMonth=" + DropDownList1.SelectedValue + "&ExitYear=" + TextBox1.Text + "&ExitEmp_ID=" + DropDownList2.SelectedValue);
            ArrayList a1 = new ArrayList();
            a1.Add("Exit");
            ArrayList a2 = new ArrayList();

            a2.Add(DataAccess.ExitEmpGetAB(ddlEmployee.SelectedValue,FromDate.Text,ToDate.Text));
            //a2.Add(DataAccess.calculateAttendanceGetAll(Request.QueryString["ExitEmp_ID"].ToString(), Request.QueryString["ExitYear"].ToString(), Request.QueryString["ExitMonth"].ToString()));

            CreatePDF("Exit", @"Reports\Exit.rdlc", a1, a2);
        }

        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { FromDate, ToDate, ddlEmployee });
        if (validate)
        {
           // Response.Redirect("../ReportView.aspx?WExitMonth=" + DropDownList1.SelectedValue + "&WExitYear=" + TextBox1.Text + "&WExitEmp_ID=" + DropDownList2.SelectedValue);
            ArrayList a1 = new ArrayList();
            a1.Add("WExit");
           // a1.Add("CalAttGet");

            ArrayList a2 = new ArrayList();

            a2.Add(DataAccess.WExitEmpGetAB(ddlEmployee.SelectedValue, FromDate.Text, ToDate.Text));
           // a2.Add(DataAccess.calculateAttendanceGetAll(Request.QueryString["WExitEmp_ID"].ToString(), Request.QueryString["WExitYear"].ToString(), Request.QueryString["WExitMonth"].ToString()));

            CreatePDF("WExit", @"Reports\WExit.rdlc", a1, a2);
        }

        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    protected void Empstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        Repeater1.DataBind();
    }
    protected void ddlEmpCategoryID_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }
    protected void btnLatePage_Click(object sender, EventArgs e)
    {
        Response.Redirect("LateEmployees.aspx");
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
    protected void FromDate_TextChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }
    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }
}