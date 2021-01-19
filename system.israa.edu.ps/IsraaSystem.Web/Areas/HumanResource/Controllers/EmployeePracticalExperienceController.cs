// ReSharper disable StyleCop.SA1633

using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.EmployeePracticalExperience;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
// ReSharper restore StyleCop.SA1633
{
    using System;
    using System.Data;
    using System.Diagnostics.CodeAnalysis;
    using System.IO;
    using System.Web;
    using System.Web.Mvc;
    using IsraaSystem.Web.Controllers;

    [SuppressMessage("ReSharper", "StyleCop.SA1600")]
    public class EmployeePracticalExperienceController : BaseController
    {
        // GET: HumanResourse/EmployeePracticalExperience
        public ActionResult Index()
        {
            EmployeePracticalExperienceVM vm = EmployeePracticalExperienceDA.GetFilterdEmployeePracticalExperiences(new EmployeePracticalExperienceVM(new EmployeePracticalExperienceFilter(-1, ""), new Pagging("List", "employee-practical-experience", 1, 10)));
            return this.View(vm);
        }

        public ActionResult List(EmployeePracticalExperienceFilter filter)
        {
            EmployeePracticalExperienceVM vm = EmployeePracticalExperienceDA.GetFilterdEmployeePracticalExperiences(new EmployeePracticalExperienceVM(filter, new Pagging("list", "form-employee-practical-experience", 1, 1000)));
            return this.View(vm);
        }

        public ActionResult EmployeeList(int id)
        {
            EmployeePracticalExperienceVM vm = EmployeePracticalExperienceDA.GetFilterdEmployeePracticalExperiences(new EmployeePracticalExperienceVM(new EmployeePracticalExperienceFilter(id), new Pagging("Employeelist", "form-employee-practical-experience", 1, 1000)));
            return this.View(vm);
        }

        public ActionResult EmployeeAdd(int empId)
        {
            EmployeePracticalExperience employeePracticalExperience = new EmployeePracticalExperience()
            {
                EmployeeID = empId
            };
            return this.View(employeePracticalExperience);
        }

        [HttpPost]
        public ActionResult EmployeeAdd(EmployeePracticalExperience employeePracticalExperience, HttpPostedFileBase file)
        {
            employeePracticalExperience.UserID = this.GetEmployeeID();
            if (this.ModelState.IsValid)
            {
                //! تعديل ازالة شرط رفع الملف منابو نائل
                if (file != null && file.ContentLength > 0)
                {
                    string fileName = DateTime.Now.ToString("ss.mm.hh.dd.MM.yyyy") +
                    Guid.NewGuid() + Path.GetExtension(file.FileName);
                    employeePracticalExperience.WorkCertificateUrl = fileName;
                    string path = this.Server.MapPath("/Uploads/Employees/Documents/" + employeePracticalExperience.WorkCertificateUrl);
                    file.SaveAs(path);
                    DataTable DT = EmployeePracticalExperienceDA.EmployeePracticalExperienceAddEdit(employeePracticalExperience);
                    this.TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                    //x return Json(new { status = DT.Rows[0]["status"].ToString(), msg = DT.Rows[0]["msg"].ToString() });
                    return View(employeePracticalExperience);
                }
                else
                {
                    DataTable DT = EmployeePracticalExperienceDA.EmployeePracticalExperienceAddEdit(employeePracticalExperience);
                    this.TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                    //this.TempData["add-msg"] = "0;" + "الرجاء اختر شهادة الخبرة العملية";
                    //return Json(new { status = "0", msg = "الرجاء اختر شهادة الخبرة العملية" });

                }
            }

            //x return Json(new { status = "0", msg = "الرجاء التحقق من البيانات" });
            return View(employeePracticalExperience);



            //x TODO make it return to the employee profile page
        }

        public ActionResult EmployeeEdit(int id)
        {
            DataTable DT = EmployeePracticalExperienceDA.EmployeePracticalExperienceGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeePracticalExperience employeePracticalExperience = new EmployeePracticalExperience()
                {
                    ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    Job = DT.Rows[0]["Job"].ToString(),
                    WorkPlace = DT.Rows[0]["WorkPlace"].ToString(),
                    WorkField = DT.Rows[0]["WorkField"].ToString(),
                    WorkFromDate = DT.Rows[0]["WorkFromDate"].ToString(),
                    WorkToDate = DT.Rows[0]["WorkToDate"].ToString(),
                    WorkDetails = DT.Rows[0]["WorkDetails"].ToString(),
                    WorkLeavingReason = DT.Rows[0]["WorkLeavingReason"].ToString(),
                    IdentifiersName = DT.Rows[0]["IdentifiersName"].ToString(),
                    IdentifiersMobile = DT.Rows[0]["IdentifiersMobile"].ToString(),
                    WorkCertificateUrl = DT.Rows[0]["WorkCertificateUrl"].ToString(),
                    IsAccredit = Convert.ToBoolean(DT.Rows[0]["IsAccredit"].ToString())
                };
                return this.View(employeePracticalExperience);
            }
            else
            {
                return this.RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeEdit(EmployeePracticalExperience employeePracticalExperience, HttpPostedFileBase file)
        {
            employeePracticalExperience.UserID = this.GetEmployeeID();
            if (this.ModelState.IsValid)
            {
                if (file != null && file.ContentLength > 0)
                {
                    string fileName = DateTime.Now.ToString("ss.mm.hh.dd.MM.yyyy") +
                    Guid.NewGuid() + Path.GetExtension(file.FileName);
                    employeePracticalExperience.WorkCertificateUrl = fileName;
                    string path = this.Server.MapPath("/Uploads/Employees/Documents/" + employeePracticalExperience.WorkCertificateUrl);
                    file.SaveAs(path);
                    DataTable DT = EmployeePracticalExperienceDA.EmployeePracticalExperienceAddEdit(employeePracticalExperience);
                    this.TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                }
                else
                {
                    this.TempData["add-msg"] = 0 + "الرجاء اختر شهادة الخبرة العملية";
                }
            }
            return this.View(employeePracticalExperience);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmployeePracticalExperienceDA.EmployeePracticalExperienceDelete(id, this.GetEmployeeID());
            this.TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            EmployeePracticalExperienceVM vm = EmployeePracticalExperienceDA.GetFilterdEmployeePracticalExperiences(new EmployeePracticalExperienceVM(new EmployeePracticalExperienceFilter(-1, ""), new Pagging("Employeelist", "employee-practical-experience", 1, 10)));
            return this.View("EmployeeList", vm);
        }

        [HttpPost]
        public ActionResult HRAccreditation(int id)
        {
            DataTable DT = EmployeePracticalExperienceDA.HRAccreditation(id, this.GetEmployeeID());
            this.TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            EmployeePracticalExperienceVM vm = EmployeePracticalExperienceDA.GetFilterdEmployeePracticalExperiences(new EmployeePracticalExperienceVM(new EmployeePracticalExperienceFilter(-1, ""), new Pagging("Employeelist", "employee-practical-experience", 1, 10)));
            return this.View("EmployeeList", vm);
        }
    }
}