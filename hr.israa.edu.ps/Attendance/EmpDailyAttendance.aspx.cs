using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_EmpDailyAttendance : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Permissions.Contains("EmpSecurityAttendance"))
            {
                ddlEmpCategoryID.SelectedValue = "4";
                ddlEmpCategoryID.Enabled = false;
                HR.Visible = false;
                Contract.Visible = false;
                Repeater1.DataBind();
            }
            else
            {
                Empstatus.SelectedValue = "1041";
                ddlEmpSubStatus.DataSourceID = "SqlDataSource22";
                ddlEmpSubStatus.DataBind();
                ddlEmpSubStatus.SelectedValue = "2126";
                HR.Visible = true;
               Contract.Visible = true;
            }
            Repeater1.DataBind();
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("Emp_ID")).Text;
        string AttId = ((Label)ri.FindControl("AttID")).Text;


        bool validate = ValidateControls(new WebControl[] { date, DropDownList1, ((TextBox)ri.FindControl("from")) });

        bool DateValidate = DateValidateControls(new WebControl[] { ((TextBox)ri.FindControl("from")), (((TextBox)ri.FindControl("to")).Text != "") ? ((TextBox)ri.FindControl("to")) : null, date });
        if (validate && DateValidate)
        {


            if (DataAccess.AttendanceConstant_TB_AddEdit(AttId,
                Convert.ToDateTime(((TextBox)ri.FindControl("from")).Text), (((TextBox)ri.FindControl("to")).Text != "") ? ((TextBox)ri.FindControl("to")).Text : "", Convert.ToDateTime(date.Text),
                Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(((Label)ri.FindControl("Emp_ID")).Text),

                 Convert.ToInt32(UserID), Convert.ToInt32(UserID)) > 0)
            {


                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                string From = ((TextBox)ri.FindControl("from")).Text;
                string To = ((TextBox)ri.FindControl("to")).Text;
                string Date =date.Text;
                string EmployeeID = ((Label)ri.FindControl("Emp_ID")).Text;
                if (From != "")
                {
                    DataTable DT = DataAccess.hrManualFingerprintAdd(EmployeeID, "1", Convert.ToDateTime (Date + " " +From),"2");
                 /*  DataTable DT = DataAccess.AttendanceDailyAdd2(EmployeeID, "1", date.Text,Convert.ToDateTime(From));*/
                }
                if (To != "")
                {
                    DataTable DT = DataAccess.hrManualFingerprintAdd(EmployeeID, "2", Convert.ToDateTime(Date + " " + To),"2");
                }


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
    protected void lbDelete_Click(object sender, EventArgs e)
    {


        if (ValidateControls(new WebControl[] {/* date, DropDownList1*/ }))
        {
            RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
            string id = ((Label)ri.FindControl("Emp_ID")).Text;
            string AttId = ((Label)ri.FindControl("AttID")).Text;


            if (DataAccess.AttendanceConstant_TB_AddEdit(AttId,
                Convert.ToDateTime("00:00"), "00:00", Convert.ToDateTime(date.Text),
                Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(((Label)ri.FindControl("Emp_ID")).Text),
                 Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {


                ShowToast(this, "تم الحفظ بنجاح.", "", "success");

                Repeater1.DataBind();
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


    protected void date_TextChanged(object sender, EventArgs e)
    {

        Repeater1.DataBind();
        if (date.Text != "")
        {
            h.Text = Convert.ToDateTime(date.Text).DayOfWeek.ToString();
            if (h.Text == "Saturday") DropDownList1.SelectedIndex = 1;
            if (h.Text == "Sunday") DropDownList1.SelectedIndex = 2;
            if (h.Text == "Monday") DropDownList1.SelectedIndex = 3;
            if (h.Text == "Tuesday") DropDownList1.SelectedIndex = 4;
            if (h.Text == "Wednesday") DropDownList1.SelectedIndex = 5;
            if (h.Text == "Thursday") DropDownList1.SelectedIndex = 6;
            if (h.Text == "Friday") DropDownList1.SelectedIndex = 7;

        }


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { date, DropDownList1 }))
        {
            // Response.Redirect("../ReportView.aspx?date=" + date.Text + "&&EmpCat=" + ddlEmpCategoryID.SelectedValue);
            ArrayList a1 = new ArrayList();
            a1.Add("AttAbsentEmp");
            a1.Add("AttAbsentEmpCountGet");
            ArrayList a2 = new ArrayList();

            a2.Add(DataAccess.AttAbsentEmp(date.Text, ddlEmpCategoryID.SelectedValue, Empstatus.SelectedValue, ddlEmpSubStatus.SelectedValue, ddlEmployeeCat.SelectedValue, ddlContractTypeID.SelectedValue, ddlSubContractType.SelectedValue));
            a2.Add(DataAccess.AttAbsentEmpCountGet(date.Text, ddlEmpCategoryID.SelectedValue, Empstatus.SelectedValue, ddlEmpSubStatus.SelectedValue, ddlEmployeeCat.SelectedValue, ddlContractTypeID.SelectedValue, ddlSubContractType.SelectedValue));
            CreatePDF("AttAbsentEmp", @"Reports\AttabsentEmp.rdlc", a1, a2);

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { date, DropDownList1 }))
        {
            Response.Redirect("FromToSearchAtt.aspx");
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { date, DropDownList1 }))
        {
            // Response.Redirect("../ReportView.aspx?vacdate=" + date.Text);
            ArrayList a1 = new ArrayList();
            a1.Add("VacationDailyGet");


            ArrayList a2 = new ArrayList();

            a2.Add(DataAccess.VacationDailyGet(date.Text, ddlEmpCategoryID.SelectedValue, Empstatus.SelectedValue, ddlEmpSubStatus.SelectedValue, ddlEmployeeCat.SelectedValue, ddlContractTypeID.SelectedValue, ddlSubContractType.SelectedValue));


            CreatePDF("VactionDaily", @"Reports\VacationDaily.rdlc", a1, a2);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    protected void Empstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
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
            ddlEmpSubStatus.SelectedValue = "-1";
        }
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

    protected void btnAbsent_Click(object sender, EventArgs e)
    {
        Response.Redirect("AbsentEmployees.aspx");
    }




    protected void lbAbsentPDF_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { date, DropDownList1 }))
        {
            // Response.Redirect("../ReportView.aspx?date=" + date.Text + "&&EmpCat=" + ddlEmpCategoryID.SelectedValue);
            ArrayList a1 = new ArrayList();
            a1.Add("dsAbsentEmployee");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.AbsentEmpGet(date.Text, ddlEmpCategoryID.SelectedValue, Empstatus.SelectedValue, ddlEmpSubStatus.SelectedValue, ddlEmployeeCat.SelectedValue, ddlContractTypeID.SelectedValue, ddlSubContractType.SelectedValue));
            CreatePDF("AbsentEmployeeReport", @"Reports\AbsentReport.rdlc", a1, a2);

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void ddlEmpCategoryID2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }

    protected void btnNoAttendanceTo_Click(object sender, EventArgs e)
    {
        //GetEmployeeAttendanceWithoutAttendanceTo
        if (ValidateControls(new WebControl[] { date, DropDownList1 }))
        {
            // Response.Redirect("../ReportView.aspx?date=" + date.Text + "&&EmpCat=" + ddlEmpCategoryID.SelectedValue);
            ArrayList a1 = new ArrayList();
            a1.Add("dsAbsentEmployee");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetEmployeeAttendanceWithoutAttendanceTo(date.Text, ddlEmpCategoryID.SelectedValue, Empstatus.SelectedValue, ddlEmpSubStatus.SelectedValue, ddlEmployeeCat.SelectedValue, ddlContractTypeID.SelectedValue, ddlSubContractType.SelectedValue));
            CreatePDF("لم يوقعوا مغادرة", @"Reports\EmployeeAttendanceWithoutAttendanceTo.rdlc", a1, a2);

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void ddlEmpSubStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }
}