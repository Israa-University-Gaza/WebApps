using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_BorrowCat : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtName,MaxDays,MaxBooks  });

            if (Validate)
            {
                DataTable DT = DataAccess.BorrowCatAddEdit(ID.Text, txtName.Text, MaxDays.Text, MaxBooks.Text, UserID, UserID);
                if (DT.Rows.Count > 0)
                {

                    ShowToast(this,DT.Rows[0]["msg"].ToString(), "", "success");

                    EmptyControls(new WebControl[] { txtName, MaxDays, MaxBooks, ID });
                    Repeater1.DataBind();
                 
                }
                else
                    ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
            }
            else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة .", "", "error");
        }
    
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtName, MaxDays, MaxBooks,ID });

    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        ID.Text = ((Label)ri.FindControl("Label1")).Text;
        DataTable DT = DataAccess.BorrowCatGet(ID.Text);
        txtName.Text = DT.Rows[0]["BorrowCatType"].ToString();
        MaxBooks.Text = DT.Rows[0]["BorrowMaxBookCount"].ToString();
        MaxDays.Text = DT.Rows[0]["BorrowMaxDayCount"].ToString();
      
    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("Label1")).Text;
       if (DataAccess.BorrowCatDelete(id, UserID) > 0)
       {

           ShowToast(this, "تم الحذف بنجاح.", "", "success");
           Repeater1.DataBind();
       }
       else
           ShowToast(this, "عذرًا , لم يتم الحذف .", "", "error");
      
    }
}