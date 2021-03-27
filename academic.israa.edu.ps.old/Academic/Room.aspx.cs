using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_Room : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("Room"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("RoomID")).Text;
        DataTable DT = DataAccess.RoomGet(id);
        if (DT.Rows.Count > 0)
        {
            txtName.Text = DT.Rows[0]["Name"].ToString();
            txtRoomNum.Text = DT.Rows[0]["RoomNum"].ToString();
            ddlBuildingID.SelectedValue = DT.Rows[0]["BuildingID"].ToString();
            txtFloor.Text = DT.Rows[0]["Floor"].ToString();
            txtArea.Text = DT.Rows[0]["Area"].ToString();
            txtLectureCapacity.Text = DT.Rows[0]["LectureCapacity"].ToString();
            txtExamCapacity.Text = DT.Rows[0]["ExamCapacity"].ToString();
            ddlRoomTypeID.SelectedValue = DT.Rows[0]["RoomTypeID"].ToString();
            txtUseType.Text = DT.Rows[0]["UseType"].ToString();
            txtNotes.Text = DT.Rows[0]["Notes"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            lblRoomID.Text = id;
            ListView1.DataBind();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("RoomID")).Text;
        DataTable DT = DataAccess.RoomDelete(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(),"", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtName, ddlBuildingID, txtLectureCapacity, txtExamCapacity, ddlRoomTypeID, txtRoomNum }))
        {
            if (DataAccess.RoomAddEdit(lblRoomID.Text, txtRoomNum.Text, txtName.Text, ddlBuildingID.SelectedValue, txtFloor.Text, txtArea.Text, txtLectureCapacity.Text, txtExamCapacity.Text, ddlRoomTypeID.SelectedValue, txtUseType.Text, txtNotes.Text, cbActive.Checked, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblRoomID, txtName, ddlBuildingID, txtFloor, txtArea, txtLectureCapacity, txtExamCapacity, ddlRoomTypeID, txtNotes, cbActive, txtRoomNum });
                ListView1.DataBind();
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


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblRoomID, txtName, ddlBuildingID, txtLectureCapacity, txtExamCapacity, ddlRoomTypeID, txtNotes, cbActive, txtRoomNum });
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("RoomID")).Text;

        if (DataAccess.RoomActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }
    }
    protected void lbPdf_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("RoomID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdStudyTable");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetRoomStudyTable(id));

        CreatePDF("RoomStudyTable_" + id, @"Academic\Reports\RoomStudyTableReport.rdlc", a1, a2);
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
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("RoomID")).Text;
        Session["RoomID"] = id;
        Response.Redirect("RoomStudyTable.aspx");
    }

    protected void ddlBuilding_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}