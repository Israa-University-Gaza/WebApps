using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Academic_StudentInstallmentAccreditation : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Permissions.Contains("StudentScholarshipAccreditation") || Permissions.Contains("StudentInstallmentAccreditation")))
        {
            Response.Redirect("Default.aspx");
        }

    }
    protected void lbAccrediteStudentInstallment_Click(object sender, EventArgs e)
    {
        int empNo = 5267;
        int AccreditationType = 0;
        if (EmployeeID == ((int)StudentInstallmentAccreditation.loansDivisionAccerdiation).ToString() ||
             EmployeeID == empNo.ToString())
        {
            AccreditationType = 1;
        }
        else if (EmployeeID == ((int)StudentInstallmentAccreditation.affairsManagerAccreditation).ToString())
        {
            AccreditationType = 2;
        }
        else if ((EmployeeID == ((int)StudentInstallmentAccreditation.academicAccerdiation).ToString() || EmployeeID == "5017"))
        {
            AccreditationType = 3;
        }
        else if (EmployeeID == ((int)StudentInstallmentAccreditation.managmentAccreditation).ToString() || EmployeeID == "5015")
        {
            AccreditationType = 4;
        }

        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("InstallmentOrderID")).Text;
        DataTable DT = DataAccess.StudentInstallmentAccreditation(id, EmployeeID, AccreditationType);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnAccrediteStudentInstallment_Click(object sender, EventArgs e)
    {

        int AccreditationType = 0;
        int empNo = 5267;
        if (EmployeeID == ((int)StudentInstallmentAccreditation.loansDivisionAccerdiation).ToString()||
            EmployeeID == empNo.ToString())
        {
            AccreditationType = 1;
        }
        else if (EmployeeID == ((int)StudentInstallmentAccreditation.affairsManagerAccreditation).ToString())
        {
            AccreditationType = 2;
        }
        else if ((EmployeeID == ((int)StudentInstallmentAccreditation.academicAccerdiation).ToString() || EmployeeID == "5017"))
        {
            AccreditationType = 3;
        }
        else if (EmployeeID == ((int)StudentInstallmentAccreditation.managmentAccreditation).ToString() || EmployeeID == "5015")
        {
            AccreditationType = 4;
        }


        int count1 = 0; int count2 = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            CheckBox cbStudentInstallment = ((CheckBox)item.FindControl("cbStudentInstallment"));
            if (cbStudentInstallment.Checked)
            {
                string id = ((Label)item.FindControl("InstallmentOrderID")).Text;
                DataTable DT = DataAccess.StudentInstallmentAccreditation(id, EmployeeID, AccreditationType);
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                    count1++;
                else
                    count2++;
            }
        }
        ShowToast(this, "تم إعتماد " + count1 + " قسط طالب " + "<br />" + "لم يتم إعتماد " + count2 + " قسط طالب", "", "success");
        ListView1.DataBind();
    }

    protected void ListView1_OnItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType != ListViewItemType.DataItem) return;

        var cbStudentInstallment = (CheckBox) e.Item.FindControl("cbStudentInstallment");

         //شعبة القروض والمساعدات
        var Label1 = (Label)e.Item.FindControl("Label1");
        var LinkButton1 = (LinkButton)e.Item.FindControl("LinkButton1");
        var icheck1 = (HtmlControl)e.Item.FindControl("icheck1");
        var iminus1 = (HtmlControl)e.Item.FindControl("iminus1");
        // added by RSR
        int empNo = 5267;
        if ((EmployeeID == ((int)StudentInstallmentAccreditation.loansDivisionAccerdiation).ToString() ||
            EmployeeID == empNo.ToString() )&& 
            Label1.Text == "False")
        {

            LinkButton1.Visible = true;
            cbStudentInstallment.Visible = true;

        }
        else switch (Label1.Text)
            {
                case "False":
                    iminus1.Visible = true;
                    break;
                case "True":
                    icheck1.Visible = true;
                    break;
            }



        //قسم شؤون نالطلبة
        var Label2 = (Label)e.Item.FindControl("Label2");
        var LinkButton2 = (LinkButton)e.Item.FindControl("LinkButton2");
        var icheck2 = (HtmlControl)e.Item.FindControl("icheck2");
        var iminus2 = (HtmlControl)e.Item.FindControl("iminus2");


        if (EmployeeID == ((int)StudentInstallmentAccreditation.affairsManagerAccreditation).ToString() && Label2.Text == "False" & Label1.Text == "True")
        {

            LinkButton2.Visible = true;
            cbStudentInstallment.Visible = true;
        }
        else switch (Label2.Text)
            {
                case "False":
                    iminus2.Visible = true;
                    break;
                case "True":
                    icheck2.Visible = true;
                    break;
            }




        //الاكاديمي
        var Label3 = (Label)e.Item.FindControl("Label3");
        var LinkButton3 = (LinkButton)e.Item.FindControl("LinkButton3");
        var icheck3 = (HtmlControl)e.Item.FindControl("icheck3");
        var iminus3 = (HtmlControl)e.Item.FindControl("iminus3");


        if ((EmployeeID == ((int)StudentInstallmentAccreditation.academicAccerdiation).ToString() || EmployeeID == "5017") && Label3.Text == "False" & Label1.Text == "True" & Label2.Text == "True")
        {

            LinkButton3.Visible = true;
            cbStudentInstallment.Visible = true;
        }
        else switch (Label3.Text)
            {
                case "False":
                    iminus3.Visible = true;
                    break;
                case "True":
                    icheck3.Visible = true;
                    break;
            }



        //الاداري
        var Label4 = (Label)e.Item.FindControl("Label4");
        var LinkButton4 = (LinkButton)e.Item.FindControl("LinkButton4");
        var icheck4 = (HtmlControl)e.Item.FindControl("icheck4");
        var iminus4 = (HtmlControl)e.Item.FindControl("iminus4");


        if ((EmployeeID == "5009" || EmployeeID == "5015") && Label4.Text == "False" & Label1.Text == "True" & Label2.Text == "True" & Label3.Text == "True")
        {

            LinkButton4.Visible = true;
            cbStudentInstallment.Visible = true;
        }
        else switch (Label4.Text)
            {
                case "False":
                    iminus4.Visible = true;
                    break;
                case "True":
                    icheck4.Visible = true;
                    break;
            }




    }

    protected void cbStudentInstallment_CheckedChanged(object sender, EventArgs e)
    {
        for(int i=0; i < ListView1.Items.Count; i++)
        {
            if(((CheckBox)ListView1.Items[i].FindControl("cbStudentInstallment")).Visible)
                ((CheckBox)ListView1.Items[i].FindControl("cbStudentInstallment")).Checked = cbCheckAll.Checked;
        }
    }
}