using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_UploaadEmpFiles : UserPage
{
    string SSNPhoto1 = "", BirthPhoto1 = "", MarriedPhoto1 = "", SonsPhoto1 = "", OthersPhoto1 = "";
    string SonsPhoto2 = "";
    string OthersPhoto2 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UploadEmpID"] != null)
        {
            Label1.Text = Session["UploadEmpID"].ToString();
            EmpName.SelectedValue = Label1.Text;
            EmpName.Enabled = false;
        }

        //Edit File photo
        if(Session["FilesID"]!=null)
        {
            DataTable DT = DataAccess.EmpFileGetID(Session["FilesID"].ToString());
            if(DT.Rows.Count>0)
            {
                EmpName.SelectedValue=DT.Rows[0]["Emp_ID"].ToString();
                SSNPhoto1 =  DT.Rows[0]["SSNPhoto"].ToString();
                BirthPhoto1 = DT.Rows[0]["BirthPhoto"].ToString();
                MarriedPhoto1 = DT.Rows[0]["MarriedPhoto"].ToString();
                SonsPhoto2 = DT.Rows[0]["SonsPhoto"].ToString();
                OthersPhoto2 = DT.Rows[0]["OthersPhoto"].ToString();
                
            }
        }
    }

    protected void UploadFiles_Click(object sender, EventArgs e)
    {
        string EmpFile = EmpName.SelectedValue;//special folder for employee named EmployeeNo to store data of this employee
      
       
        // new folder for employee
        String path = Server.MapPath("../EmpFiles/"+EmpFile);
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }


        if (SSNPhoto.PostedFile.ContentType.Contains("image"))
        {
            SSNPhoto1 = Guid.NewGuid() + System.IO.Path.GetExtension(SSNPhoto.FileName);
            SSNPhoto.SaveAs(MapPath("../EmpFiles/") + EmpFile + "/" + SSNPhoto1);
        }

        if (BirthPhoto.PostedFile.ContentType.Contains("image"))
        {
            BirthPhoto1 = Guid.NewGuid() + System.IO.Path.GetExtension(SSNPhoto.FileName);
            BirthPhoto.SaveAs(MapPath("../EmpFiles/") + EmpFile + "/" + BirthPhoto1);
        }

         if (MarriedPhoto.PostedFile.ContentType.Contains("image"))
        {

            MarriedPhoto1 = Guid.NewGuid() + System.IO.Path.GetExtension(SSNPhoto.FileName);
            MarriedPhoto.SaveAs(MapPath("../EmpFiles/") + EmpFile + "/" + MarriedPhoto1);
        }

        if (SonsPhoto.HasFile)
        {
            if (SonsPhoto.PostedFile.ContentType.Contains("image"))
            {
             
                HttpFileCollection uploads = HttpContext.Current.Request.Files;
                for (int i = 0; i < uploads.Count; i++)
                {
                    HttpPostedFile upload = uploads[i];

                    if (upload.ContentLength == 0)
                        continue;

                    SonsPhoto1 = System.IO.Path.GetFileName(upload.FileName);
                    SonsPhoto2 += SonsPhoto1 + ",";
                    try
                    {
                       
                        upload.SaveAs(MapPath("../EmpFiles/") + EmpFile + "/" + SonsPhoto1);
                      

                    }
                    catch (Exception Exp)
                    {
                        // Handle Errors
                    }
                }
            }
        }


        //others
        if (OthersPhoto.HasFile)
        {
            if (OthersPhoto.PostedFile.ContentType.Contains("image"))
            {
                HttpFileCollection uploads = HttpContext.Current.Request.Files;
                for (int i = 0; i < uploads.Count; i++)
                {
                    HttpPostedFile upload = uploads[i];

                    if (upload.ContentLength == 0)
                        continue;

                    OthersPhoto1 = System.IO.Path.GetFileName(upload.FileName);
                    OthersPhoto2 += OthersPhoto1 + ",";
                    try
                    {
                     
                        upload.SaveAs(MapPath("../EmpFiles/") + EmpFile + "/" + OthersPhoto1);
                 

                    }
                    catch (Exception Exp)
                    {
                        // Handle Errors
                    }
                }
            }
        }

        //Now insert into DataBase 

        if (DataAccess.EmpFile_TB_AddEdit((Session["FilesID"] == null) ? "" : Session["FilesID"].ToString(), SSNPhoto1, BirthPhoto1, MarriedPhoto1, SonsPhoto2, OthersPhoto2, Convert.ToInt16(EmpName.SelectedValue), Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
             {
                 ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                 Repeater2.DataBind();
                 Session["FilesID"] = null;
             }
             else
             {
                 ShowToast(this, "عذرًا موجود مسبقا.", "", "error");
             }
    }

    protected void btn1Filter_Click(object sender, EventArgs e)
    {
        Repeater2.DataBind();
    }
    protected void EmptyFields_Click(object sender, EventArgs e)
    {
        Session["FilesID"] = null;
        EmptyControls(new WebControl[] { SSNPhoto,BirthPhoto,MarriedPhoto,SonsPhoto,OthersPhoto});
    }
    protected void lbEdit2_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["FilesID"] = ((Label)ri.FindControl("ID")).Text;
        Response.Redirect("UploaadEmpFiles.aspx");
        
    }
    protected void lbDelete2_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
        if (DataAccess.EmpFileDelete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
   }

    protected void LbView_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["FileEmpID"] = ((Label)ri.FindControl("EmpID")).Text;
        Response.Redirect("EmpFilesView.aspx"); 
    }
}