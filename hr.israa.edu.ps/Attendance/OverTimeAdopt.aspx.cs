using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_OverTimeAdopt : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        
          
            string ID = ((Label)ri.FindControl("ID")).Text;
            //bool validate = ValidateControls(new WebControl[] {TextBox1,DropDownList1,EmpName });

            //bool DateValidate = DateValidateControls(new WebControl[] {(TextBox)ri.FindControl("from"),(TextBox)ri.FindControl("to"), (TextBox)ri.FindControl("date"), });
            //if (validate && DateValidate)
            //{ }

            if (DataAccess.Work_OverTime_TB_AddEdit(ID, Convert.ToDateTime(((TextBox)ri.FindControl("date")).Text),
                Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(TextBox1.Text),Convert.ToInt16( EmpName.SelectedValue),
                Convert.ToDateTime(((TextBox)ri.FindControl("from")).Text),Convert.ToDateTime(((TextBox)ri.FindControl("to")).Text),

               Convert.ToDateTime(((TextBox)ri.FindControl("TotalHour")).Text), 0, ((TextBox)ri.FindControl("notes")).Text, false, Convert.ToDateTime(((TextBox)ri.FindControl("RestHour")).Text),
               Convert.ToDateTime(((TextBox)ri.FindControl("WorkHour")).Text), Convert.ToDateTime(((TextBox)ri.FindControl("TotalOverHour")).Text),
               Convert.ToDateTime(((TextBox)ri.FindControl("acceptedHour")).Text), Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {
                ID = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { });
                Repeater2.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
            }

        
      
           
        
        
    }
    protected void lbSubmit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;


        string ID = ((Label)ri.FindControl("ID")).Text;

        if (DataAccess.Work_OverTime_TB_Adopt(ID, UserID) > 0)
        {
            ID = null;
            ShowToast(this, "تم الاعتماد بنجاح.", "", "success");
            EmptyControls(new WebControl[] { });
            Repeater2.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم الاعتماد.", "", "error");
        }

    }
}