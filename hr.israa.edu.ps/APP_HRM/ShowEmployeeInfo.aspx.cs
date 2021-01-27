using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Globalization;
using System.Text;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
public partial class APP_HRM_ShowEmployeeInfo : System.Web.UI.Page
{
    string _connStr = ConfigurationManager.ConnectionStrings["HumanResources"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //ddlEmpCategoryID2.SelectedValue = "-1";
           // ddlEmpTermenateReason.SelectedValue = "-1";
            BindTableColumns();
            //for (int i = 1; i < chkEmployeeInfo.Items.Count; i++)
            //{

            //    chkEmployeeInfo.Items[i].Selected = true;
            //}
            Empstatus.SelectedValue = "1041";
            ddlEmpSubStatus.DataSourceID = "SqlDataSource22";
            ddlEmpSubStatus.DataBind();
            ddlEmpSubStatus.SelectedValue = "-1";
        }
      
    }


    private void BindTableColumns()
    {
        DataTable table = new DataTable();
        using (SqlConnection conn = new SqlConnection(_connStr))
        {
            using (SqlCommand cmd = new SqlCommand("sp_columns", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@table_name", "EmployeesDetails");
                using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                {
                    ad.Fill(table);
                }
                chkEmployeeInfo.DataSource = table;
                chkEmployeeInfo.DataBind();
            }
        }
    }

    private void ExportGridToExcel()
    {
        BoundField h = new BoundField();
        h.DataField = "RowNo";
        h.HeaderText = "#";
        GridView1.Columns.Add(h);
        foreach (System.Web.UI.WebControls.ListItem item in chkEmployeeInfo.Items)
        {
         
            if (item.Selected)
            {
                BoundField b = new BoundField();
                b.DataField = item.Value;
                b.HeaderText = item.Value;
                GridView1.Columns.Add(b);
               
            }
        }
       
        //this.GetData();
        // EmployeeList

        DataTable EmpList = new DataTable();
        EmpList.Columns.Add("ID", typeof(Int32));
        foreach (System.Web.UI.WebControls.ListItem item in cblEmployees.Items)
        {
            if (item.Selected)
            {
                EmpList.Rows.Add(item.Value);
            }
        }
        string departmentID;
        if (section.SelectedValue != "-1") departmentID = section.SelectedValue;
        else if (Department.SelectedValue != "-1") departmentID = Department.SelectedValue;
        else if (DDL.SelectedValue != "-1") departmentID = DDL.SelectedValue;
        else if (Unite.SelectedValue != "-1") departmentID = Unite.SelectedValue;
        else departmentID = ddlPresident.SelectedValue;
        DataTable DT = DataAccess.GetEmployeesInfo(txtEmployeeNo.Text, txtArFirstName.Text, txtSecoundName.Text, txtArFamilyName.Text, departmentID,ddlCader.SelectedValue,ddlGrade.SelectedValue,ddlDegree.SelectedValue, ddlJobTitle.SelectedValue, ddlEmpTypeID.SelectedValue, ddlEmpSubTypeID.SelectedValue, ddlEmpCategoryID.SelectedValue, ddlContractTypeID.SelectedValue, ddlSubContractType.SelectedValue, Empstatus.SelectedValue, ddlEmpSubStatus.SelectedValue, ddlAcademicData.SelectedValue, ddlRetirementStatus.SelectedValue, EmpList, Unite.SelectedValue, DDL.SelectedValue, Department.SelectedValue, section.SelectedValue, ddlEmployeeCat.SelectedValue, ddlCurrencyID.SelectedValue);
      
        GridView1.DataSource = DT;
        GridView1.DataBind();

        //// Let's hide all unwanted stuffing    
        this.GridView1.AllowPaging = false;
        this.GridView1.AllowSorting = false;
        this.GridView1.EditIndex = -1;
        this.GridView1.Attributes.Add("dir", "rtl");

        //// Let's bind data to GridView  
        //this.GetData();

        // Let's output HTML of GridView   
        Response.Clear();
        Response.ContentType = "application/vnd.xls";
        Response.AddHeader("content-disposition", "attachment;filename=contacts.xls");
        Response.ContentEncoding = System.Text.Encoding.Unicode;
        Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
        StringWriter swriter = new StringWriter();
        HtmlTextWriter hwriter = new HtmlTextWriter(swriter);

        HtmlForm frm = new HtmlForm();
        this.GridView1.Parent.Controls.Add(frm);
        frm.Attributes["runat"] = "server";
        frm.Controls.Add(this.GridView1);
        frm.RenderControl(hwriter);

        Response.Write(swriter.ToString());
        Response.End();
    }
 
    protected void btExcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {

    }
    protected void btnGenrateReport_Click(object sender, EventArgs e)
    {
        // EmployeeList

        DataTable EmpList = new DataTable();
        EmpList.Columns.Add("ID", typeof(Int32));
        foreach (System.Web.UI.WebControls.ListItem item in cblEmployees.Items)
        {
            if (item.Selected)
            {
                EmpList.Rows.Add(item.Value);
            }
        }
        //SqlParameter parameter = new SqlParameter();
        ////The parameter for the SP must be of SqlDbType.Structured 
        //parameter.ParameterName = "@EmployeeList";
        //parameter.SqlDbType = System.Data.SqlDbType.Structured;
        //parameter.Value = EmpList;

        BoundField h = new BoundField();
        h.DataField = "RowNo";
        h.HeaderText = "#";
        GridView1.Columns.Add(h);

        foreach (System.Web.UI.WebControls.ListItem item in chkEmployeeInfo.Items)
        { 
            if (item.Selected)
            {
                BoundField b = new BoundField();
                b.DataField = item.Value;
                b.HeaderText = item.Value;
                GridView1.Columns.Add(b);
            }
        }
        string departmentID;
        if (section.SelectedValue != "-1") departmentID = section.SelectedValue;
        else if (Department.SelectedValue != "-1") departmentID = Department.SelectedValue;
        else if (DDL.SelectedValue != "-1") departmentID = DDL.SelectedValue;
        else if (Unite.SelectedValue != "-1") departmentID = Unite.SelectedValue;
        else departmentID = ddlPresident.SelectedValue;
        DataTable DT = DataAccess.GetEmployeesInfo(txtEmployeeNo.Text, txtArFirstName.Text, txtSecoundName.Text, txtArFamilyName.Text, departmentID, ddlCader.SelectedValue, ddlGrade.SelectedValue, ddlDegree.SelectedValue, ddlJobTitle.SelectedValue, ddlEmpTypeID.SelectedValue, ddlEmpSubTypeID.SelectedValue, ddlEmpCategoryID.SelectedValue, ddlContractTypeID.SelectedValue, ddlSubContractType.SelectedValue, Empstatus.SelectedValue,ddlEmpSubStatus.SelectedValue, ddlAcademicData.SelectedValue, ddlRetirementStatus.SelectedValue, EmpList, Unite.SelectedValue, DDL.SelectedValue, Department.SelectedValue, section.SelectedValue, ddlEmployeeCat.SelectedValue, ddlCurrencyID.SelectedValue);
        GridView1.DataSource = DT;
        GridView1.DataBind();
    }
    protected void btnEmpView_Click(object sender, EventArgs e)
    {
        EmployeeList.Visible = true;
    }

    protected void Unite_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDL.DataBind();
        Department.DataBind();
        section.DataBind();
        ddlJobTitle.DataBind();
        Employee.DataBind();
    }
    protected void DDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        Department.DataBind();
        section.DataBind();
        ddlJobTitle.DataBind();
        Employee.DataBind();
    }
    protected void Department_SelectedIndexChanged(object sender, EventArgs e)
    {

        section.DataBind();
        ddlJobTitle.DataBind();
        Employee.DataBind();
    }
    protected void ddlCader_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlGrade.DataBind();
        ddlDegree.DataBind();
       
    }
    protected void section_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlJobTitle.DataBind();
        Employee.DataBind();
    }
    protected void Employee_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlJobTitle.DataBind();
    }
    protected void Empstatus_SelectedIndexChanged(object sender, EventArgs e)
    {//اذا كان على راس عمله تظهر قائمة معفي وغير معفي من التوقيع
        ddlEmpSubStatus.Visible = true;
        if (Empstatus.SelectedValue == "1041")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource22";
        }
        else if (Empstatus.SelectedValue == "1043")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource34";

        }
        else if (Empstatus.SelectedValue == "2122")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource5";
        }
        else
        {
            ddlEmpSubStatus.Visible = false;
        }
    }

    protected void ddlEmpTypeID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlEmpSubTypeID.DataBind();
    }
}