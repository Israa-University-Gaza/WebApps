using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.EmployeeMedicalCheckUp;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeMedicalCheckUpController : BaseController
    {



        public ActionResult EmployeeList(int id)
        {
            EmployeeMedicalCheckUpVM vm = EmployeeMedicalCheckUpDA.GetFilterdEmployeeMedicalCheckUp(new EmployeeMedicalCheckUpVM(new EmployeeMedicalCheckUpFilter(id), new Pagging("Employeelist", "form-employee-medical-checkup", 1, 1000)));
            return this.View(vm);
        }




        public ActionResult EmployeeAdd(int empId)
        {
            EmployeeMedicalCheckUp EmployeeMedicalCheckUp = new EmployeeMedicalCheckUp()
            {
                EmployeeID = empId,
                CheckUpDate = DateTime.Now.Date
            };
            return this.View(EmployeeMedicalCheckUp);
        }



        [HttpPost]
        public ActionResult EmployeeAdd(EmployeeMedicalCheckUp employeeMedicalCheckUp, HttpPostedFileBase file)
        {
            employeeMedicalCheckUp.UserID = GetEmployeeID();
            if (this.ModelState.IsValid)
            {
                if (file != null && file.ContentLength > 0)
                {
                    string fileName = DateTime.Now.ToString("ss.mm.hh.dd.MM.yyyy") +
                                      Guid.NewGuid() + Path.GetExtension(file.FileName);
                    employeeMedicalCheckUp.MedicalCheckUpUrl = fileName;
                    string path = this.Server.MapPath("/Uploads/Employees/Documents/" + employeeMedicalCheckUp.MedicalCheckUpUrl);
                    file.SaveAs(path);
                    DataTable DT = EmployeeMedicalCheckUpDA.EmployeeMedicalCheckUpAddEdit(employeeMedicalCheckUp);
                    this.TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                    //x return Json(new { status = DT.Rows[0]["status"].ToString(), msg = DT.Rows[0]["msg"].ToString() });
                    return View(employeeMedicalCheckUp);
                }
                else
                {
                    this.TempData["add-msg"] = "0;" + "الرجاء ارفاق مستند الفحص الطبي";
                    //x return Json(new { status = "0", msg = "الرجاء اختر شهادة الخبرة العملية" });

                }
            }

            //x return Json(new { status = "0", msg = "الرجاء التحقق من البيانات" });
            return View(employeeMedicalCheckUp);



            //x TODO make it return to the employee profile page
        }




        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmployeeMedicalCheckUpDA.EmployeeMedicalCheckUpDelete(id, this.GetEmployeeID());
            this.TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            EmployeeMedicalCheckUpVM vm = EmployeeMedicalCheckUpDA.GetFilterdEmployeeMedicalCheckUp(new EmployeeMedicalCheckUpVM(new EmployeeMedicalCheckUpFilter(-1), new Pagging("Employeelist", "employee-medical-checkup", 1, 10)));
            return this.View("EmployeeList", vm);
        }


        public ActionResult HRAccreditation(int id)
        {
            DataTable DT = EmployeeMedicalCheckUpDA.HRAccreditation(id, this.GetEmployeeID());
            this.TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            EmployeeMedicalCheckUpVM vm = EmployeeMedicalCheckUpDA.GetFilterdEmployeeMedicalCheckUp(new EmployeeMedicalCheckUpVM(new EmployeeMedicalCheckUpFilter(-1), new Pagging("Employeelist", "employee-medical-checkup", 1, 10)));
            return this.View("EmployeeList", vm);
        }



    }
}