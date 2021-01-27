using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_AcademicSectionStudents : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //ddlOfferdCourseType.DataBind();
            //ddlOfferdCourseType.Items.Insert(0, new ListItem("الكل", "-1"));
            //ddlCourse.DataBind();
            //ddlCourse.Items.Insert(0, new ListItem("اختر المساق", "-1"));
            //ddlSection.DataBind();
            //ddlSection.Items.Insert(0, new ListItem("اختر الشعبة", "-1"));
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
        Repeater1.DataBind();
    }
    protected void lbOpenStudent_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Response.Redirect("~/Admission/Student.aspx?id=" + ((Label)item.FindControl("StudentID")).Text);
    }

    protected void lbSectionStudentPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsTeacherSectionStudents");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSectionStudents(ddlSection.SelectedValue));
        a2.Add(DataAccess.GetSectionStatistics(ddlSection.SelectedValue));

        CreatePDF("StudyTable", @"Admission\Reports\TeacherSectionStudentsReport.rdlc", a1, a2);
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

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCourse.DataBind();
        ddlSection.DataBind();
        ListView1.DataBind();
    }

    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSection.DataBind();
        ListView1.DataBind();
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        int count = 0;
        string totalMsg = "";
        foreach (ListViewItem item in ListView1.Items)
        {
            string StudentID = (item.FindControl("StudentID") as Label).Text;
            CheckBox cbStudent = (item.FindControl("cbStudent") as CheckBox);
            if (cbStudent.Checked)
            {
                DataTable DT = DataAccess.RegisterCourse(StudentID, ddlSemester.SelectedValue, ddlToSection.SelectedValue, EmployeeID);
                totalMsg += DT.Rows[0]["msg"].ToString() + "<br />";
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                    count++;
            }
        }

        totalMsg = "تم نقل " + count + " طالب للشعبة المحددة" + "<br />" + totalMsg;
        ListView1.DataBind();
        Repeater1.DataBind();
        ShowMsg1(totalMsg, "warning");
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable");
        divMsg1.Visible = (msg != "");
    }

    protected void ddlOfferdCourseType_OnSelectedIndexChanged(object sender, EventArgs e)
    {
      
        ddlCourse.DataBind();
        ddlSection.DataBind();
        ListView1.DataBind();
    }
}