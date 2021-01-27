using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_BookCategorySearch :UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
         Repeater1.DataBind();
        
    }
   
   
    protected void View_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
        Response.Redirect("ViewBook.aspx?id="+id);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       DataTable DT= DataAccess.GetBooksByCategorySurvay(ddlBookCategoryID.SelectedValue);
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