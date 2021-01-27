using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReportView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (Request.QueryString["Month1"] != null && Request.QueryString["Year1"] != null)
        {
          ArrayList a1 = new ArrayList();
            a1.Add("Employee");
            a1.Add("Plus");
            a1.Add("Discount");
            a1.Add("Differences");
            a1.Add("Salary");
            ArrayList a2 = new ArrayList();
            a2.Add(SqlDataSource1);
            a2.Add(PlusSalaryForm);
            a2.Add(DiscountSalaryForm);
            a2.Add(DifferencesSalaryForm);
            a2.Add(Salary);

            CreatePDF("SalaryForm", @"Reports\SalaryForm.rdlc", a1, a2);
           }
          
  //print complete tasks for deprtment
        //else if (Request.QueryString["EmployeeID1"] != null && Request.QueryString["MangerIDV"] != null && Request.QueryString["Type1"] != null && Request.QueryString["Type2"] != null && Request.QueryString["Type3"] != null && Request.QueryString["Type4"] != null && Request.QueryString["ManagerID"] != null && Request.QueryString["DepID1"] != null && Request.QueryString["DepID2"] != null && Request.QueryString["DepID3"] != null && Request.QueryString["DepID4"] != null && Request.QueryString["From1"] != null && Request.QueryString["To1"] != null)
        //{
        //    ArrayList a1 = new ArrayList();
        //    a1.Add("DepartmentCompleteTasksView");
        //    a1.Add("GetDepartmentName");
        //    ArrayList a2 = new ArrayList();
        //    a2.Add(DataAccessTasks.PrintCompleteTasks(Request.QueryString["EmployeeID1"].ToString(), Request.QueryString["MangerIDV"].ToString(), Request.QueryString["Type1"].ToString(), Request.QueryString["Type2"].ToString(), Request.QueryString["Type3"].ToString(), Request.QueryString["Type4"].ToString(), Convert.ToDateTime(Request.QueryString["From1"].ToString()), Convert.ToDateTime(Request.QueryString["To1"].ToString())));
        //    a2.Add(DataAccessTasks.GetDepartmentName(Request.QueryString["ManagerID"].ToString(), Request.QueryString["DepID1"].ToString(), Request.QueryString["DepID2"].ToString(), Request.QueryString["DepID3"].ToString(), Request.QueryString["DepID4"].ToString()));
        //    CreatePDF("DepartmentCompleteTasks", @"Reports\CompleteTasksView1.rdlc", a1, a2);
        //}
        ////print  complete task for employee
        //else if (Request.QueryString["EmployeeID2"] != null && Request.QueryString["From2"] != null && Request.QueryString["To2"] != null)
        //{
        //    ArrayList a1 = new ArrayList();
        //    a1.Add("EmployeeCompleteTasksView");
        //    ArrayList a2 = new ArrayList();
        //    a2.Add(DataAccessTasks.PrintEmployeeCompleteTasks(Request.QueryString["EmployeeID2"].ToString(), Convert.ToDateTime(Request.QueryString["From2"].ToString()), Convert.ToDateTime(Request.QueryString["To2"].ToString())));
        //    CreatePDF("EmployeeCompleteTasks", @"Reports\CompleteTasksEmpView.rdlc", a1, a2);
        //}


        //     //print Incomplete tasks for deprtment
        //else if (Request.QueryString["EmployeeID3"] != null && Request.QueryString["MangerIDV"] != null && Request.QueryString["Type1"] != null && Request.QueryString["Type2"] != null && Request.QueryString["Type3"] != null && Request.QueryString["Type4"] != null && Request.QueryString["ManagerID"] != null && Request.QueryString["DepID1"] != null && Request.QueryString["DepID2"] != null && Request.QueryString["DepID3"] != null && Request.QueryString["DepID4"] != null && Request.QueryString["From3"] != null && Request.QueryString["To3"] != null)
        //{
        //    ArrayList a1 = new ArrayList();
        //    a1.Add("DepartmentInCompleteTasksView");
        //    a1.Add("GetDepartmentName");
        //    ArrayList a2 = new ArrayList();
        //    a2.Add(DataAccessTasks.PrintInCompleteTasks(Request.QueryString["EmployeeID3"].ToString(), Request.QueryString["MangerIDV"].ToString(), Request.QueryString["Type1"].ToString(), Request.QueryString["Type2"].ToString(), Request.QueryString["Type3"].ToString(), Request.QueryString["Type4"].ToString(), Convert.ToDateTime(Request.QueryString["From3"].ToString()), Convert.ToDateTime(Request.QueryString["To3"].ToString())));
        //    a2.Add(DataAccessTasks.GetDepartmentName(Request.QueryString["ManagerID"].ToString(), Request.QueryString["DepID1"].ToString(), Request.QueryString["DepID2"].ToString(), Request.QueryString["DepID3"].ToString(), Request.QueryString["DepID4"].ToString()));
        //    CreatePDF("DepartmentInCompleteTasks", @"Reports\InCompleteTasksView1.rdlc", a1, a2);
        //}
        ////print  Incomplete task for employee
        //else if (Request.QueryString["EmployeeID4"] != null && Request.QueryString["From4"] != null && Request.QueryString["To4"] != null)
        //{
        //    ArrayList a1 = new ArrayList();
        //    a1.Add("EmployeeInCompleteTasksView");
        //    ArrayList a2 = new ArrayList();
        //    a2.Add(DataAccessTasks.PrintEmployeeInCompleteTasks(Request.QueryString["EmployeeID4"].ToString(), Convert.ToDateTime(Request.QueryString["From4"].ToString()), Convert.ToDateTime(Request.QueryString["To4"].ToString())));
        //    CreatePDF("EmployeeInCompleteTasks", @"Reports\InCompleteTasksEmpView.rdlc", a1, a2);
        //}
        ////No Tasks
        //else if (Request.QueryString["From5"] != null && Request.QueryString["To5"] != null)
        //{
        //    ArrayList a1 = new ArrayList();
        //    a1.Add("NoTasks");
        //    ArrayList a2 = new ArrayList();
        //    a2.Add(DataAccessTasks.NoTasks(Convert.ToDateTime(Request.QueryString["From5"].ToString()), Convert.ToDateTime(Request.QueryString["To5"].ToString())));
        //    CreatePDF("NoTasks", @"Reports\No tasks.rdlc", a1, a2);
        //}
      


        //    //كشف دوام الموظف
        //else if (Request.QueryString["Month2"] != null && Request.QueryString["Year2"] != null && Request.QueryString["Emp_ID2"] != null && Request.QueryString["Late"]==null)
        //{
        //    ArrayList a1 = new ArrayList();
        //    a1.Add("EmpAttendance");
        //    a1.Add("calculateAttendance");
        //    ArrayList a2 = new ArrayList();
        //    a2.Add(DataAccess.EmpAttendance(Request.QueryString["Emp_ID2"].ToString() ,Convert.ToInt16(Request.QueryString["Month2"].ToString()), Convert.ToInt16(Request.QueryString["Year2"].ToString())));
        //    a2.Add(DataAccess.calculateAttendanceGetAll(Request.QueryString["Emp_ID2"].ToString(), Convert.ToInt16(Request.QueryString["Month2"].ToString()), Convert.ToInt16(Request.QueryString["Year2"].ToString())));
        //    CreatePDF("Attendance", @"Reports\Attendance.rdlc", a1, a2);
        //}
            //كشف دوام الموظف (ايام التاخير فقط)
        //else if (Request.QueryString["Month2"] != null && Request.QueryString["Year2"] != null && Request.QueryString["Emp_ID2"] != null && Request.QueryString["Late"].ToString()=="1")
        //{
        //    ArrayList a1 = new ArrayList();
        //    a1.Add("EmpAttendanceLate");
        //    a1.Add("EmpAttendanceLateHours");
        //    ArrayList a2 = new ArrayList();
        //    a2.Add(DataAccess.EmpAttendanceLate(Request.QueryString["Emp_ID2"].ToString(), Convert.ToInt16(Request.QueryString["Month2"].ToString()), Convert.ToInt16(Request.QueryString["Year2"].ToString())));
        //    a2.Add(DataAccess.EmpAttendanceLateHours(Request.QueryString["Emp_ID2"].ToString(), Convert.ToInt16(Request.QueryString["Month2"].ToString()), Convert.ToInt16(Request.QueryString["Year2"].ToString())));
        //    CreatePDF("AttendanceLate", @"Reports\AttendanceLate.rdlc", a1, a2);
        //}

            //كشف رواتب الموظفين
        else if (Request.QueryString["Month"] != null && Request.QueryString["Year"] != null)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("CalculateSalary");
            ArrayList a2 = new ArrayList();
            a2.Add(CalculateSalary);
            CreatePDF("CalculateSalary", @"Reports\CalculateSalary.rdlc", a1, a2);
        }
            //كشف خصميات الموظفين
        else if (Request.QueryString["DisCountMonth"] != null && Request.QueryString["DiscountYear"] != null)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("DiscountSalaryEmpGetAll");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.DiscountSalaryEmpGetAll(Convert.ToInt16(Request.QueryString["DisCountMonth"].ToString()), Convert.ToInt16(Request.QueryString["DiscountYear"].ToString())));
            CreatePDF("DiscountSalary", @"Reports\DiscountSalaryEmpAll.rdlc", a1, a2);
        }


