using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_search :UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { RadioButtonList1, TextBox14 });

        if (Validate)
        {
            switch (Convert.ToInt16(RadioButtonList1.SelectedValue))
            {
                case 1:

                    Repeater1.DataSourceID = "SqlDataSource5";
                    Repeater1.DataBind();
                    break;
                case 2:
                    Repeater1.DataSourceID = "SqlDataSource2";
                    Repeater1.DataBind();
                    break;
                case 3:
                    Repeater1.DataSourceID = "SqlDataSource3";
                    Repeater1.DataBind();
                    break;
                case 4:
                    Repeater1.DataSourceID = "SqlDataSource4";
                    Repeater1.DataBind();
                    break;
            }
        }
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        Session["ID"] = ((Label)ri.FindControl("ID")).Text;
        Response.Redirect("InsertBook.aspx");
    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
        if (DataAccess.BookDelete(id,UserID ) > 0)
        {

            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            
        }
        else
            ShowToast(this, "عذرًا , لم يتم الحذف .", "", "error");
        
    }
    protected void View_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
        Response.Redirect("ViewBook.aspx?id="+id);
    }
}