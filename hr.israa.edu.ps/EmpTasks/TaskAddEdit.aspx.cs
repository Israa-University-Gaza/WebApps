using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmpTasks_TaskAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            EmpID.Text = UserID;
            Date.Text = DateTime.Now.ToString("yyyy/MM/dd");
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        bool valid = ValidateControls(new WebControl[] { Date, TaskName, TaskStatus });
        bool DateValid = DateValidateControls(new WebControl[] { Date });
        if (valid)
        {
            if (DateValid)
            {

                DataTable DT = DataAccessTasks.AddTasks(lblTaskID.Text, TaskName.Text, UserID, TaskStatus.SelectedValue, Convert.ToDateTime(Date.Text), UserID, UserID);
                if (DT.Rows.Count > 0)
                {
                    ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                    ListView1.DataBind();
                    if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                        EmptyControls(new WebControl[] { lblTaskID, TaskName, TaskStatus });
                }

                else
                {
                    ShowToast(this, "لايوجد بيانات صحيحة", "", "error");

                }
            }

            else
            {
                ShowToast(this, "يرجى ادخال التاريخ بشكل صحيح", "", "error");

            }
        }

        else
        {
            ShowToast(this, "بالرجاء ادخال البيانات", "", "error");
        }

    }
    protected void Edit_Click(object sender, EventArgs e)
    {
        ListViewDataItem ri = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("id")).Text;
        DataTable DT = DataAccessTasks.EmployeeTaskGet(id);

        lblTaskID.Text = id;
        TaskName.Text = DT.Rows[0]["TaskText"].ToString();
        Date.Text = Convert.ToDateTime(DT.Rows[0]["Date"].ToString()).ToString("yyyy/MM/dd");
        TaskStatus.DataBind();
        TaskStatus.SelectedValue = DT.Rows[0]["TaskStatusID"].ToString();
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        DataTable DT = DataAccessTasks.DeleteTask(id, UserID);

        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblTaskID, Date, TaskName, TaskStatus });
    }
}
