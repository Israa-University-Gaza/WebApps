using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SendMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        MessageHub.SendMessage(ddlSendTo.SelectedValue, txtTitle.Text, txtMsg.Text, rblMsgType.SelectedValue);
        Label1.Text = "تم بنجاح ارسال " + txtTitle.Text;
    }
}