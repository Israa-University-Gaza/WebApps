<%@ WebHandler Language="C#" Class="GetRoomLectures" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;

public class GetRoomLectures : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        System.Web.Script.Serialization.JavaScriptSerializer oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        string sJSON = oSerializer.Serialize(GetOfferdCourseSections(context.Request.QueryString["offerdCourseid"]));

        context.Response.Clear();
        context.Response.ContentType = "application/json; charset=utf-8";
        context.Response.Write(sJSON);
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    public List<Section> GetOfferdCourseSections(string offerdCourseid)
    {
        List<Section> sections = new List<Section>();
        DataTable DT = DataAccess.GetOfferdCourseSections(offerdCourseid, "-1");
        foreach (DataRow row in DT.Rows)
        {
            sections.Add(new Section()
            {
                ID = row["ID"].ToString(),
                SectionNum = row["SectionNum"].ToString(),

            });
        }

        return sections;
    }
}