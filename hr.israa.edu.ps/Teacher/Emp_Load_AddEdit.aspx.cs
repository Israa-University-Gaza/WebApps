using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Teacher_Emp_Load_AddEdit :UserPage
{
    DataTable DT = new DataTable(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["Load_ID"] != null)
            {
                DataTable DT = DataAccess.Emp_Load_TB_Get(Session["Load_ID"].ToString());

                txtName.Text = DT.Rows[0]["Max_Load"].ToString();
                txtSubmit.Text = DT.Rows[0]["Hour_Price"].ToString();
                DropDownList8.SelectedValue = DT.Rows[0]["Emp_ID"].ToString();
              

               
            }
        }
    }



    protected void Button12_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] {txtSubmit, DropDownList8 ,txtName });
        bool DecimalValidate = DecimalValidateControls(new WebControl[] {txtSubmit  });
        bool IntValidate = IntValidateControls(new WebControl[] {txtName });
        if (Validate && DecimalValidate)
   
        {

            if (DataAccess.Emp_Load_TB_AddEdit((Session["Load_ID"] == null) ? "" : Session["Load_ID"].ToString(), Convert.ToInt16(DropDownList8.SelectedValue),
               Convert.ToInt16(txtName.Text),
                Convert.ToDecimal(txtSubmit.Text),Convert.ToInt16(DropDownList1.SelectedValue),  Convert.ToInt16(UserID), (Session["Load_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Session["Load_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { txtName, txtSubmit, DropDownList8 });
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
        EmptyControls(new WebControl[] { txtName, txtSubmit, DropDownList8 });
        Session["Load_ID"] = null;
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Load_ID"] = ((Label)ri.FindControl("LoadID")).Text;
        Response.Redirect("~/Teacher/Emp_Load_AddEdit.aspx");
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("LoadID")).Text;

        if (DataAccess.Emp_Load_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }


}
