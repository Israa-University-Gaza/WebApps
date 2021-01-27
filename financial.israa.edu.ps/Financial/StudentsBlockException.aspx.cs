using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_StudentsBlockException : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //string checkAllScript = "$('#selectAll').click(function (e) {$(this).closest('table').find('td input:checkbox').prop('checked', this.checked);});";
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "temp", "<script language='javascript'>" + checkAllScript + "</script>", false);
    }


    protected void chActivate_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("id")).Text;
        DataTable DT = DataAccess.StudentBlockExceptionActive(id, ((CheckBox)item.FindControl("chActivate")).Checked, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {

        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("id")).Text;
        DataTable DT = DataAccess.StudentBlockExceptionDelete(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    //protected void lbActivateAll_Click(object sender, EventArgs e)
    //{
    //    int c = 0, s = 0, f = 0;

    //    foreach (ListViewItem li in ListView1.Items)
    //    {
    //        string ID = ((Label)li.FindControl("ID")).Text;
    //        if (((CheckBox)li.FindControl("cbAdopt")).Checked)
    //        {
    //            c++;

    //            DataTable DT = DataAccess.StudentBlockExceptionActive(ID, true, EmployeeID);
    //            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
    //                s++;
    //            else
    //                f++;

    //        }
    //    }
    //    ShowToast(this, " تم تفعيل " + s + " ولم يتم تفعيل" + f + " من أصل " + c, "", (f == 0) ? "success" : "error");
    //    ListView1.DataBind();

    //}


    protected void DataBind_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();

    }
}