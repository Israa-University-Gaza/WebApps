using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_DelayNotification : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
     if( DataAccess.FirstNotify(id,UserID)>0)
     {
          ShowToast(this, "تمت العملية  بنجاح.", "", "success");
           Repeater1.DataBind();
     }
     else
         ShowToast(this, "لم تتم العملية بنجاح", "", "error");
    

    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
        if (DataAccess.SecondNotify(id, UserID) > 0)
        {
            ShowToast(this, "تمت العملية  بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "لم تتم العملية بنجاح", "", "error");
    
    }
    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
        if (DataAccess.FinallyNotify(id, UserID) > 0)
        {
            ShowToast(this, "تمت العملية  بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "لم تتم العملية بنجاح", "", "error");
    
    }
    protected void print_Click(object sender, EventArgs e)
    {

    }
}