using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_E_BookAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["E_ID"] != null)
            {
                DataTable DT = DataAccess.E_BookGet(Session["E_ID"].ToString());

                ISBN.Text = DT.Rows[0]["ISBN"].ToString();
                BookTitle.Text = DT.Rows[0]["BookTitle"].ToString();
                AuthorName.Text = DT.Rows[0]["AuhorName"].ToString();
                if (DT.Rows[0]["LanguageID"].ToString() != "") LanguageID.SelectedValue = DT.Rows[0]["LanguageID"].ToString();
                if (DT.Rows[0]["CategoryID"].ToString() != "") CategoryID.SelectedValue = DT.Rows[0]["CategoryID"].ToString();
               // Image1.ImageUrl = "" + DT.Rows[0]["BookPhoto"].ToString();
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { BookTitle, AuthorName, CategoryID, LanguageID });

        if (Validate)
        {
            if (DataAccess.DigitalBookAddEdit((Session["E_ID"] == null) ? "" : Session["E_ID"].ToString(), BookTitle.Text, AuthorName.Text, CategoryID.SelectedValue,
                ISBN.Text, LanguageID.SelectedValue, hfurl.Text, Label5.Text, UserID, UserID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
            }
        }
        else
        {
            ShowToast(this, "يرجى تعبئة البيانات المطلوبة .", "", "error");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

        Session["E_ID"] = null;
        EmptyControls(new WebControl[] { BookTitle, ISBN, AuthorName, Label5, hfurl });


    }
}