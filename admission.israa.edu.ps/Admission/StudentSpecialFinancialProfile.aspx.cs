using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_FinancialProfile : UserPage
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
                    DataTable DT2 = DataAccess.GetStudentData(Request.QueryString["id"].ToString());
                    lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                    lblStudentID.Text = Request.QueryString["id"].ToString();

                }
                else
                    Response.Redirect("~/Admission/Students.aspx");
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Admission/Students.aspx");
            }
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Admission/Students.aspx");
        }
    }



    protected void lbStudentFinancialProfileExcel_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.GetSpecialStdTransaction(lblStudentID.Text);
        string[] cols = { "ID", "StudentID", "CDFlag", "Amount", "CDAmount" };
        foreach (string col in cols)
        {
            DT.Columns.Remove(col);
        }
        ExportToExcel(DT);
    }

    public void ExportToExcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            string filename = "StudentFinancialProfileExcel.xls";
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            DataGrid dgGrid = new DataGrid();

            dgGrid.DataSource = dt;
            dgGrid.DataBind();

            //Get the HTML for the control.
            dgGrid.RenderControl(hw);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
            this.EnableViewState = false;
            Response.Write(tw.ToString());
            Response.End();
        }
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblActionArName = ((Label)e.Item.FindControl("lblActionArName"));
        LinkButton lbActionArName = ((LinkButton)e.Item.FindControl("lbActionArName"));
        if (lblActionArName.Text=="خصومات")
        {
            lblActionArName.Visible = false;
            lbActionArName.Visible=true;
        }
    }

    protected void lbActionArName_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admission/StudentFinancialDedection.aspx?id=" + lblStudentID.Text);
    }
}