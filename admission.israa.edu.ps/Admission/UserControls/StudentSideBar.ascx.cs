using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admission_UserControls_StudentSideBar : System.Web.UI.UserControl
{
    private string _ActiveTab;
    public string ActiveTab
    {
        get
        {
            return _ActiveTab;
        }
        set
        {
            _ActiveTab = value;
            OpenTab(value);

        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                UserPage userPage = new UserPage();
                lblEmployeeID.Text = userPage.EmployeeID;
                if (Request.QueryString["id"] != null)
                {
                    DataTable DT2 = DataAccess.GetStudentData(Request.QueryString["id"].ToString());
                    lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                    lblGraduationStatusID.Text = DT2.Rows[0]["GraduationStatusID"].ToString();
                    DataTable DT1 = DataAccess.GetEmployeeData(userPage.EmployeeID);
                    lblEmployeeName.Text = DT1.Rows[0]["DisplayName"].ToString();

                    lblStudentID.Text = Request.QueryString["id"].ToString();
                    DataTable DT = DataAccess.StudentImageGet(lblStudentID.Text);
                    if (DT.Rows.Count > 0)
                    {
                        if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                        {
                            byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                            string imgString = Convert.ToBase64String(imgBytes);
                            image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                        }
                        else
                        {
                            image.Src = "../images/std.jpg";
                        }
                    }
                }
                else
                    Response.Redirect("~/Admission/Students.aspx");
                if (Request.QueryString["tab"] != null)
                {
                    int tab = Convert.ToInt32(Request.QueryString["tab"]);
                    OpenTab(tab);
                }

            }
            catch (Exception ex)
            {
                Response.Redirect("~/Admission/Students.aspx");
            }

            // LinkButton10_OnClick(LinkButton10, EventArgs.Empty);
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Admission/Students.aspx");
        }
    }


    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {

            //Button btn = (Button)sender;
            //Response.Redirect("~/Admission/StudentTest.aspx?id=" + DT.Rows[0]["StudentID"].ToString() + "&tab=" + btn.CommandArgument.ToString());
            Response.Redirect("~/Admission/Student.aspx?id=" + DT.Rows[0]["StudentID"].ToString());
        }
        else
        {
            //todo islam: show msg
            // UserPage.ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
    }

    protected void LinkRedirect(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;

        Response.Redirect("~/Admission/Student.aspx?id=" + lblStudentID.Text + "&tab=" + btn.CommandArgument.ToString());



    }
    void OpenTab(int i)
    {


        litab1.Attributes.Add("class", (i == 1) ? "active" : "");
        litab2.Attributes.Add("class", (i == 2) ? "active" : "");
        litab3.Attributes.Add("class", (i == 3) ? "active" : "");
        litab4.Attributes.Add("class", (i == 4) ? "active" : "");
        litab5.Attributes.Add("class", (i == 5) ? "active" : "");
        litab6.Attributes.Add("class", (i == 6) ? "active" : "");
        litab7.Attributes.Add("class", (i == 7) ? "active" : "");
        litab8.Attributes.Add("class", (i == 8) ? "active" : "");
        litab9.Attributes.Add("class", (i == 9) ? "active" : "");
        litab10.Attributes.Add("class", (i == 10) ? "active" : "");
        litab11.Attributes.Add("class", (i == 11) ? "active" : "");
        litab12.Attributes.Add("class", (i == 12) ? "active" : "");
        litab13.Attributes.Add("class", (i == 13) ? "active" : "");
        litab14.Attributes.Add("class", (i == 14) ? "active" : "");
        litab16.Attributes.Add("class", (i == 16) ? "active" : "");
        //litab20.Attributes.Add("class", (i == 20) ? "active" : "");
        litab21.Attributes.Add("class", (i == 21) ? "active" : "");
        //litab22.Attributes.Add("class", (i == 22) ? "active" : "");
        litab23.Attributes.Add("class", (i == 23) ? "active" : "");

    }

    void OpenTab(string LiId)
    {
        ((HtmlControl)FindControl(LiId)).Attributes.Add("class", "active");
        ((HtmlControl)FindControl("litab1")).Attributes.Add("class", "");


    }


}