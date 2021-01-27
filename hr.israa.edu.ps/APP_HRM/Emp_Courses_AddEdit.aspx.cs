using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Emp_Courses_AddEdit :UserPage
{
    DataTable DT = new DataTable(); 

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["Course_ID"] != null)
            {
                DataTable DT = DataAccess.Courses_TB_Get(Session["Course_ID"].ToString());

                txtName.Text = DT.Rows[0]["Course_Name"].ToString();
                txtSubmit.Text = DT.Rows[0]["Course_Place"].ToString();
                DropDownList8.SelectedValue = DT.Rows[0]["Emp_ID"].ToString(); 
                txtNotes.Text = DT.Rows[0]["Courses_Details"].ToString();
                txtSDate.Text = Convert.ToDateTime(DT.Rows[0]["Course_From"]).ToShortDateString();
                txtFDate.Text = Convert.ToDateTime(DT.Rows[0]["Course_To"]).ToShortDateString();
               // txtSDate.Text = DT.Rows[0]["Course_From"].ToString();
               // txtFDate.Text = DT.Rows[0]["Course_To"].ToString();
            
                //check.Visible = false;
            }
        }
    }

    protected void Button12_Click(object sender, EventArgs e)
    {

        if (ValidateControls(new WebControl[] { txtSubmit, txtNotes, DropDownList8 }))
        {

            if (DataAccess.Courses_TB_AddEdit((Session["Course_ID"] == null) ? "" : Session["Course_ID"].ToString(),
                txtName.Text
                , txtSubmit.Text, Convert.ToInt16(DropDownList8.SelectedValue), txtNotes.Text, Convert.ToDateTime(txtSDate.Text), Convert.ToDateTime(txtFDate.Text),10,"", Convert.ToInt16(UserID), (Session["Course_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Session["Course_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { txtName, txtSubmit, txtNotes, txtSDate, txtFDate, DropDownList8 });
                Repeater1.DataBind();
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
    protected void btnCancel_Click2(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtName, txtSubmit, txtNotes, txtSDate, txtFDate, DropDownList8 });
        Session["Course_ID"] = null;
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Course_ID"] = ((Label)ri.FindControl("CourseID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Courses_AddEdit.aspx");
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("CourseID")).Text;

        if (DataAccess.Courses_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }


}