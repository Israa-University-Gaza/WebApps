using System;
using Microsoft.Reporting.WebForms;
using System.Collections;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

public partial class Admission_StudentsGraduateAvowal : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbGoStudent_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("lblStudentID")).Text;
        Response.Redirect("~/Admission/Student.aspx?id=" + id);
    }



    protected void txtStudentName_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnPDF_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
      
        string StudentID = ((Label)li.FindControl("StudentID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdGraduateAvowalReport");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStdGraduateAvowalReport(StudentID));
        CreatePDF("GraduateAvowal", @"Admission\Reports\GraduateAvowal.rdlc", a1, a2);
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
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        DataTable DT = DataAccess.StdGraduateAvowalDelete(ID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }



    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        string StudentID = ((Label)li.FindControl("StudentID")).Text;
        string MobileNo = ((TextBox)li.FindControl("txtMobile")).Text;
        string EMobileNo = ((TextBox)li.FindControl("txtEMobile")).Text;
        string StudentAddress = ((TextBox)li.FindControl("txtAddress")).Text;
        string Problem = ((TextBox)li.FindControl("txtProblem")).Text;
        string Suggestion = ((TextBox)li.FindControl("txtSuggestion")).Text;
        bool Validate = ValidateControls(new WebControl[] { (TextBox)li.FindControl("txtMobile"), (TextBox)li.FindControl("txtEMobile"), (TextBox)li.FindControl("txtAddress"), (TextBox)li.FindControl("txtProblem"), (TextBox)li.FindControl("txtSuggestion") });
        bool IntValidate = IntValidateControls(new WebControl[] { (TextBox)li.FindControl("txtMobile"), (TextBox)li.FindControl("txtEMobile") });

        if (Validate && IntValidate)
        {
            DataTable DT = DataAccess.StdGraduateAvowalAddEdit(ID, StudentID, MobileNo, EMobileNo, StudentAddress, Problem, Suggestion,EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        }

        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح ", "", "error");

        }

    }
}