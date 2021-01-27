using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
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

                //divNotPeriodical.Visible = Da.Rows[0]["ContainerTypeID"].ToString() != "3";
                divPeriodical2.Visible = Da.Rows[0]["ContainerTypeID"].ToString() == "3";

                divSeries.Visible = Da.Rows[0]["ContainerTypeID"].ToString() == "15";
                rbIsBorrow1.Checked = Da.Rows[0]["ContainerTypeID"].ToString() != "2";
                rbIsBorrow2.Checked = Da.Rows[0]["ContainerTypeID"].ToString() == "2";

                if (Session["BookID"] != null)
                {
                    lblBookID.Text = Session["BookID"].ToString();
                    Session["BookID"] = null;

                    if (Convert.ToInt32(Da.Rows[0]["ContainerTypeID"].ToString()) == 3)//دوريات
                    {
                        DivPerson.Visible = false;
                        DivAddPerson.Visible = false;
                        DivPublisher.Visible = true;
                        DivAddPublisher.Visible = true;
                        DivPeriodical.Visible = true;
                        DivAddPeriodical.Visible = true;

                    }
                    else
                    {
                        DivPerson.Visible = true;
                        DivAddPerson.Visible = true;
                        DivPublisher.Visible = true;
                        DivAddPublisher.Visible = true;
                        DivPeriodical.Visible = false;
                        DivAddPeriodical.Visible = false;
                    }

                    //DivPerson.Visible = true;
                    //DivAddPerson.Visible = true;
                    //DivPublisher.Visible = true;
                    //DivAddPublisher.Visible = true;
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
                    txtBookGetDate.Text = DT.Rows[0]["BookGetDate"].ToString();
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
                    txtPeriodicalNumber.Text= DT.Rows[0]["PeriodicalNumber"].ToString();//للدورية

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
                    txtBookNo.Text = "";
                    ddlBookStatus.SelectedValue = DT.Rows[0]["BookStatusID"].ToString();
                    txtISBN.Text = DT.Rows[0]["ISBN"].ToString();
                    txtPageCount.Text = DT.Rows[0]["PageCount"].ToString();
                    ddlBookGetType.DataBind();
                    ddlBookGetType.SelectedValue = DT.Rows[0]["BookGetTypeID"].ToString();
                    txtBookGetName.Text = DT.Rows[0]["BookGetName"].ToString();
                    txtBookGetDate.Text = DT.Rows[0]["BookGetDate"].ToString();
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
                    txtPeriodicalNumber.Text = DT.Rows[0]["PeriodicalNumber"].ToString();//للدورية

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
        bool intValidate = IntValidateControls(new WebControl[] { txtPageCount, (ddlBookGetType.SelectedValue == "1") ? txtBookPrice : null });
        bool Validate = ValidateControls(new WebControl[] { txtBookTitle1, ddlBookStatus, txtDetails, ddlBookGetType, txtBookGetName });
        if (Validate && intValidate)
        {
            DataTable DT = NewDataAccess.BookAddEdit(lblBookID.Text, lblBookCopyID.Text, txtBookTitle1.Text, txtBookTitle2.Text, txtBookTitle3.Text, txtSeriesTitle.Text, txtSeriesNo.Text, txtBookNo.Text, lblContainerID.Text, ddlBookGetType.SelectedValue, txtBookGetName.Text, txtBookGetDate.Text, txtBookPrice.Text, ddlBookType.SelectedValue, ddlBookStatus.SelectedValue, rbIsBorrow1.Checked, txtISBN.Text, txtPageCount.Text, txtCopyNo.Text, txtEditionNo.Text, txtPartNo.Text, ddlFloor.SelectedValue, txtDetails.Text, txtNotes.Text, txtPeriodicalNumber.Text, UserID);

            if (Convert.ToInt32(DT.Rows[0]["status"]) > 0)
            {
                lblBookID.Text = DT.Rows[0]["BooKID"].ToString();
                txtBookNo.Text = DT.Rows[0]["BooKNo"].ToString();
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");

                DataTable dt2 = NewDataAccess.ContainerGet(DT.Rows[0]["ContainerID"].ToString());
                int type = Convert.ToInt32(dt2.Rows[0]["ContainerTypeID"].ToString());
                if (type == 3)//دوريات
                {
                    DivPerson.Visible = false;
                    DivAddPerson.Visible = false;
                    DivPublisher.Visible = true;
                    DivAddPublisher.Visible = true;
                    DivPeriodical.Visible = true;
                    DivAddPeriodical.Visible = true;

                }
                else
                {
                    DivPerson.Visible = true;
                    DivAddPerson.Visible = true;
                    DivPublisher.Visible = true;
                    DivAddPublisher.Visible = true;
                    DivPeriodical.Visible = false;
                    DivAddPeriodical.Visible = false;
                }
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

    protected void lbBookPersonEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("BookPersonID")).Text;
        lblBookPersonID.Text = ID;
        DataTable DT = NewDataAccess.BookPersonGet(lblBookPersonID.Text);
        if (DT.Rows.Count > 0)
        {
            txtPersonName.Text = DT.Rows[0]["PersonName"].ToString();
            ddlPersonType.DataBind();
            ddlPersonType.SelectedValue = DT.Rows[0]["PersonTypeID"].ToString();
        }
    }

    protected void lbBookPersonDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("BookPersonID")).Text;
        DataTable DT = NewDataAccess.BookPersonDelete(ID, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void btnBookPersonSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtPersonName, ddlPersonType });
        if (Validate)
        {
            DataTable DT = NewDataAccess.BookPersonAddEdit(lblBookPersonID.Text, lblBookID.Text, txtPersonName.Text, ddlPersonType.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            EmptyControls(new WebControl[] { lblBookPersonID, txtPersonName, ddlPersonType });
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnBookPersonCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblBookPersonID, txtPersonName, ddlPersonType });
    }

    protected void lbBookPublisherEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("BookPublisherID")).Text;
        lblBookPublisherID.Text = ID;
        DataTable DT = NewDataAccess.BookPublisherGet(lblBookPublisherID.Text);
        if (DT.Rows.Count > 0)
        {
            txtPublisherName.Text = DT.Rows[0]["PublisherName"].ToString();
            txtPublisherPlace.Text = DT.Rows[0]["PublisherPlace"].ToString();
            txtPublisherYear.Text = DT.Rows[0]["PublisherYear"].ToString();
        }
    }

    protected void lbBookPublisherDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("BookPublisherID")).Text;
        DataTable DT = NewDataAccess.BookPublisherDelete(ID, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView2.DataBind();
    }

    protected void btnBookPublisherSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtPublisherName, txtPublisherPlace, txtPublisherYear });
        if (Validate)
        {
            DataTable DT = NewDataAccess.BookPublisherAddEdit(lblBookPublisherID.Text, lblBookID.Text, txtPublisherName.Text, txtPublisherPlace.Text, txtPublisherYear.Text, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            EmptyControls(new WebControl[] { lblBookPublisherID, txtPublisherName, txtPublisherPlace, txtPublisherYear });
            ListView2.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnBookPublisherCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblBookPublisherID, txtPublisherName, txtPublisherPlace, txtPublisherYear });
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

    protected void lbPeriodicalTitleEdit_OnClick(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("PeriodicalTitleID")).Text;
        lblBookPeriodicalID.Text = ID;
        DataTable DT = NewDataAccess.BookPeriodicalTitleGet(lblBookPeriodicalID.Text);
        if (DT.Rows.Count > 0)
        {
            txtPeriodicalSubTitle.Text = DT.Rows[0]["PeriodicalSubTitle"].ToString();
            btnBookPeriodicalTitleSave.Enabled = true;
        }
    }

    protected void lbPeriodicalTitleDelete_OnClick(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("PeriodicalTitleID")).Text;
        DataTable DT = NewDataAccess.BookPeriodicalTitleDelete(ID, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView3.DataBind();
        DivAddPeriodicalTitlePerson.Visible = false;
        DivPeriodicalTitlePerson.Visible = false;
        btnBookPeriodicalTitleSave.Enabled = true;
    }

    protected void btnBookPeriodicalTitleSave_OnClick(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtPeriodicalSubTitle });
        if (Validate)
        {
            DataTable DT = NewDataAccess.BookPeriodicalTitlesAddEdit(lblBookPeriodicalID.Text, lblBookID.Text, txtPeriodicalSubTitle.Text, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            EmptyControls(new WebControl[] { lblBookPeriodicalID, txtPeriodicalSubTitle });
            ListView3.DataBind();
            DivAddPeriodicalTitlePerson.Visible = false;
            DivPeriodicalTitlePerson.Visible = false;
            btnBookPeriodicalTitleSave.Enabled = true;
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnBookPeriodicalTitleCancel_OnClick(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblBookPeriodicalID, txtPeriodicalSubTitle });
        btnBookPeriodicalTitleSave.Enabled = true;
    }

    protected void btnPeriodicalTitlePersonSave_OnClick(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtTitlePersonName, ddlPersonType2 });
        if (Validate)
        {
            DataTable DT = NewDataAccess.PeriodicalTitlePersonAddEdit(lblPeriodicalTitlePersonID.Text, lblBookPeriodicalID.Text, txtTitlePersonName.Text, ddlPersonType2.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            ListView4.DataSource = NewDataAccess.GetPeriodicalTitlePerson(lblBookPeriodicalID.Text);
            ListView4.DataBind();
            ListView3.DataBind();
            EmptyControls(new WebControl[] { lblBookPeriodicalID,lblPeriodicalTitlePersonID, txtTitlePersonName, ddlPersonType2 });
            btnBookPeriodicalTitleSave.Enabled = true;
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnPeriodicalTitlePersonCancel_OnClick(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblPeriodicalTitlePersonID, txtTitlePersonName, ddlPersonType2 });
        btnBookPeriodicalTitleSave.Enabled = true;
    }

    protected void lbPeriodicalTitlePersonEdit_OnClick(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("PeriodicalTitlePersonID")).Text;
        lblPeriodicalTitlePersonID.Text = ID;
        DataTable DT = NewDataAccess.PeriodicalTitlePersonGet(lblPeriodicalTitlePersonID.Text);
        if (DT.Rows.Count > 0)
        {
            txtTitlePersonName.Text = DT.Rows[0]["TitlePersonName"].ToString();
            ddlPersonType2.DataBind();
            ddlPersonType2.SelectedValue = DT.Rows[0]["PersonTypeID"].ToString();
            lblBookPeriodicalID.Text = DT.Rows[0]["PeriodicalTitleID"].ToString();
            btnBookPeriodicalTitleSave.Enabled = true;
        }
    }

    protected void lbPeriodicalTitlePersonDelete_OnClick(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("PeriodicalTitlePersonID")).Text;
        DataTable DT = NewDataAccess.PeriodicalTitlePersonDelete(ID, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView4.DataSource = NewDataAccess.GetPeriodicalTitlePerson(DT.Rows[0]["PeriodicalTitleID"].ToString());
        ListView4.DataBind();
        ListView3.DataBind();
        ListView4.DataBind();
        btnBookPeriodicalTitleSave.Enabled = true;
    }

    protected void lbPeriodicalSubTitlePersonManage_OnClick(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("PeriodicalTitleID")).Text;
        DataTable DT = NewDataAccess.BookPeriodicalTitleGet(ID);
        if (DT.Rows.Count > 0)
        {
            lblPeriodicalTitle.Text = DT.Rows[0]["PeriodicalSubTitle"].ToString();
            lblPeriodicalTitle2.Text = DT.Rows[0]["PeriodicalSubTitle"].ToString();
            lblBookPeriodicalID.Text = ID;
            ListView4.DataSource = NewDataAccess.GetPeriodicalTitlePerson(ID);
            ListView4.DataBind();
            
            DivAddPeriodicalTitlePerson.Visible = true;
            DivPeriodicalTitlePerson.Visible = true;
            btnBookPeriodicalTitleSave.Enabled = false;//علشان لما يعمل ادارة للمؤلفين ما يقدر يعدل على العنوان الفرعي لأنو بسجل الآيدي تبع العنوان الفرعي
        }
        
    }
}