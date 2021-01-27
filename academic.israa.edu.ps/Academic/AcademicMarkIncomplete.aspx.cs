using System;
using System.Data;
using System.IO;
using System.Net;
using System.Web.UI.WebControls;
public partial class Academic_AcademicMarkIncomplete : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("AcademicSectionStudentsMarks"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnAcceptFinalMarkIncomplete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string FinalMarkIncompleteID = ((Label)item.FindControl("FinalMarkIncompleteID")).Text;
        string StudentID = ((Label)item.FindControl("StudentID")).Text;
        DataTable DT = DataAccess.AcceptFinalMarkIncomplete(FinalMarkIncompleteID, EmployeeID);

        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + StudentID + "&stdSemesterId=&accreditationStatusEnum=1";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        ListView1.DataBind();

    }


}