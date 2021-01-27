using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_RoomStudyTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["RoomID"] != null)
            {
              lblRoomID.Text = Session["RoomID"].ToString();
                Session["RoomID"] = null;
                DataTable DT = DataAccess.RoomGet(lblRoomID.Text);
                if(DT.Rows.Count>0)
                RoomName.Text = DT.Rows[0]["Name"].ToString();
            }
        }
    }
}