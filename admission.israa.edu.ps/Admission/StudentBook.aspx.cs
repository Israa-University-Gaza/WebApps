using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentBook : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["StudentID"] != null)
            {
                DataTable DT1 = DataAccess.GetEmployeeData(EmployeeID);
                lblEmployeeName.Text = DT1.Rows[0]["DisplayName"].ToString();

                lblStudentID.Text = Session["StudentID"].ToString();
                DataTable DT = DataAccess.StudentImageGet(lblStudentID.Text);
                if (DT.Rows.Count > 0)
                {
                    if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                    {
                        // Get the byte array from image file
                        byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];

                        string imgString = Convert.ToBase64String(imgBytes);
                        //Set the source with data:image/bmp
                        image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    }
                    else
                    {
                        image.Src = "../images/std.jpg";
                    }
                }
            }
            else
                Response.Redirect("~/Admission/Students.aspx");
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Admission/Students.aspx");
        }
    }

    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            Session["StudentID"] = DT.Rows[0]["StudentID"].ToString();
            Response.Redirect("~/Admission/Student.aspx");
        }
        else
        {
            ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg1.Visible = (msg != "");
    }
    public void ShowMsg2(string msg = "", string status = "warning")
    {
        lblMsg2.Text = msg;
        divMsg2.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg2.Visible = (msg != "");
    }

    protected void btnBuyBook_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlBook }))
        {
            DataTable DT = DataAccess.BuyBook(lblStudentID.Text, ddlBook.SelectedValue, EmployeeID);
            ListView1.DataBind();
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        }
        else
        {
            ShowMsg1("الرجاء إختيار الكتاب للحجز", "danger");
        }
    }

    protected void btnDeleteStudentBook_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("StudentBookID")).Text;
        DataTable DT = DataAccess.DeleteStudentBook(id, EmployeeID);
        ListView1.DataBind();
        ShowMsg2(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
    }
    protected void btnStudentBookPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStudentBooks");
        a1.Add("dsStdStudyTableInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentBooks(lblStudentID.Text));
        a2.Add(DataAccess.GetStdStudyTableInfoReport(lblStudentID.Text));

        CreatePDF1("StudentBook", @"Admission\Reports\StudentBooksReport.rdlc", a1, a2, lblEmployeeName.Text);
    }

    private void CreatePDF1(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray, string EmployeeName)
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


        ReportParameter p1 = new ReportParameter("EmployeeName", EmployeeName);

        viwer.LocalReport.SetParameters(new ReportParameter[] { p1 });

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