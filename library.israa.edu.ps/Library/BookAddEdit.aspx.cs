﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_BookAddEdit : UserPage
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
                lblContainerTitle1.Text = Da.Rows[0]["Title"].ToString();
                lblContainerNo.Text = Da.Rows[0]["ContainerNo"].ToString();
                lblContainerCategoryName.Text = Da.Rows[0]["ContainerCategoryName"].ToString();
                lblBookCount.Text = Da.Rows[0]["ContainerBookNo"].ToString();
                lblLanguage.Text = Da.Rows[0]["LanguageName"].ToString();

                divSeries.Visible = Da.Rows[0]["ContainerTypeID"].ToString() == "15";
                rbIsBorrow1.Checked = Da.Rows[0]["ContainerTypeID"].ToString() != "2";
                rbIsBorrow2.Checked = Da.Rows[0]["ContainerTypeID"].ToString() == "2";
                
                if (Session["BookID"] != null)
                {
                    lblBookID.Text = Session["BookID"].ToString();
                    Session["BookID"] = null;
                    DivPerson.Visible = true;
                    DivAddPerson.Visible = true;
                    btnBookCopy.Enabled = true;
                    DataTable DT = NewDataAccess.BookGet(lblBookID.Text);
                    txtBookTitle1.Text = DT.Rows[0]["BookTitle1"].ToString();
                    txtBookTitle2.Text = DT.Rows[0]["BookTitle2"].ToString();
                    txtBookTitle3.Text = DT.Rows[0]["BookTitle3"].ToString();
                    txtSeriesTitle.Text = DT.Rows[0]["SeriesTitle"].ToString();
                    txtSeriesNo.Text = DT.Rows[0]["SeriesNo"].ToString();
                    txtBookNo.Text = DT.Rows[0]["BookNo"].ToString();
                    ddlBookStatus.SelectedValue = DT.Rows[0]["BookStatusID"].ToString();
                    txtISBN.Text = DT.Rows[0]["ISBN"].ToString();
                    txtPageCount.Text = DT.Rows[0]["PageCount"].ToString();
                    ddlBookGetType.DataBind();
                    ddlBookGetType.SelectedValue = DT.Rows[0]["BookGetTypeID"].ToString();
                    txtBookGetName.Text = DT.Rows[0]["BookGetName"].ToString();
                    txtBookPrice.Text = DT.Rows[0]["BookPrice"].ToString();
                    ddlBookType.DataBind();
                    ddlBookType.SelectedValue = DT.Rows[0]["BookTypeID"].ToString();
                    txtCopyNo.Text = DT.Rows[0]["CopyNo"].ToString();
                    txtEditionNo.Text = DT.Rows[0]["EditionNo"].ToString();
                    txtPartNo.Text = DT.Rows[0]["PartNo"].ToString();
                    ddlBranch.DataBind();
                    ddlBranch.SelectedValue = DT.Rows[0]["BranchID"].ToString();
                    ddlBuilding.DataBind();
                    ddlBuilding.SelectedValue = DT.Rows[0]["BuildingID"].ToString();
                    ddlFloor.DataBind();
                    ddlFloor.SelectedValue = DT.Rows[0]["FloorID"].ToString();
                    txtDetails.Text = DT.Rows[0]["Details"].ToString();
                    txtNotes.Text = DT.Rows[0]["Notes"].ToString();

                    rbIsBorrow1.Checked = Convert.ToBoolean(DT.Rows[0]["IsBorrow"].ToString());
                    rbIsBorrow2.Checked = !Convert.ToBoolean(DT.Rows[0]["IsBorrow"].ToString());
                }


                if (Session["BookCopyID"] != null)
                {
                    lblBookCopyID.Text = Session["BookCopyID"].ToString();
                    DataTable DT = NewDataAccess.BookGet(lblBookCopyID.Text);
                    btnBookCopy.Enabled = true;
                    Session["BookCopyID"] = null;
                    txtBookTitle1.Text = DT.Rows[0]["BookTitle1"].ToString();
                    txtBookTitle2.Text = DT.Rows[0]["BookTitle2"].ToString();
                    txtBookTitle3.Text = DT.Rows[0]["BookTitle3"].ToString();
                    txtSeriesTitle.Text = DT.Rows[0]["SeriesTitle"].ToString();
                    txtSeriesNo.Text = DT.Rows[0]["SeriesNo"].ToString();
                    txtBookNo.Text = null;
                    ddlBookStatus.SelectedValue = DT.Rows[0]["BookStatusID"].ToString();
                    txtISBN.Text = DT.Rows[0]["ISBN"].ToString();
                    txtPageCount.Text = DT.Rows[0]["PageCount"].ToString();
                    ddlBookGetType.DataBind();
                    ddlBookGetType.SelectedValue = DT.Rows[0]["BookGetTypeID"].ToString();
                    txtBookGetName.Text = DT.Rows[0]["BookGetName"].ToString();
                    txtBookPrice.Text = DT.Rows[0]["BookPrice"].ToString();
                    int bookTypeID = Convert.ToInt32(DT.Rows[0]["BookTypeID"].ToString());
                    bookTypeID = (bookTypeID <= 3) ? bookTypeID + 3 : bookTypeID;
                    ddlBookType.SelectedValue = bookTypeID.ToString();
                    txtCopyNo.Text = DT.Rows[0]["CopyNo"].ToString();
                    txtEditionNo.Text = DT.Rows[0]["EditionNo"].ToString();
                    txtPartNo.Text = DT.Rows[0]["PartNo"].ToString();
                    ddlBranch.DataBind();
                    ddlBranch.SelectedValue = DT.Rows[0]["BranchID"].ToString();
                    ddlBuilding.DataBind();
                    ddlBuilding.SelectedValue = DT.Rows[0]["BuildingID"].ToString();
                    ddlFloor.DataBind();
                    ddlFloor.SelectedValue = DT.Rows[0]["FloorID"].ToString();
                    txtDetails.Text = DT.Rows[0]["Details"].ToString();
                    txtNotes.Text = DT.Rows[0]["Notes"].ToString();

                    rbIsBorrow1.Checked = Convert.ToBoolean(DT.Rows[0]["IsBorrow"].ToString());
                    rbIsBorrow2.Checked = !Convert.ToBoolean(DT.Rows[0]["IsBorrow"].ToString());
                }
            }
            else
            {
                Response.Redirect("Containers.aspx");
            }
        }
    }

    protected void btnBookSave_Click(object sender, EventArgs e)
    {
        bool intValidate = IntValidateControls(new WebControl[] { txtPageCount, txtBookNo, (ddlBookGetType.SelectedValue == "1") ? txtBookPrice : null });
        bool Validate = ValidateControls(new WebControl[] { txtBookTitle1, ddlBookStatus, txtDetails, ddlBookGetType, txtBookGetName });
        if (Validate && intValidate)
        {
            DataTable DT = NewDataAccess.BookAddEdit(lblBookID.Text, lblBookCopyID.Text, txtBookTitle1.Text, txtBookTitle2.Text, txtBookTitle3.Text, txtSeriesTitle.Text, txtSeriesNo.Text, txtBookNo.Text, lblContainerID.Text, ddlBookGetType.SelectedValue, txtBookGetName.Text, txtBookPrice.Text, ddlBookType.SelectedValue, ddlBookStatus.SelectedValue, rbIsBorrow1.Checked, txtISBN.Text, txtPageCount.Text, txtCopyNo.Text, txtEditionNo.Text, txtPartNo.Text, ddlFloor.SelectedValue, txtDetails.Text, txtNotes.Text, UserID);

            if (Convert.ToInt32(DT.Rows[0]["status"]) > 0)
            {
                lblBookID.Text = DT.Rows[0]["BooKID"].ToString();
                txtBookNo.Text = DT.Rows[0]["BooKNo"].ToString();
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
                DivPerson.Visible = true;
                DivAddPerson.Visible = true;
                btnBookCopy.Enabled = true;
            }
            else
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnNewBook_Click(object sender, EventArgs e)
    {
        Session["ContainerID"] = lblContainerID.Text;
        Response.Redirect("BookAddEdit.aspx");
    }

    protected void lbPersonEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("PersonID")).Text;
        lblPersonID.Text = ID;
        DataTable DT = NewDataAccess.BookPersonGet(lblPersonID.Text);
        if (DT.Rows.Count > 0)
        {
            txtPersonName.Text = DT.Rows[0]["PersonName"].ToString();
            ddlPersonType.DataBind();
            ddlPersonType.SelectedValue = DT.Rows[0]["PersonTypeID"].ToString();
        }
    }

    protected void lbPersonDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("PersonID")).Text;
        DataTable DT = NewDataAccess.BookPersonDelete(ID, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void btnPersonSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtPersonName, ddlPersonType });
        if (Validate)
        {
            DataTable DT = NewDataAccess.BookPersonAddEdit(lblPersonID.Text, lblBookID.Text, txtPersonName.Text, ddlPersonType.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            EmptyControls(new WebControl[] { lblPersonID, txtPersonName, ddlPersonType });
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnPersoncancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblPersonID, txtPersonName, ddlPersonType });
    }

    protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlBuilding.DataBind();
        ddlFloor.DataBind();
    }

    protected void ddlBuilding_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlFloor.DataBind();
    }

    protected void btnNewContainer_Click(object sender, EventArgs e)
    {
        Response.Redirect("Containers.aspx");
    }

    protected void btnBookCopy_Click(object sender, EventArgs e)
    {
        Session["ContainerID"] = lblContainerID.Text;
        Session["BookCopyID"] = lblBookID.Text;
        Response.Redirect("BookAddEdit.aspx");
    }
}