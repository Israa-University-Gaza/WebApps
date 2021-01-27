using System;
using System.Data;
using System.Web.Services.Description;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Academic.UserControls
{
    public partial class Academic_UserControls_StudentSideBar : System.Web.UI.UserControl
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
                //try
                //{
                UserPage userPage = new UserPage();
                if (!userPage.Permissions.Contains("StudentInfraction"))
                {
                    //li2.Visible = true;
                }
                lblEmployeeID.Text = userPage.EmployeeID;
                if (Request.QueryString["id"] != null)
                {
                    DataTable DT2 = DataAccess.GetStudentData(Request.QueryString["id"].ToString());
                    lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                    lblStdTypeID.Text = DT2.Rows[0]["StdTypeID"].ToString();
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
                    Response.Redirect("~/Academic/Students.aspx");
                if (Request.QueryString["tab"] != null)
                {
                    int tab = Convert.ToInt32(Request.QueryString["tab"]);
                    OpenTab(tab);
                }

                //}
                //catch 
                //{
                //    Response.Redirect("~/Academic/Students.aspx");
                //}

                // LinkButton10_OnClick(LinkButton10, EventArgs.Empty);
            }
            else if (lblStudentID.Text == "")
            {
                Response.Redirect("~/Academic/Students.aspx");
            }
        }


        protected void btnChechStudent_Click(object sender, EventArgs e)
        {
            DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
            if (DT.Rows.Count > 0)
            {
                Response.Redirect("~/Academic/StudentMain.aspx?id=" + DT.Rows[0]["StudentID"].ToString());
            }
            else
            {
                //todo islam: show msg
                // UserPage.ShowToast(this, "رقم الطالب غير صحيح", "", "error");
            }
        }


        void OpenTab(int i)
        {


            // litab1.Attributes.Add("class", (i == 1) ? "active" : "");

            // litab3.Attributes.Add("class", (i == 3) ? "active" : "");

            // litab7.Attributes.Add("class", (i == 7) ? "active" : "");

            // litab10.Attributes.Add("class", (i == 10) ? "active" : "");
            //// litab11.Attributes.Add("class", (i == 11) ? "active" : "");
            // litab12.Attributes.Add("class", (i == 12) ? "active" : "");

            // //litab16.Attributes.Add("class", (i == 16) ? "active" : "");


        }

        void OpenTab(string LiId)
        {
            ((HtmlControl)FindControl(LiId)).Attributes.Add("class", "active");
            ((HtmlControl)FindControl("StudentMain")).Attributes.Add("class", "");


        }


        protected void Link_OnClick(object sender, EventArgs e)
        {

            LinkButton b = (LinkButton)sender;

            string arguments = b.CommandArgument;
            string[] args = arguments.Split(';');
            string page = args[0];
            string tab = args[1];

            string url = page + "?id=" + lblStudentID.Text + (string.IsNullOrWhiteSpace(tab) ? " " : "&tab=" + tab);
            Response.Redirect(url);
        }


    }
}