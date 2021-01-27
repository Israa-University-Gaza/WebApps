using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class APP_HRM_Observer : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (ListViewItem item in ListView1.Items)
        {
            if (ValidateControls(new WebControl[] { ((DropDownList)item.FindControl("ddlGender")) }))
            {
                string EmpID = ((Label)item.FindControl("EmpID")).Text;
                            bool IsObserver = ((CheckBox)item.FindControl("IsObserver")).Checked;
                DataAccess.EmployeeObserverUpdate(EmpID, IsObserver, "2");            }
        }
        ListView1.DataBind();
        ShowToast(this, "تم الحفظ بنجاح.", "", "success");
    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.GetObservers();
        ExportToExcel(DT);
    }
    public void ExportToExcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            string filename = "DownloadExcel.xls";
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            DataGrid dgGrid = new DataGrid();
            dgGrid.DataSource = dt;
            dgGrid.DataBind();

            //Get the HTML for the control.
            dgGrid.RenderControl(hw);
            //Write the HTML back to the browser.
            //Response.ContentType = application/vnd.ms-excel;
            Response.ContentType = "application/vnd.ms-excel";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
            this.EnableViewState = false;
            Response.Write(tw.ToString());
            Response.End();
        }
    }
}