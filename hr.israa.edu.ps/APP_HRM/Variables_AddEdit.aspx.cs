using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Variables_AddEdit : UserPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["Allowance_Type_ID"] != null)
            {
                DataTable DT = DataAccess.Allowance_Type_TB_Get(Session["Allowance_Type_ID"].ToString());
                txtAllowanceType.Text = DT.Rows[0]["Allowance_Type"].ToString();
                CodeAll.Text = DT.Rows[0]["Code"].ToString();
                txtAllownaceCondition.Text = DT.Rows[0]["Allowance_Condition"].ToString();
                

            }


            if (Session["Bouns_Type_ID"] != null)
            {
         
                DataTable DT = DataAccess.Bouns_Type_TB_Get(Session["Bouns_Type_ID"].ToString());
                txtBounsType.Text = DT.Rows[0]["Bouns_Type"].ToString();
                CodeBouns.Text = DT.Rows[0]["Code"].ToString();
                txtBounsCondition.Text = DT.Rows[0]["Bouns_Condition"].ToString();
                BounsValue.Text = DT.Rows[0]["Bouns_Default_Value"].ToString();
                CurrType.SelectedValue = DT.Rows[0]["Currancy_ID"].ToString();
                cssBouns();
            }
            if (Session["Deduction_Type_ID"] != null)
            {
                DataTable DT = DataAccess.Deduction_Type_TB_Get(Session["Deduction_Type_ID"].ToString());
                CodeDed.Text = DT.Rows[0]["Code"].ToString();
                txtDeductionType.Text = DT.Rows[0]["Deduction_Type"].ToString();
                txtDeductionCondition.Text = DT.Rows[0]["Deduction_Condition"].ToString();
                cssDeduction();
            }
            if (Session["Penelty_Type_ID"] != null)
            {
                DataTable DT = DataAccess.Panetly_Type_TB_Get(Session["Penelty_Type_ID"].ToString());
                PaneltyType.Text = DT.Rows[0]["Penalty_Type"].ToString();
                CodePen.Text = DT.Rows[0]["Code"].ToString();
                PaneltyCond.Text = DT.Rows[0]["Penalty_Condition"].ToString();
                cssPenalty();
            }

            if (Session["Motivation_Type_ID"] != null)
            {
                DataTable DT = DataAccess.Motivation_Type_TB_Get(Session["Motivation_Type_ID"].ToString());
                MotivatType.Text = DT.Rows[0]["Motivation_Type"].ToString();
                CodeMot.Text = DT.Rows[0]["Code"].ToString();
                MotivatCond.Text = DT.Rows[0]["Motivation_Condition"].ToString();
                cssMotivate();
            }

        }


    }

    protected void Button5_Click(object sender, EventArgs e) // انواع البدلات
    {
        if (ValidateControls(new WebControl[] { txtAllowanceType, CodeAll, txtAllownaceCondition }))
        {

            if (DataAccess.Allowance_Type_TB_AddEdit((Session["Allowance_Type_ID"] == null) ? "" : Session["Allowance_Type_ID"].ToString(), CodeAll.Text, txtAllowanceType.Text, txtAllownaceCondition.Text, Convert.ToInt16(UserID), (Session["ContractID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Session["Allowance_Type_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { txtAllowanceType, CodeAll, txtAllownaceCondition });
                Repeater2.DataBind();
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
    protected void Button7_Click(object sender, EventArgs e) // انواع العلاوات
    {
        if (ValidateControls(new WebControl[] { CodeBouns, txtBounsType, txtBounsCondition, BounsValue }))
        {
            if (DataAccess.Bouns_Type_TB_AddEdit((Session["Bouns_Type_ID"] == null) ? "" : Session["Bouns_Type_ID"].ToString(),
              CodeBouns.Text, txtBounsType.Text, txtBounsCondition.Text, Convert.ToDecimal(BounsValue.Text), Convert.ToInt16(CurrType.Text)) > 0)
            {
                Session["Bouns_Type_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { CodeBouns, txtBounsType, txtBounsCondition, BounsValue });
                Repeater4.DataBind();

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
        cssBouns();
    }
    protected void Button9_Click(object sender, EventArgs e)// انواع الجزاءات
    {
        if (ValidateControls(new WebControl[] { CodeDed, txtDeductionType, txtDeductionCondition }))
        {
            if (DataAccess.Deduction_Type_TB_AddEdit((Session["Deduction_Type_ID"] == null) ? "" : Session["Deduction_Type_ID"].ToString(),
              CodeDed.Text, txtDeductionType.Text, txtDeductionCondition.Text) > 0)
            {
                Session["Deduction_Type_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { CodeDed, txtDeductionType, txtDeductionCondition });
                Repeater5.DataBind();
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
        cssDeduction();
      
    }

    protected void Panelty_Click(object sender, EventArgs e)// انواع العقوبات
    {
        if (ValidateControls(new WebControl[] { CodePen, PaneltyType, PaneltyCond }))
        {
            if (DataAccess.Panelty_Type_TB_AddEdit((Session["Penelty_Type_ID"] == null) ? "" : Session["Penelty_Type_ID"].ToString(),
               CodePen.Text, PaneltyType.Text, PaneltyCond.Text) > 0)
            {
                Session["Penelty_Type_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { CodePen, PaneltyType, PaneltyCond });
                Repeater6.DataBind();
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
        cssPenalty();
    }

    protected void Motivate_Click(object sender, EventArgs e)// انواع المكافآت
    {
        if (ValidateControls(new WebControl[] { MotivatType, MotivatCond }))
        {
            if (DataAccess.Motivation_Type_TB_AddEdit((Session["Motivation_Type_ID"] == null) ? "" : Session["Motivation_Type_ID"].ToString(), CodeMot.Text, MotivatType.Text, MotivatCond.Text) > 0)
            {
                Session["Motivation_Type_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { MotivatType, MotivatCond });
                Repeater7.DataBind();
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

        cssMotivate();
    }



    protected void AllowlbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Allowance_Type_ID"] = ((Label)ri.FindControl("AllowanceTypeID")).Text;
        Response.Redirect("~/APP_HRM/Variables_AddEdit.aspx");
    }

    protected void AllowlbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("AllowanceTypeID")).Text;

        if (DataAccess.Allowance_Type_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        
    }
    protected void AllowCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtAllowanceType, CodeAll, txtAllownaceCondition });
        Session["Allowance_Type_ID"] = null;

    }
    protected void BounslbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Bouns_Type_ID"] = ((Label)ri.FindControl("BounsTypeID")).Text;
        Response.Redirect("~/APP_HRM/Variables_AddEdit.aspx");
    }

    protected void BounslbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("BounsTypeID")).Text;

        if (DataAccess.Bouns_Type_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater4.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        cssBouns();

    }
    protected void BounsCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { CodeBouns, txtBounsType, txtBounsCondition, BounsValue });
        Session["Bouns_Type_ID"] = null;
        cssBouns();

    }
    protected void DeductlbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Deduction_Type_ID"] = ((Label)ri.FindControl("DeductionTypeID")).Text;
        Response.Redirect("~/APP_HRM/Variables_AddEdit.aspx");

    }

    protected void DeductlbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("DeductionTypeID")).Text;

        if (DataAccess.Deduction_Type_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater5.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        cssDeduction();
        
    }
    protected void DeductCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { CodeDed, txtDeductionType, txtDeductionCondition });
        Session["Deduction_Type_ID"] = null;

        cssDeduction();
    }
    protected void PaneltylbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Penelty_Type_ID"] = ((Label)ri.FindControl("PaneltyTypeID")).Text;
        Response.Redirect("~/APP_HRM/Variables_AddEdit.aspx");
    }

    protected void PaneltylbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("PaneltyTypeID")).Text;

        if (DataAccess.Panelty_Type_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater6.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        cssPenalty();
    }
    protected void PaneltyCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { CodePen, PaneltyType, PaneltyCond });
        Session["Penalty_Type_ID"] = null;
        cssPenalty();

    }
    protected void MotivationlbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Motivation_Type_ID"] = ((Label)ri.FindControl("MotivationTypeID")).Text;
        Response.Redirect("~/APP_HRM/Variables_AddEdit.aspx");
    }

    protected void MotivationlbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("MotivationTypeID")).Text;

        if (DataAccess.Motivation_Type_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater7.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        cssMotivate();
    }
    protected void MotivateCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { MotivatType, MotivatCond });
        Session["Motivation_Type_ID"] = null;
        cssMotivate();
    }


    // methods for css
    void cssBouns() 
    {

        li6.Attributes.Add("class", "");
        li5.Attributes.Add("class", "");
        li4.Attributes.Add("class", "");
        li2.Attributes.Add("class", "");
        li3.Attributes.Add("class", "active");

        tab_2.Attributes.Add("class", "tab-pane");
        tab_3.Attributes.Add("class", "tab-pane active");
        tab_4.Attributes.Add("class", "tab-pane");
        tab_5.Attributes.Add("class", "tab-pane");
        tab_6.Attributes.Add("class", "tab-pane");
    }
    void cssDeduction()
    { 
         li6.Attributes.Add("class", "");
        li5.Attributes.Add("class", "");
        li3.Attributes.Add("class", "");
        li2.Attributes.Add("class", "");
        li4.Attributes.Add("class", "active");

        tab_2.Attributes.Add("class", "tab-pane");
        tab_3.Attributes.Add("class", "tab-pane");
        tab_5.Attributes.Add("class", "tab-pane");
        tab_6.Attributes.Add("class", "tab-pane");
        tab_4.Attributes.Add("class", "tab-pane active");
    }
    void cssPenalty()
    {
        li4.Attributes.Add("class", "");
        li3.Attributes.Add("class", "");
        li2.Attributes.Add("class", "");
        li5.Attributes.Add("class", "active");
        li6.Attributes.Add("class", "");
        tab_2.Attributes.Add("class", "tab-pane");
        tab_3.Attributes.Add("class", "tab-pane");
        tab_4.Attributes.Add("class", "tab-pane");
        tab_5.Attributes.Add("class", "tab-pane active");
        tab_6.Attributes.Add("class", "tab-pane");
    }
    void cssMotivate()
    {
        li4.Attributes.Add("class", "");
        li3.Attributes.Add("class", "");
        li5.Attributes.Add("class", "");
        li2.Attributes.Add("class", "");
        li6.Attributes.Add("class", "active");

        tab_2.Attributes.Add("class", "tab-pane");
        tab_3.Attributes.Add("class", "tab-pane");
        tab_4.Attributes.Add("class", "tab-pane");
        tab_5.Attributes.Add("class", "tab-pane");
        tab_6.Attributes.Add("class", "tab-pane active");
    }
}