using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_lec_Coll : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    eLern r = new eLern();
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        coll.Items.Insert(0, new ListItem("اختر", "-1"));
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write(coll.SelectedValue);
        DataTable dt1 = new DataTable();

        dt1.Columns.AddRange(new DataColumn[7] { new DataColumn("Id"), new DataColumn("instructor"), new DataColumn("courseDepartment"), new DataColumn("employeeNo"), new DataColumn("lastLogin"), new DataColumn("count"), new DataColumn("crs_count") });

        dt1.Columns["Id"].AutoIncrement = true;

        dt1.Columns["Id"].AutoIncrementSeed = 1;

        dt1.Columns["Id"].AutoIncrementStep = 1;

  dt = r.coll_lect(coll.SelectedValue);

        for (int i = dt.Rows.Count - 1; i >= 0; i--)
        {
            DataRow dr = dt.Rows[i];
            if (dr["courseDepartment"].ToString() != dept.SelectedItem.Text /*|| dr["crs_count"].ToString() == "0"*/)
                dr.Delete();

        }
        dt.AcceptChanges();

      
       dt= r.RemoveDuplicateRows(dt, "instructor");
        // dt.AcceptChanges();
        //  GridView1.DataSource =dt ;





        // dt.DefaultView.Sort = "count desc";

        DataView dv = dt.DefaultView;
        dv.Sort = "count desc";
       dt = dv.ToTable();

        for (int i=0;i<dt.Rows.Count;i++)
        {
            dt1.Rows.Add(null, dt.Rows[i]["instructor"], dt.Rows[i]["courseDepartment"],dt.Rows[i]["employeeNo"], dt.Rows[i]["lastLogin"], dt.Rows[i]["count"], dt.Rows[i]["crs_count"]);
        }
        
        GridView1.DataSource = dt1;
       

        GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (DataBinder.Eval(e.Row.DataItem, "employeeNo") != null)
        //{

        
        //    Label crs = (Label)e.Row.FindControl("crs");
        //string employeeNo = DataBinder.Eval(e.Row.DataItem, "employeeNo").ToString();
           
        //    DataTable dt1 = r.lec_COURS(employeeNo, "20");
        //    r.RemoveDuplicateRows(dt1, "courseArName");

        //    for (int i = dt1.Rows.Count - 1; i >= 0; i--)
        //    {
        //        DataRow dr = dt1.Rows[i];
        //        if (dr["departmentArName"].ToString() != dept.SelectedItem.Text)
        //            dr.Delete();
        //    }
        //    dt1.AcceptChanges();

        //    crs.Text = dt1.Rows.Count.ToString();
        //}
        //    if (DataBinder.Eval(e.Row.DataItem, "courseDepartment") != null)
        //    {
        //        string courseDepartment = DataBinder.Eval(e.Row.DataItem, "courseDepartment").ToString();

        //        if (courseDepartment != dept.SelectedItem.Text)
        //        {
        //            e.Row.Visible = false;
        //        }
        //    }
    }
    protected DataTable dt { get; set; }
    
}