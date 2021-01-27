using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Finanical_EmployeeDegreeAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void Save_Click(object sender, EventArgs e)
    {

        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        bool Validate = ValidateControls(new WebControl[] { (DropDownList)li.FindControl("ddlCader"), (DropDownList)li.FindControl("ddlGrade"), (DropDownList)li.FindControl("ddlDegree"), (TextBox)li.FindControl("txtSeniority") });
        if (Validate)
        {

            string EmpID = ((Label)li.FindControl("EmpID")).Text;
            string Cader = ((DropDownList)li.FindControl("ddlCader")).SelectedValue;
            string Grade = ((DropDownList)li.FindControl("ddlGrade")).SelectedValue;
            string Degree = ((DropDownList)li.FindControl("ddlDegree")).SelectedValue;
            

            DataTable DT = DataAccess.EmployeeDegreeAddEdit(EmpID, Degree, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
               ListView1.DataBind();

            }
        }
        else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

    }

    protected void ddlCader_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((DropDownList)sender).Parent;
        ((DropDownList)li.FindControl("ddlGrade")).DataBind();
        ((DropDownList)li.FindControl("ddlDegree")).DataBind();
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewItem item = e.Item;
        string CaderID = ((Label)item.FindControl("CaderID")).Text;
        string GradeID = ((Label)item.FindControl("GradeID")).Text;
        string DegreeID = ((Label)item.FindControl("DegreeID")).Text;

        DropDownList ddlCader = ((DropDownList)item.FindControl("ddlCader"));
        ddlCader.DataBind();
        ddlCader.SelectedValue = CaderID;

        DropDownList ddlGrade = ((DropDownList)item.FindControl("ddlGrade"));
        ddlGrade.DataBind();
        ddlGrade.SelectedValue = GradeID;

        DropDownList ddlDegree = ((DropDownList)item.FindControl("ddlDegree"));
        ddlDegree.DataBind();
        ddlDegree.SelectedValue = DegreeID;

    }
}