using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_AdoptEmpAttendance : UserPage
{
    DataTable DT = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
  
    protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
    {
      
        Repeater1.DataBind();
    }
    protected void lbAdopt_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("Attendance_ID")).Text;

        if (DataAccess.Attendance_TB_Adopt(id, UserID) > 0)
        {
            ShowToast(this, "تم الاعتماد بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else if (DataAccess.Attendance_TB_Adopt(id, UserID) == -1)
        {
            ShowToast(this, "تم الاعتماد مسبقا.", "", "Warning");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم الاعتماد .", "", "error");
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("Attendance_ID")).Text;

         if (DataAccess.AttendanceConstant_TB_AddEdit(id,
                Convert.ToDateTime(((TextBox)ri.FindControl("from")).Text), Convert.ToDateTime(((TextBox)ri.FindControl("to")).Text),
                Convert.ToDateTime(((TextBox)ri.FindControl("date")).Text),
               Convert.ToInt16(((Label)ri.FindControl("DayID")).Text), Convert.ToInt16(DropDownList8.SelectedValue), 
 
                 Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {
        
            ShowToast(this, "تم الحفظ بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
    }
}