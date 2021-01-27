using System;
using System.Xml;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Web.UI.WebControls;

public partial class Admission_EmailManagment : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtEmail, txtPassword }))
        {
            Request request = new Request();
            XmlDocument doc = CreatePacket(txtEmail.Text, txtPassword.Text);
            XmlDocument result = request.Send(doc);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    private static bool RemoteCertificateValidation(object sender, Org.BouncyCastle.X509.X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
    {
        if (sslPolicyErrors != SslPolicyErrors.RemoteCertificateNotAvailable)
            return true;

        Console.WriteLine("Certificate error: {0}", sslPolicyErrors);
        return false;
    }


    static XmlDocument CreatePacket(string email, string pass)
    {

        XmlDocument doc = new XmlDocument();

        XmlDeclaration xmlDeclaration = doc.CreateXmlDeclaration("1.0", "UTF-8", null);
        XmlElement root = doc.DocumentElement;
        doc.InsertBefore(xmlDeclaration, root);

        XmlElement packet = doc.CreateElement(string.Empty, "packet", string.Empty);
        doc.AppendChild(packet);

        XmlElement mail = doc.CreateElement(string.Empty, "mail", string.Empty);
        packet.AppendChild(mail);

        XmlElement create = doc.CreateElement(string.Empty, "create", string.Empty);
        mail.AppendChild(create);

        XmlElement filter = doc.CreateElement(string.Empty, "filter", string.Empty);
        create.AppendChild(filter);

        XmlElement siteid = doc.CreateElement(string.Empty, "site-id", string.Empty);
        XmlText text1 = doc.CreateTextNode("1");
        siteid.AppendChild(text1);
        filter.AppendChild(siteid);

        XmlElement mailname = doc.CreateElement(string.Empty, "mailname", string.Empty);
        filter.AppendChild(mailname);

        XmlElement name = doc.CreateElement(string.Empty, "name", string.Empty);
        XmlText text2 = doc.CreateTextNode(email);
        name.AppendChild(text2);
        mailname.AppendChild(name);

        XmlElement mailbox = doc.CreateElement(string.Empty, "mailbox", string.Empty);
        mailname.AppendChild(mailbox);

        XmlElement enabled = doc.CreateElement(string.Empty, "enabled", string.Empty);
        enabled.AppendChild(doc.CreateTextNode("true"));
        mailbox.AppendChild(enabled);

        XmlElement quota = doc.CreateElement(string.Empty, "quota", string.Empty);
        quota.AppendChild(doc.CreateTextNode("1024000"));
        mailbox.AppendChild(quota);

        XmlElement password = doc.CreateElement(string.Empty, "password", string.Empty);
        mailname.AppendChild(password);

        XmlElement value = doc.CreateElement(string.Empty, "value", string.Empty);
        value.AppendChild(doc.CreateTextNode(pass));
        password.AppendChild(value);

        XmlElement type = doc.CreateElement(string.Empty, "type", string.Empty);
        type.AppendChild(doc.CreateTextNode("plain"));
        password.AppendChild(type);

        XmlElement antivir = doc.CreateElement(string.Empty, "antivir", string.Empty);
        XmlText text4 = doc.CreateTextNode("inout");
        antivir.AppendChild(text4);
        mailname.AppendChild(antivir);

        return doc;
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtEmail, txtPassword });
    }
}