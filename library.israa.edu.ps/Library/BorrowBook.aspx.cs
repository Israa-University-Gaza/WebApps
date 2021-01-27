using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_BorrowBook : UserPage
{
    Label BorrowCatID;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ID_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
        Repeater1.DataBind();
    }
    protected void PublicID_TextChanged(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        if (PublicID.Text != "")
        {
            DataTable DT = DataAccess.BookGet1(PublicID.Text);
            if (DT.Rows.Count > 0)
            {
                TextBox1.Text = DT.Rows[0]["BookTitle"].ToString();
                BookID.Text = DT.Rows[0]["ID"].ToString();
            }
            else ShowToast(this, "رقم الكتاب غير موجود", "","error");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { ID,PublicID });

        if (validate)
        {
            DataTable DT = DataAccess.BorrowAddEdit("", BookID.Text, ID.Text, UserID, UserID);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) EmptyControls(new WebControl[] { TextBox1, BookID, PublicID });
                Repeater1.DataBind();
            }

        }
        else ShowToast(this, "الرجاء تعبئة البيانات المطلوبة","", "error");
    }
   
    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        // set IsReturned true and ActualReturnDate = GetDate();
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;

        if (DataAccess.BookReturned(id, ((CheckBox)ri.FindControl("cbIsActive")).Checked, UserID) > 0)
        {
            
            ShowToast(this, "تمت عملية ارجاع الكتاب بنجاح.", "", "success");
            ((CheckBox)ri.FindControl("cbIsActive")).Enabled = false;
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم ارجاع الكتاب .", "", "error");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { BookID, ID, TextBox1 });
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;

        DataTable DT=DataAccess.BookRenew(id, ((CheckBox)ri.FindControl("CheckBox1")).Checked, UserID);
       if(DT.Rows.Count>0)
        
        {

            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

            Repeater1.DataBind();
            ((CheckBox)ri.FindControl("CheckBox1")).Enabled = false;
           
        }
        else
            ShowToast(this, "عذرًا , لم يتم تجديد الاعارة .", "", "error");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ReportView.aspx?benficiaryID=" + ID.Text);
    }
}