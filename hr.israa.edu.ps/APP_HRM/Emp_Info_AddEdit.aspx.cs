using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class APP_HRM_Emp_Info_AddEdit : UserPage
{
    int EmpID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!Permissions.Contains("AddCaderBounsSalary"))
            {
                Subtab_2_9.Visible = false;
                li29.Visible = false;
            }

            if (Session["Emp_ID"] == null)
            {
                DisableControls(new WebControl[] { Ar_F_Name, Ar_S_Name, Ar_Th_Name, Ar_Family, En_F_Name, En_Family, En_S_Name, En_Th_Name, MotherName, Gender, Nationality, DOB, POB, SSN, passportNo, DriverType, DriverNo, Button1, Button2 });
                DisableControls(new WebControl[] { children, DependentNo, MStatus, wifes, Button5, Button6 });
                Subtab_2_5.Visible = false; li25.Visible = false;
                DisableControls(new WebControl[] { ddlEmpCategory, Empstatus, ddlAcademicData, AccountBank, BankBranch, Banks, Button9, Button7, Button8 });
                RetirmentStatus.Visible = false;
                EmpType.Visible = false;
                DivEmpStatus.Visible = false;
                DivEmpDegree.Visible = false;
                DivCheckEmployee.Visible = false;
                Subtab_2_9.Visible = false;
                li29.Visible = false;
                tab_1_3.Visible = false; tab_1_4.Visible = false; tab_1_5.Visible = false;
                li3.Visible = false; li4.Visible = false; li5.Visible = false;
                Label4.Text = Context.User.Identity.Name;

            }

            // must disable all textboxes for employee  only show data
            else if (Session["Emp_ID"] != null)
            {
                if (Permissions.Contains("ProfileView"))
                {
                    //login HRM Employee to any employee page for edit update data
                    Label4.Text = Session["Emp_ID"].ToString();
                    RetirmentStatus.Visible = true;
                    EmpType.Visible = true;
                    DivEmpStatus.Visible = true;
                    DivEmpDegree.Visible = true;
                    DivCheckEmployee.Visible = true;
                    DivContract.Visible = true;
                    changePassword.Visible = false;
                    li28.Visible = true;
                    Subtab_2_8.Visible = true;
                    Subtab_2_9.Visible = true;

                    // btnAddExceptionDegreeBouns.Visible = true;
                    Div4.Visible = true;
                    Session["Emp_ID"] = null;
                    // must enable all textboxes for hrmEmployee to edit data
                }
            }

            activeTab(1);


            try
            {
                DataTable DT11 = DataAccess.Employee_TB_Get(Label4.Text);
                string attendance = DT11.Rows[0]["Attendance_Type_ID"].ToString();
                if (attendance == "2055")
                {
                    Div1.Visible = true;
                    Div2.Visible = false;
                    Div3.Visible = false;
                }
                if (attendance == "2056")
                {
                    Div1.Visible = false;
                    Div2.Visible = true;
                    Div3.Visible = false;
                }
                if (attendance == "2057")
                {
                    Div1.Visible = false;
                    Div2.Visible = false;
                    Div3.Visible = true;
                }
            }
            catch { }


            DataTable DTphoto = DataAccess.EmployeePhoto_Get(Label4.Text);
            if (DTphoto.Rows.Count > 0)
            {
                if (!Convert.IsDBNull(DTphoto.Rows[0]["Emp_Picture"]))
                {
                    // Get the byte array from image file
                    byte[] imgBytes = (byte[])DTphoto.Rows[0]["Emp_Picture"];
                    string imgString = Convert.ToBase64String(imgBytes);
                    //Set the source with data:image/bmp
                    image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    imgTitle.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                }
            }


            DataTable DT = DataAccess.Employee_TB_Get(Label4.Text);
            if (DT.Rows.Count > 0)
            {
                Ar_F_Name.Text = DT.Rows[0]["Ar_F_Name"].ToString();
                Ar_S_Name.Text = DT.Rows[0]["Ar_S_Name"].ToString();
                Ar_Th_Name.Text = DT.Rows[0]["Ar_Th_Name"].ToString();
                Ar_Family.Text = DT.Rows[0]["Ar_Family_Name"].ToString();
                En_F_Name.Text = DT.Rows[0]["En_F_Name"].ToString();
                En_S_Name.Text = DT.Rows[0]["En_S_Name"].ToString();
                En_Th_Name.Text = DT.Rows[0]["En_Th_Name"].ToString();
                En_Family.Text = DT.Rows[0]["En_Family_Name"].ToString();
                MotherName.Text = DT.Rows[0]["Emp_Mother_Name"].ToString();
                ViewCV.Text = DT.Rows[0]["CVFile"].ToString();
                ddlCaderEmployee.SelectedValue = (Convert.ToBoolean(DT.Rows[0]["IsCaderEmployee"]) == false) ? "0" : "1";


                if ((DT.Rows[0]["Emp_DOB"].ToString()) != "")
                    DOB.Text = DT.Rows[0]["Emp_DOB1"].ToString();

                if (DT.Rows[0]["C_Driver_Licence_Type_ID"].ToString() != "") DriverType.SelectedValue = DT.Rows[0]["C_Driver_Licence_Type_ID"].ToString();
                DriverNo.Text = DT.Rows[0]["Emp_Driver_Licence_No"].ToString();

                if (DT.Rows[0]["C_Bank_ID"].ToString() != "") Banks.SelectedValue = DT.Rows[0]["C_Bank_ID"].ToString();
                AccountBank.Text = DT.Rows[0]["Emp_Bank_Account_NO"].ToString();

                // if ((DT.Rows[0]["Emp_Appointment_Date"].ToString()) != "")
                //    EmpAppointmentDate.Text = DT.Rows[0]["Emp_Appointment_Date1"].ToString();


                if ((DT.Rows[0]["C_City_ID"].ToString()) != "") CityID.SelectedValue = DT.Rows[0]["C_City_ID"].ToString();
                if ((DT.Rows[0]["C_Region_ID"].ToString()) != "") Region.SelectedValue = DT.Rows[0]["C_Region_ID"].ToString();
                home.Text = DT.Rows[0]["Emp_Home_ID"].ToString();

                DependentNo.Text = DT.Rows[0]["Emp_Dependent_No"].ToString();
                POB.Text = DT.Rows[0]["Emp_DOB_Place"].ToString();

                UnivEmail.Text = DT.Rows[0]["UnivEmail"].ToString();
                email.Text = DT.Rows[0]["Emp_Email"].ToString();
                fax.Text = DT.Rows[0]["Emp_Fax"].ToString();
                mobile.Text = DT.Rows[0]["Emp_Mobile"].ToString();
                Nationality.SelectedValue = (DT.Rows[0]["Emp_Nationality_ID"].ToString() != "") ? DT.Rows[0]["Emp_Nationality_ID"].ToString() : "0";
                passportNo.Text = DT.Rows[0]["Emp_Passport_No"].ToString();
                //               JobTitle.SelectedValue = (DT.Rows[0]["Emp_Job_Title_ID"]!= null) ? DT.Rows[0]["Emp_Job_Title_ID"].ToString() : "0";
                SSN.Text = DT.Rows[0]["Emp_SSN"].ToString();
                Empstatus.SelectedValue = (DT.Rows[0]["Emp_Status_ID"].ToString() != "") ? DT.Rows[0]["Emp_Status_ID"].ToString() : "0";
                if (DT.Rows[0]["Emp_Status_ID"].ToString() == "1041")
                {
                    ddlEmpSubStatus.DataSourceID = "SqlDataSource22";
                    ddlEmpSubStatus.DataBind();
                    ddlEmpSubStatus.SelectedValue = DT.Rows[0]["EmployeeSubStatusID"].ToString();
                }
                else if (DT.Rows[0]["Emp_Status_ID"].ToString() == "1043")
                {
                    ddlEmpSubStatus.DataSourceID = "SqlDataSource34";
                    ddlEmpSubStatus.DataBind();
                    ddlEmpSubStatus.SelectedValue = DT.Rows[0]["EmployeeSubStatusID"].ToString();
                }
                else if (DT.Rows[0]["Emp_Status_ID"].ToString() == "2122")
                {
                    ddlEmpSubStatus.DataSourceID = "SqlDataSource35";
                    ddlEmpSubStatus.DataBind();
                    ddlEmpSubStatus.SelectedValue = DT.Rows[0]["EmployeeSubStatusID"].ToString();

                }
                else
                {
                    ddlEmpSubStatus.Visible = false;
                    ddlEmpSubStatus.SelectedValue = "-1";
                }
                ddlEmpCategory.SelectedValue = (DT.Rows[0]["EmpCategoryID"].ToString() != "") ? DT.Rows[0]["EmpCategoryID"].ToString() : "-1";
                //new
                ddlEmpTypeID.SelectedValue = (DT.Rows[0]["EmployeeTypeStatusID"].ToString() != "") ? DT.Rows[0]["EmployeeTypeStatusID"].ToString() : "-1";
                ddlEmpSubTypeID.SelectedValue = (DT.Rows[0]["EmployeeSubTypeStatusID"].ToString() != "") ? DT.Rows[0]["EmployeeSubTypeStatusID"].ToString() : "-1";

                ddlAcademicData.SelectedValue = (DT.Rows[0]["AcademicData"].ToString() != "") ? DT.Rows[0]["AcademicData"].ToString() : "-1";
                ddlRetirementStatus.SelectedValue = (DT.Rows[0]["RetirementStatusID"].ToString() != "") ? DT.Rows[0]["RetirementStatusID"].ToString() : "-1";
                street.Text = DT.Rows[0]["Emp_Street"].ToString();
                phone.Text = DT.Rows[0]["Emp_Phone"].ToString();
                //                ddlEmployeeCat.SelectedValue = (DT.Rows[0]["EmployeeCatID"].ToString() != "") ? DT.Rows[0]["EmployeeCatID"].ToString() : "-1";
                //                ddlEmployeeCat.DataBind();
                //               Con_Type_ID.DataBind();
                /*                if (ddlEmployeeCat.SelectedValue == "2")
                                {
                                    ContractType.Visible = true;

                                }
                                Con_Type_ID.SelectedValue = (DT.Rows[0]["Contract_Type_ID"].ToString() != "") ? DT.Rows[0]["Contract_Type_ID"].ToString() : "0";
                                ddlContractSubType.DataBind();
                                if (Con_Type_ID.SelectedValue == "7" && DT.Rows[0]["SubConTypeID"].ToString() != "-1")
                                {
                                    subcontract.Visible = true;
                                }
                                ddlContractSubType.SelectedValue = (DT.Rows[0]["SubConTypeID"].ToString() != "") ? DT.Rows[0]["SubConTypeID"].ToString() : "-1";
                    */
                if (DT.Rows[0]["Emp_Marital_Status_ID"].ToString() != "") MStatus.SelectedValue = DT.Rows[0]["Emp_Marital_Status_ID"].ToString();
                if ((DT.Rows[0]["Emp_Marital_Status_ID"].ToString() == "1044"))
                {
                    wifesNo.Visible = false;
                    chNo.Visible = false;
                }
                else
                {


                    children.Text = DT.Rows[0]["Emp_Children_No"].ToString();
                    wifes.Text = DT.Rows[0]["Emp_Wifes_No"].ToString();
                    wifesNo.Visible = true;
                    chNo.Visible = true;
                }
                if (DT.Rows[0]["Emp_Gender"].ToString() != "")
                {
                    Gender.SelectedValue = DT.Rows[0]["Emp_Gender"].ToString();
                    wifesNo.Visible = (DT.Rows[0]["Emp_Gender"].ToString() == "False") ? false : true;
                }
                //                EmpNo.Text = DT.Rows[0]["EmployeeNO"].ToString();



                EmpID = Convert.ToInt16(DT.Rows[0]["Emp_ID"].ToString());
                BankBranch.Text = DT.Rows[0]["Bank_Branch"].ToString();

                // Employee Degree
                ddlCader.DataBind();
                ddlCader.SelectedValue = DT.Rows[0]["CaderID"].ToString();
                ddlGrade.DataBind();
                ddlGrade.SelectedValue = DT.Rows[0]["GradeID"].ToString();
                ddlDegree.DataBind();
                ddlDegree.SelectedValue = DT.Rows[0]["DegreeID"].ToString();
                txtSeniority.Text = DT.Rows[0]["Seniority"].ToString();
                //lblEmployeeDegreeBouns.Text= DT.Rows[0]["EmployeeDegreeBouns"].ToString();
                //if(Convert.ToBoolean(DT.Rows[0]["HaveExceptionDegreeBouns"].ToString())==true)
                //{
                //    btnDeleteDegreeBounsException.Visible = true;
                //}
            }
        }

    }

    protected int Subtract(int item1, int item2)
    {
        return (item1 - item2);

    }
    public bool ID_CHECK(string ssn)
    {
        bool valid = false;
        string ID_String = ssn.Trim();
        int IDSum = 0;

        if (ID_String.Length == 9)
        {
            for (int i = 1; i <= 7; i++)
            {
                int x = ((Convert.ToInt32(ID_String.Substring(i, 1))) * (((i % 2) == 0) ? 1 : 2));
                IDSum = (x > 9) ? IDSum + (x % 10) + 1 : IDSum + (x % 10);
            }
            IDSum = IDSum + Convert.ToInt32(ID_String.Substring(0, 1));
            valid = (Convert.ToInt32(ID_String.Substring(8, 1)) == (10 - Convert.ToInt32((IDSum.ToString()).Substring(1, 1))));
        }
        return valid;

    } // رقم الهوية


    protected void Button1_Click(object sender, EventArgs e)
    {

        bool Validate = ValidateControls(new WebControl[] { Ar_F_Name, Ar_S_Name, Ar_Th_Name, Ar_Family });
        bool dateValidate = DateValidateControls(new WebControl[] { DOB });


        if (Validate && dateValidate)
        {

            if (DataAccess.EmployeeInfo_TB_AddEdit(Label4.Text, Ar_F_Name.Text, Ar_S_Name.Text, Ar_Th_Name.Text, Ar_Family.Text, En_F_Name.Text, En_S_Name.Text, En_Th_Name.Text, En_Family.Text,
              MotherName.Text, Convert.ToBoolean(Gender.SelectedValue), Convert.ToInt16(Nationality.SelectedValue), Convert.ToDateTime(DOB.Text), POB.Text, SSN.Text, passportNo.Text,
              Convert.ToInt16(DriverType.SelectedValue), DriverNo.Text, Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { });
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }

        activeTab(2);
        activeTab2(1);

    } // البيانات الشخصية
    protected void Button2_Click(object sender, EventArgs e)
    {

        EmptyControls(new WebControl[] { Ar_F_Name, Ar_S_Name, Ar_Th_Name, Ar_Family, En_F_Name, En_S_Name, En_Th_Name, En_Family, MotherName });

        activeTab(2);
        activeTab2(1);

    }

    protected void Button3_Click(object sender, EventArgs e)
    {

        if (ValidateControls(new WebControl[] { /*phone, mobile, email, CityID, Region, street, home*/ }))
        {

            if (DataAccess.EmployeeInfoContact_TB_AddEdit(Label4.Text, phone.Text, mobile.Text, email.Text, fax.Text, Convert.ToInt16(CityID.SelectedValue), Convert.ToInt16(Region.SelectedValue),
              street.Text, home.Text, UnivEmail.Text, Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { });
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }

        activeTab(2);
        activeTab2(3);
    } // الاتصال و التواصل
    protected void Button16_Click(object sender, EventArgs e)
    {

        EmptyControls(new WebControl[] { phone, mobile, email, fax, CityID, Region, street, home, UnivEmail });

        activeTab(2);
        activeTab2(3);

    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { !(MStatus.SelectedValue == "1044") ? wifes : null, !(MStatus.SelectedValue == "1044") ? children : null, DependentNo });
        if (IntValidate)
        {

            if (DataAccess.EmployeeInfoStatus_TB_AddEdit(Label4.Text, Convert.ToInt16(MStatus.SelectedValue), !(MStatus.SelectedValue == "1044") ? Convert.ToInt16(wifes.Text) : 0,
               !(MStatus.SelectedValue == "1044") ? Convert.ToInt16(children.Text) : 0, Convert.ToInt16(DependentNo.Text), Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { });
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

        activeTab(2);
        activeTab2(4);
    } // الحالة الاجتماعية
    protected void Button6_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { wifes, children, DependentNo });

        activeTab(2);
        activeTab2(4);
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { }))
        {

            if (DataAccess.ChangeEmployeeData(Label4.Text, Convert.ToInt16(ddlEmpCategory.SelectedValue),
             ddlAcademicData.SelectedValue, ddlRetirementStatus.SelectedValue, ddlCaderEmployee.SelectedValue, Convert.ToInt16(UserID)) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { });
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        activeTab(2);
        activeTab2(6);
    } // البيانات الوظيفية
    protected void Button10_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { Empstatus });

        activeTab(2);
        activeTab2(6);
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { }))
        {

            if (DataAccess.EmployeeBank_TB_AddEdit(Label4.Text, Convert.ToInt16(Banks.SelectedValue), BankBranch.Text, AccountBank.Text, Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { });
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }

        activeTab(2);
        activeTab2(7);
    } // البيانات البنكية
    protected void Button8_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { AccountBank, BankBranch, Banks });

        activeTab(2);
        activeTab2(7);
    }
    protected void Button11_Click(object sender, EventArgs e)
    {


        string base64 = Request.Form["imgCropped"];
        byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);


        if (ValidateControls(new WebControl[] { }))
        {

            if (DataAccess.EmployeePhoto_TB_AddEdit(Label4.Text,

              bytes, Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");

                string imgString = Convert.ToBase64String(bytes);
                image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                EmptyControls(new WebControl[] { });
                Response.Redirect(Request.RawUrl);
            }
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
        }




        activeTab(2);
        activeTab2(2);

    } // الصورة الشخصية
    protected void Button12_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { });

        activeTab(2);
        activeTab2(2);
    }
    protected void MStatus_SelectedIndexChanged(object sender, EventArgs e)// تغيير اسم تاريخ الميلاد او تاريخ الزواج حسب صلة القرابة
    {
        if (MStatus.SelectedValue == "1044")
        {
            wifesNo.Visible = false;
            chNo.Visible = false;
            activeTab(2);
            activeTab2(4);
        }
        else
        {
            wifesNo.Visible = true;
            chNo.Visible = true;
            activeTab(2);
            activeTab2(4);
        }
    }
    protected void Button13_Click(object sender, EventArgs e)// بيانات العائلة
    {
        bool date = DateValidateControls(new WebControl[] { !(CheckBox1.Checked) ? NotActive_Date : null });

        bool valid = ValidateControls(new WebControl[] { RelativeID, F_Name });
        if (date && valid)
        {

            DataTable DT = DataAccess.Emp_Family_AddEdit(lblEmpFamily.Text,
                 F_Name.Text, S_Name.Text, Th_Name.Text, Family_Name.Text, RelativeID.SelectedValue, Convert.ToDateTime(DOB1.Text),
                 birth_Place.Text, JobType.SelectedValue, Convert.ToInt16(Label4.Text), CheckBox1.Checked, (CheckBox1.Checked == true) ? "34" : DropDownList2.SelectedValue,
                 (!CheckBox1.Checked) ? NotActive_Date.Text : "", UserID, UserID);

            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if ((Convert.ToInt32(DT.Rows[0]["status"].ToString())) > 0)
            {


                EmptyControls(new WebControl[] { lblEmpFamily, RelativeID, F_Name, S_Name, Family_Name, Th_Name, DOB1, birth_Place, JobType, CheckBox1, NotActive_Date });
                Repeater1.DataBind();
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        activeTab(2);
        activeTab2(5);
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblEmpFamily, RelativeID, F_Name, S_Name, Family_Name, Th_Name, DOB1, birth_Place, JobType, CheckBox1 });


        activeTab(2);
        activeTab2(5);
    }
    protected void RelativeID_SelectedIndexChanged(object sender, EventArgs e)// تغيير اسم تاريخ الميلاد او تاريخ الزواج حسب صلة القرابة
    {
        //  if (RelativeID.SelectedItem.ToString() == "زوج" || RelativeID.SelectedItem.ToString() == "زوجة")
        if (RelativeID.SelectedValue == "7")
        {
            lbldate.Text = "تاريخ الزواج";
            BPlace.Visible = false;
            birth_Place.Visible = false;

        }
        else
            lbldate.Text = "تاريخ الميلاد";
        activeTab(2);
        activeTab2(5);


        if (RelativeID.SelectedValue == "8")
        {
            lblName.Text = "اسم الابن/ة";
            S_Name.Visible = false;
            Th_Name.Visible = false;
            Family_Name.Visible = false;
            activeTab(2);
            activeTab2(5);

        }
        else
        {
            lblName.Text = "الاسم بالكامل ";
            S_Name.Visible = true;
            Th_Name.Visible = true;
            Family_Name.Visible = true;
            activeTab(2);
            activeTab2(5);


        }

    }
    protected void Gender_SelectedIndexChanged(object sender, EventArgs e)// تغيير اسم تاريخ الميلاد او تاريخ الزواج حسب صلة القرابة
    {
        if (Gender.SelectedValue == "False")
        {
            wifesNo.Visible = false;
            activeTab(2);
            activeTab2(1);
        }
        else
            wifesNo.Visible = true;
        activeTab(2);
        activeTab2(1);
    }
    protected void Check_Changed(object sender, EventArgs e) // فعال او غير فعال
    {
        if (CheckBox1.Checked)
        {
            Active.Visible = false;
            Active2.Visible = false;
            activeTab2(5);
        }
        else
        {
            Active.Visible = true;
            Active2.Visible = true;
            activeTab2(5);
        }

        activeTab(2);
        activeTab2(5);
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblEmpFamily.Text = ((Label)ri.FindControl("EmpFamilyID")).Text;

        activeTab(2);
        activeTab2(5);

        //try
        //{
        DataTable DT2 = DataAccess.Emp_Family_Get(lblEmpFamily.Text);
        if (DT2.Rows.Count > 0)
        {
            if (DT2.Rows[0]["Relative_Type_ID"].ToString() != "") RelativeID.SelectedValue = DT2.Rows[0]["Relative_Type_ID"].ToString();

            F_Name.Text = DT2.Rows[0]["F_Name"].ToString();
            S_Name.Text = DT2.Rows[0]["S_Name"].ToString();
            Th_Name.Text = DT2.Rows[0]["Th_Name"].ToString();
            Family_Name.Text = DT2.Rows[0]["Family_Name"].ToString();
            //if (DT2.Rows[0]["Job"].ToString() != "") JobType.SelectedValue = DT2.Rows[0]["Job"].ToString();
            // cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());


            DOB1.Text = DT2.Rows[0]["Date_Of_Birth1"].ToString();
            birth_Place.Text = DT2.Rows[0]["Birth_Place"].ToString();
            if (DT2.Rows[0]["Job"].ToString() != "") JobType.SelectedValue = DT2.Rows[0]["Job"].ToString();


            CheckBox1.Checked = Convert.ToBoolean(DT2.Rows[0]["IsActive"].ToString());
            if (CheckBox1.Checked == false)
            {
                if (DT2.Rows[0]["NotActive_Reason"].ToString() != "") DropDownList2.SelectedValue = DT2.Rows[0]["NotActive_Reason"].ToString();
                if (DT2.Rows[0]["NotActive_Date"].ToString() != "") NotActive_Date.Text = Convert.ToDateTime(DT2.Rows[0]["NotActive_Date"]).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);

            }
            else
            {
                Active.Visible = false;
                Active2.Visible = false;
            }

            EmpID = Convert.ToInt16(DT2.Rows[0]["Emp_ID"].ToString());
            EmpFamilyID.Text = DT2.Rows[0]["Emp_Family_ID"].ToString();
        }
        //}
        //catch { }

    }



    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("EmpFamilyID")).Text;

        if (DataAccess.Emp_Family_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        Repeater1.DataBind();

        activeTab(2);
        activeTab2(5);
    }



    protected void Button15_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { DropDownList1, ETextBox2, ETextBox3, ETextBox4, ETextBox5 }))
        {

            if (DataAccess.Emergancy_TB_AddEdit(lblEmergancyID.Text, ETextBox2.Text, ETextBox3.Text, ETextBox4.Text, ETextBox4.Text,
                Eemail.Text, Ephone.Text, Emobile.Text, Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(ECityID.SelectedValue),
                EAddress.Text, Convert.ToInt16(Label4.Text), Convert.ToInt16(Label4.Text), Convert.ToInt16(UserID)) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblEmergancyID, DropDownList1, ETextBox5, Ephone, Eemail, Emobile, EAddress, ETextBox2, ETextBox3, ETextBox4, ECityID });
                Repeater3.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        activeTab(5);
        activeTab5(2);
    }// بيانات الطوارئ
    protected void Button20_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblEmergancyID, DropDownList1, ETextBox5, Ephone, Eemail, Emobile, EAddress, ETextBox2, ETextBox3, ETextBox4, ECityID });

        activeTab(5);
        activeTab5(2);
    }
    protected void lbDeleteEmg_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("EmergancyID")).Text;

        if (DataAccess.Emergancy_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater3.DataBind();

        }
        else
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        Repeater3.DataBind();

    }

    protected void lbEditEmg_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblEmergancyID.Text = ((Label)ri.FindControl("EmergancyID")).Text;

        activeTab(5);
        activeTab5(2);

        DataTable DT3 = DataAccess.Emergancy_TB_Get(lblEmergancyID.Text);
        if (DT3.Rows.Count > 0)
        {
            ETextBox2.Text = DT3.Rows[0]["Ar_F_Name"].ToString();
            ETextBox3.Text = DT3.Rows[0]["Ar_S_Name"].ToString();
            ETextBox4.Text = DT3.Rows[0]["Ar_Th_Name"].ToString();
            ETextBox5.Text = DT3.Rows[0]["Ar_Family_Name"].ToString();
            DropDownList1.SelectedValue = DT3.Rows[0]["Emergancy_Relative_ID"].ToString();
            ECityID.SelectedValue = DT3.Rows[0]["Emergancy_City_ID"].ToString();
            EAddress.Text = DT3.Rows[0]["Emergancy_Address"].ToString();
            Ephone.Text = DT3.Rows[0]["Emergancy_Phone"].ToString();
            Emobile.Text = DT3.Rows[0]["Emergancy_Mobile"].ToString();
            Eemail.Text = DT3.Rows[0]["Emergancy_Email"].ToString();
            EmpID = Convert.ToInt16(DT3.Rows[0]["Emp_ID"].ToString());
        }

    }




    protected void Button17_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { RAr_F_Name, RAr_S_Name, RAr_Th_Name, RAr_Family }))
        {

            if (DataAccess.References_AddEdit(lblRefID.Text, RAr_F_Name.Text, RAr_S_Name.Text,
                RAr_Th_Name.Text, RAr_Family.Text, Convert.ToInt16(Label4.Text), txtEmail.Text, txtMobile.Text, txtPhone.Text, txtJob.Text,
                txtAddress.Text, Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblRefID, Ar_F_Name, Ar_S_Name, Ar_Th_Name, Ar_Family });
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

        activeTab(5);
        activeTab5(1);

    } // بيانات المعرفين
    protected void Button18_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblRefID, RAr_F_Name, RAr_S_Name, RAr_Th_Name, RAr_Family });

        activeTab(5);
        activeTab5(1);
    }
    protected void lbEditRef_Click3(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblRefID.Text = ((Label)ri.FindControl("RefID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Info_AddEdit.aspx");

        activeTab(5);
        activeTab5(1);
        try
        {
            DataTable DT4 = DataAccess.References_Get(lblRefID.Text);
            if (DT4.Rows.Count > 0)
            {
                RAr_F_Name.Text = DT4.Rows[0]["Ar_F_Name"].ToString();
                RAr_S_Name.Text = DT4.Rows[0]["Ar_S_Name"].ToString();
                RAr_Th_Name.Text = DT4.Rows[0]["Ar_Th_Name"].ToString();
                RAr_Family.Text = DT4.Rows[0]["Ar_Family_Name"].ToString();

                txtEmail.Text = DT4.Rows[0]["Ref_Email"].ToString();
                // cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
                txtMobile.Text = DT4.Rows[0]["Ref_Mobile"].ToString();
                txtPhone.Text = DT4.Rows[0]["Ref_Phone"].ToString();
                txtJob.Text = DT4.Rows[0]["Ref_Job"].ToString();
                txtAddress.Text = DT4.Rows[0]["Ref_Address"].ToString();
                EmpID = Convert.ToInt16(DT4.Rows[0]["Emp_ID"].ToString());
            }
        }
        catch { }
    }

    protected void lbDeleteRef_Click3(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("RefID")).Text;

        if (DataAccess.References_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater4.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        activeTab(5);
        activeTab5(1);
    }


    protected void Button30_Click(object sender, EventArgs e)
    {
        string images = "";
        // bool decimalvalidate = DecimalValidateControls(new WebControl[] { txtAvg });
        if (ValidateControls(new WebControl[] { QulTypeID, Res_Date, UniID, col, txtAvg, Speclize }))
        {

            if (Image1.Visible == true) { images = Image1.ImageUrl.ToString(); }
            if (FileUpload1.Visible == true)
            {
                if (FileUpload1.PostedFile.ContentType.Contains("image"))
                {

                    images = Guid.NewGuid() + System.IO.Path.GetExtension(FileUpload1.FileName);
                    FileUpload1.SaveAs(MapPath("../images/Certification/") + images);
                }
            }
            if (DataAccess.Qualification_TB_AddEdit(lblQualifactionID.Text,
                Convert.ToInt16(QulTypeID.SelectedValue), Convert.ToInt16(CuntID.SelectedValue), UniID.Text,
                Convert.ToDateTime(Res_Date.Text), Convert.ToInt16(Label4.Text), col.Text, txtAvg.Text, Speclize.Text, Convert.ToInt16(UserID),
                 (lblQualifactionID.Text == "") ? 0 : Convert.ToInt16(UserID), QTextBox11.Text, images) > 0)
            {

                Image1.Visible = false;
                FileUpload1.Visible = true;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblQualifactionID, QulTypeID, UniID, col, txtAvg, Speclize, Res_Date, QTextBox11, CuntID });
                Repeater5.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }


        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }

        activeTab(3);
        activeTab3(1);

    }// المؤهلات العلمية
    protected void btnCance31_Click2(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblQualifactionID, QulTypeID, CuntID, UniID, Res_Date, QTextBox11, col, txtAvg, Speclize });

        activeTab(3);
        activeTab3(1);
    }
    protected void lbEditQul_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblQualifactionID.Text = ((Label)ri.FindControl("Qualifaction_ID")).Text;

        activeTab(3);
        activeTab3(1);
        try
        {
            DataTable DT5 = DataAccess.Qualification_TB_Get(lblQualifactionID.Text);
            if (DT5.Rows.Count > 0)
            {
                if (DT5.Rows[0]["C_Qual_Type_ID"].ToString() != "") QulTypeID.SelectedValue = DT5.Rows[0]["C_Qual_Type_ID"].ToString();
                if ((DT5.Rows[0]["C_Country_ID"].ToString()) != "") CuntID.SelectedValue = DT5.Rows[0]["C_Country_ID"].ToString();
                UniID.Text = DT5.Rows[0]["C_University_ID"].ToString();
                Res_Date.Text = DT5.Rows[0]["Graduate_Date1"].ToString();
                col.Text = DT5.Rows[0]["Collage_Name"].ToString();
                txtAvg.Text = DT5.Rows[0]["Qual_Avarge_GPA"].ToString();
                Speclize.Text = DT5.Rows[0]["Speclize"].ToString();
            }
            // من جدول الشهادات
            DataTable DT12 = DataAccess.Certificate_TB_Get(DT5.Rows[0]["Certificate_ID"].ToString());
            if (DT12.Rows.Count > 0)
            {
                Image1.Visible = true;
                Image1.ImageUrl = "../images/Certification/" + DT12.Rows[0]["Scan_Pic"].ToString();
                QTextBox11.Text = DT12.Rows[0]["Certificate_Name"].ToString();
            }
        }
        catch { }

    }



    protected void lbDeleteQul_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("Qualifaction_ID")).Text;

        if (DataAccess.Qualification_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater5.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        activeTab(3);
        activeTab3(1);
    }




    protected void Button21_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { JobName, ScopeName }))
        {

            if (DataAccess.Experience_TB_AddEdit(lblExperinceID.Text,
                JobName.Text, CompName.Text, From_Date.Text, To_Date.Text, LeaveReason.Text, ScopeName.Text,
                JobDetailes.Text, Convert.ToInt16(Label4.Text), Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {


                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblExperinceID, JobName, JobDetailes, CompName, ScopeName, From_Date, To_Date, LeaveReason });
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
        activeTab(3);
        activeTab3(2);
    } // الخبرات العملية
    protected void btnCancel21_Click2(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblExperinceID, JobName, JobDetailes, CompName, ScopeName, From_Date, To_Date, LeaveReason });

        activeTab(3);
        activeTab3(2);
    }
    protected void lbEditExp_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblExperinceID.Text = ((Label)ri.FindControl("Experince_ID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Info_AddEdit.aspx");

        activeTab(3);
        activeTab3(2);
        try
        {
            DataTable DT6 = DataAccess.Experience_TB_Get(lblExperinceID.Text);
            if (DT6.Rows.Count > 0)
            {
                JobName.Text = DT6.Rows[0]["Job_Name"].ToString();
                JobDetailes.Text = DT6.Rows[0]["job_Details"].ToString();
                CompName.Text = DT6.Rows[0]["Company_Name"].ToString();
                ScopeName.Text = DT6.Rows[0]["Company_Work_Scope"].ToString();
                if ((DT6.Rows[0]["Experince_From"].ToString()) != "")
                    From_Date.Text = DT6.Rows[0]["Experince_From1"].ToString();

                if ((DT6.Rows[0]["Experince_To"].ToString()) != "")
                    To_Date.Text = DT6.Rows[0]["Experince_To1"].ToString();



                LeaveReason.Text = DT6.Rows[0]["Reason_Leave_Job"].ToString();
                //EmpID = Convert.ToInt16(DT6.Rows[0]["Emp_ID"].ToString());
                // check.Visible = false;
            }
        }
        catch { }

    }

    protected void lbDeleteExp_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("Experince_ID")).Text;

        if (DataAccess.Experience_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater6.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");

        activeTab(3);
        activeTab3(2);
    }


    protected void Button23_Click(object sender, EventArgs e)
    {


        bool date = DateValidateControls(new WebControl[] { txtSDate, txtFDate });
        bool IntValid = IntValidateControls(new WebControl[] { CourseHours });
        bool valid = ValidateControls(new WebControl[] { txtName, txtSubmit });
        if (date && valid && IntValid)
        {


            if (DataAccess.Courses_TB_AddEdit(lblCourseID.Text, txtName.Text, txtSubmit.Text, Convert.ToInt16(Label4.Text), txtNotes.Text,
         Convert.ToDateTime(txtSDate.Text), Convert.ToDateTime(txtFDate.Text), Convert.ToInt16(CourseHours.Text), SpecializeIn.Text, Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblCourseID, txtName, txtSubmit, txtNotes, txtSDate, txtFDate, SpecializeIn, CourseHours });
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

        activeTab(3);
        activeTab3(3);


    } // الدورات التدريبية
    protected void btnCancel24_Click2(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblCourseID, txtName, txtSubmit, txtNotes, txtSDate, txtFDate });

        activeTab(3);
        activeTab3(3);
    }
    protected void lbEditCor_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblCourseID.Text = ((Label)ri.FindControl("CourseID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Info_AddEdit.aspx");
        activeTab(3);
        activeTab3(3);

        DataTable DT7 = DataAccess.Courses_TB_Get(lblCourseID.Text);
        if (DT7.Rows.Count > 0)
        {
            txtName.Text = DT7.Rows[0]["Course_Name"].ToString();
            txtSubmit.Text = DT7.Rows[0]["Course_Place"].ToString();
            txtNotes.Text = DT7.Rows[0]["Courses_Details"].ToString();
            CourseHours.Text = DT7.Rows[0]["CourseHours"].ToString();
            SpecializeIn.Text = DT7.Rows[0]["SpecializeIn"].ToString();
            if ((DT7.Rows[0]["Course_From"].ToString()) != "")
                txtSDate.Text = DT7.Rows[0]["Course_From1"].ToString();

            if ((DT7.Rows[0]["Course_To"].ToString()) != "")
                txtFDate.Text = DT7.Rows[0]["Course_To1"].ToString();

        }

    }

    protected void lbDeleteCor_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("CourseID")).Text;

        if (DataAccess.Courses_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater7.DataBind();
            activeTab(3);
            activeTab3(3);
        }
        else
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        activeTab(3);
        activeTab3(3);
    }


    protected void Button25_Click(object sender, EventArgs e)
    {

        bool date = DateValidateControls(new WebControl[] { Research_Date });

        bool valid = ValidateControls(new WebControl[] { TextBox2, TextBox3 });
        if (date && valid)
        {

            if (DataAccess.Research_TB_AddEdit(lblResearchID.Text,
                TextBox3.Text, TextBox2.Text, TextBox4.Text, Convert.ToDateTime(Research_Date.Text), Convert.ToInt16(Label4.Text), Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblResearchID, TextBox2, TextBox3, TextBox4, Research_Date });
                Repeater14.DataBind();

            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        activeTab(4);
    }// الابحاث
    protected void btnCancel26_Click2(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblResearchID, TextBox1, TextBox2, TextBox3, TextBox4, Res_Date });

        activeTab(4);
    }
    protected void lbEditRes_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblResearchID.Text = ((Label)ri.FindControl("ResearchID")).Text;

        activeTab(3);
        activeTab(4);
        try
        {
            DataTable DT8 = DataAccess.Research_TB_Get(lblResearchID.Text);
            if (DT8.Rows.Count > 0)
            {
                TextBox3.Text = DT8.Rows[0]["Research_Subject"].ToString();
                TextBox2.Text = DT8.Rows[0]["Submitted_To"].ToString();
                if ((DT8.Rows[0]["Research_Date"].ToString()) != "")
                    Research_Date.Text = DT8.Rows[0]["Research_Date1"].ToString();
                TextBox4.Text = DT8.Rows[0]["Research_Notes"].ToString();

            }
        }
        catch { }
    }



    protected void lbDeleteRes_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ResearchID")).Text;

        if (DataAccess.Research_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater14.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");

        activeTab(4);
    }
    protected void Button27_Click(object sender, EventArgs e)
    {

        if (ValidateControls(new WebControl[] { LangName, Reading, Writing, Speeking }))
        {

            if (DataAccess.Language_Option_TB_AddEdit(lbllangID.Text, LangName.SelectedValue,
             Reading.SelectedValue, Speeking.SelectedValue, Writing.SelectedValue, Convert.ToInt16(Label4.Text),
                 Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lbllangID, LangName, Reading, Writing, Speeking });
                Repeater9.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        activeTab(3);
        activeTab3(4);
    }// اللغات
    protected void btnCance28_Click2(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lbllangID, LangName, Reading, Writing, Speeking });

        activeTab(3);
        activeTab3(4);
    }
    protected void lbEditLang_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lbllangID.Text = ((Label)ri.FindControl("ID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Info_AddEdit.aspx");

        activeTab(3);
        activeTab3(4);

        try
        {
            DataTable DT9 = DataAccess.Language_Option_TB_Get(lbllangID.Text);
            if (DT9.Rows.Count > 0)
            {
                LangName.SelectedValue = DT9.Rows[0]["Lang_ID"].ToString();

                Reading.SelectedValue = DT9.Rows[0]["Lang_Read"].ToString();
                Writing.SelectedValue = DT9.Rows[0]["Lang_Write"].ToString();
                Speeking.SelectedValue = DT9.Rows[0]["Lang_Speak"].ToString();
            }
        }
        catch { }
    }


    protected void lbDeleteLang_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;

        if (DataAccess.Language_Option_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater9.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        Repeater9.DataBind();
        activeTab(3);
        activeTab3(4);
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {



        Response.Redirect("Emp_Profile_Veiw.aspx");
        Session["Emp_ID"] = null;
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater10.DataBind();

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Repeater10.DataBind();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        activeTab(2);
        activeTab2(2);

    }
    protected void Region_SelectedIndexChanged(object sender, EventArgs e)
    {
        activeTab(2);
        activeTab2(3);
    }
    protected void CityID_SelectedIndexChanged(object sender, EventArgs e)
    {
        activeTab(2);
        activeTab2(3);
    }





    private void EnableControls(bool ctrlStatus)
    {
        foreach (Control c in Page.Controls)
        {
            foreach (Control ctrl in c.Controls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Enabled = (ctrlStatus == true) ? false : true;

                else if (ctrl is Button)
                    ((Button)ctrl).Enabled = ctrlStatus;

                else if (ctrl is RadioButtonList)
                    ((RadioButtonList)ctrl).Enabled = ctrlStatus;

                else if (ctrl is ImageButton)
                    ((ImageButton)ctrl).Enabled = ctrlStatus;

                else if (ctrl is CheckBox)
                    ((CheckBox)ctrl).Enabled = ctrlStatus;

                else if (ctrl is DropDownList)
                    ((DropDownList)ctrl).Enabled = ctrlStatus;

                else if (ctrl is HyperLink)
                    ((HyperLink)ctrl).Enabled = ctrlStatus;


            }
        }
    }
    protected void ComputerSkills_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ProgamName, ComputerLevel }))
        {

            if (DataAccess.ComputerSkills_TB_AddEdit(lblComputerID.Text, ProgamName.Text,
             ComputerLevel.SelectedValue, Convert.ToInt16(Label4.Text), Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblComputerID });
                Repeater2.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        activeTab(3);
        activeTab3(5);
    }
    protected void ComputerEmpty_Click(object sender, EventArgs e)
    {

        EmptyControls(new WebControl[] { lblComputerID, ComputerLevel, ProgamName });
        activeTab(3);
        activeTab3(5);
    }

    protected void lbEditComputer_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblComputerID.Text = ((Label)ri.FindControl("ID")).Text;

        activeTab(3);
        activeTab3(5);

        try
        {
            DataTable DTComputer = DataAccess.ComputerSkills_TB_Get(lblComputerID.Text);
            if (DTComputer.Rows.Count > 0)
            {
                ProgamName.Text = DTComputer.Rows[0]["ProgramName"].ToString();
                ComputerLevel.SelectedValue = DTComputer.Rows[0]["ComputerLevel"].ToString();
            }
        }
        catch { }
    }

    protected void lbDeleteComputer_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;

        if (DataAccess.ComputerSkills_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater9.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        Repeater2.DataBind();
        activeTab(3);
        activeTab3(5);
    }

    protected void UploadCVFiles_Click(object sender, EventArgs e)
    {
        string CVFile = "";
        string EmpFile = Label4.Text;
        String path = Server.MapPath("../EmpFiles/" + EmpFile);
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }

        if (UploadCV.HasFile)
        {
            string filePath = UploadCV.PostedFile.FileName;
            string filename = Path.GetFileName(filePath);
            string ext = Path.GetExtension(filename);
            string contenttype = String.Empty;

            //Set the contenttype based on File Extension
            switch (ext)
            {
                case ".doc":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".docx":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".pdf":
                    contenttype = "application/pdf";
                    break;
            }
            if (contenttype != String.Empty)
            {


                HttpFileCollection uploads = HttpContext.Current.Request.Files;
                for (int i = 0; i < uploads.Count; i++)
                {
                    HttpPostedFile upload = uploads[i];

                    if (upload.ContentLength == 0)
                        continue;

                    CVFile = System.IO.Path.GetFileName(upload.FileName);

                    try
                    {

                        upload.SaveAs(MapPath("../EmpFiles/") + EmpFile + "/" + CVFile);
                        if (DataAccess.CVFileEmployeeUpload(Label4.Text, CVFile, Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
                        {
                            ShowToast(this, "تم الحفظ بنجاح.", "", "success");



                        }
                        else
                        {
                            ShowToast(this, "عذرًا  لم تتم عملية الحفظ.", "", "error");
                        }


                    }
                    catch (Exception Exp)
                    {
                        // Handle Errors
                    }
                }
            }
            else
                ShowToast(this, "عذرًا , يجب عليك تحميل ملف بصيغة word  أو pdf.", "", "error");
        }
        activeTab(3);
        activeTab3(6);
    }

    //protected void ddlContractType_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    subcontract.Visible = false;

    //    if (Con_Type_ID.SelectedValue == "7")
    //    {
    //        subcontract.Visible = true;
    //    }
    //    activeTab(2);
    //    activeTab2(6);
    //}

    //protected void ddlEmployeeCat_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    ContractType.Visible = false;

    //      if (ddlEmployeeCat.SelectedValue == "2")
    //    {
    //        ContractType.Visible = true;

    //    }
    //      activeTab(2);
    //      activeTab2(6);
    //}























    // css desgin tabs
    void activeTab(int i)
    {

        li1.Attributes.Add("Class", (i == 1) ? "active" : "");
        li2.Attributes.Add("Class", (i == 2) ? "active" : "");
        li3.Attributes.Add("Class", (i == 3) ? "active" : "");
        li4.Attributes.Add("Class", (i == 4) ? "active" : "");
        li5.Attributes.Add("Class", (i == 5) ? "active" : "");

        tab_1_1.Attributes.Add("Class", (i == 1) ? "tab-pane active" : "tab-pane ");
        tab_1_2.Attributes.Add("Class", (i == 2) ? "tab-pane active" : "tab-pane ");
        tab_1_3.Attributes.Add("Class", (i == 3) ? "tab-pane active" : "tab-pane ");
        tab_1_4.Attributes.Add("Class", (i == 4) ? "tab-pane active" : "tab-pane ");
        tab_1_5.Attributes.Add("Class", (i == 5) ? "tab-pane active" : "tab-pane ");
    }


    void activeTab1(int i)
    {

        li1_1.Attributes.Add("Class", (i == 1) ? "active" : "");
        li1_2.Attributes.Add("Class", (i == 2) ? "active" : "");


        tab_1_11.Attributes.Add("Class", (i == 1) ? "tab-pane active" : "tab-pane ");
        tab_1_22.Attributes.Add("Class", (i == 2) ? "tab-pane active" : "tab-pane ");

    }


    void activeTab2(int i)
    {

        li21.Attributes.Add("Class", (i == 1) ? "active" : "");
        li22.Attributes.Add("Class", (i == 2) ? "active" : "");
        li23.Attributes.Add("Class", (i == 3) ? "active" : "");
        li24.Attributes.Add("Class", (i == 4) ? "active" : "");
        li25.Attributes.Add("Class", (i == 5) ? "active" : "");
        li26.Attributes.Add("Class", (i == 6) ? "active" : "");
        li27.Attributes.Add("Class", (i == 7) ? "active" : "");
        li28.Attributes.Add("Class", (i == 8) ? "active" : "");
        li29.Attributes.Add("Class", (i == 9) ? "active" : "");

        Subtab_2_1.Attributes.Add("Class", (i == 1) ? "tab-pane active" : "tab-pane ");
        Subtab_2_2.Attributes.Add("Class", (i == 2) ? "tab-pane active" : "tab-pane ");
        Subtab_2_3.Attributes.Add("Class", (i == 3) ? "tab-pane active" : "tab-pane ");
        Subtab_2_4.Attributes.Add("Class", (i == 4) ? "tab-pane active" : "tab-pane ");
        Subtab_2_5.Attributes.Add("Class", (i == 5) ? "tab-pane active" : "tab-pane ");
        Subtab_2_6.Attributes.Add("Class", (i == 6) ? "tab-pane active" : "tab-pane ");
        Subtab_2_7.Attributes.Add("Class", (i == 7) ? "tab-pane active" : "tab-pane ");
        Subtab_2_8.Attributes.Add("Class", (i == 8) ? "tab-pane active" : "tab-pane ");
        Subtab_2_9.Attributes.Add("Class", (i == 9) ? "tab-pane active" : "tab-pane ");
    }

    void activeTab3(int i)
    {

        li31.Attributes.Add("Class", (i == 1) ? "active" : "");
        li32.Attributes.Add("Class", (i == 2) ? "active" : "");
        li33.Attributes.Add("Class", (i == 3) ? "active" : "");
        li34.Attributes.Add("Class", (i == 4) ? "active" : "");
        li35.Attributes.Add("Class", (i == 5) ? "active" : "");
        li36.Attributes.Add("Class", (i == 6) ? "active" : "");

        subtab_3_1.Attributes.Add("Class", (i == 1) ? "tab-pane active" : "tab-pane ");
        subtab_3_2.Attributes.Add("Class", (i == 2) ? "tab-pane active" : "tab-pane ");
        subtab_3_3.Attributes.Add("Class", (i == 3) ? "tab-pane active" : "tab-pane ");
        subtab_3_4.Attributes.Add("Class", (i == 4) ? "tab-pane active" : "tab-pane ");
        subtab_3_5.Attributes.Add("Class", (i == 5) ? "tab-pane active" : "tab-pane ");
        subtab_3_6.Attributes.Add("Class", (i == 6) ? "tab-pane active" : "tab-pane ");
    }

    void activeTab5(int i)
    {

        li51.Attributes.Add("Class", (i == 1) ? "active" : "");
        li52.Attributes.Add("Class", (i == 2) ? "active" : "");

        subtab_5_1.Attributes.Add("Class", (i == 1) ? "tab-pane active" : "tab-pane ");
        subtab_5_2.Attributes.Add("Class", (i == 2) ? "tab-pane active" : "tab-pane ");


    }






    protected void GoToUploadPage_Click(object sender, EventArgs e)
    {
        Session["UploadEmpID"] = Label4.Text;
        Response.Redirect("UploaadEmpFiles.aspx");
    }

    protected void ViewCVbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/EmpFiles/" + Label4.Text + "/" + ViewCV.Text);
    }
    protected void PrintCV_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ReportView.aspx?CVid=" + Label4.Text);
    }
    protected void btnTerminate_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { DropDownList4, ddlTerminateReason, txtTerminateDate }))
        {
            DataTable DT = DataAccess.TerminateEmployeeServicesAdd(Label4.Text, txtTerminateDate.Text, DropDownList4.SelectedValue, ddlTerminateReason.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            EmptyControls(new WebControl[] { DropDownList4, ddlTerminateReason, txtTerminateDate });
            Empstatus.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        activeTab(2);
        activeTab2(8);
    }

    protected void Empstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
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
            ddlEmpSubStatus.DataSourceID = "SqlDataSource35";
        }
        else
        {
            ddlEmpSubStatus.Visible = false;
        }
        activeTab(2);
        activeTab2(6);
    }

    protected void Empstatus2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList4.SelectedValue == "1043")
        {
            ddlTerminateReason.DataSourceID = "SqlDataSource34";

        }
        else if (DropDownList4.SelectedValue == "2122")
        {
            ddlTerminateReason.DataSourceID = "SqlDataSource35";
        }
        activeTab(2);
        activeTab2(8);
    }


    protected void ddlEmpTypeID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlEmpSubTypeID.DataBind();
        activeTab(2);
        activeTab2(6);
    }

    protected void brnSaveEmpType_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlEmpTypeID, (ddlEmpTypeID.SelectedValue == "1") ? ddlEmpSubTypeID : null });
        if (Validate)
        {
            DataTable DT = DataAccess.ChangeEmployeeTypes(Label4.Text, ddlEmpTypeID.SelectedValue, ddlEmpSubTypeID.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        activeTab(2);
        activeTab2(6);
    }

    protected void btnChangeEmpStatus_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { Empstatus, ddlEmpSubStatus });
        if (Validate)
        {
            DataTable DT = DataAccess.ChangeEmployeeStatus(Label4.Text, Empstatus.SelectedValue, ddlEmpSubStatus.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        activeTab(2);
        activeTab2(6);
    }
    protected void ddlCader_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlGrade.DataBind();
        ddlDegree.DataBind();
        activeTab(2);
        activeTab2(6);
    }

    protected void btnEmpDegree_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlCader, ddlGrade, ddlDegree });
        if (Validate)
        {
            DataTable DT = DataAccess.EmployeeDegreeAddEdit(Label4.Text, ddlDegree.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

        }
        else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        activeTab(2);
        activeTab2(6);
    }

    protected void btnEmployeeSearch_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckEmployee(txtEmployeeNo.Text);
        if (DT.Rows.Count > 0)
        {
            Session["Emp_ID"] = DT.Rows[0]["EmployeeID"].ToString();
            Response.Redirect("~/APP_HRM/Emp_Info_AddEdit.aspx");
        }
        else
        {
            ShowToast(this, "رقم الموظف غير صحيح", "", "error");
        }
    }

    protected void ddlGrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDegree.DataBind();
        activeTab(2);
        activeTab2(6);
    }

    protected void btnSeniority_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtSeniority }))
        {

            DataTable DT = DataAccess.EmployeeSeniorityAddEdit(Label4.Text, txtSeniority.Text, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        }
        else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        activeTab(2);
        activeTab2(6);
    }

    protected void ddlBouns_SelectedIndexChanged(object sender, EventArgs e)
    {
        Div5.Visible = true;
        exceptionAdddiv.Visible = true;
        DataTable DT = DataAccess.BounsGet(ddlBouns.SelectedValue);
        if (DT.Rows.Count > 0)
        {
            lblValue.Text = DT.Rows[0]["BounsValue"].ToString();
            lblRVType.Text = (DT.Rows[0]["RVType"].ToString() == "1") ? "نسبة" : "قيمة";
            lblCurrency.Text = DT.Rows[0]["CurrencyName"].ToString();
        }
        activeTab(2);
        activeTab2(9);
    }


    protected void AddException_Click(object sender, EventArgs e)
    {
        DivException.Visible = true;
        activeTab(2);
        activeTab2(9);
    }

    protected void btnSaveBouns_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlBounsType, ddlBouns });
        if (Validate)
        {
            DataTable DT = DataAccess.EmployeeBounsAdd(ddlBouns.SelectedValue, Label4.Text, UserID, true);
            if (DivException.Visible == true && DT.Rows[0]["ID"].ToString() != null)
            {
                if (ValidateControls(new WebControl[] { ddlRVType, txtAmount, CurrType }))
                {
                    DataTable DT2 = DataAccess.EmployeeBounsValueAdd(DT.Rows[0]["ID"].ToString(), txtAmount.Text, CurrType.SelectedValue, ddlRVType.SelectedValue, UserID, true);
                    if (DT.Rows.Count > 0)
                        ShowToast(this, DT2.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT2.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                }
                else
                {
                    ShowToast(this, " الرجاء تعبئة الحقول المطلوبة لاضافة استثناء بشكل صحيح.", "", "error");
                }

            }
            else
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            }

            ListView1.DataBind();
        }
        else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        activeTab(2);
        activeTab2(9);
    }

    protected void ddlBounsType_SelectedIndexChanged(object sender, EventArgs e)
    {
        activeTab(2);
        activeTab2(9);
    }
    protected void IsActive_CheckedChanged(object sender, EventArgs e)
    {

        ListViewItem li = (ListViewItem)((CheckBox)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        Boolean IsActive = ((CheckBox)li.FindControl("IsActive")).Checked;
        DataTable DT = DataAccess.EmployeeBounsActive(ID, IsActive, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        {
            ListView1.DataBind();
        }
        activeTab(2);
        activeTab2(9);
    }

    protected void btnAddExceptionDegreeBouns_Click(object sender, EventArgs e)
    {
        ExceptionDegreeBounsDiv.Visible = true;
        activeTab(2);
        activeTab2(9);
    }



    protected void btnAddDegreeBouns_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlDegreeBounsCurrencyID, ddlDegreeBounsRVType, txtDegreeBounsValue });
        if (Validate)
        {
            DataTable DT = DataAccess.ExceptionEmployeeDegreeBounsAdd(txtDegreeBounsValue.Text, ddlDegreeBounsCurrencyID.SelectedValue, ddlDegreeBounsRVType.SelectedValue, Label4.Text, UserID);
            Repeater19.DataBind();
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

        }
        else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        activeTab(2);
        activeTab2(9);
    }

    protected void btnDeleteDegreeBounsException_Click(object sender, EventArgs e)
    {

        DataTable DT = DataAccess.ExceptionEmployeeDegreeBounsDelete(Label4.Text, UserID);
        Repeater19.DataBind();
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

        activeTab(2);
        activeTab2(9);
    }

    protected void lbDelete_Click1(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
        DataTable DT = DataAccess.EmployeeBounsDelete(id, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        {
            ListView1.DataBind();
        }
        activeTab(2);
        activeTab2(9);
    }
}