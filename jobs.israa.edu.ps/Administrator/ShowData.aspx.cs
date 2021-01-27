using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Default2 : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable DT = m.hr_add_emp_get(Convert.ToInt32(Request.QueryString["id"].ToString()));


        name.Text = DT.Rows[0]["n1"] + " " + " " + DT.Rows[0]["n2"] + " " + DT.Rows[0]["n3"] + " " + DT.Rows[0]["n4"];
                
                age.Text = DT.Rows[0]["age"].ToString();
        pob.Text= DT.Rows[0]["dop"].ToString()+" "+ DT.Rows[0]["pob"].ToString();
       
                id.Text = DT.Rows[0]["ID"].ToString();

                p_id.Text = DT.Rows[0]["p_ID"].ToString();
                addres.Text = DT.Rows[0]["addres"].ToString();
                stat.Text = DT.Rows[0]["stat"].ToString();
                tel.Text = DT.Rows[0]["tel"].ToString();
                email.Text = DT.Rows[0]["email"].ToString();
                nat.Text = DT.Rows[0]["nat"].ToString();
                nat1.Text = DT.Rows[0]["nat1"].ToString();
                pob.Text = DT.Rows[0]["pob"].ToString();
                rel.Text = DT.Rows[0]["rel"].ToString();
                n_has.Text = DT.Rows[0]["n_has"].ToString();
                w_has.Text = DT.Rows[0]["w_has"].ToString();
                d_mar.Text = DT.Rows[0]["d_mar"].ToString();
                h_stat.Text = DT.Rows[0]["h_stat"].ToString();
                w_c_type.Text = DT.Rows[0]["w_c_type"].ToString();
                w_c_place.Text = DT.Rows[0]["w_c_place"].ToString();
                w_c_place.Text = DT.Rows[0]["w_c_place"].ToString();
                w_leav.Text = DT.Rows[0]["w_leav"].ToString();
                d_leave.Text = DT.Rows[0]["d_leave"].ToString();
                w_c_date.Text=DT.Rows[0]["w_c_date"].ToString();
        DT= m.hr_emp_Future_exist(Convert.ToInt32(Request.QueryString["id"].ToString()));
        if(DT.Rows.Count>0)
        life.Text= DT.Rows[0][1].ToString();
        
        //gender.SelectedValue = DT.Rows[0]["gender"].ToString();
        img.Src = "ShowImage_p.ashx?id=" + Request.QueryString["id"];

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("Label1") != null)
        {
            Label Label1 = (Label)e.Row.FindControl("Label1");
            Label1.Text = m.maj_get(Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "cer")));
        }
    }
}