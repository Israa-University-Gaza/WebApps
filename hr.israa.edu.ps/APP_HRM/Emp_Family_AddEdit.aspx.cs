using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Emp_Family : UserPage
{
    DataTable DT = new DataTable(); int EmpID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            if (Session["Emp_Family_ID"] != null)
            {
                
                DataTable DT = DataAccess.Emp_Family_Get(Session["Emp_Family_ID"].ToString());
                RelativeID.SelectedValue = DT.Rows[0]["Relative_Type_ID"].ToString();
                F_Name.Text = DT.Rows[0]["F_Name"].ToString();
                S_Name.Text = DT.Rows[0]["S_Name"].ToString();
                Th_Name.Text = DT.Rows[0]["Th_Name"].ToString();
                Family_Name.Text = DT.Rows[0]["Family_Name"].ToString();
               JobType.SelectedValue = DT.Rows[0]["Job"].ToString();
                CheckBox1.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
                 DOB.Text = Convert.ToDateTime(DT.Rows[0]["Date_Of_Birth"]).ToShortDateString();
                 if (Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString()) == false)
                 {
                     Active.Visible = true;
                     NotActive_Date.Text = Convert.ToDateTime(DT.Rows[0]["NotActive_Date"]).ToShortDateString();
                     Active2.Visible = true;
                     DropDownList2.SelectedValue = DT.Rows[0]["NotActive_Reason"].ToString();

                 }
                 DropDownList8.SelectedValue =DT.Rows[0]["Emp_ID"].ToString();
            }
           

            if (Session["Emergancy_ID"] != null)
            {
                DataTable DT = DataAccess.Emergancy_TB_Get(Session["Emergancy_ID"].ToString());
             
                TextBox1.Text = DT.Rows[0]["Ar_F_Name"].ToString();
                TextBox2.Text = DT.Rows[0]["Ar_S_Name"].ToString();
                TextBox3.Text = DT.Rows[0]["Ar_Th_Name"].ToString();
                TextBox4.Text = DT.Rows[0]["Ar_Family_Name"].ToString();
               DropDownList1.SelectedValue = DT.Rows[0]["Emergancy_Relative_ID"].ToString();
            
               CityID.SelectedValue = DT.Rows[0]["Emergancy_City_ID"].ToString();
         
                Address.Text = DT.Rows[0]["Emergancy_Address"].ToString();
                phone.Text = DT.Rows[0]["Emergancy_Phone"].ToString();
                mobile.Text = DT.Rows[0]["Emergancy_Mobile"].ToString();
                email.Text = DT.Rows[0]["Emergancy_email"].ToString();
                DropDownList3.SelectedValue = DT.Rows[0]["Emp_ID"].ToString();
            }

            if (Session["Ref_ID"] != null)
            {
                DataTable DT = DataAccess.References_Get(Session["Ref_ID"].ToString());
                Ar_F_Name.Text = DT.Rows[0]["Ar_F_Name"].ToString();
                Ar_S_Name.Text = DT.Rows[0]["Ar_S_Name"].ToString();
                Ar_Th_Name.Text = DT.Rows[0]["Ar_Th_Name"].ToString();
                Ar_Family.Text = DT.Rows[0]["Ar_Family_Name"].ToString();
                txtEmail.Text = DT.Rows[0]["Ref_Email"].ToString();
                // cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
                txtMobile.Text = DT.Rows[0]["Ref_Mobile"].ToString();
                txtPhone.Text = DT.Rows[0]["Ref_Phone"].ToString();
                txtJob.Text = DT.Rows[0]["Ref_Job"].ToString();
                Address.Text = DT.Rows[0]["Ref_Address"].ToString();
                DropDownList4.SelectedValue = DT.Rows[0]["Emp_ID"].ToString();
              
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)// بيانات العائلة
    {
       
       
            //if (ValidateControls(new WebControl[] { RelativeID, F_Name, S_Name, Family_Name, Th_Name, DropDownList8 }))
            //{

            //    if (DataAccess.Emp_Family_AddEdit((Session["Emp_Family_ID"] == null) ? "" : Session["Emp_Family_ID"].ToString(),
            //        F_Name.Text, S_Name.Text, Th_Name.Text, Family_Name.Text,
            //        Convert.ToInt16(RelativeID.SelectedValue.ToString()), Convert.ToDateTime(DOB.Text), birth_Place.Text, JobType.SelectedValue,
            //        Convert.ToInt16(DropDownList8.SelectedValue), CheckBox1.Checked,(CheckBox1.Checked)? 34: Convert.ToInt16(DropDownList2.SelectedValue),
            //        (CheckBox1.Checked) ? DBNull.Value.ToString() : (Convert.ToDateTime(NotActive_Date.Text).ToShortDateString()), Convert.ToInt16(UserID), (Session["Emp_Family_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            //    {
            //        Session["Emp_Family_ID"] = null;
            //        ShowToast(this, "تم الحفظ بنجاح.", "", "success");
            //        EmptyControls(new WebControl[] { RelativeID, F_Name, S_Name, Family_Name, Th_Name, DropDownList8 });
            //    }
            //    else
            //    {
            //        ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
            //    }
            //}
            //else
            //{
            //    ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
            //}
        }

       

             
        
        
          
    


    protected void Check_Changed(object sender, EventArgs e) // فعال او غير فعال
    {
        if (CheckBox1.Checked)
        {
            Active.Visible = false;
            Active2.Visible = false;
        }
        else
        {
            Active.Visible = true;
            Active2.Visible = true;
        }
    }
    protected void RelativeID_SelectedIndexChanged(object sender, EventArgs e)// تغيير اسم تاريخ الميلاد او تاريخ الزواج حسب صلة القرابة
    {
        if (RelativeID.SelectedItem.ToString() == "زوج" || RelativeID.SelectedItem.ToString() == "زوجة")
        {
            lbldate.Text = "تاريخ الزواج"; BPlace.Visible = false;
        }
        else lbldate.Text = "تاريخ الميلاد";
    }
    protected void Button3_Click(object sender, EventArgs e)// بيانات الطوارئ
    {
        if (ValidateControls(new WebControl[] {DropDownList1, DropDownList3, TextBox1, TextBox2, TextBox3, TextBox4 }))

        {

            if (DataAccess.Emergancy_TB_AddEdit((Session["Emergancy_ID"] == null) ? "" : Session["Emergancy_ID"].ToString(), TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, email.Text, phone.Text, mobile.Text,
                    Convert.ToInt16(DropDownList1.SelectedValue.ToString()),  Convert.ToInt16(CityID.SelectedValue.ToString()),
                    Address.Text, Convert.ToInt16(DropDownList3.SelectedValue), Convert.ToInt16(UserID), (Session["Emergancy_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
                
                {
                    Session["Emergancy_ID"] = null;
                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                    EmptyControls(new WebControl[] { DropDownList1, TextBox1, TextBox2, TextBox3, TextBox4, DropDownList3 });
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
   
    
    protected void Button5_Click(object sender, EventArgs e)// بيانات المعرفين
    {
        if (ValidateControls(new WebControl[] { Ar_F_Name, Ar_S_Name, Ar_Th_Name, Ar_Family, DropDownList4 }))

        {

            if (DataAccess.References_AddEdit((Session["Ref_ID"] == null) ? "" : Session["Ref_ID"].ToString(), Ar_F_Name.Text, Ar_S_Name.Text,
                Ar_Th_Name.Text, Ar_Family.Text, Convert.ToInt16(UserID),
                   txtEmail.Text,  txtMobile.Text,txtPhone.Text,txtJob.Text,
                    Address.Text, Convert.ToInt16(DropDownList4.SelectedValue), (Session["Ref_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
                
                {
                    Session["Ref_ID"] = null;
                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                    EmptyControls(new WebControl[] { Ar_F_Name, Ar_S_Name, Ar_Th_Name, Ar_Family, DropDownList4 });
                    Repeater3.DataBind();
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

    protected void Button2_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { RelativeID, F_Name, S_Name, Family_Name, Th_Name });
        Session["Emp_Family_ID"] = null;
    }


    protected void Button4_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { TextBox1, TextBox2, TextBox3, TextBox4 });
        Session["Emergancy_ID"] = null;
    }


    protected void Button6_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { Ar_F_Name, Ar_S_Name, Ar_Th_Name, Ar_Family });
        Session["Ref_ID"] = null;
    }


    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Emp_Family_ID"] = ((Label)ri.FindControl("EmpFamilyID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Family_AddEdit.aspx");
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("EmpFamilyID")).Text;

        if (DataAccess.Emp_Family_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }

    protected void lbEdit_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Emergancy_ID"] = ((Label)ri.FindControl("EmergancyID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Family_AddEdit.aspx");
    }

    protected void lbDelete_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("EmergancyID")).Text;

        if (DataAccess.Emergancy_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }
    protected void lbEdit_Click3(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Ref_ID"] = ((Label)ri.FindControl("RefID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Family_AddEdit.aspx");
    }

    protected void lbDelete_Click3(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("RefID")).Text;

        if (DataAccess.References_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater3.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }

    //protected void Username_Checker_Click1(object sender, EventArgs e)
    //{

    //    try
    //    {
    //        if (ValidateControls(new WebControl[] { txtEmp }))
    //        {
    //            DT = DataAccess.EmployeeNO_Get(txtEmp.Text);

    //            Label5.Text = DT.Rows[0]["Ar_F_Name"].ToString() + " " + DT.Rows[0]["Ar_S_Name"].ToString() + " " + DT.Rows[0]["Ar_Th_Name"].ToString() + " " + DT.Rows[0]["Ar_Family_Name"].ToString();
    //            //  tab_2.Attributes.Add("Class", "active");
    //            HiddenField1.Value = DT.Rows[0]["Emp_ID"].ToString();
    //        }
    //        else
    //        {
    //            ShowToast(this, "الرجاء ادخال رقم الموظف   بشكل صحيح.", "", "error");
    //        }
    //    }

    //    catch { ShowToast(this, "الرجاء ادخال رقم الموظف   بشكل صحيح.", "", "error"); }
    //}

    //protected void Username_Checker_Click2(object sender, EventArgs e)
    //{

    //    try
    //    {
    //        if (ValidateControls(new WebControl[] { TextBox5 }))
    //        {
    //            DT = DataAccess.EmployeeNO_Get(TextBox5.Text);

    //            Label5.Text = DT.Rows[0]["Ar_F_Name"].ToString() + " " + DT.Rows[0]["Ar_S_Name"].ToString() + " " + DT.Rows[0]["Ar_Th_Name"].ToString() + " " + DT.Rows[0]["Ar_Family_Name"].ToString();
    //            //  tab_2.Attributes.Add("Class", "active");
    //            HiddenField2.Value = DT.Rows[0]["Emp_ID"].ToString();
    //        }
    //        else
    //        {
    //            ShowToast(this, "الرجاء ادخال رقم الموظف   بشكل صحيح.", "", "error");
    //        }
    //    }

    //    catch { ShowToast(this, "الرجاء ادخال رقم الموظف   بشكل صحيح.", "", "error"); }
    //}

    //protected void Username_Checker_Click3(object sender, EventArgs e)
    //{

    //    try
    //    {
    //        if (ValidateControls(new WebControl[] { TextBox6 }))
    //        {
    //            DT = DataAccess.EmployeeNO_Get(TextBox6.Text);

    //            Label5.Text = DT.Rows[0]["Ar_F_Name"].ToString() + " " + DT.Rows[0]["Ar_S_Name"].ToString() + " " + DT.Rows[0]["Ar_Th_Name"].ToString() + " " + DT.Rows[0]["Ar_Family_Name"].ToString();
    //            //  tab_2.Attributes.Add("Class", "active");
    //            HiddenField3.Value = DT.Rows[0]["Emp_ID"].ToString();
    //        }
    //        else
    //        {
    //            ShowToast(this, "الرجاء ادخال رقم الموظف   بشكل صحيح.", "", "error");
    //        }
    //    }

    //    catch { ShowToast(this, "الرجاء ادخال رقم الموظف   بشكل صحيح.", "", "error"); }
    //}
}