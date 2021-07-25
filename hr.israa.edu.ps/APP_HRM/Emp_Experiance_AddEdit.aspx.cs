using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class APP_HRM_Emp_Experiance_AddEdit : UserPage
{
    DataTable DT = new DataTable(); 

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["Experince_ID"] != null)
            {
                DataTable DT = DataAccess.Experience_TB_Get(Session["Experince_ID"].ToString());

                JobName.Text = DT.Rows[0]["Job_Name"].ToString();
                JobDetailes.Text = DT.Rows[0]["job_Details"].ToString();
                CompName.Text = DT.Rows[0]["Company_Name"].ToString();
                ScopeName.Text = DT.Rows[0]["Company_Work_Scope"].ToString();
                From_Date.Text = Convert.ToDateTime(DT.Rows[0]["Experince_From"]).ToShortDateString();
                To_Date.Text = Convert.ToDateTime(DT.Rows[0]["Experince_To"]).ToShortDateString();
                LeaveReason.Text = DT.Rows[0]["Reason_Leave_Job"].ToString();
                DropDownList8.SelectedValue = DT.Rows[0]["Emp_ID"].ToString();
            
            }
        }
    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        /* by RSR if (ValidateControls(new WebControl[] { JobName, JobDetailes, CompName, ScopeName, From_Date, To_Date, LeaveReason, DropDownList8 }))
        {

            if (DataAccess.Experience_TB_AddEdit(


                (Session["Experince_ID"] == null) ? "" : Session["Experince_ID"].ToString(),
                JobName.Text,CompName.Text, Convert.ToDateTime(From_Date.Text), Convert.ToDateTime(To_Date.Text),
                LeaveReason.Text, ScopeName.Text, JobDetailes.Text,  Convert.ToInt16(DropDownList8.SelectedValue),
                Convert.ToInt16(UserID), (Session["Experince_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
                {

                    Session["Experince_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { JobName, JobDetailes, CompName, ScopeName, From_Date, To_Date, LeaveReason, DropDownList8 });
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
        }*/

    }
    //protected void Username_Checker_Click2(object sender, EventArgs e)
    //{

    //    try
    //    {
    //        if (ValidateControls(new WebControl[] { txtEmp }))
    //        {
    //            DT = DataAccess.EmployeeNO_Get(txtEmp.Text);

    //            Label5.Text = DT.Rows[0]["Ar_F_Name"].ToString() + " " + DT.Rows[0]["Ar_S_Name"].ToString() + " " + DT.Rows[0]["Ar_Th_Name"].ToString() + " " + DT.Rows[0]["Ar_Family_Name"].ToString();
    //            //  tab_2.Attributes.Add("Class", "active");
    //            HiddenField1.Value = DT.Rows[0]["Emp_ID"].ToString();
    //        }
    //        else
    //        {
    //            ShowToast(this, "الرجاء ادخال رقم الموظف   بشكل صحيح.", "", "error");
    //        }
    //    }

    //    catch { ShowToast(this, "الرجاء ادخال رقم الموظف   بشكل صحيح.", "", "error"); }
    //}
    protected void btnCancel_Click2(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { JobName, JobDetailes, CompName, ScopeName, From_Date, To_Date, LeaveReason, DropDownList8 });
        Session["Experince_ID"] = null;
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Experince_ID"] = ((Label)ri.FindControl("Experince_ID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Experiance_AddEdit.aspx");
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("Experince_ID")).Text;

        if (DataAccess.Experience_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }
}