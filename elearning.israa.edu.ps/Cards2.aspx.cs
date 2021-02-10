using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QRCoder;
using System.IO;
using System.Data;

using System.Text;

public partial class Default2 : System.Web.UI.Page
{
  
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
    //    if (Request.QueryString["coll"] == null)
    //        DataList1.DataSourceID = "SqlDataSource1";
    //    else
    //        DataList1.DataSourceID = "SqlDataSource2";

    //    if (Request.QueryString["dept"] != null)
    //        DataList1.DataSourceID = "SqlDataSource3";

    //    DataList1.DataBind();
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {

    }
}