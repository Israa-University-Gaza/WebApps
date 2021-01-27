using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_StdSemesterMarksBITrans : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            UserPage userPage = new UserPage();


            if (Request.QueryString["id"] != null)
            {


                lblStudentID.Text = Request.QueryString["id"].ToString();

            }
            else
                Response.Redirect("~/Academic/Students.aspx");




        }

    }



    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg1.Visible = (msg != "");
    }

    protected void btnSaveWorkMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)item.FindControl("MarkID")).Text;
        TextBox txtWorkMark = (TextBox)item.FindControl("txtWorkMark");

        if (IntValidateControls(new WebControl[] { txtWorkMark }))
        {
            DataTable DT = DataAccess.SetMarkWorkMark(ID, txtWorkMark.Text, EmployeeID);
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                Repeater17.DataBind();
            }
        }
        else
        {
            ShowMsg1("الرجاء إدخال العلامة بالشكل الصحيح", "danger");
        }

    }

    protected void btnCancelWorkMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        Label lblWorkMark = (Label)item.FindControl("lblWorkMark");
        TextBox txtWorkMark = (TextBox)item.FindControl("txtWorkMark");
        Button btnSaveWorkMark = (Button)item.FindControl("btnSaveWorkMark");
        Button btnCancelWorkMark = (Button)item.FindControl("btnCancelWorkMark");
        lblWorkMark.Visible = true;
        txtWorkMark.Visible = btnSaveWorkMark.Visible = btnCancelWorkMark.Visible = false;

    }



    protected void btnSaveMidtermMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)item.FindControl("MarkID")).Text;
        TextBox txtMidtermMark = (TextBox)item.FindControl("txtMidtermMark");
        bool IsMidtermNoMark = (txtMidtermMark.Text == "N" || txtMidtermMark.Text == "غياب" || txtMidtermMark.Text == "غ . م");
        txtMidtermMark.Text = IsMidtermNoMark ? "0" : txtMidtermMark.Text;

        if (IntValidateControls(new WebControl[] { txtMidtermMark }))
        {
            DataTable DT = DataAccess.SetMarkMidtermMark(ID, txtMidtermMark.Text, IsMidtermNoMark, EmployeeID);
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                Repeater17.DataBind();
            }
        }
        else
        {
            ShowMsg1("الرجاء إدخال العلامة بالشكل الصحيح", "danger");
        }
    }

    protected void btnCancelMidtermMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        Label lblMidtermMark = (Label)item.FindControl("lblMidtermMark");
        TextBox txtMidtermMark = (TextBox)item.FindControl("txtMidtermMark");
        Button btnSaveMidtermMark = (Button)item.FindControl("btnSaveMidtermMark");
        Button btnCancelMidtermMark = (Button)item.FindControl("btnCancelMidtermMark");
        lblMidtermMark.Visible = true;
        txtMidtermMark.Visible = btnSaveMidtermMark.Visible = btnCancelMidtermMark.Visible = false;

    }

    protected void btnSaveFinalMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)item.FindControl("MarkID")).Text;
        TextBox txtFinalMark = (TextBox)item.FindControl("txtFinalMark");
        bool IsFinalNoMark = (txtFinalMark.Text == "N" || txtFinalMark.Text == "غياب" || txtFinalMark.Text == "غ . م");
        txtFinalMark.Text = IsFinalNoMark ? "0" : txtFinalMark.Text;

        if (IntValidateControls(new WebControl[] { txtFinalMark }))
        {
            DataTable DT = DataAccess.SetMarkFinalMark(ID, txtFinalMark.Text, IsFinalNoMark, EmployeeID);
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                Repeater17.DataBind();
            }
        }
        else
        {
            ShowMsg1("الرجاء إدخال العلامة بالشكل الصحيح", "danger");
        }

    }

    protected void btnCancelFinalMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        Label lblFinalMark = (Label)item.FindControl("lblFinalMark");
        TextBox txtFinalMark = (TextBox)item.FindControl("txtFinalMark");
        Button btnSaveFinalMark = (Button)item.FindControl("btnSaveFinalMark");
        Button btnCancelFinalMark = (Button)item.FindControl("btnCancelFinalMark");
        lblFinalMark.Visible = true;
        txtFinalMark.Visible = btnSaveFinalMark.Visible = btnCancelFinalMark.Visible = false;

    }


    protected void btnEditMark_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;

        Label lblWorkMark = (Label)item.FindControl("lblWorkMark");
        TextBox txtWorkMark = (TextBox)item.FindControl("txtWorkMark");
        Button btnSaveWorkMark = (Button)item.FindControl("btnSaveWorkMark");
        Button btnCancelWorkMark = (Button)item.FindControl("btnCancelWorkMark");
        lblWorkMark.Visible = false;
        txtWorkMark.Visible = btnSaveWorkMark.Visible = btnCancelWorkMark.Visible = true;

        Label lblMidtermMark = (Label)item.FindControl("lblMidtermMark");
        TextBox txtMidtermMark = (TextBox)item.FindControl("txtMidtermMark");
        Button btnSaveMidtermMark = (Button)item.FindControl("btnSaveMidtermMark");
        Button btnCancelMidtermMark = (Button)item.FindControl("btnCancelMidtermMark");
        lblMidtermMark.Visible = false;
        txtMidtermMark.Visible = btnSaveMidtermMark.Visible = btnCancelMidtermMark.Visible = true;

        Label lblFinalMark = (Label)item.FindControl("lblFinalMark");
        TextBox txtFinalMark = (TextBox)item.FindControl("txtFinalMark");
        Button btnSaveFinalMark = (Button)item.FindControl("btnSaveFinalMark");
        Button btnCancelFinalMark = (Button)item.FindControl("btnCancelFinalMark");
        lblFinalMark.Visible = false;
        txtFinalMark.Visible = btnSaveFinalMark.Visible = btnCancelFinalMark.Visible = true;


    }

    protected void btnIsMidtermIncomplete2_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkMidtermIncomplete(StdSectionID);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater17.DataBind();
        }


    }

    protected void lbFinalMarkIncompleteAdd_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.FinalMarkIncompleteAdd(StdSectionID, EmployeeID);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            Repeater17.DataBind();
        }
    }


}