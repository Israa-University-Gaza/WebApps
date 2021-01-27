using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class APP_HRM_Emp_Allownace_AddEdit : UserPage
{
    DataTable DT = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

      

        if (!IsPostBack)
        {
          

            if (Session["Allowance_ID"] != null)
            {
                activeTab(1);
                DataTable DT = DataAccess.Allowance_TB_Get(Session["Allowance_ID"].ToString());

                AllowancyTypeID.SelectedValue = DT.Rows[0]["Allowance_Type_ID"].ToString();
               
                DropDownList3.SelectedValue = DT.Rows[0]["description"].ToString();

                EvaluateType.SelectedValue = DT.Rows[0]["EvaluateType"].ToString();
                AllownaceRate.Text = DT.Rows[0]["Allowance_Rate"].ToString();
                EmpName.SelectedValue = DT.Rows[0]["Emp_ID"].ToString();
                AllowanceValue.Text = DT.Rows[0]["Allowance_Value"].ToString();

                if ((DT.Rows[0]["Allowance_Start_Date"].ToString()) != "")
                    AllowanceSDate.Text = DT.Rows[0]["Allowance_Start_Date1"].ToString();

                if ((DT.Rows[0]["Allowance_End_Date"].ToString()) != "")
                    AllowanceFDate.Text = DT.Rows[0]["Allowance_End_Date1"].ToString();

                         
            }

            if (Session["Bouns_ID"] != null)
            {
              activeTab(2);
                DataTable DT1 = DataAccess.Bouns_TB_Get(Session["Bouns_ID"].ToString());

                DropDownList1.SelectedValue = DT1.Rows[0]["Bouns_Type_ID"].ToString();
                DropDownList7.SelectedValue = DT1.Rows[0]["Child_No"].ToString();

               
                DropDownList6.SelectedValue = DT1.Rows[0]["description"].ToString();
               // EvaluateType1.SelectedValue = DT1.Rows[0]["EvaluateType"].ToString();

                BounsValue.Text = DT1.Rows[0]["Bouns_Value"].ToString();
                BounsEmp.SelectedValue = DT1.Rows[0]["Emp_ID"].ToString();
                BounsRate.Text = DT1.Rows[0]["Bouns_Rate"].ToString();

                if ((DT1.Rows[0]["Bouns_Start_Date"].ToString()) != "")
                    BounsSDate.Text = DT1.Rows[0]["Bouns_Start_Date1"].ToString();

                if ((DT1.Rows[0]["Bouns_End_Date"].ToString()) != "")
                    BounsFDate.Text = DT1.Rows[0]["Bouns_End_Date1"].ToString();

                CurrBou.SelectedValue = DT1.Rows[0]["Currancy_ID"].ToString();         

            }

            if (Session["Deduction_ID"] != null)
            {
              activeTab(3);
                DataTable DT2 = DataAccess.Deduction_TB_Get(Session["Deduction_ID"].ToString());

                DropDownList2.SelectedValue = DT2.Rows[0]["Deduction_Type_ID"].ToString();
               
                DropDownList4.SelectedValue = DT2.Rows[0]["description"].ToString();
                EvaluateType2.SelectedValue = DT2.Rows[0]["EvaluateType"].ToString();
                DedRate.Text = DT2.Rows[0]["Deduction_Rate"].ToString();
                DedEmp.SelectedValue = DT2.Rows[0]["Emp_ID"].ToString();
                DedValue.Text = DT2.Rows[0]["Deduction_Value"].ToString();

                if ((DT2.Rows[0]["Deduction_Start_Date"].ToString()) != "")
                    DedSDate.Text = DT2.Rows[0]["Deduction_Start_Date1"].ToString();

                if ((DT2.Rows[0]["Deduction_End_Date"].ToString()) != "")
                    DedFDate.Text = DT2.Rows[0]["Deduction_End_Date1"].ToString();



                CurrDed.SelectedValue = DT2.Rows[0]["Currancy_ID"].ToString();         


            }

            if (Session["Motivation_ID"] != null)
            {
               activeTab(4);
                DataTable DT3 = DataAccess.Motivation_TB_Get(Session["Motivation_ID"].ToString());

                DDMotivate.SelectedValue = DT3.Rows[0]["Motivation_Type_ID"].ToString();
               
                DropDownList5.SelectedValue = DT3.Rows[0]["description"].ToString();
               // EvaluateType3.SelectedValue = DT.Rows[0]["EvaluateType"].ToString();
                MotivateRate.Text = DT3.Rows[0]["Motivation_Rate"].ToString();
                MotivatEmp.SelectedValue = DT3.Rows[0]["Emp_ID"].ToString();
                MotivateValue.Text = DT3.Rows[0]["Motivation_Value"].ToString();
                if ((DT3.Rows[0]["Motivation_S_Date"].ToString()) != "")
                    MotivateSDate.Text = DT3.Rows[0]["Motivation_S_Date1"].ToString();
                CurrMot.SelectedValue = DT3.Rows[0]["Currancy_ID"].ToString();

            }

            if (Session["Penalty_ID"] != null)
            {
                activeTab(5);
                DataTable DT4 = DataAccess.Penetly_TB_Get(Session["Penalty_ID"].ToString());

                DDPanelty.SelectedValue = DT4.Rows[0]["Penalty_Type_ID"].ToString();
             
               // EvaluateType4.SelectedValue = DT.Rows[0]["EvaluateType"].ToString();

                PenaltyEmp.SelectedValue = DT4.Rows[0]["Emp_ID"].ToString();

                if ((DT4.Rows[0]["Penalty_Date"].ToString()) != "")
                    PaneltySDate.Text = DT4.Rows[0]["Penalty_Date1"].ToString();


            }


        }
    }

    protected void Button1_Click(object sender, EventArgs e) // ادخال البدلات للموظف
    {
        DataTable DT = new DataTable();
        bool validate = ValidateControls(new WebControl[] { EmpName, AllownaceRate, AllowanceValue });
        bool decimalValidate = DecimalValidateControls(new WebControl[] { AllownaceRate, AllowanceValue });
        bool DateValidate = DateValidateControls(new WebControl[] { AllowanceSDate, AllowanceFDate });
        if (validate && decimalValidate && DateValidate)
        {

           DT= DataAccess.Allowance_TB_AddEdit((Session["Allowance_ID"] == null) ? "" : Session["Allowance_ID"].ToString(),
                 (DropDownList3.SelectedValue == "1") ? "نسبة" : "قيمة", Convert.ToInt16(EvaluateType.SelectedValue),
                Convert.ToInt16(AllowancyTypeID.SelectedValue), 
                Convert.ToDecimal(AllownaceRate.Text), Convert.ToDecimal(AllowanceValue.Text),
                 Convert.ToDateTime(AllowanceSDate.Text), 
                    Convert.ToDateTime(AllowanceFDate.Text),  Convert.ToInt16(EmpName.SelectedValue), Convert.ToInt32(CurrType.Text),
                    Convert.ToInt16(UserID),(Session["Allowance_ID"] == null) ? 0 : Convert.ToInt16(UserID));
           ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
           if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                 {
                    Session["Allowance_ID"] = null;
              Repeater1.DataBind();
                    EmptyControls(new WebControl[] {  AllownaceRate, AllowanceValue, AllowanceSDate, AllowanceFDate });
                 
                }
              
        }
       else
       {
           ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
       }
        activeTab(1);
        }


    protected void Button3_Click(object sender, EventArgs e)// ادخال العلاوات للموظف 
    {
       DataTable DT= new DataTable();
           bool validate = ValidateControls(new WebControl[] { BounsEmp, BounsRate, BounsValue, BounsSDate, BounsFDate });
        bool decimalValidate = DecimalValidateControls(new WebControl[] {BounsValue, BounsRate });
        bool DateValidate = DateValidateControls(new WebControl[] { BounsSDate, BounsFDate});
        if (validate && decimalValidate && DateValidate)
        {
       
        

          DT=DataAccess.Bouns_TB_AddEdit((Session["Bouns_ID"] == null) ? "" : Session["Bouns_ID"].ToString(),
              Convert.ToInt16(DropDownList1.SelectedValue),(DropDownList1.SelectedValue == "3")? Convert.ToInt16(DropDownList7.SelectedValue):0,
              ( DropDownList6.SelectedValue=="1")?"نسبة":"قيمة", 2052,
                    Convert.ToDateTime(BounsSDate.Text), Convert.ToDateTime(BounsFDate.Text),  Convert.ToInt16(BounsEmp.SelectedValue),
                    Convert.ToDecimal(BounsRate.Text), Convert.ToDecimal(BounsValue.Text), Convert.ToInt32(CurrBou.Text), Convert.ToInt16(UserID), (Session["Bouns_ID"] == null) ? 0 : Convert.ToInt16(UserID));
          ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
          if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
             
            
            {
                Session["Bouns_ID"] = null;
                Repeater2.DataBind();
                EmptyControls(new WebControl[] {  BounsRate, BounsValue, BounsSDate, BounsFDate });
              
            }
           
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }

      activeTab(2);

    }

    protected void Deduction_Click(object sender, EventArgs e)// ادخال الجزاءات للموظف 
    {
        bool validate = ValidateControls(new WebControl[] { DedEmp, DedRate, DedValue, DedSDate,CurrDed, DedFDate, DropDownList2, DropDownList4, EvaluateType2 });
        bool decimalValidate = DecimalValidateControls(new WebControl[] { DedRate, DedValue });
        bool DateValidate = DateValidateControls(new WebControl[] { DedSDate, DedFDate });
        if (validate && decimalValidate && DateValidate)
        {

            if (DataAccess.Deduction_TB_AddEdit((Session["Deduction_ID"] == null) ? "" : Session["Deduction_ID"].ToString(),
                Convert.ToInt16(DedEmp.SelectedValue),
                Convert.ToInt16(DropDownList2.SelectedValue), (DropDownList4.SelectedValue == "1") ? "نسبة" : "قيمة", Convert.ToInt16(EvaluateType2.SelectedValue),
                Convert.ToDecimal(DedRate.Text),
                Convert.ToDecimal(DedValue.Text),
               Convert.ToDateTime(DedSDate.Text), 
               Convert.ToDateTime(DedFDate.Text),Convert.ToInt32(CurrDed.Text), Convert.ToInt16(UserID),
                (Session["Deduction_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Repeater3.DataBind();
                Session["Deduction_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] {  DedRate, DedValue, DedSDate, DedFDate, DropDownList2,CurrDed, DropDownList4, EvaluateType2 });

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
      activeTab(3);
    }

    protected void Motivation_Click(object sender, EventArgs e)// ادخال المكافآت للموظف 
    {
        bool validate = ValidateControls(new WebControl[] { DDMotivate,MotivatEmp, MotivateValue, MotivateRate, MotivateSDate, CurrMot, DropDownList5 });
        bool decimalValidate = DecimalValidateControls(new WebControl[] { MotivateValue, MotivateRate });
        bool DateValidate = DateValidateControls(new WebControl[] { MotivateSDate });
        if (validate && decimalValidate && DateValidate)
        {

            if (DataAccess.Motivation_TB_AddEdit((Session["Motivation_ID"] == null) ? "" : Session["Motivation_ID"].ToString(),
                Convert.ToInt16(DDMotivate.SelectedValue), (DropDownList5.SelectedValue == "1") ? "نسبة" : "قيمة", 0, Convert.ToDateTime(MotivateSDate.Text), 
                Convert.ToInt16(MotivatEmp.SelectedValue), "", Convert.ToDecimal(MotivateValue.Text), Convert.ToDecimal(MotivateRate.Text),
               Convert.ToInt32(CurrMot.Text), Convert.ToInt16(UserID),
                (Session["Motivation_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {

                Session["Motivation_ID"] = null;
                Repeater4.DataBind();
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { DDMotivate, MotivateValue, MotivateRate, MotivateSDate, CurrMot, DropDownList5 });

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
       activeTab(4);
    }

    protected void Panelty_Click(object sender, EventArgs e)// ادخال العقوبات للموظف 
    {

        bool validate = ValidateControls(new WebControl[] { DDPanelty, PenaltyEmp, PaneltySDate });
        bool decimalValidate = DecimalValidateControls(new WebControl[] {  });
        bool DateValidate = DateValidateControls(new WebControl[] { PaneltySDate });
        if (validate && decimalValidate && DateValidate)

        {

            if (DataAccess.Penalty_TB_AddEdit((Session["Penalty_ID"] == null) ? "" : Session["Penalty_ID"].ToString(),
                Convert.ToInt16(DDPanelty.SelectedValue),  0,
             Convert.ToDateTime(PaneltySDate.Text),
                Convert.ToInt16(PenaltyEmp.SelectedValue), Convert.ToInt16(UserID),
                (Session["Penalty_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Session["Penalty_ID"] = null;
                Repeater5.DataBind();
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { DDPanelty, PaneltySDate });


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
        activeTab(5);
    }

    


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        activeTab(2);
        if (DropDownList1.SelectedValue == "5")
        {
            son1.Visible = true;
           // DropDownList7.Visible = true;



        }

        else
        {
            son1.Visible = false;
           // DropDownList7.Visible = false;
        }

     
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList3.SelectedValue == "1") { AllowanceValue.Enabled = false; AllownaceRate.Enabled = true; }
        else
        {
            AllownaceRate.Enabled = false; AllowanceValue.Enabled = true;
        
        }
        activeTab(1);
    }
    protected void AllownaceRate_TextChanged(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { EmpName, AllownaceRate });
        bool decimalValidate = DecimalValidateControls(new WebControl[] { AllownaceRate });
        bool DateValidate = DateValidateControls(new WebControl[] {  });
        if (validate && decimalValidate && DateValidate)
        {
            DataTable DT = DataAccess.Employee_TB_Get(EmpName.SelectedValue);
            decimal main_salary = Convert.ToDecimal(DT.Rows[0]["Main_Salary"].ToString());
            decimal value = Math.Round( ((Convert.ToDecimal(AllownaceRate.Text) * (main_salary)) / 100),2);
            AllowanceValue.Text = value.ToString();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        activeTab(1);
        }
    protected void AllowanceValue_TextChanged(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { EmpName, AllowanceValue });
        bool decimalValidate = DecimalValidateControls(new WebControl[] { AllowanceValue });
        bool DateValidate = DateValidateControls(new WebControl[] { });
        if (validate && decimalValidate && DateValidate)
        {
            DataTable DT = DataAccess.Employee_TB_Get(EmpName.SelectedValue);
            decimal main_salary = Convert.ToDecimal(DT.Rows[0]["Main_Salary"].ToString());

            decimal rate =Math.Round( ((Convert.ToDecimal(AllowanceValue.Text) * 100) / (main_salary)),2);
          
            AllownaceRate.Text = rate.ToString();
        } 
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        activeTab(1);
    }


    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList6.SelectedValue == "1") { BounsValue.Enabled = false; BounsRate.Enabled = true; }
        else
        {
            BounsRate.Enabled = false; BounsValue.Enabled = true;

        }
      activeTab(2);
    }
    protected void BounsRate_TextChanged(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] {BounsEmp ,BounsRate  });
        bool decimalValidate = DecimalValidateControls(new WebControl[] { BounsRate });
        bool DateValidate = DateValidateControls(new WebControl[] { });
        if (validate && decimalValidate && DateValidate)
        {
            DataTable DT = DataAccess.Employee_TB_Get(BounsEmp.SelectedValue);
            decimal main_salary = Convert.ToDecimal(DT.Rows[0]["Main_Salary"].ToString());
            decimal value = Math.Round( ((Convert.ToDecimal(BounsRate.Text) * (main_salary)) / 100),2);
            BounsValue.Text = value.ToString();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
      activeTab(2);
    }
    protected void BounsValue_TextChanged(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { BounsEmp,BounsValue  });
        bool decimalValidate = DecimalValidateControls(new WebControl[] {BounsValue  });
        bool DateValidate = DateValidateControls(new WebControl[] { });
        if (validate && decimalValidate && DateValidate)
        {
            DataTable DT = DataAccess.Employee_TB_Get(BounsEmp.SelectedValue);
            decimal main_salary = Convert.ToDecimal(DT.Rows[0]["Main_Salary"].ToString());
            decimal rate = Math.Round( ((Convert.ToDecimal(BounsValue.Text) * 100) / (main_salary)),2);
            BounsRate.Text = rate.ToString();
        }

        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
      activeTab(2);
    }


    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (DropDownList4.SelectedValue == "1") { DedValue.Enabled = false; DedRate.Enabled = true; }
        else
        {
            DedRate.Enabled = false; DedValue.Enabled = true;

        }
      activeTab(3);
    }
    protected void DedRate_TextChanged(object sender, EventArgs e)
    {
         bool validate = ValidateControls(new WebControl[] {DedEmp , DedRate });
        bool decimalValidate = DecimalValidateControls(new WebControl[] {DedRate  });
        bool DateValidate = DateValidateControls(new WebControl[] { });
        if (validate && decimalValidate && DateValidate)
        {
            DataTable DT = DataAccess.Employee_TB_Get(DedEmp.SelectedValue);
            decimal main_salary = Convert.ToDecimal(DT.Rows[0]["Main_Salary"].ToString());
            
            decimal value = Math.Round( ((Convert.ToDecimal(DedRate.Text) * (main_salary)) / 100),2);
            DedValue.Text = value.ToString();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
      activeTab(3);
    }
    protected void DedValue_TextChanged(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { DedEmp, DedValue });
        bool decimalValidate = DecimalValidateControls(new WebControl[] {DedValue  });
        bool DateValidate = DateValidateControls(new WebControl[] { });
        if (validate && decimalValidate && DateValidate)
        {
            DataTable DT = DataAccess.Employee_TB_Get(DedEmp.SelectedValue);
            decimal main_salary = Convert.ToDecimal(DT.Rows[0]["Main_Salary"].ToString());
            decimal rate = Math.Round( ((Convert.ToDecimal(DedValue.Text) * 100) / (main_salary)),2);
            DedRate.Text = rate.ToString();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
      activeTab(3);
    }

    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList5.SelectedValue == "1") { MotivateValue.Enabled = false; MotivateRate.Enabled = true; }
        else
        {
            MotivateRate.Enabled = false; MotivateValue.Enabled = true;

        }
       activeTab(4);
    }
    protected void MotivateRate_TextChanged(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] {MotivatEmp ,MotivateRate  });
        bool decimalValidate = DecimalValidateControls(new WebControl[] {MotivateRate  });
        bool DateValidate = DateValidateControls(new WebControl[] { });
        if (validate && decimalValidate && DateValidate)
        {
            DataTable DT = DataAccess.Employee_TB_Get(MotivatEmp.SelectedValue);
            decimal main_salary = Convert.ToDecimal(DT.Rows[0]["Main_Salary"].ToString());
            decimal value = Math.Round( ((Convert.ToDecimal(MotivateRate.Text) * (main_salary)) / 100),2);
            MotivateValue.Text = value.ToString();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
       activeTab(4);
    }
    protected void MotivateValue_TextChanged(object sender, EventArgs e)
    {
         bool validate = ValidateControls(new WebControl[] {MotivatEmp ,  MotivateValue});
        bool decimalValidate = DecimalValidateControls(new WebControl[] { MotivateValue });
        bool DateValidate = DateValidateControls(new WebControl[] { });
        if (validate && decimalValidate && DateValidate)
        {
        DataTable DT = DataAccess.Employee_TB_Get(MotivatEmp.SelectedValue);
        decimal main_salary = Convert.ToDecimal(DT.Rows[0]["Main_Salary"].ToString());
        decimal rate = Math.Round( ((Convert.ToDecimal(MotivateValue.Text) * 100) / (main_salary)),2);
        MotivateRate.Text = rate.ToString();
    }
   else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
       activeTab(4);
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Allowance_ID"] = ((Label)ri.FindControl("AllowanceID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("AllowanceID")).Text;

        if (DataAccess.Allowance_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        activeTab(1);
    }

    protected void lbEdit_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Bouns_ID"] = ((Label)ri.FindControl("BounsID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbDelete_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("BounsID")).Text;

        if (DataAccess.Bouns_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
      activeTab(2);
    }

    protected void lbEdit_Click3(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Deduction_ID"] = ((Label)ri.FindControl("DeductionID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbDelete_Click3(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("DeductionID")).Text;

        if (DataAccess.Deduction_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater3.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
      activeTab(3);
    }

    protected void lbEdit_Click4(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Motivation_ID"] = ((Label)ri.FindControl("MotivationID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbDelete_Click4(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("MotivationID")).Text;

        if (DataAccess.Motivation_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater4.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
       activeTab(4);
    }

    protected void lbEdit_Click5(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Penalty_ID"] = ((Label)ri.FindControl("PenatlyID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbDelete_Click5(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("PenatlyID")).Text;

        if (DataAccess.Penalty_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater5.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        activeTab(5);
    }

    protected void Button2_Click(object sender, EventArgs e) 
    {
        EmptyControls(new WebControl[] { EmpName, AllownaceRate, AllowanceValue, AllowanceSDate, AllowanceFDate });
        AllownaceRate.Text = "";
        AllowanceValue.Text = "";
        Session["Allowance_ID"] = null;
        activeTab(1);
    }
    protected void Button4_Click(object sender, EventArgs e) 
    {
        EmptyControls(new WebControl[] { BounsEmp, BounsRate, BounsValue, BounsSDate, BounsFDate });
        BounsRate.Text = "";
        BounsValue.Text = "";
        Session["Bouns_ID"] = null;
      activeTab(2);
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { DedEmp, DedRate, DedValue, DedSDate, DedFDate });
        DedRate.Text = "";
        DedValue.Text = "";
        Session["Deduction_ID"] = null;
      activeTab(3);
}
    protected void Button12_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { MotivatEmp, MotivateRate, MotivateRate, MotivateSDate });
        MotivateRate.Text = "";
        MotivateValue.Text = "";
        Session["Motivation_ID"] = null;
       activeTab(4);
    }

    protected void Button15_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { PenaltyEmp, PaneltySDate});
  
        PaneltySDate.Text = "";
        Session["Penalty_ID"] = null;
        activeTab(5);
    }


    // css desgin tabs
    void activeTab(int i)
    {

        t1.Attributes.Add("Class", (i == 1) ? "active" : "");
        t2.Attributes.Add("Class", (i == 2) ? "active" : "");
        t3.Attributes.Add("Class", (i == 3) ? "active" : "");
        t4.Attributes.Add("Class", (i == 4) ? "active" : "");
        t5.Attributes.Add("Class", (i == 5) ? "active" : "");

        tab_1.Attributes.Add("Class", (i == 1) ? "tab-pane active" : "tab-pane ");
        tab_2.Attributes.Add("Class", (i == 2) ? "tab-pane active" : "tab-pane ");
        tab_3.Attributes.Add("Class", (i == 3) ? "tab-pane active" : "tab-pane ");
        tab_4.Attributes.Add("Class", (i == 4) ? "tab-pane active" : "tab-pane ");
        tab_5.Attributes.Add("Class", (i == 5) ? "tab-pane active" : "tab-pane ");
    }
    //void Cssallownace()
    //{
    //    t2.Attributes.Add("class", "");
    //    t3.Attributes.Add("class", "");
    //    t4.Attributes.Add("class", "");
    //    t5.Attributes.Add("class", "");
    //    t1.Attributes.Add("class", "active");
    //    tab_1.Attributes.Add("class", "tab-pane ");
    //    tab_2.Attributes.Add("class", "tab-pane ");
    //    tab_3.Attributes.Add("class", "tab-pane ");
    //    tab_4.Attributes.Add("class", "tab-pane ");
    //    tab_5.Attributes.Add("class", "tab-pane ");
    //}
    //void CssBouns()
    //{
    //    t1.Attributes.Add("class", "");
    //    t3.Attributes.Add("class", "");
    //    t4.Attributes.Add("class", "");
    //    t5.Attributes.Add("class", "");
    //    t2.Attributes.Add("class", "active");
    //    tab_2.Attributes.Add("class", "tab-pane active");
    //    tab_1.Attributes.Add("class", "tab-pane ");
    //    tab_3.Attributes.Add("class", "tab-pane ");
    //    tab_4.Attributes.Add("class", "tab-pane ");
    //    tab_5.Attributes.Add("class", "tab-pane ");
    //}
    //void CssDed()
    //{
    //    t1.Attributes.Add("class", "");
    //    t2.Attributes.Add("class", "");
    //    t4.Attributes.Add("class", "");
    //    t5.Attributes.Add("class", "");
    //    t3.Attributes.Add("class", "active");
    //    tab_3.Attributes.Add("class", "tab-pane active");
    //    tab_1.Attributes.Add("class", "tab-pane ");
    //    tab_2.Attributes.Add("class", "tab-pane ");
    //    tab_4.Attributes.Add("class", "tab-pane ");
    //    tab_5.Attributes.Add("class", "tab-pane ");
    //}
    //void CssPenalty()
    //{
    //    t1.Attributes.Add("class", "");
    //    t2.Attributes.Add("class", "");
    //    t3.Attributes.Add("class", "");
    //    t4.Attributes.Add("class", "");
    //    t5.Attributes.Add("class", "active");
    //    tab_5.Attributes.Add("class", "tab-pane active");
    //    tab_1.Attributes.Add("class", "tab-pane ");
    //    tab_2.Attributes.Add("class", "tab-pane ");
    //    tab_3.Attributes.Add("class", "tab-pane ");
    //    tab_4.Attributes.Add("class", "tab-pane ");
    //}

    //void CssMotivation()
    //{
    //    t1.Attributes.Add("class", "");
    //    t2.Attributes.Add("class", "");
    //    t3.Attributes.Add("class", "");
    //    t5.Attributes.Add("class", "");
    //    t4.Attributes.Add("class", "active");
    //    tab_4.Attributes.Add("class", "tab-pane active");
    //    tab_1.Attributes.Add("class", "tab-pane ");
    //    tab_2.Attributes.Add("class", "tab-pane ");
    //    tab_3.Attributes.Add("class", "tab-pane ");
    //    tab_5.Attributes.Add("class", "tab-pane ");
    //}

    protected void BounsEmp_SelectedIndexChanged(object sender, EventArgs e)
    {
        activeTab(2);
    }
    protected void PenaltyEmp_SelectedIndexChanged(object sender, EventArgs e)
    {
        activeTab(5);
    }
    protected void MotivatEmp_SelectedIndexChanged(object sender, EventArgs e)
    {
        activeTab(4);
    }
    protected void DedEmp_SelectedIndexChanged(object sender, EventArgs e)
    {
        activeTab(3);
    }
}
