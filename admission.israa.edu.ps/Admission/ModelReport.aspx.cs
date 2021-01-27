using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_ModelReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbSemesterCoursePDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsSemesterCoursesSections");
        a1.Add("dsSemesterCoursesSectionsInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSemesterCoursesSections(ddlDepartment.SelectedValue));
        a2.Add(DataAccess.GetSemesterCoursesSectionsInfo(ddlDepartment.SelectedValue));

        CreatePDF("SemesterCourse", @"Admission\Reports\SemesterCourse.rdlc", a1, a2);
    }

    protected void lbAccreditationPlans_Click(object sender, EventArgs e)
    {
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
        a2.Add(DataAccess.GetPlanSemester11Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester12Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester21Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester22Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester31Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester32Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester41Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester42Report(ddlPlan.SelectedValue));
        CreatePDF("AccreditationPlans", @"Admission\Reports\AccreditationPlans.rdlc", a1, a2);
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

    protected void lbConstantsCourse_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetCourseReport");
        a1.Add("dsGetPreRequestReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetCourseReport(ddlCourse.SelectedValue));
        a2.Add(DataAccess.GetPreRequestReport(ddlCourse.SelectedValue));

        CreatePDF("ConstantsCourse", @"Admission\Reports\ConstantsCourse.rdlc", a1, a2);
    }
    protected void lbDepartmentSectionData_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsSemesterCoursesSections");
        a1.Add("dsSemesterCoursesSectionsInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSemesterCoursesSections(ddlDepartment.SelectedValue));
        a2.Add(DataAccess.GetSemesterCoursesSectionsInfo(ddlDepartment.SelectedValue));

        CreatePDF("DepartmentSectionData", @"Admission\Reports\DepartmentSectionData.rdlc", a1, a2);
    }

    protected void lbSpecialtiesAvailablePDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetAvailableDepartmentCount");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetAvailableDepartmentCount());

        CreatePDF("SpecialtiesAvailable", @"Admission\Reports\SpecialtiesAvailable.rdlc", a1, a2);
    }

    protected void lbUnacceptedStudents_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsUnacceptedStudents");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetUnacceptedStudents());

        CreatePDF("UnacceptedStudents", @"Admission\Reports\UnAcceptanceStudent.rdlc", a1, a2);
    }
    protected void lbGetDepartmentWishesCountReport_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetDepartmentWishesCount");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetDepartmentWishesCount());

        CreatePDF("GetDepartmentWishes", @"Admission\Reports\GetDepartmentWishesCountReport.rdlc", a1, a2);
    }
    protected void lbacceptedStudents_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsacceptedStudent");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetacceptedStudents());

        CreatePDF("acceptedStudents", @"Admission\Reports\AcceptanceStudent.rdlc", a1, a2);
    }
    protected void lbConstantsCourses_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetCourseReport");
        a1.Add("dsGetPreRequestReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetCourseReport(ddlCourse2.SelectedValue));
        a2.Add(DataAccess.GetPreRequestReport(ddlCourse2.SelectedValue));

        CreatePDF("ConstantsCourse", @"Admission\Reports\ConstantsCourse.rdlc", a1, a2);
    }
    protected void lbPlansAndDepartments_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetPlansAndDepartments");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetPlansAndDepartments());

        CreatePDF("PlansAndDepartments", @"Admission\Reports\PlansAndDepartments.rdlc", a1, a2);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetStdPayFullReport");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdPayFullReport());

        CreatePDF("StdPayFull", @"Admission\Reports\StdPayFull.rdlc", a1, a2);
    }
}