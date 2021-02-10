using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class d : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(Request.Browser.IsMobileDevice+"<br/>");
        //Response.Write(Request.Browser.MobileDeviceManufacturer + "<br/>");
        //Response.Write(Request.Browser.MobileDeviceModel + "<br/>");
        //Response.Write(Request.Browser.ScreenPixelsWidth + "<br/>");
        //Response.Write(Request.Browser.SupportsXmlHttp + "<br/>");
    }
}