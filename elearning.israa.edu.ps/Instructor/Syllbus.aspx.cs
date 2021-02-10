using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Announcements : System.Web.UI.Page
{
    eLern r = new eLern();
 SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
            Response.Redirect("../Login.aspx");
        if (!IsPostBack)
        {
            er.Visible = false;




           SqlDataAdapter DA1 = new SqlDataAdapter("SELECT       top 1  semester_id FROM            e_semester", conn);
            DataTable DT1 = new DataTable();
            DA1.Fill(DT1);
            DataTable dt = r.lec_COURS(Session["log"].ToString(), DT1.Rows[0][0].ToString());
            DropDownList2.DataSource = dt;
            DropDownList2.DataValueField = "courseCode";
            DropDownList2.DataTextField = "courseArName";
            DropDownList2.DataBind();
            if (Request.QueryString["crs"] != null)
            {
                DropDownList2.SelectedValue = Request.QueryString["crs"];
                DropDownList2.Enabled = false;
            }

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string image = "defualt.pdf";
        if (FileUpload1.HasFile)
        {
            string[] fname = FileUpload1.FileName.Split('.');
            string ext = fname[fname.Length - 1];
            if (ext.ToLower().Equals("ppt") || ext.ToLower().Equals("pptx") || ext.ToLower().Equals("pdf") || ext.ToLower().Equals("doc") || ext.ToLower().Equals("docx"))
            {
                if (FileUpload1.PostedFile.ContentLength <= 5242880)
                {
                    string newname = DateTime.Now.Ticks.ToString() + "." + ext;
                    image = newname;
                    FileUpload1.SaveAs(Request.PhysicalApplicationPath + "Syllbus/" + image);
                    r.add_syllbus(DropDownList2.SelectedValue, image);
                    Response.Redirect("crs.aspx?crs=" + Request.QueryString["crs"] + "&section=" + Request.QueryString["section"]);
                }
                else
                {
                    er.Visible = true;
                    ertxt.InnerText = "اقصى حجم 5 ميجا";

                }
            }
            else
            {
                er.Visible = true;
                ertxt.InnerText = "امتداد خاطئ";
            }


        }
    }
    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0, new ListItem("اختر", "-1"));
    }


    protected void DropDownList2_TextChanged(object sender, EventArgs e)
    {
        
    }
}
