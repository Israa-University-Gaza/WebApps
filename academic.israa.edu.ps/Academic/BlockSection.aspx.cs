using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_BlockSection : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPermissionsContains("BlockSection"))
        //{
        //    Response.Redirect("Default.aspx");
        //}
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("BlockSectionID")).Text;
        DataTable DT = DataAccess.BlockSectionGet(id);
        if (DT.Rows.Count > 0)
        {
            ddlBlock.DataBind();
            ddlBlock.SelectedValue = DT.Rows[0]["BlockID"].ToString();
            ddlOfferdCourse.SelectedValue = DT.Rows[0]["OfferdCourseID"].ToString();
            ddlSection.DataBind();
            ddlSection.SelectedValue = DT.Rows[0]["SectionID"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            lblBlockSectionID.Text = id;
            ListView1.DataBind();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("BlockSectionID")).Text;

        if (DataAccess.BlockSectionDelete(id, EmployeeID) > 0)
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
        if (ValidateControls(new WebControl[] { ddlBlock, ddlSection }))
        {
            DataTable DT = DataAccess.BlockSectionAddEdit(lblBlockSectionID.Text, ddlBlock.SelectedValue, ddlSection.SelectedValue, cbActive.Checked, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
            {
                EmptyControls(new WebControl[] { lblBlockSectionID });
                ListView1.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblBlockSectionID, cbActive, ddlBlock, ddlSection });
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("BlockSectionID")).Text;

        if (DataAccess.BlockSectionActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }
    }
    protected void lbBlockSectionPdf_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdStudyTable");
        a1.Add("dsBlockStudyTableInfo");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetBlockStudyTableReport(ddlBlocks.SelectedValue));
        a2.Add(DataAccess.GetBlockStudyTableInfoReport(ddlBlocks.SelectedValue));

        CreatePDF("BlockSection", @"Academic\Reports\BlockStudyTableReport.rdlc", a1, a2);
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