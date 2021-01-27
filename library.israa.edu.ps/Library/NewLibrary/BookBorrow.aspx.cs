using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_BookBorrow : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["ContainerID"] != null)
            {

                lblContainerID.Text = Session["ContainerID"].ToString();
                Session["ContainerID"] = null;
                DataTable Da = NewDataAccess.ContainerGet(lblContainerID.Text);
                lblContainerTitle.Text = Da.Rows[0]["Title"].ToString();
                lblContainerNo.Text = Da.Rows[0]["ContainerNo"].ToString();

                if (Session["BookID"] != null)
                {
                    lblBookID.Text = Session["BookID"].ToString();
                    Session["BookID"] = null;
                    DataTable DT = NewDataAccess.BookGet(lblBookID.Text);
                    lblBookTitle.Text = DT.Rows[0]["BookTitle1"].ToString();
                    lblBookNo.Text = DT.Rows[0]["BookNo"].ToString();
                    lblBookType.Text = DT.Rows[0]["BookType"].ToString();
                }
            }

            else
            {
                Response.Redirect("Books.aspx");
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }


    protected void lbBorrowBook_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ClientID = ((Label)li.FindControl("ID")).Text;
        string BorrowCategoryID = ((Label)li.FindControl("BorrowCategoryID")).Text;
        DataTable DT = NewDataAccess.BorrowBook(lblBookID.Text, ClientID, BorrowCategoryID,UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void txtClientNo_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbOpenFile_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ClientID = ((Label)li.FindControl("ID")).Text;
        string BorrowCategoryID = ((Label)li.FindControl("BorrowCategoryID")).Text;

        if (BorrowCategoryID == "1")
        {
            Session["EmployeeID"] = ClientID;
            Response.Redirect("Employee.aspx");

        }
       else if (BorrowCategoryID == "2")
        {
            Session["StudentID"] = ClientID;
            Response.Redirect("Student.aspx");
        }

        else
        {
            Session["VisitorID"] = ClientID;
            Response.Redirect("Visitor.aspx");
        }
    }
}