//Attendance Survay
        else if (Request.QueryString["AttMonth"] != null && Request.QueryString["AttYear"] != null)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("AttendanceSurvay");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.AttendanceSurvay(Convert.ToInt16(Request.QueryString["AttMonth"].ToString()),Convert.ToInt16(Request.QueryString["AttYear"].ToString())));
            CreatePDF("AttendaceSurvay", @"Reports\AttendaceSurvay.rdlc", a1, a2);
        }

            //Attendance Survay Yearly
        //else if (Request.QueryString["AttYear1"] != null)
        //{
        //    ArrayList a1 = new ArrayList();
        //    a1.Add("AttendanceSurvayYearly");
        //    ArrayList a2 = new ArrayList();
        //    a2.Add(DataAccess.AttendanceSurvayYearly( Convert.ToInt16(Request.QueryString["AttYear1"].ToString()),1));
        //    CreatePDF("AttendaceSurvay", @"Reports\AttendanceSurvayYearly.rdlc", a1, a2);
        //}
  // AttAbsentEmp
        else if (Request.QueryString["date"] != null && Request.QueryString["EmpCat"] != null)
        {

        //    ArrayList a1 = new ArrayList();
        //    a1.Add("AttAbsentEmp");
        //    a1.Add("AttAbsentEmpCountGet");
        //    ArrayList a2 = new ArrayList();

        //    a2.Add(DataAccess.AttAbsentEmp(Request.QueryString["date"].ToString(),Request.QueryString["EmpCat"].ToString()));
        //    a2.Add(DataAccess.AttAbsentEmpCountGet(Request.QueryString["date"].ToString(), Convert.ToInt16(Request.QueryString["EmpCat"].ToString())));
        //    CreatePDF("AttAbsentEmp", @"Reports\AttabsentEmp.rdlc", a1, a2);
        }

              // AttAbsentEmp
        else if (Request.QueryString["vacdate"] != null)
        {

            //ArrayList a1 = new ArrayList();
            //a1.Add("VacationDailyGet");
       

            //ArrayList a2 = new ArrayList();

            //a2.Add(DataAccess.VacationDailyGet(Request.QueryString["vacdate"].ToString()));
           

            //CreatePDF("VactionDaily", @"Reports\VacationDaily.rdlc", a1, a2);
        }
        //// AttLateEmp
        //else if (Request.QueryString["Latedate"] != null && Request.QueryString["LateEmpCat"] != null)
        //{

        //    ArrayList a1 = new ArrayList();
        //    a1.Add("AttAbsentEmp");

        //    ArrayList a2 = new ArrayList();

        //    a2.Add(DataAccess.AttLateEmp(Request.QueryString["Latedate"].ToString(), Request.QueryString["LateEmpCat"].ToString()));

        //    CreatePDF("AttLateEmp", @"Reports\AttLateEmp.rdlc", a1, a2);
        //}

        //VacationRequest
        //else if (Request.QueryString["VacationID"] != null)
        //{

        //    ArrayList a1 = new ArrayList();
        //    a1.Add("VacationRequestReport");
        //    a1.Add("VacationRequestBalanceReport");
        //    ArrayList a2 = new ArrayList();
        
        //    a2.Add(DataAccess.VacationRequestReport(Request.QueryString["VacationID"].ToString()));
        //    a2.Add(DataAccess.VacationRequestBalanceReport(Request.QueryString["VacationID"].ToString()));
        //    CreatePDF("VacationRequest", @"Reports\VacationRequest.rdlc", a1, a2);
        //}
        //ExitRequest
        else if (Request.QueryString["ExitID"] != null)
        {

            ArrayList a1 = new ArrayList();
            a1.Add("ExitRequestReport");
         
            ArrayList a2 = new ArrayList();

            a2.Add(DataAccess.ExitRequestReport(Request.QueryString["ExitID"].ToString()));
          
            CreatePDF("ExitRequest", @"Reports\ExitRequest.rdlc", a1, a2);
        }

       //WExitRequest
        else if (Request.QueryString["WExitID"] != null)
        {

            ArrayList a1 = new ArrayList();
            a1.Add("WExitRequestReport");

            ArrayList a2 = new ArrayList();

            a2.Add(DataAccess.WExitRequestReport(Request.QueryString["WExitID"].ToString()));

            CreatePDF("WExitRequest", @"Reports\WExitRequest.rdlc", a1, a2);
        }
        // WExit.rdlc
        //else if (Request.QueryString["WExitEmp_ID"] != null && Request.QueryString["WExitMonth"] != null && Request.QueryString["WExitYear"] != null)
        //{

        //    ArrayList a1 = new ArrayList();
        //    a1.Add("WExit");
        //    a1.Add("CalAttGet");

        //    ArrayList a2 = new ArrayList();

        //    a2.Add(DataAccess.WExitEmpGetAB(Request.QueryString["WExitEmp_ID"].ToString(), Request.QueryString["WExitYear"].ToString(), Request.QueryString["WExitMonth"].ToString()));
        //    a2.Add(DataAccess.calculateAttendanceGetAll(Request.QueryString["WExitEmp_ID"].ToString(), Request.QueryString["WExitYear"].ToString(), Request.QueryString["WExitMonth"].ToString()));

        //    CreatePDF("WExit", @"Reports\WExit.rdlc", a1, a2);
        //}

         // Exit.rdlc
        //else if (Request.QueryString["ExitEmp_ID"] != null && Request.QueryString["ExitMonth"] != null && Request.QueryString["ExitYear"] != null)
        //{

        //    ArrayList a1 = new ArrayList();
        //    a1.Add("Exit");
        //    a1.Add("CalAttGet");

        //    ArrayList a2 = new ArrayList();

        //    a2.Add(DataAccess.ExitEmpGetAB(Request.QueryString["ExitEmp_ID"].ToString(), Request.QueryString["ExitYear"].ToString(), Request.QueryString["ExitMonth"].ToString()));
        //    a2.Add(DataAccess.calculateAttendanceGetAll(Request.QueryString["ExitEmp_ID"].ToString(), Request.QueryString["ExitYear"].ToString(), Request.QueryString["ExitMonth"].ToString()));

        //    CreatePDF("Exit", @"Reports\Exit.rdlc", a1, a2);
        //}

        //AllEmpExit
        else if (Request.QueryString["AllExitMonth"] != null && Request.QueryString["AllExitYear"] != null)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("AttExitRegister");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.AttExitRegister(Convert.ToInt16(Request.QueryString["AllExitMonth"].ToString()), Convert.ToInt16(Request.QueryString["AllExitYear"].ToString())));
            CreatePDF("AllEmpExit", @"Reports\AllEmpExit.rdlc", a1, a2);
        }

            //CVEmployee
        else if (Request.QueryString["CVid"] != null)
        {

            ArrayList a1 = new ArrayList();
            a1.Add("EmpPersonalInformationCV");
            a1.Add("EmpQualGetAll");
            a1.Add("EmpCourcesGetAll");
            a1.Add("EmpExperienceGetAll");
            a1.Add("ComputerSkillsEmp_GetAll");
            a1.Add("LanguagesEmp_Option_GetAll");
            

            ArrayList a2 = new ArrayList();

            a2.Add(DataAccess.EmpPersonalInformationCV(Request.QueryString["CVid"].ToString()));
            a2.Add(DataAccess.EmpQualGetAll(Request.QueryString["CVid"].ToString()));
            a2.Add(DataAccess.EmpCourcesGetAll(Request.QueryString["CVid"].ToString()));
            a2.Add(DataAccess.EmpExperienceGetAll(Request.QueryString["CVid"].ToString()));
            a2.Add(DataAccess.ComputerSkillsEmp_GetAll(Request.QueryString["CVid"].ToString()));
            a2.Add(DataAccess.LanguagesEmp_Option_GetAll(Request.QueryString["CVid"].ToString()));
            CreateWord("EmpCV", @"Reports\CV.rdlc", a1, a2);
        }

        // Attendance for non fingure print
        else if (Request.QueryString["MonthNF"] != null && Request.QueryString["YearNF"] != null)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("AttNotFingrPrint");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.AttNotFingrPrint(Convert.ToInt16(Request.QueryString["MonthNF"].ToString()), Convert.ToInt16(Request.QueryString["YearNF"].ToString())));
            CreatePDF("AttNotFingure", @"Reports\AttNotFingure.rdlc", a1, a2);
        }


        // Names of Employees Arabic ,english
        else if (Request.QueryString["Names"] == "1" )
        {
            ArrayList a1 = new ArrayList();
            a1.Add("EmpNamesGetAll");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.EmpNamesGetAll());
            CreatePDF("اسماء الموظفين", @"Reports\EmpNamesGetAll.rdlc", a1, a2);
        }
        //TelePhone
        else if (Request.QueryString["searchId"].ToString() == "1")
        {
            ArrayList a1 = new ArrayList();
            a1.Add("Telephone");
            ArrayList a2 = new ArrayList();
            a2.Add(TelephoneDataAccess.search1());
            CreatePDF("دليل الهواتف  ", @"Reports\TelephoneReport.rdlc", a1, a2);
        }
    }


    protected void Button1_Click1(object sender, EventArgs e)
    {


      
    }



    private void CreatePDF(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
    {
        ReportViewer viwer = new ReportViewer();
        Warning[] warnings = null;
        string[] streamIds = null;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;
        string filetype = string.Empty;

        viwer.SizeToReportContent = true;
        viwer.LocalReport.ReportPath = reportpath;
        viwer.ProcessingMode = ProcessingMode.Local;

        for (int i = 0; i < dsNameArray.Count; i++)
        {
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], DTArray[i]);
            viwer.LocalReport.DataSources.Add(rds1);
        }

        viwer.LocalReport.Refresh();


        byte[] bytes = viwer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
        Response.Buffer = true;
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file
        Response.Flush(); // send it to the client to download
    }

    private void CreateWord(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
    {
        ReportViewer viwer = new ReportViewer();
        Warning[] warnings = null;
        string[] streamIds = null;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;
        string filetype = string.Empty;

        viwer.SizeToReportContent = true;
        viwer.LocalReport.ReportPath = reportpath;
        viwer.ProcessingMode = ProcessingMode.Local;

        for (int i = 0; i < dsNameArray.Count; i++)
        {
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], DTArray[i]);
            viwer.LocalReport.DataSources.Add(rds1);
        }

        viwer.LocalReport.Refresh();

        byte[] bytes = viwer.LocalReport.Render("WORD", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
        Response.Buffer = true;
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file
        Response.Flush(); // send it to the client to download


        //Byte[] mybytes = viwer.LocalReport.Render("WORD");
        ////Byte[] mybytes = report.Render("PDF"); for exporting to PDF
        //using (FileStream fs = File.Create(@"D:\CV.doc"))
        //{
        //    fs.Write(mybytes, 0, mybytes.Length);
        //    fs.Flush();
        //}

    }

    private void CreateExcel(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
    {
        ReportViewer viwer = new ReportViewer();
        Warning[] warnings = null;
        string[] streamIds = null;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;
        string filetype = string.Empty;

        viwer.SizeToReportContent = true;
        viwer.LocalReport.ReportPath = reportpath;
        viwer.ProcessingMode = ProcessingMode.Local;

        for (int i = 0; i < dsNameArray.Count; i++)
        {
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], DTArray[i]);
            viwer.LocalReport.DataSources.Add(rds1);
        }

        viwer.LocalReport.Refresh();

        byte[] bytes = viwer.LocalReport.Render("Excel", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
        Response.Buffer = true;
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file
        Response.Flush(); // send it to the client to download


        //Byte[] mybytes = viwer.LocalReport.Render("WORD");
        ////Byte[] mybytes = report.Render("PDF"); for exporting to PDF
        //using (FileStream fs = File.Create(@"D:\CV.doc"))
        //{
        //    fs.Write(mybytes, 0, mybytes.Length);
        //    fs.Flush();
        //}

    }



  
}