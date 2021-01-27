using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Contract_Emp : UserPage
{
    int EmpID; // int EmpID2;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //departmentID
        int departmentID;
        if (section.SelectedValue != "-1") departmentID = Convert.ToInt16(section.SelectedValue);
        else if (Department.SelectedValue != "-1") departmentID = Convert.ToInt16(Department.SelectedValue);
        else if (DDL.SelectedValue != "-1") departmentID = Convert.ToInt16(DDL.SelectedValue);
        else if (Unite.SelectedValue != "-1") departmentID = Convert.ToInt16(Unite.SelectedValue);
        else departmentID = Convert.ToInt16(ddlPresident.SelectedValue);


        bool validate = ValidateControls(new WebControl[] { Employee, JobTitle, Con_Type_ID, AttType, MainSalary, (AttType.SelectedValue == "2055") ? DropDownList1 : null, ddlCurrencyID });
        bool DateValidate = DateValidateControls(new WebControl[] { !(Con_Type_ID.SelectedValue == "8") ? SDate : null, (Con_Type_ID.SelectedValue == "8") || (Con_Type_ID.SelectedValue == "1") ? null : FDate, (TestFrom.Text != "") ? TestFrom : null, (TestTo.Text != "") ? TestTo : null });
        bool DecimalValidate = DecimalValidateControls(new WebControl[] { MainSalary });
        if (DecimalValidate && validate && DateValidate)
        {

            DataTable DT = DataAccess.Contract_Emp_TB_AddEdit(Label1.Text, Employee.SelectedValue,
                Convert.ToInt16(JobTitle.SelectedValue), departmentID,
                Convert.ToInt16(Con_Type_ID.SelectedValue),ddlSubContractType.SelectedValue,
                 Convert.ToDecimal(MainSalary.Text), ddlCurrencyID.SelectedValue,
                 Convert.ToInt16(AttType.SelectedValue), (AttType.SelectedValue == "2055") ? Convert.ToInt16(DropDownList1.SelectedValue) : 0,
                 (Con_Type_ID.SelectedValue != "8") ? (Convert.ToDateTime(SDate.Text).ToString()) : "",
                 (Con_Type_ID.SelectedValue == "8") || (Con_Type_ID.SelectedValue == "1") ? "" : (Convert.ToDateTime(FDate.Text).ToString()), TestFrom.Text, TestTo.Text,lblIsRenew.Text,PID.Text, Convert.ToInt16(UserID), Convert.ToInt16(UserID));
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {

                Session["Contract_ID"] = null;

                EmptyControls(new WebControl[] { !(Con_Type_ID.SelectedValue == "8") ? SDate : null, !(Con_Type_ID.SelectedValue == "8") ? FDate : null, Department, Employee, JobTitle, Con_Type_ID, AttType, MainSalary, ddlCurrencyID, (AttType.SelectedValue == "2055") ? DropDownList1 : null, TestFrom, TestTo,PID,lblIsRenew });
                Repeater2.DataBind();
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { !(Con_Type_ID.SelectedValue == "8") ? SDate : null, !(Con_Type_ID.SelectedValue == "8") ? FDate : null, Department, JobTitle, Con_Type_ID, AttType, MainSalary, (AttType.SelectedValue == "2055") ? DropDownList1 : null, TestFrom, TestTo });

    }

    protected void lbEdit_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Label1.Text = ((Label)ri.FindControl("ContractID")).Text;

        DataTable DT = DataAccess.Contract_Emp_TB_Get(Label1.Text);
        Con_Type_ID.SelectedValue = DT.Rows[0]["Contract_Type_ID"].ToString();
        ddlSubContractType.DataBind();
        if (Con_Type_ID.SelectedValue == "7") subtype.Visible = true;
        ddlSubContractType.SelectedValue = DT.Rows[0]["SubContractTypeID"].ToString();
        Unite.DataBind();
        Unite.SelectedValue = DT.Rows[0]["Unit"].ToString();
        DDL.DataBind();
        DDL.SelectedValue = DT.Rows[0]["DDl"].ToString();
        Department.DataBind();
        Department.SelectedValue = DT.Rows[0]["Department"].ToString();
        section.DataBind();
        section.SelectedValue = DT.Rows[0]["section"].ToString();
        section.DataBind();
        Employee.DataBind();
        JobTitle.DataBind();
        try { JobTitle.SelectedValue = DT.Rows[0]["Job_Title_ID"].ToString(); }
        catch { }
        Employee.DataBind();
        try { Employee.SelectedValue = DT.Rows[0]["Emp_ID"].ToString(); }
        catch { }
        // cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
        SDate.Text = DT.Rows[0]["Date_Begin_Job1"].ToString();
        FDate.Text = DT.Rows[0]["Date_End_Job1"].ToString();
        TestFrom.Text = DT.Rows[0]["TestFrom1"].ToString();
        TestTo.Text = DT.Rows[0]["TestTo1"].ToString();
        MainSalary.Text = Math.Round((Convert.ToDecimal(DT.Rows[0]["Main_Salary"])), 2).ToString();
        if (DT.Rows[0]["CurrencyTypeID"] != null) ddlCurrencyID.SelectedValue = DT.Rows[0]["CurrencyTypeID"].ToString();

        // SDate.Text= (DT.Rows[0]["Date_Begin_Job"].ToString()=="")? SDate.Text : Convert.ToDateTime(DT.Rows[0]["Date_Begin_Job"]).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
        // FDate.Text =  (DT.Rows[0]["Date_End_Job"].ToString() == "")? FDate.Text: Convert.ToDateTime(DT.Rows[0]["Date_End_Job"]).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);

        DataTable DT2 = DataAccess.Employee_TB_Get(DT.Rows[0]["Emp_ID"].ToString());
        if (DT.Rows[0]["Contract_Type_ID"].ToString() == "1")
        {
            Lbdate.Text = "تاريخ التعيين";
            LbEndDate.Visible = false;
            FDate.Visible = false;
            FEnd.Visible = false;
        }

        if (DT2.Rows[0]["Attendance_Type_ID"].ToString() == "2055")
        {
            Div1.Visible = true;
            AttType.SelectedValue = DT2.Rows[0]["Attendance_Type_ID"].ToString();
            DropDownList1.SelectedValue = DT2.Rows[0]["Attendance_Constant_ID"].ToString();
        }
        else Div1.Visible = false;

    }
 protected void lbDelete_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ContractID")).Text;

        if (DataAccess.Contract_Emp_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }
    protected void AttType_TextChanged(object sender, EventArgs e)
    {
        if (AttType.SelectedValue != "2055")
            Div1.Visible = false;
        else Div1.Visible = true;
    }
    protected void Con_Type_ID_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Con_Type_ID.SelectedValue == "7") subtype.Visible = true; else subtype.Visible = false;
        if (Con_Type_ID.SelectedValue == "1")
        {
            Lbdate.Text = "تاريخ التعيين";
            LbEndDate.Visible = false;
            FDate.Visible = false;
            FEnd.Visible = false;
        }
        else
        {

            Lbdate.Text = "تاريخ بدء العقد";
            LbEndDate.Visible = true;
            FDate.Visible = true;
            FEnd.Visible = true;
        }


        if (Con_Type_ID.SelectedValue == "8")
        {
            specail.Visible = false;

        }
        else
        {
            specail.Visible = true;
        }
    }

    protected void Deactivate_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("ContractID")).Text;
        bool active = ((CheckBox)ri.FindControl("CheckBox1")).Checked;
        DataTable DT=DataAccess.ActivateDeActivateEmpContract(id, active);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
           
            Repeater2.DataBind();
       
    }
 
    protected void Unite_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDL.DataBind();
        Department.DataBind();
        section.DataBind();
        JobTitle.DataBind();
        Employee.DataBind();
    }
    protected void DDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        Department.DataBind();
        section.DataBind();
        JobTitle.DataBind();
        Employee.DataBind();
    }
    protected void Department_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        section.DataBind();
        JobTitle.DataBind();
        Employee.DataBind();
    }
    protected void section_SelectedIndexChanged(object sender, EventArgs e)
    {
        JobTitle.DataBind();
        Employee.DataBind();
    }
    protected void Employee_SelectedIndexChanged(object sender, EventArgs e)
    {
        JobTitle.DataBind();
    }
    protected void lbRenew_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id= ((Label)ri.FindControl("ContractID")).Text;
        Label1.Text = "";
        lblIsRenew.Text = "1";
        PID.Text = id;
        DataTable DT = DataAccess.Contract_Emp_TB_Get(id);
        Con_Type_ID.SelectedValue = DT.Rows[0]["Contract_Type_ID"].ToString();
        ddlSubContractType.DataBind();
        if (Con_Type_ID.SelectedValue == "7") subtype.Visible = true;
         ddlSubContractType.SelectedValue = DT.Rows[0]["SubContractTypeID"].ToString();
        Unite.DataBind();
        Unite.SelectedValue = DT.Rows[0]["Unit"].ToString();
         DDL.DataBind();
        DDL.SelectedValue = DT.Rows[0]["DDl"].ToString();
       Department.DataBind();
        Department.SelectedValue = DT.Rows[0]["Department"].ToString();
        section.DataBind();
        section.SelectedValue = DT.Rows[0]["section"].ToString();
        
        Employee.DataBind();
       JobTitle.DataBind();
        try { JobTitle.SelectedValue = DT.Rows[0]["Job_Title_ID"].ToString(); }
        catch { }
        Employee.DataBind();
        try { Employee.SelectedValue = DT.Rows[0]["Emp_ID"].ToString(); }
        catch { }
        // cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
        SDate.Text = DT.Rows[0]["Date_Begin_Job1"].ToString();
        FDate.Text = DT.Rows[0]["Date_End_Job1"].ToString();
        TestFrom.Text = DT.Rows[0]["TestFrom1"].ToString();
        TestTo.Text = DT.Rows[0]["TestTo1"].ToString();
        MainSalary.Text = Math.Round((Convert.ToDecimal(DT.Rows[0]["Main_Salary"])), 2).ToString();
        if (DT.Rows[0]["CurrencyTypeID"] != null) ddlCurrencyID.SelectedValue = DT.Rows[0]["CurrencyTypeID"].ToString();

        // SDate.Text= (DT.Rows[0]["Date_Begin_Job"].ToString()=="")? SDate.Text : Convert.ToDateTime(DT.Rows[0]["Date_Begin_Job"]).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
        // FDate.Text =  (DT.Rows[0]["Date_End_Job"].ToString() == "")? FDate.Text: Convert.ToDateTime(DT.Rows[0]["Date_End_Job"]).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);

        DataTable DT2 = DataAccess.Employee_TB_Get(DT.Rows[0]["Emp_ID"].ToString());
        if (DT.Rows[0]["Contract_Type_ID"].ToString() == "1")
        {
            Lbdate.Text = "تاريخ التعيين";
            LbEndDate.Visible = false;
            FDate.Visible = false;
            FEnd.Visible = false;
        }

        if (DT2.Rows[0]["Attendance_Type_ID"].ToString() == "2055")
        {
            Div1.Visible = true;
            AttType.SelectedValue = DT2.Rows[0]["Attendance_Type_ID"].ToString();
            DropDownList1.SelectedValue = DT2.Rows[0]["Attendance_Constant_ID"].ToString();
        }
        else Div1.Visible = false;
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        Repeater2.DataBind();
    }
    protected void Empstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater2.DataBind();
    }
    protected void ddlEmpCategoryID_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater2.DataBind();
    }
    protected void IsIllusory_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("ContractID")).Text;
        bool IsIllusory = ((CheckBox)ri.FindControl("IsIllusory")).Checked;
        DataTable DT = DataAccess.IllusoryEmpContract(id, IsIllusory);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

        Repeater2.DataBind();
    }
}