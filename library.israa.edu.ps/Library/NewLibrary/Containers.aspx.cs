using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_Containers : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool FloatValidate = FloatValidateControls(new WebControl[] { txtContainerCategory });
        bool Validate = ValidateControls(new WebControl[] { ddlLanguage, ddlContainerType, txtContainerTitle, txtKTR });
        if (Validate && FloatValidate)
        {

            DataTable DT = NewDataAccess.ContainerAddEdit(lblContainerID.Text, txtContainerNo.Text, txtContainerTitle.Text, ddlLanguage.SelectedValue, txtContainerCategory.Text, ddlContainerCategory.SelectedValue, txtKTR.Text, ddlContainerType.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                if (lblContainerID.Text == "")
                {
                    Session["ContainerID"] = DT.Rows[0]["ContainerID"].ToString();
                    Response.Redirect("BookAddEdit.aspx");
                }
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
        EmptyControls(new WebControl[] { lblContainerID, txtContainerCategory, ddlLanguage, ddlContainerType, txtContainerNo, txtContainerTitle, txtKTR, ddlContainerCategory });
    }

    protected void txtContainerNo1_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void txtContainerTitle1_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }



    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ContainerID")).Text;
        lblContainerID.Text = ID;
        DataTable DT = NewDataAccess.ContainerGet(lblContainerID.Text);
        if (DT.Rows.Count > 0)
        {
            txtContainerTitle.Text = DT.Rows[0]["Title"].ToString();
            txtContainerNo.Text = DT.Rows[0]["ContainerNo"].ToString();
            txtContainerCategory.Text = DT.Rows[0]["ContainerCategory"].ToString();
            ddlContainerCategory.DataBind();
            ddlContainerCategory.SelectedValue = DT.Rows[0]["ContainerCategoryID"].ToString();
            txtKTR.Text = DT.Rows[0]["KTR"].ToString();
            ddlContainerType.DataBind();
            ddlContainerType.SelectedValue = DT.Rows[0]["ContainerTypeID"].ToString();
            ddlLanguage.DataBind();
            ddlLanguage.SelectedValue = DT.Rows[0]["LanguageID"].ToString();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ContainerID")).Text;
        DataTable DT = NewDataAccess.ContainerDelete(ID, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();

    }
    protected void lbAddBook_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ContainerID")).Text;
        Session["ContainerID"] = ID;
        Response.Redirect("BookAddEdit.aspx");
    }

    protected void lbBookView_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ContainerID")).Text;
        Session["ContainerID"] = ID;
        Response.Redirect("Books.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
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
    protected void btnPdf_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetFilterdContainersReport");
        ArrayList a2 = new ArrayList();
        a2.Add(NewDataAccess.GetFilterdContainersReport(txtContainerNo1.Text, txtContainerTitle1.Text, txtContainerCategoryFrom.Text,txtContainerCategoryTo.Text));
        CreatePDF("BookContainerCategoryReport", @"Library/NewLibrary/Reports/FilterdContainersReport.rdlc", a1, a2);
    }

    protected void btnContanersBookNoPdf_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetFilterdContainersReport2");
        ArrayList a2 = new ArrayList();
        a2.Add(NewDataAccess.GetFilterdContainersReport2(txtContainerNo1.Text, txtContainerTitle1.Text, txtContainerCategoryFrom.Text, txtContainerCategoryTo.Text));
        CreatePDF("ContainersBookNoReport", @"Library/NewLibrary/Reports/ContainersBookNoReport.rdlc", a1, a2);
    }
}