using System;
using System.Net;
using System.Xml;
using System.Xml.Schema;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Web.UI.WebControls;

public partial class IsraaEmail : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {

    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("EmployeeEmailID")).Text;
        string email = ((Label)item.FindControl("Email")).Text;

        Request request = new Request();
        XmlDocument doc = request.DeleteEmail(email);
        XmlNode statusNode = doc.DocumentElement.SelectSingleNode("/packet/mail/remove/result/status");
        XmlNode errcodeNode = doc.DocumentElement.SelectSingleNode("/packet/mail/remove/result/errcode");
        XmlNode errtextNode = doc.DocumentElement.SelectSingleNode("/packet/mail/remove/result/errtext");
        string status = statusNode.InnerText;
        string errcode = "";
        if (status == "ok")
        {
            EmailDataAccess.EmployeeEmailDelete(id, UserID);
            ListView1.DataBind();
            ShowToast(this, "تمت العملية بنجاح", "", "success");
        }
        else
        {
            errcode = errcodeNode.InnerText;
            ShowToast(this, "لم تتم العملية بنجاح : " + errcode, "", "error");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlEmployee, txtEmail, txtPassword }))
        {
            Request request = new Request();
            XmlDocument doc = request.CreateEmail(txtEmail.Text, txtPassword.Text);
            XmlNode statusNode = doc.DocumentElement.SelectSingleNode("/packet/mail/create/result/status");
            XmlNode errcodeNode = doc.DocumentElement.SelectSingleNode("/packet/mail/create/result/errcode");
            XmlNode errtextNode = doc.DocumentElement.SelectSingleNode("/packet/mail/create/result/errtext");
            XmlNode idNode = doc.DocumentElement.SelectSingleNode("/packet/mail/create/result/mailname/id");
            string status = statusNode.InnerText;
            string errcode = "", id = "";
            if (status == "ok")
            {
                id = idNode.InnerText;
                EmailDataAccess.EmployeeEmailAddEdit("", ddlEmployee.SelectedValue, txtNickname.Text, id, txtEmail.Text, txtPassword.Text, UserID);
                ListView1.DataBind();
                EmptyControls(new WebControl[] { ddlEmployee, txtEmail, txtPassword });
                ShowToast(this, "تمت العملية بنجاح" + " : " + id, "", "success");
            }
            else
            {
                errcode = errcodeNode.InnerText;
                string error = (errcode == "1007") ? "عنوان الإيميل موجود مسبقًا" : "";
                ShowToast(this, "لم تتم العملية بنجاح : " + error, "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { ddlEmployee, txtEmail, txtPassword });
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {

    }
}