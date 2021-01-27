using System;
using System.Net;
using System.Text;
using System.IO;
using System.Xml;
using System.Xml.Schema;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
public class Request
{
    public string Hostname = "163.172.31.143";
    public string Login = "admin";
    public string Password = "mA0599409159##";
    public string Protocol = "1.6.7.0";

    public ValidationEventHandler XmlSchemaValidation = null;

    public Request()
    {

    }

    public string AgentEntryPoint { get { return "https://" + Hostname + ":8443/enterprise/control/agent.php"; } }

    public string InputValidationSchema { get { return "https://" + Hostname + ":8443/schemas/rpc/" + Protocol + "/agent_input.xsd"; } }

    public string OutputValidationSchema { get { return "https://" + Hostname + ":8443/schemas/rpc/" + Protocol + "/agent_output.xsd"; } }

    public XmlDocument Send(XmlDocument packet)
    {
        HttpWebRequest request = SendRequest(packet.OuterXml);
        XmlDocument result = GetResponse(request);
        return result;
    }

    public XmlDocument Send(Stream packet)
    {
        using (TextReader reader = new StreamReader(packet))
        {
            return Send(ParseAndValidate(reader, InputValidationSchema));
        }
    }

    public XmlDocument Send(string packetUri)
    {
        using (TextReader reader = new StreamReader(packetUri))
        {
            return Send(ParseAndValidate(reader, InputValidationSchema));
        }
    }

    private HttpWebRequest SendRequest(string message)
    {
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(AgentEntryPoint);

        request.Method = "POST";
        request.Headers.Add("HTTP_AUTH_LOGIN", Login);
        request.Headers.Add("HTTP_AUTH_PASSWD", Password);
        request.ContentType = "text/xml";
        request.ContentLength = message.Length;

        ASCIIEncoding encoding = new ASCIIEncoding();

        byte[] buffer = encoding.GetBytes(message);

        using (Stream stream = request.GetRequestStream())
        {
            stream.Write(buffer, 0, message.Length);
        }

        return request;
    }

    private XmlDocument ParseAndValidate(TextReader xml, string schemaUri)
    {
        XmlSchemaSet schemas = new XmlSchemaSet();

        schemas.Add(null, schemaUri);

        XmlReaderSettings settings = new XmlReaderSettings();
        if (XmlSchemaValidation != null)
            settings.ValidationEventHandler += new ValidationEventHandler(XmlSchemaValidation);

        settings.ValidationType = ValidationType.Schema;
        settings.ValidationFlags |= XmlSchemaValidationFlags.ProcessSchemaLocation;
        settings.Schemas = schemas;

        XmlDocument document = new XmlDocument();

        using (XmlReader reader = XmlTextReader.Create(xml, settings))
        {
            document.Load(reader);
        }
        return document;
    }

    private XmlDocument GetResponse(HttpWebRequest request)
    {
        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())

        using (Stream stream = response.GetResponseStream())

        using (TextReader reader = new StreamReader(stream))
        {
            return ParseAndValidate(reader, OutputValidationSchema);
        }
    }
}
