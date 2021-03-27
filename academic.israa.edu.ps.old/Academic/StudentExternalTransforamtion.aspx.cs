using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

public partial class Academic_StudentExternalTransforamtion : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            UserPage userPage = new UserPage();


            if (Request.QueryString["id"] != null)
            {


                lblStudentID.Text = Request.QueryString["id"].ToString();
                DataTable DT2 = DataAccess.GetStudentData(Request.QueryString["id"].ToString());
                lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                lblStdTypeID.Text = DT2.Rows[0]["StdTypeID"].ToString();
            }
            else
                Response.Redirect("~/Academic/Students.aspx");




        }
    }

    protected void lbDeleteExternalTransformation_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent.Parent;
        Repeater repeater52 = (Repeater)ri.Parent;
        string id = ((Label)ri.FindControl("TransformationID")).Text;

        if (DataAccess.DeleteExternalTransformation(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            repeater52.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }


    }

    protected void lbEditExternalTransformation_Click1(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent.Parent;
        Repeater repeater11 = (Repeater)ri.Parent;
        ((TextBox)ri.FindControl("txtCourseName")).Enabled = true;
        ((TextBox)ri.FindControl("txtCourseHours")).Enabled = true;
        ((Panel)ri.FindControl("Panel1")).Visible = true;
        ((Panel)ri.FindControl("Panel2")).Visible = false;

    }

    protected void lbEditExternalTransformation_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent.Parent;
        Repeater repeater52 = (Repeater)ri.Parent;
        ((TextBox)ri.FindControl("txtCourseName")).Enabled = true;
        ((TextBox)ri.FindControl("txtCourseHours")).Enabled = true;
        ((Panel)ri.FindControl("Panel1")).Visible = true;
        ((Panel)ri.FindControl("Panel2")).Visible = false;


    }

    protected void Repeater5_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {


        var PlanID = (Label)e.Item.FindControl("PlanID");
        var StudentID = (Label)e.Item.FindControl("StudentID");
        var CSemesterID = (Label)e.Item.FindControl("CSemesterID");

        var Repeater2 = (Repeater)e.Item.FindControl("Repeater2");



        var data3 = DataAccess.GetStdExternalCSemesterPlanCourses(PlanID.Text, StudentID.Text, CSemesterID.Text);
        Repeater2.DataSource = data3;
        Repeater2.DataBind();


    }


    protected void btnExternalTransformation_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent.Parent;
        TextBox txtCourseName = (TextBox)ri.FindControl("txtCourseName");
        TextBox txtCourseHours = (TextBox)ri.FindControl("txtCourseHours");
        TextBox txtMark = (TextBox)ri.FindControl("txtMark");
        Label CourseID = (Label)ri.FindControl("lblCourseID");
        Label TransformationID = (Label)ri.FindControl("TransformationID");
        Repeater repeater52 = (Repeater)ri.Parent;

        bool Validate = ValidateControls(new WebControl[] { txtMark });

        if (Validate)
        {
            DataTable DT = DataAccess.ExternalTransformation(TransformationID.Text, lblStudentID.Text, CourseID.Text, txtCourseName.Text, txtCourseHours.Text, txtMark.Text, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
            {
                repeater52.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }

    }


    protected void lbAccrediteETransformation_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdTransformationCourses");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetAccrediteETransformation(lblStudentID.Text));

        CreatePDF("StdTransformationCourses", @"Academic\Reports\AccrediteETransformation.rdlc", a1, a2);
    }
    protected void lbUnAccrediteETransformation_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdTransformationCourses");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetUnaccrediteETransformation(lblStudentID.Text));

        CreatePDF("StdTransformationCourses", @"Academic\Reports\AccrediteETransformation.rdlc", a1, a2);
    }
    protected void lbTransformationAccreditation_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.TransformationAccreditation(lblStudentID.Text, EmployeeID, (Permissions.Contains("AcademicStudentExternalTransforamtion")) ? "4" : ((Permissions.Contains("DeanStudentExternalTransforamtion")) ? "3" : ((Permissions.Contains("HeadStudentExternalTransforamtion")) ? "2" : "1")));
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");


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


    protected void lbDeleteExternalTransformation_Click1(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent.Parent;
        Repeater repeater11 = (Repeater)ri.Parent;
        string id = ((Label)ri.FindControl("TransformationID")).Text;

        if (DataAccess.DeleteExternalTransformation(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            repeater11.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }

    }


}