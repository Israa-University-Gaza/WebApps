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
public partial class Admission_ReportData : UserPage
{
    string _connStr = ConfigurationManager.ConnectionStrings["isra"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindTableColumns();

            ddlStudyPlace.DataBind();

            ddlStudyPlace.Items.Insert(0, new System.Web.UI.WebControls.ListItem("الكل", "-1"));
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
                cmd.Parameters.AddWithValue("@table_name", "ReportData");
                using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                {
                    ad.Fill(table);

                }
                cblStudentPersonal.DataSource = table;
                cblStudentPersonal.DataBind();
            }
        }
    }
    //private void GetData()
    //{
    //    DataTable table = new DataTable();
    //    using (SqlConnection conn = new SqlConnection(_connStr))
    //    {
    //        if (txtTawjehyGPAFrom.Text == "" && txtTawjehyGPATo.Text == "")
    //        {
    //             string sql = "SELECT (row_number() OVER (ORDER BY [الرقم])) AS الرقم, * FROM ReportData WHERE مسجل like '%' + N'" + ddlIsSemesterRegister.SelectedItem.Text + "' + '%'  and مسدد like '%' + N'" + ddlIsPaid.SelectedItem.Text + "' + '%' and الكلية like '%' + N'" + ddlCollege.SelectedItem.Text + "' + '%' and القسم like '%' + N'" + ddlDepartment.SelectedItem.Text + "' + '%' and الجنس like '%' + N'" + ddlGender.SelectedItem.Text + "' + '%' and [نوع توجيهي] like '%' + N'" + ddlTawjehyType.SelectedItem.Text + "' + '%'  and البرنامج like '%' + N'" + ddlprogram.SelectedItem.Text + "' + '%' and SemesterID=" + ddlSemester.SelectedValue + " and [نوع الطالب] like '%' + N'" + ddlStudentType.SelectedItem.Text + "' + '%' and [حالة الطالب] like '%' + N'" + ddlStudentStatus.SelectedItem.Text + "' + '%' and [منحة الطالب] like '%' + N'" + ddlScholarship.SelectedItem.Text + "' + '%' order by [تاريخ الاضافة] ;";

    //           // string sql = "SELECT (row_number() OVER (ORDER BY [الرقم])) AS الرقم, * FROM ReportData WHERE مسجل like '%' + N'" + ddlIsSemesterRegister.SelectedItem.Text + "' + '%' and مسدد like '%' + N'" + ddlIsPaid.SelectedItem.Text + "' + '%' and الكلية like '%' + N'" + ddlCollege.SelectedItem.Text + "' + '%' and القسم like '%' + N'" + ddlDepartment.SelectedItem.Text + "' + '%' and الجنس like '%' + N'" + ddlGender.SelectedItem.Text + "' + '%' and [نوع توجيهي] like '%' + N'" + ddlTawjehyType.SelectedItem.Text + "' + '%'  and البرنامج like '%' + N'" + ddlprogram.SelectedItem.Text + "' + '%' and SemesterID=" + ddlSemester.SelectedValue + " and [نوع الطالب] like '%' + N'" + ddlStudentType.SelectedItem.Text + "' + '%' and [منحة الطالب] like '%' + N'" + ddlScholarship.SelectedItem.Text + "' + '%' order by [تاريخ الاضافة] ;";
    //            using (SqlCommand cmd = new SqlCommand(sql, conn))
    //            {
    //                using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
    //                {
    //                    ad.Fill(table);
    //                }
    //            }
    //        }
    //        else
    //        {
    //            string sql = "SELECT (row_number() OVER (ORDER BY [الرقم])) AS الرقم, * FROM ReportData WHERE مسجل like '%' + N'" + ddlIsSemesterRegister.SelectedItem.Text + "' + '%' and  مسدد like '%' + N'" + ddlIsPaid.SelectedItem.Text + "' + '%' and الكلية like '%' + N'" + ddlCollege.SelectedItem.Text + "' + '%' and القسم like '%' + N'" + ddlDepartment.SelectedItem.Text + "' + '%' and الجنس like '%' + N'" + ddlGender.SelectedItem.Text + "' + '%' and [نوع توجيهي] like '%' + N'" + ddlTawjehyType.SelectedItem.Text + "' + '%'  and البرنامج like '%' + N'" + ddlprogram.SelectedItem.Text + "' + '%' and SemesterID=" + ddlSemester.SelectedValue + " and [نوع الطالب] like '%' + N'" + ddlStudentType.SelectedItem.Text + "' + '%' and [حالة الطالب] like '%' + N'" + ddlStudentStatus.SelectedItem.Text + "' + '%' and [منحة الطالب] like '%' + N'"  +ddlScholarship.SelectedItem.Text + "' + '%' and [معدل التوجيهي] between " + txtTawjehyGPAFrom.Text + "  and " + txtTawjehyGPATo.Text + " order by [تاريخ الاضافة]  ";
    //            using (SqlCommand cmd = new SqlCommand(sql, conn))
    //            {
    //                using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
    //                {
    //                    ad.Fill(table);
    //                }
    //            }
    //        }

    //    }
    //    GridView1.DataSource = table;
    //    GridView1.DataBind();
    //}
    protected void btnGenrateReport_Click(object sender, EventArgs e)
    {
        BoundField h = new BoundField();
        h.DataField = "RowNo";
        h.HeaderText = "#";
        GridView1.Columns.Add(h);


        foreach (System.Web.UI.WebControls.ListItem item in cblStudentPersonal.Items)
        {
            if (item.Selected)
            {
                BoundField b = new BoundField();
                b.DataField = item.Value;
                b.HeaderText = item.Value;
                GridView1.Columns.Add(b);
            }
        }
        BoundField h1 = new BoundField();
        h1.DataField = "StudentSemesterGPA";
        h1.HeaderText = "المعدل الفصلي";
        GridView1.Columns.Add(h1);

        BoundField h3 = new BoundField();
        h3.DataField = "StudentSemesterStudiedHour";
        h3.HeaderText = " ساعات الدراسة الفصلي";
        GridView1.Columns.Add(h3);

        BoundField h2 = new BoundField();
        h2.DataField = "StudentSemesterSucceedHour";
        h2.HeaderText = "ساعات النجاح الفصلي";
        GridView1.Columns.Add(h2);

        //  this.GetData();
        DataTable DT = DataAccess.GetReportData(ddlprogram.SelectedValue, ddlCollege.SelectedValue, ddlDepartment.SelectedValue, ddlCourse.SelectedValue,ddlSemester.SelectedValue, ddlStudentType.SelectedValue, ddlStudentStatus.SelectedValue, ddlGender.SelectedValue, txtTawjehyGPAFrom.Text, txtTawjehyGPATo.Text, ddlIsPaid.SelectedValue, ddlAppAccreditation.SelectedValue, ddlAccreditation.SelectedValue, FirstRegisterSemesterID.SelectedValue, ddlTawjehyType.SelectedValue, ddlFirstWish.SelectedValue,ddlStudyPlace.SelectedValue,txtSemesterGPA.Text,ddlGraduationStatus.SelectedValue);
        if (DT.Rows.Count > 0)
        {
            GridView1.DataSource = DT;
            GridView1.DataBind();
        }
    }
    protected void btExcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }
    private void ExportGridToExcel()
    {
        foreach (System.Web.UI.WebControls.ListItem item in cblStudentPersonal.Items)
        {
            if (item.Selected)
            {
                BoundField b = new BoundField();
                b.DataField = item.Value;
                b.HeaderText = item.Value;
                GridView1.Columns.Add(b);
            }
        }
        // this.GetData();
        DataTable DT = DataAccess.GetReportData(ddlprogram.SelectedValue, ddlCollege.SelectedValue, ddlDepartment.SelectedValue, ddlCourse.SelectedValue, ddlSemester.SelectedValue, ddlStudentType.SelectedValue, ddlStudentStatus.SelectedValue, ddlGender.SelectedValue, txtTawjehyGPAFrom.Text, txtTawjehyGPATo.Text, ddlIsPaid.SelectedValue, ddlAppAccreditation.SelectedValue, ddlAccreditation.SelectedValue, FirstRegisterSemesterID.SelectedValue, ddlTawjehyType.SelectedValue, ddlFirstWish.SelectedValue, ddlStudyPlace.SelectedValue, txtSemesterGPA.Text, ddlGraduationStatus.SelectedValue);
        if (DT.Rows.Count > 0)
        {
            GridView1.DataSource = DT;
            GridView1.DataBind();
        }


        // Let's hide all unwanted stuffing   
        this.GridView1.AllowPaging = false;
        this.GridView1.AllowSorting = false;
        this.GridView1.EditIndex = -1;
        this.GridView1.Attributes.Add("dir", "rtl");

        // Let's bind data to GridView  
        //  this.GetData();

        GridView1.DataSource = DT;
        GridView1.DataBind();


        // Let's output HTML of GridView   
        Response.Clear();
        Response.ContentType = "application/vnd.xls";
        Response.AddHeader("content-disposition", "attachment;filename=contacts.xls");

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

    protected void ddlprogram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollege.DataBind();
        ddlDepartment.DataBind();
        ddlStudentType.DataBind();
    }
    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.DataBind();
        ddlCourse.DataBind();
    }


    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCourse.DataBind();
    }
}