using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_VisitorAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    if (Request.QueryString["id"].ToString() != null)
        //    {
        //        Label1.Text = Request.QueryString["id"].ToString();
        //        DataTable DT = DataAccess.VisitorGet(Label1.Text);
        //        if (DT.Rows.Count > 0)
        //        {
        //            SSN.Text = DT.Rows[0]["SSN"].ToString();
        //            FullName.Text = DT.Rows[0]["FullName"].ToString();
        //            Phone.Text = DT.Rows[0]["Phone"].ToString();
        //            Mobile.Text = DT.Rows[0]["Mobile"].ToString();
        //            email.Text = DT.Rows[0]["Email"].ToString();
        //            address.Text = DT.Rows[0]["Address"].ToString();
        //            Notes.Text = DT.Rows[0]["Notes"].ToString();
        //        }
        //    }
        //}
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { SSN,FullName,Mobile,email });

      if(validate)
      {
          DataTable DT = DataAccess.VisitorAddEdit(Label1.Text,
              SSN.Text, FullName.Text, Mobile.Text, Phone.Text, email.Text, address.Text, Notes.Text, UserID, UserID);
        if (DT.Rows.Count > 0)
        {
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { SSN, FullName, Mobile, email, Phone, Notes, address, Label1 });
                Repeater1.DataBind();
            }
        }
        else ShowToast(this, "هناك خطا حاول مرة اخرى", "خطأ","error");
        }
      else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة", "خطأ","error");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { SSN, FullName, Mobile, email, Phone, Notes, address, Label1 });
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
        //Response.Redirect("VisitorAddEdit.aspx?id="+id);
        DataTable DT = DataAccess.VisitorGet(id);
        if (DT.Rows.Count > 0)
        {
            Label1.Text = id;
            SSN.Text = DT.Rows[0]["SSN"].ToString();
            FullName.Text = DT.Rows[0]["FullName"].ToString();
            Phone.Text = DT.Rows[0]["Phone"].ToString();
            Mobile.Text = DT.Rows[0]["Mobile"].ToString();
            email.Text = DT.Rows[0]["Email"].ToString();
            address.Text = DT.Rows[0]["Address"].ToString();
            Notes.Text = DT.Rows[0]["Notes"].ToString();
        }

    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
        if (DataAccess.VisitorDelete(id, UserID) > 0)
        {

            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();

        }
        else
            ShowToast(this, "عذرًا , لم يتم الحذف .", "", "danger");

    }
}