using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_InsertBook : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ID"] != null)
            {
                next.Visible = true;
                DataTable DT = DataAccess.BookGet(Session["ID"].ToString());
                if (DT.Rows[0]["BookType"].ToString() == "3")per.Visible = true;
                Label1.Text = DT.Rows[0]["ID"].ToString();
                PublicID.Text = DT.Rows[0]["PublicID"].ToString();
                Barcode.Text = DT.Rows[0]["BarcodeID"].ToString();
                DDCat.Text=DT.Rows[0]["CategoryID"].ToString();
                if (DT.Rows[0]["BookType"].ToString() != "") DDType.SelectedValue = DT.Rows[0]["BookType"].ToString();
              
                Title1.Text=DT.Rows[0]["BookTitle"].ToString();
                Title2.Text = DT.Rows[0]["BookTitle2"].ToString();
                Title3.Text = DT.Rows[0]["BookTitle3"].ToString();
                Height.Text= DT.Rows[0]["BookHeight"].ToString();
                    Width.Text= DT.Rows[0]["BookWidth"].ToString();
                    CopyCount.Text = DT.Rows[0]["CopyCount"].ToString();
                   if(DT.Rows[0]["BookStatus"].ToString() !="") BookStatus.SelectedValue = DT.Rows[0]["BookStatus"].ToString();
                   if(DT.Rows[0]["BookLanguage"].ToString() !="") BookLang.SelectedValue = DT.Rows[0]["BookLanguage"].ToString();
                Tdmak.Text=DT.Rows[0]["BookLanguage"].ToString();
                BookSummary.Text = DT.Rows[0]["BookSummary"].ToString();
                FolderCount.Text = DT.Rows[0]["FolderCount"].ToString();
                FolderNo.Text = DT.Rows[0]["FolderNo"].ToString();
                BookPlace.Text = DT.Rows[0]["BookPlace"].ToString();
                if (DT.Rows[0]["BookGet"].ToString() != "") BookGet.SelectedValue = DT.Rows[0]["BookGet"].ToString();
                BookGetName.Text = DT.Rows[0]["BookGetName"].ToString();
                Notes.Text = DT.Rows[0]["BookNotes"].ToString();
                SeriesTitle.Text = DT.Rows[0]["SeriesTitle"].ToString();
                SeriesNo.Text = DT.Rows[0]["SeriesNo"].ToString();
                EntryDate.Text =Convert.ToDateTime( DT.Rows[0]["libEntryDate"].ToString()).ToString("yyyy/MM/dd");
                UpdateDate.Text=DT.Rows[0]["UpdateDate"].ToString();
                SubjectHead.Text = DT.Rows[0]["SubjectHead"].ToString();
                if (DT.Rows[0]["BookStatus2"].ToString() != "") DropDownList2.SelectedValue = DT.Rows[0]["BookStatus2"].ToString();
                PagesCount.Text= DT.Rows[0]["PagesCount"].ToString();
                PartsCount.Text = DT.Rows[0]["PartsCount"].ToString();
                PartsNo.Text = DT.Rows[0]["PartsNo"].ToString();
                Edition.Text = DT.Rows[0]["EditionNo"].ToString();

            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        if (Label1.Text == "")
        {
            bool Validate = ValidateControls(new WebControl[] {  PublicID, DDCat,Title1 });

            if (Validate)
            {
                DataTable DT = DataAccess.BookAddEditMain((Session["ID"] == null) ? "" : Session["ID"].ToString(), PublicID.Text, DDCat.Text, Barcode.Text, DDType.SelectedValue,
                    Title1.Text, EntryDate.Text, Title2.Text, Title3.Text, UserID, UserID);
                if (DT.Rows.Count > 0)
                {

                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
              
                    next.Visible = true;
                    Label1.Text = DT.Rows[0]["id"].ToString(); 
                    if (DDType.SelectedValue =="3") per.Visible = true;
                    Session["ID"] = null;
                    // Repeater1.DataBind();
                 
                }
                else
                    ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
            }
        }
        else
        {
            bool Validate = ValidateControls(new WebControl[] { EntryDate, PublicID, DDCat });

            if (Validate)
            {
               
                    if (CheckBox1.Checked) // نكرر الكتاب الذي تم اضافته بعدد الاجزاء مع تغيير رقم الجزء في كل مرة
                    {
                        int No = Convert.ToInt16(PartsCount.Text);
                        while (No>0)
                        {
                            if (DataAccess.BookAddEdit(Label1.Text, PublicID.Text, DDCat.Text, Barcode.Text, DDType.SelectedValue,
                  Title1.Text, Width.Text, Height.Text, CopyCount.Text, SubjectHead.Text, BookPlace.Text, BookSummary.Text, BookStatus.SelectedValue, Tdmak.Text, Attach.Text,
                  BookLang.SelectedValue, Notes.Text, Explain.Text, FolderCount.Text, FolderNo.Text, SeriesTitle.Text, SeriesNo.Text, Edition.Text,
                  Convert.ToDateTime(EntryDate.Text).ToString(), Title2.Text, Title3.Text, UserID, UserID, BookGet.SelectedValue,BookGetName.Text, PartsCount.Text, Convert.ToString(No), PagesCount.Text,DropDownList2.SelectedValue) > 0)
                            {
                                Label1.Text = "";
                                No--;
                            }
                        }
                        ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                        EmptyControls(new WebControl[] { Label1, EntryDate, PublicID, DDCat, PublicID, DDCat, Barcode, DDType, Title1, Width, Height, CopyCount, SubjectHead, BookPlace, BookSummary, Tdmak, Attach, Edition, SeriesNo, SeriesTitle, Title2, Title3, Explain, FolderCount, FolderNo, Notes, DropDownList2, PagesCount });
                        Label1.Text = "";
                        Session["ID"] = null;
                    }
                    else   if (CheckBox2.Checked) // نكرر الكتاب الذي تم اضافته بعدد المجلدات مع تغيير رقم المجلد في كل مرة
                    {
                        int No2 = Convert.ToInt16(FolderCount.Text);
                        while (No2>0)
                        {
                            if (DataAccess.BookAddEdit(Label1.Text, PublicID.Text, DDCat.Text, Barcode.Text, DDType.SelectedValue,
                  Title1.Text, Width.Text, Height.Text, CopyCount.Text, SubjectHead.Text, BookPlace.Text, BookSummary.Text, BookStatus.SelectedValue, Tdmak.Text, Attach.Text,
                  BookLang.SelectedValue, Notes.Text, Explain.Text, FolderCount.Text, Convert.ToString(No2), SeriesTitle.Text, SeriesNo.Text, Edition.Text,
                  Convert.ToDateTime(EntryDate.Text).ToString(), Title2.Text, Title3.Text, UserID, UserID, BookGet.SelectedValue, BookGetName.Text, PartsCount.Text, PartsNo.Text, PagesCount.Text, DropDownList2.SelectedValue) > 0)
                            {
                                Label1.Text = "";
                                No2--;
                            }
                        }
                        ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                        EmptyControls(new WebControl[] { Label1, EntryDate, PublicID, DDCat, PublicID, DDCat, Barcode, DDType, Title1, Width, Height, CopyCount, SubjectHead, BookPlace, BookSummary, Tdmak, Attach, Edition, SeriesNo, SeriesTitle, Title2, Title3, Explain, FolderCount, FolderNo, Notes, DropDownList2, PagesCount });
                        Label1.Text = "";
                        Session["ID"] = null;
                    }
                    else
                    {
                         if (DataAccess.BookAddEdit(Label1.Text, PublicID.Text, DDCat.Text, Barcode.Text, DDType.SelectedValue,
                   Title1.Text, Width.Text, Height.Text, CopyCount.Text, SubjectHead.Text, BookPlace.Text, BookSummary.Text, BookStatus.SelectedValue, Tdmak.Text, Attach.Text,
                   BookLang.SelectedValue, Notes.Text, Explain.Text, FolderCount.Text, FolderNo.Text, SeriesTitle.Text, SeriesNo.Text, Edition.Text,
                   Convert.ToDateTime(EntryDate.Text).ToString(), Title2.Text, Title3.Text, UserID, UserID, BookGet.SelectedValue, BookGetName.Text, PartsCount.Text, PartsNo.Text, PagesCount.Text, DropDownList2.SelectedValue) > 0)
                {

                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                    Label1.Text = "";
                    Session["ID"] = null;
                    EmptyControls(new WebControl[] { Label1, EntryDate, PublicID, DDCat, PublicID,DDCat,Barcode,DDType,Title1,Width,Height,CopyCount,SubjectHead,BookPlace,BookSummary,Tdmak,Attach,Edition,SeriesNo,SeriesTitle,Title2,Title3,Explain,FolderCount,FolderNo,Notes,DropDownList2,PagesCount });
                    // Repeater1.DataBind();
                    }
                }
            }
                else
                    ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
            }
        }
        
       
    

    protected void PublishAdd_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { PubName});

        if (Validate)
        {
            if (DataAccess.PublisherAddEdit("", PubName.Text, PubPlace.Text, PubYear.Text, Label1.Text, UserID, UserID) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                Repeater1.DataBind();
                EmptyControls(new WebControl[] { PubName, PubPlace, PubYear });
            }
            else
                ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
        }
    }
    //protected void Translate_Click(object sender, EventArgs e)
    //{
    //    // subconstant  for Translate  = 8
    //    bool Validate = ValidateControls(new WebControl[] { TranslateName });

    //    if (Validate)
    //    {

    //        if (DataAccess.BookPersonAddEdit("", TranslateName.Text, "8", Label1.Text, UserID, UserID) > 0)
    //        {

    //            ShowToast(this, "تم الحفظ بنجاح.", "", "success");
    //            Repeater2.DataBind();
    //            TranslateName.Text = "";
    //        }
    //        else
    //            ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
    //    }
    //}
    //protected void Investigator_Click(object sender, EventArgs e)
    //{
    //    // subconstant  for Investigator  = 6
    //    bool Validate = ValidateControls(new WebControl[] {  PersonName});

    //    if (Validate)
    //    {

    //        if (DataAccess.BookPersonAddEdit("", PersonName.Text, "6", Label1.Text, UserID, UserID) > 0)
    //        {

    //            ShowToast(this, "تم الحفظ بنجاح.", "", "success");
    //            Repeater3.DataBind();
    //            PersonName.Text = "";
    //        }
    //        else
    //            ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");

    //    }
    //}
    protected void Author_Click(object sender, EventArgs e)
    {
        // subconstant  for Author  = 5
        bool Validate = ValidateControls(new WebControl[] {  Author});

        if (Validate)
        {
            if (DataAccess.BookPersonAddEdit("", Author.Text, DropDownList1.SelectedValue, Label1.Text, UserID, UserID) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                Repeater4.DataBind();
                Author.Text = "";
            }
            else
                ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)ri.FindControl("Label2")).Text;
        if (((Button)ri.FindControl("lbEdit")).Text == "تحرير")
        {
           
            ((DropDownList)ri.FindControl("DropDownList11")).Enabled = true;
            ((TextBox)ri.FindControl("TextBox2")).Enabled = true;
            ((Button)ri.FindControl("lbEdit")).Text = "حفظ";
        }
        else if (((Button)ri.FindControl("lbEdit")).Text == "حفظ")
        {
            if (DataAccess.BookPersonAddEdit(ID, ((TextBox)ri.FindControl("TextBox2")).Text, ((DropDownList)ri.FindControl("DropDownList11")).SelectedValue, Label1.Text, UserID, UserID) > 0)
            {

                ShowToast(this, "تم التعديل بنجاح.", "", "success");
                Repeater4.DataBind();
                ((Button)ri.FindControl("lbEdit")).Text = "تحرير";
            }
            else
                ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
        }

    }

    protected void lbEdit2_Click(object sender, EventArgs e)
    {

        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)ri.FindControl("Label2")).Text;
        if (((Button)ri.FindControl("lbEdit")).Text == "تحرير")
        {

            ((TextBox)ri.FindControl("TextBox1")).Enabled = true;
            ((TextBox)ri.FindControl("TextBox2")).Enabled = true;
            ((TextBox)ri.FindControl("TextBox3")).Enabled = true;
            ((Button)ri.FindControl("lbEdit")).Text = "حفظ";
        }
        else if (((Button)ri.FindControl("lbEdit")).Text == "حفظ")
        {
            if (DataAccess.PublisherAddEdit(ID, ((TextBox)ri.FindControl("TextBox1")).Text, ((TextBox)ri.FindControl("TextBox2")).Text, ((TextBox)ri.FindControl("TextBox3")).Text, Label1.Text, UserID, UserID) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                Repeater1.DataBind();

                EmptyControls(new WebControl[] { PubName, PubPlace, PubYear });
            }
            else
                ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session["ID"] = null;
        EmptyControls(new WebControl[] { Label1, EntryDate, PublicID, DDCat, PublicID, DDCat, Barcode, DDType, Title1, Width, Height, CopyCount, SubjectHead, BookPlace, BookSummary, Tdmak, Attach, Edition, SeriesNo, SeriesTitle, Title2, Title3, Explain, FolderCount, FolderNo, Notes });
                   
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["BookID"] = Label1.Text;
        Response.Redirect("PeriodicDetailsAddEdit.aspx");
    }
    protected void DDType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDType.SelectedValue == "3") per.Visible = true;
        else per.Visible = false;
    }
}