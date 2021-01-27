using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class NewLibrary_StudentBorrowBook : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["StudentID"] != null)
            {
                lblStudentID.Text = Session["StudentID"].ToString();
                DataTable DT = NewDataAccess.StudentImageGet(lblStudentID.Text);
                if (DT.Rows.Count > 0)
                {
                    if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                    {
                        byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                        string imgString = Convert.ToBase64String(imgBytes);
                        image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    }
                }
            }
            else
            {
                Response.Redirect("Students.aspx");
            }
        }
    }

    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = NewDataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            Session["StudentID"] = DT.Rows[0]["StudentID"].ToString();
            Response.Redirect("Student.aspx");
        }
        else
        {
            ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbBorrowBook_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string BookID = ((Label)li.FindControl("BookID")).Text;
        DataTable DT = NewDataAccess.BorrowBook(BookID, lblStudentID.Text, "2", UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
}