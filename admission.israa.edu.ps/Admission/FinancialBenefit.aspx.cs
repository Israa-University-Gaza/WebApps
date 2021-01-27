using System;
using System.Collections;
using System.Data;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

public partial class FinancialBenefit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            try
            {
                lblEmployeeID.Text = EmployeeID;

                if (Request.QueryString["id"] != null)
                {
                    DataTable DT1 = DataAccess.GetEmployeeData(EmployeeID);
                    lblEmployeeName.Text = DT1.Rows[0]["DisplayName"].ToString();

                    lblStudentID.Text = Request.QueryString["id"].ToString();
                    DataTable DT4 = DataAccess.StudentImageGet(lblStudentID.Text);
                    if (DT4.Rows.Count > 0)
                    {
                        if (!Convert.IsDBNull(DT4.Rows[0]["StudentImage"]))
                        {
                            // Get the byte array from image file
                            byte[] imgBytes = (byte[])DT4.Rows[0]["StudentImage"];

                            string imgString = Convert.ToBase64String(imgBytes);
                            //Set the source with data:image/bmp
                            image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                        }
                    }
                    else
                    {
                        image.Src = "../images/std.jpg";
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Admission/Students.aspx");
            }
        }
    }

    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            Response.Redirect("~/Admission/Student.aspx?id=" + DT.Rows[0]["StudentID"].ToString());
        }
        else
        {
            ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { txtSumOfHours });
        bool DoubleValidate = DoubleValidateControls(new WebControl[] { txtSumOfHours });
        if (IntValidate && DoubleValidate)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsGetStdFinancialBenefit1");
            a1.Add("dsGetStdFinancialBenefit2");
            a1.Add("dsGetStdFinancialBenefit3");
            a1.Add("dsGetStdFinancialBenefit4");
            a1.Add("dsStdStudyTableInfo");

            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetStdFinancialBenefit1(lblStudentID.Text, txtSumOfHours.Text));
            a2.Add(DataAccess.GetStdFinancialBenefit2(lblStudentID.Text, txtSumOfHours.Text));
            a2.Add(DataAccess.GetStdFinancialBenefit3(lblStudentID.Text, txtSumOfHours.Text, txtTotalCost.Text));
            a2.Add(DataAccess.GetStdFinancialBenefit4(lblStudentID.Text));
            a2.Add(DataAccess.GetStdStudyTableInfoReport(lblStudentID.Text));

            CreatePDF1("FinancialBenefit", @"Admission\Reports\FinancialBenefit.rdlc", a1, a2, lblEmployeeName.Text);
        }
        else
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    }
  protected void btnPrint_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { txtSumOfHours });
        bool DoubleValidate = DoubleValidateControls(new WebControl[] { txtSumOfHours });
        if (IntValidate && DoubleValidate)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsStdFinancialBenefitReport");
            a1.Add("dsStdStudyTableInfo");

            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetStdFinancialBenefitReport(lblStudentID.Text, txtSumOfHours.Text,txtTotalCost.Text));
            
            a2.Add(DataAccess.GetStdStudyTableInfoReport(lblStudentID.Text));

            CreatePDF1(" FinancialBenefitReport", @"Admission\Reports\FinancialBenefitReport.rdlc", a1, a2, lblEmployeeName.Text);
        }
        else
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    }
}