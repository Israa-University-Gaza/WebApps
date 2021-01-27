using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net;
using System.IO;

public partial class Academic_StdInternalTransformationAdd : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        liAcademicUnAccreditAll.Visible = false;
        liAcademicAccreditAll.Visible = false;
        liDeanAccreditAll.Visible = false;
        liDeanUnAccreditAll.Visible = false;
        if (!IsPostBack)
        {
            lblEmployeeID.Text = EmployeeID;


            if (Request.QueryString["id"]!= null)
            {
                lblStudentID.Text = Request.QueryString["id"];
            }
            else
                Response.Redirect("~/Academic/Students.aspx");
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Academic/Students.aspx");
        }

        // تحديد الكل
        string checkAllScript = "$('#selectAll').click(function (e) {$(this).closest('table').find('td input:checkbox').prop('checked', this.checked);});";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "temp", "<script language='javascript'>" + checkAllScript + "</script>", false);

        // اعادة تفعيل الدروب داون لست
        string FormSamples = "FormSamples.init();";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "temp2", "<script language='javascript'>" + FormSamples + "</script>", false);
    }

    protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
    {

        ListViewItem li = (ListViewItem)((DropDownList)sender).Parent;
        Label lblStdInternalTransformationID = ((Label)li.FindControl("lblStdInternalTransformationID"));

        var ID = ((DropDownList)li.FindControl("ddlCourses")).SelectedValue;
        TextBox txtCourseHours = ((TextBox)li.FindControl("txtCourseHours"));

        var ID2 = ((DropDownList)li.FindControl("ddlCourses2")).SelectedValue;
        TextBox txtCourseHours2 = ((TextBox)li.FindControl("txtCourseHours2"));


        var btnSave = ((Button)li.FindControl("btnSave"));


        if (Convert.ToInt32(ID) > -1)
        {
            btnSave.Enabled = true;
            if (lblStdInternalTransformationID.Text != "")
                btnSave.ForeColor = System.Drawing.Color.White;
        }
        else
        {
            btnSave.Enabled = false;
        }


        if (ID != "-1")
        {
            DataTable DT = DataAccess.GetCourseHour(ID);
            txtCourseHours.Text = DT.Rows[0]["NumOfHours"].ToString();
        }
        else
        {
            txtCourseHours.Text = "";
        }




        if (ID2 != "-1")
        {

            DataTable DT2 = DataAccess.GetCourseHour(ID2);
            txtCourseHours2.Text = DT2.Rows[0]["NumOfHours"].ToString();
            ((DropDownList)li.FindControl("ddlCourses2")).CssClass = ((DropDownList)li.FindControl("ddlCourses2")).CssClass.Replace("hide", "");
            ((TextBox)li.FindControl("txtCourseHours2")).CssClass = ((TextBox)li.FindControl("txtCourseHours2")).CssClass.Replace("hide", "");
        }
        else
        {
            txtCourseHours2.Text = "";

        }
        //listview2.DataBind();
    }
    protected void listview2_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblStdInternalTransformationID = ((Label)e.Item.FindControl("lblStdInternalTransformationID"));
        Label lblAllDeanAccreditation = ((Label)e.Item.FindControl("lblAllDeanAccreditation"));
        Label lblIsTransformation = ((Label)e.Item.FindControl("lblIsTransformation"));
        Label lblIsAllTransformation = ((Label)e.Item.FindControl("lblIsAllTransformation"));
        Label lblAllAcademicAccreditation = ((Label)e.Item.FindControl("lblAllAcademicAccreditation"));
        Label lblExistDeanAccreditation = ((Label)e.Item.FindControl("lblExistDeanAccreditation"));
        Label lbllExistAcademicAccreditation = ((Label)e.Item.FindControl("lblExistAcademicAccreditation"));
        Label lblIsDeanAccreditation = ((Label)e.Item.FindControl("lblIsDeanAccreditation"));

        TextBox txtCourseHours = ((TextBox)e.Item.FindControl("txtCourseHours"));
        TextBox txtCourseHours2 = ((TextBox)e.Item.FindControl("txtCourseHours2"));

        var iplus = ((HtmlControl)e.Item.FindControl("iplus"));

        var ddl = ((DropDownList)e.Item.FindControl("ddlCourses"));
        ddl.SelectedValue = ((Label)e.Item.FindControl("lblITransWithCourseID")).Text;
        var ID = ddl.SelectedValue;

        var ddl2 = ((DropDownList)e.Item.FindControl("ddlCourses2"));
        ddl2.SelectedValue = ((Label)e.Item.FindControl("lblITransWithCourseID2")).Text;
        var ID2 = ddl2.SelectedValue;



        iplus.Visible = (lblIsDeanAccreditation.Text == "0");


        if (lblStdInternalTransformationID.Text != "")
        {
            ((Button)e.Item.FindControl("btnSave")).Text = "تعديل";
            ((Button)e.Item.FindControl("btnSave")).CssClass = "btn btn-sm btn-warning";

            //((CheckBox)e.Item.FindControl("cbAdopt")).Enabled = false;
        }


        if (ID != "-1")
        {
            DataTable DT = DataAccess.GetCourseHour(ID);
            txtCourseHours.Text = DT.Rows[0]["NumOfHours"].ToString();
        }
        else
        {
            txtCourseHours.Text = "";
        }

        if (ID2 != "-1")
        {

            DataTable DT2 = DataAccess.GetCourseHour(ID2);
            txtCourseHours2.Text = DT2.Rows[0]["NumOfHours"].ToString();
        }
        else
        {
            txtCourseHours2.Text = "";

        }

        if (lblIsAllTransformation.Text != "1")
        {
            liSaveAll.Visible = true;

        }

        if (lblIsTransformation.Text == "1")
        {
            //if (lblAllDeanAccreditation.Text != "1" && lbllExistAcademicAccreditation.Text != "1")
            if (lblAllDeanAccreditation.Text != "1")
            {
                liDeanAccreditAll.Visible = true;
            }

            if (lblExistDeanAccreditation.Text == "1" && lbllExistAcademicAccreditation.Text != "1")
            {
                liDeanUnAccreditAll.Visible = true;
            }

            if (lblAllAcademicAccreditation.Text != "1" && lblExistDeanAccreditation.Text == "1")
            {
                liAcademicAccreditAll.Visible = true;
            }

            if (lbllExistAcademicAccreditation.Text == "1")
            {
                liAcademicUnAccreditAll.Visible = true;
            }

        }

        var thislist = ((DropDownList)e.Item.FindControl("ddlCourses"));
        var thislist2 = ((DropDownList)e.Item.FindControl("ddlCourses2"));


        var d = SqlDataSource2;
        DataTable dt = ((DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty)).Table;

        var rows = dt.AsEnumerable().ToList();


        string i = (string.IsNullOrEmpty("islam")) ? "ddddd" : "xxxxx";

        foreach (var x in rows)
        {

            int? t = x.Field<int?>("ITransWithCourseID");
            int? s = x.Field<int?>("ITransWithCourseID2");
            int? id = x.Field<int?>("ID");

            if (t != null)
            {
                if (t.ToString() != ((Label)e.Item.FindControl("lblITransWithCourseID")).Text)
                {
                    try
                    {
                        thislist.Items.FindByValue(t.ToString()).Enabled = false;
                        thislist2.Items.FindByValue(t.ToString()).Enabled = false;


                    }
                    catch
                    {

                    }


                    //Response.Write(thislist.Items.FindByValue(t.Value.ToString()) + "_____");
                }

            }

            if (s != null)
            {
                if (s.ToString() != ((Label)e.Item.FindControl("lblITransWithCourseID2")).Text)
                {
                    try
                    {
                        thislist.Items.FindByValue(s.ToString()).Enabled = false;

                    thislist2.Items.FindByValue(s.ToString()).Enabled = false;
                    }
                    catch
                    {

                    }

                    //Response.Write(thislist.Items.FindByValue(t.Value.ToString()) + "_____");
                }

            }


        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((Button)sender).Parent;
        DropDownList ddlCourse = ((DropDownList)li.FindControl("ddlCourses"));
        DropDownList ddlCourse2 = ((DropDownList)li.FindControl("ddlCourses2"));
        DropDownList ddlTransformationReason = ((DropDownList)li.FindControl("ddlTransformationReason"));
        Button save = ((Button)li.FindControl("btnSave"));
        string StdSectionID = ((Label)li.FindControl("lblStdSectionID")).Text;
        string StdInternalTransformationID = ((Label)li.FindControl("lblStdInternalTransformationID")).Text;
        bool Validate = ValidateControls(new WebControl[] { ddlCourse });
        if (Validate)
        {

            DataTable DT = DataAccess.StdInternalTransformationAddEdit(StdInternalTransformationID, StdSectionID, ddlCourse.SelectedValue, Convert.ToInt32(ddlCourse2.SelectedValue) > 0 ? ddlCourse2.SelectedValue : "", "3", EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

            listview2.DataBind();
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }
    protected void lbSaveAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in listview2.Items)
        {

            DropDownList ddlCourse = ((DropDownList)li.FindControl("ddlCourses"));
            DropDownList ddlCourse2 = ((DropDownList)li.FindControl("ddlCourses2"));
            DropDownList ddlTransformationReason = ((DropDownList)li.FindControl("ddlTransformationReason"));
            string StdSectionID = ((Label)li.FindControl("lblStdSectionID")).Text;
            string StdInternalTransformationID = ((Label)li.FindControl("lblStdInternalTransformationID")).Text;
            bool Validate = ValidateControls(new WebControl[] { ddlCourse });
            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                c++;
                if (Validate)
                {
                    DataTable DT = DataAccess.StdInternalTransformationAddEdit(StdInternalTransformationID, StdSectionID, ddlCourse.SelectedValue, Convert.ToInt32(ddlCourse2.SelectedValue) > 0 ? ddlCourse2.SelectedValue : "", "3", EmployeeID);
                    if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                        s++;
                    else
                        f++;
                }
                else
                    f++;
            }
        }
        ShowToast(this, "تم معادلة " + s + " ولم يتم معادلة " + f + " من أصل " + c, "", (f == 0) ? "success" : "error");
        listview2.DataBind();
        Repeater1.DataBind();
    }
    protected void btnAcademicAccredit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((Button)sender).Parent;
        string StdSectionID = ((Label)li.FindControl("lblStdSectionID")).Text;
        DataTable DT = DataAccess.SetStdInternalTransformationAccreditation(StdSectionID, EmployeeID, "3");
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + lblStudentID.Text + "&stdSemesterId=&accreditationStatusEnum=1";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        listview2.DataBind();

    }
    protected void btnDeanAccredit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((Button)sender).Parent;
        string StdSectionID = ((Label)li.FindControl("lblStdSectionID")).Text;
        DataTable DT = DataAccess.SetStdInternalTransformationAccreditation(StdSectionID, EmployeeID, "2");
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");


        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + lblStudentID.Text + "&stdSemesterId=&accreditationStatusEnum=1";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();
        listview2.DataBind();
    }
    protected void btnCancelAcademicAccredit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((Button)sender).Parent;
        string StdSectionID = ((Label)li.FindControl("lblStdSectionID")).Text;
        DataTable DT = DataAccess.SetStdInternalTransformationUnAccreditation(StdSectionID, EmployeeID, "3");
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + lblStudentID.Text + "&stdSemesterId=&accreditationStatusEnum=0";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        listview2.DataBind();
    }
    protected void btnCancelDeanAccredit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((Button)sender).Parent;
        string StdSectionID = ((Label)li.FindControl("lblStdSectionID")).Text;
        DataTable DT = DataAccess.SetStdInternalTransformationUnAccreditation(StdSectionID, EmployeeID, "2");
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + lblStudentID.Text + "&stdSemesterId=&accreditationStatusEnum=0";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        listview2.DataBind();
    }
    protected void lbDeanAccreditAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in listview2.Items)
        {
            DropDownList ddlCourse = ((DropDownList)li.FindControl("ddlCourses"));

            string StdSectionID = ((Label)li.FindControl("lblStdSectionID")).Text;
            bool Validate = ValidateControls(new WebControl[] { ddlCourse });

            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                c++;
                if (Validate)
                {

                    DataTable DT = DataAccess.SetStdInternalTransformationAccreditation(StdSectionID, EmployeeID, "2");

                    if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                        s++;
                    else
                        f++;
                }
                else
                    f++;

            }

        }
        ShowToast(this, "تم اعتماد " + s + " ولم يتم اعتماد " + f + " من أصل " + c, "", (f == 0) ? "success" : "error");

        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + lblStudentID.Text + "&stdSemesterId=&accreditationStatusEnum=1";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        listview2.DataBind();
    }
    protected void lbAcademicAccreditAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in listview2.Items)
        {
            DropDownList ddlCourse = ((DropDownList)li.FindControl("ddlCourses"));

            string StdSectionID = ((Label)li.FindControl("lblStdSectionID")).Text;
            bool Validate = ValidateControls(new WebControl[] { ddlCourse });
            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                c++;
                if (Validate)
                {

                    DataTable DT = DataAccess.SetStdInternalTransformationAccreditation(StdSectionID, EmployeeID, "3");
                    if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                        s++;
                    else
                        f++;
                }
                else
                    f++;
            }

        }
        ShowToast(this, "تم اعتماد " + s + " ولم يتم اعتماد " + f + " من أصل " + c, "", (f == 0) ? "success" : "error");


        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + lblStudentID.Text + "&stdSemesterId=&accreditationStatusEnum=1";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        listview2.DataBind();
    }
    protected void lbDeanUnAccreditAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in listview2.Items)
        {
            DropDownList ddlCourse = ((DropDownList)li.FindControl("ddlCourses"));

            string StdSectionID = ((Label)li.FindControl("lblStdSectionID")).Text;
            bool Validate = ValidateControls(new WebControl[] { ddlCourse });

            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                c++;
                if (Validate)
                {
                    DataTable DT = DataAccess.SetStdInternalTransformationUnAccreditation(StdSectionID, EmployeeID, "2");
                    if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                        s++;
                    else
                        f++;
                }
                else
                    f++;

            }

        }
        ShowToast(this, "تم الغاء اعتماد " + s + " ولم يتم الغاء اعتماد " + f + " من أصل " + c, "", (f == 0) ? "success" : "error");

        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + lblStudentID.Text + "&stdSemesterId=&accreditationStatusEnum=0";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        listview2.DataBind();
    }
    protected void lbAcademicUnAccreditAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in listview2.Items)
        {
            DropDownList ddlCourse = ((DropDownList)li.FindControl("ddlCourses"));

            string StdSectionID = ((Label)li.FindControl("lblStdSectionID")).Text;
            bool Validate = ValidateControls(new WebControl[] { ddlCourse });

            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                c++;
                if (Validate)
                {
                    DataTable DT = DataAccess.SetStdInternalTransformationUnAccreditation(StdSectionID, EmployeeID, "3");
                    if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                        s++;
                    else
                        f++;
                }
                else
                    f++;
            }

        }
        ShowToast(this, "تم الغاء اعتماد " + s + " ولم يتم الغاء اعتماد " + f + " من أصل " + c, "", (f == 0) ? "success" : "error");

        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + lblStudentID.Text + "&stdSemesterId=&accreditationStatusEnum=0";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        listview2.DataBind();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((Button)sender).Parent;
        string StdInternalTransformationID = ((Label)li.FindControl("lblStdInternalTransformationID")).Text;
        DataTable DT = DataAccess.StdInternalTransformationDelete(StdInternalTransformationID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        listview2.DataBind();


        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + lblStudentID.Text + "&stdSemesterId=&accreditationStatusEnum=0";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();
        Repeater1.DataBind();
    }



}