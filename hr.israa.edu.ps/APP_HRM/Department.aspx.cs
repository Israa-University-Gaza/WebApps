using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Department : UserPage
{
    int EmpID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
            //DT = DataAccess.Employee_TB_Get(HiddenField1.Value);

            //txtEmpID.Text = DT.Rows[0]["Ar_F_Name"].ToString();
           
        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
       string id = ((Label)ri.FindControl("DepartmentID")).Text;
        DataTable DT = DataAccess.Department_TB_Get(id);
        txtName.Text = DT.Rows[0]["Ar_Name"].ToString();
        //txtEmpID.Text = DT.Rows[0]["managerID"].ToString();
        DropDownList1.SelectedValue = DT.Rows[0]["PID"].ToString();
        DepType.SelectedValue = DT.Rows[0]["DepTypeID"].ToString();
        TextBox1.Text = DT.Rows[0]["En_Name"].ToString();
        cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
        lblDepID.Text = id;
     //   HiddenField1.Value = DT.Rows[0]["managerID"].ToString();
     //   DT = DataAccess.Employee_TB_Get(HiddenField1.Value);

      //if( DT.Rows[0]["managerID"].ToString()!=null) EmpName.SelectedValue = DT.Rows[0]["managerID"].ToString();


      
    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("DepartmentID")).Text;

        if (DataAccess.Department_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtName }))
        {
            if (DataAccess.Department_TB_AddEdit(lblDepID.Text, txtName.Text, TextBox1.Text,Convert.ToInt16( EmpName.SelectedValue),
                cbActive.Checked, Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(DepType.SelectedValue), Convert.ToInt16(UserID), (Session["Department_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Session["Department_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { txtName, lblDepID, TextBox1,cbActive });
                Repeater1.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblDepID, txtName, TextBox1, cbActive,DropDownList1,EmpName,DepType });
        txtName.Text = "";
        TextBox1.Text = "";
    }

  


    public DataTable DT { get; set; }
}