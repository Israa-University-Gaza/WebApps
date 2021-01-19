using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.EmployeeQualification;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeQualificationController : BaseController
    {
        // GET: HumanResourse/EmployeeQualification
        #region All Employee Qualification
        public ActionResult Index()
        {
            EmployeeQualificationVM vm = EmployeeQualificationDA.GetFilterEmployeeQualifications(new EmployeeQualificationVM(new EmployeeQualificationsFilter("", "", "", "", "", SelectDA.ddlQualificationTypes()), new Pagging("List", "form-employee-qualification", 1, 10)));
            return View(vm);
        }

        public ActionResult List(EmployeeQualificationsFilter filter, int page = 1)
        {
            EmployeeQualificationVM vm = EmployeeQualificationDA.GetFilterEmployeeQualifications(new EmployeeQualificationVM(filter, new Pagging("List", "form-employee-qualification", page, 10)));
            vm.filter.QualificationTypes = SelectDA.ddlQualificationTypes();
            return View(vm);
        }
        #endregion

        #region Employee Qualification
        public ActionResult EmployeeList(int id)
        {
            EmployeeQualificationVM vm = EmployeeQualificationDA.GetFilterEmployeeQualifications(new EmployeeQualificationVM(new EmployeeQualificationsFilter(id), new Pagging("EmployeeList", "form-employee-qualification", 1, 1000)));
            return View(vm);
        }
        public ActionResult Add(int empid)
        {
            EmployeeQualification employeeQualification = new EmployeeQualification()
            {
                EmployeeID = empid,
                QualificationTypes = SelectDA.ddlQualificationTypes(),
                Countries = SelectDA.ddlCountries(),
                Months = SelectDA.ddlMonths()
            };
            return View(employeeQualification);
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Add(EmployeeQualification employeeQualification, HttpPostedFileBase file)
        {
            employeeQualification.UserID = GetEmployeeID();

            if (ModelState.IsValid)
            {

                //! تعديل من ابو نائل ازالة شرط الملف في الرفع
                if (file != null && file.ContentLength > 0)
                {
                    string fileName = DateTime.Now.ToString("ss.mm.hh.dd.MM.yyyy") +
                    Guid.NewGuid() + Path.GetExtension(file.FileName);
                    employeeQualification.GraduateCertificateUrl = fileName;
                    string path = Server.MapPath("/Uploads/Employees/Documents/" + employeeQualification.GraduateCertificateUrl);
                    file.SaveAs(path);
                    DataTable DT = EmployeeQualificationDA.EmployeeQualificationAddEdit(employeeQualification);
                    TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                }
                else
                {
                    DataTable DT = EmployeeQualificationDA.EmployeeQualificationAddEdit(employeeQualification);
                    TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                    //TempData["add-msg"] = 0 + "; الرجاء اختيار ملف لرفع الشهادة;";
                }
            }
            employeeQualification.QualificationTypes = SelectDA.ddlQualificationTypes();
            employeeQualification.Countries = SelectDA.ddlCountries();
            employeeQualification.Months = SelectDA.ddlMonths();
            return View(employeeQualification);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = EmployeeQualificationDA.EmployeeQualificationGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeQualification employeeQualification = new EmployeeQualification()
                {
                    ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    QualificationTypeID = Convert.ToInt32(DT.Rows[0]["QualificationTypeID"].ToString()),
                    CountryID = Convert.ToInt32(DT.Rows[0]["CountryID"].ToString()),
                    UniversityName = DT.Rows[0]["UniversityName"].ToString(),
                    GPAGraduate = DT.Rows[0]["GPAGraduate"].ToString(),
                    GraduateYear = Convert.ToInt32(DT.Rows[0]["GraduateYear"].ToString()),
                    GraduateMonthID = Convert.ToInt32(DT.Rows[0]["GraduateMonthID"].ToString()),
                    College = DT.Rows[0]["College"].ToString(),
                    Department = DT.Rows[0]["Department"].ToString(),
                    //GraduateCertificateUrl = DT.Rows[0]["GraduateCertificateUrl"].ToString(),

                    //TODO chick IsAccredit from select
                    //IsAccredit = Convert.ToBoolean(DT.Rows[0]["IsAccredit"].ToString()),

                    QualificationTypes = SelectDA.ddlQualificationTypes(),
                    Countries = SelectDA.ddlCountries(),
                    Months = SelectDA.ddlMonths()
                };
                return View(employeeQualification);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(EmployeeQualification employeeQualification/*, HttpPostedFileBase file*/)
        {
            employeeQualification.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                //if (file != null && file.ContentLength > 0)
                //{
                    //string fileName = DateTime.Now.ToString("ss.mm.hh.dd.MM.yyyy") +
                    //Guid.NewGuid() + Path.GetExtension(file.FileName);
                    //employeeQualification.GraduateCertificateUrl = fileName;
                    //string path = Server.MapPath("/Uploads/Employees/Documents/" + employeeQualification.GraduateCertificateUrl);
                    //file.SaveAs(path);
                    DataTable DT = EmployeeQualificationDA.EmployeeQualificationAddEdit(employeeQualification);
                    TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                //}
                //else
                //{
                //    TempData["add-msg"] = 0 + "الرجاء اختيار ملف لرفع الشهادة";
                //}
                //return RedirectToAction("EmployeeList", employeeQualification.EmployeeID);
            }
            employeeQualification.QualificationTypes = SelectDA.ddlQualificationTypes();
            employeeQualification.Countries = SelectDA.ddlCountries();
            employeeQualification.Months = SelectDA.ddlMonths();

            return View(employeeQualification);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmployeeQualificationDA.EmployeeQualificationDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            int EmpID = Convert.ToInt32(DT.Rows[0]["EmpID"].ToString());
            EmployeeQualificationVM vm = EmployeeQualificationDA.GetFilterEmployeeQualifications(new EmployeeQualificationVM(new EmployeeQualificationsFilter(EmpID), new Pagging("EmployeeList", "form-employee-qualification", 1, 1000)));
            return View("EmployeeList", vm);
        }



        public ActionResult islam(int id)
        {
            return Json(new { islam = "islam" }, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        public ActionResult Accreditation(int id)
        {
            DataTable DT = EmployeeQualificationDA.EmployeeQualificationAccredit(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("Refresh");
        }

        #endregion





    }
}