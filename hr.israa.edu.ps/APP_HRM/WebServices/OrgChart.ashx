<%@ WebHandler Language="C#" Class="OrgChart" %>
using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class OrgChart : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        System.Web.Script.Serialization.JavaScriptSerializer oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        string sJSON = oSerializer.Serialize(GetDepartment());
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

    public Department GetDepartment()
    {
        DataTable DT = DataAccess.DepartmentGet(1);
        Department department = new Department()
        {
            id = DT.Rows[0]["id"].ToString(),
            name = DT.Rows[0]["name"].ToString(),
            title = DT.Rows[0]["title"].ToString(),
            children = GetDepartmentChildren(1)
        };
        return department;
    }

    public List<Department> GetDepartmentChildren(int DepartmentID)
    {
        List<Department> departments = new List<Department>();
        DataTable DT = DataAccess.GetDepartmentChildren(DepartmentID);
        if (DT.Rows.Count > 0)
        {
            foreach (DataRow row in DT.Rows)
            {
                departments.Add(new Department()
                {
                    id = row["id"].ToString(),
                    name = row["name"].ToString(),
                    title = row["title"].ToString(),
                    children = GetDepartmentChildren(Convert.ToInt32(row["id"].ToString()))
                });
            }
            return departments;
        }
        else {
            return new List<Department>();
        }
    }
}