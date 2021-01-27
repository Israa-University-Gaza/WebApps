using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_EmpFilesView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FileEmpID"] != null)
        {
            EmpName.SelectedValue = Session["FileEmpID"].ToString();
            ViewPhotoEmp(Session["FileEmpID"].ToString());
        
            
        }
    }
 

    public void ViewPhotoEmp(string EmpName)
    {
        #region ViewPhotos
        DataTable DT = DataAccess.EmpFileGet(EmpName);

        if (DT.Rows.Count > 0)
        {
            SSNPhoto.ImageUrl = "../EmpFiles/" + EmpName + "/" + DT.Rows[0]["SSNPhoto"].ToString();
            BirthPhoto.ImageUrl = "../EmpFiles/" + EmpName + "/" + DT.Rows[0]["BirthPhoto"].ToString();
            MarriedPhoto.ImageUrl = "../EmpFiles/" + EmpName + "/" + DT.Rows[0]["MarriedPhoto"].ToString();
            string[] SonsphotoArray = (DT.Rows[0]["SonsPhoto"].ToString()).Split(',');
            foreach (string photo in SonsphotoArray)
            {
                if (photo != "")
                {
                    Image img = new Image();
                    img.Height = 400; img.Width = 400;
                    img.ImageUrl = "../EmpFiles/" + EmpName + "/" + photo;

                    sons.Controls.Add(img);

                }
            }

            string[] OthersphotoArray = (DT.Rows[0]["OthersPhoto"].ToString()).Split(',');
            foreach (string photo in OthersphotoArray)
            {
                if (photo != "")
                {
                    Image img = new Image();
                    img.Height = 400; img.Width = 400;
                    img.ImageUrl = "../EmpFiles/" + EmpName + "/" + photo;

                    Others.Controls.Add(img);

                }
            }
        }
        #endregion
    }
}