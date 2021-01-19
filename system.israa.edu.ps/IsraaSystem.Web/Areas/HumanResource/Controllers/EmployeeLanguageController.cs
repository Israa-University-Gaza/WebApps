using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.EmployeeLanguage;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeLanguageController : BaseController
    {
        // GET: HumanResource/EmployeeLanguage
        public ActionResult Index()
        {
            EmployeeLanguageVM vm = EmployeeLanguageDA.GetFilterdEmployeeLanguages(new EmployeeLanguageVM(new EmployeeLanguageFilter(-1, "", "", "", "", SelectDA.ddlLanguages(), SelectDA.ddlKnowLevels(), SelectDA.ddlKnowLevels(), SelectDA.ddlKnowLevels()), new Pagging("List", "employee-language", 1, 10)));
            return View(vm);
        }

        public ActionResult List(EmployeeLanguageFilter filter)
        {
            EmployeeLanguageVM vm = EmployeeLanguageDA.GetFilterdEmployeeLanguages(new EmployeeLanguageVM(filter, new Pagging("list", "employee-page", 1, 1000)));
            vm.filter.Languages = SelectDA.ddlLanguages();
            vm.filter.ReadingKnowLevels = SelectDA.ddlKnowLevels();
            vm.filter.WritingKnowLevels = SelectDA.ddlKnowLevels();
            vm.filter.SpeakingKnowLevels = SelectDA.ddlKnowLevels();
            return View(vm);
        }

        public ActionResult EmployeeList(int id)
        {
            EmployeeLanguageVM vm = EmployeeLanguageDA.GetFilterdEmployeeLanguages(new EmployeeLanguageVM(new EmployeeLanguageFilter(id), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View(vm);
        }

        public ActionResult EmployeeAdd(int empId)
        {
            EmployeeLanguage employeeLanguage = new EmployeeLanguage()
            {
                EmployeeID = empId,
                languages = SelectDA.ddlLanguages(),
                ReadingKnowLevels = SelectDA.ddlKnowLevels(),
                WritingKnowLevels = SelectDA.ddlKnowLevels(),
                SpeakingKnowLevels = SelectDA.ddlKnowLevels()
            };
            return View(employeeLanguage);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeAdd(EmployeeLanguage employeeLanguage)
        {
            employeeLanguage.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeLanguageDA.EmployeeLanguageAddEdit(employeeLanguage);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employeeLanguage.languages = SelectDA.ddlLanguages();
            employeeLanguage.ReadingKnowLevels = SelectDA.ddlKnowLevels();
            employeeLanguage.WritingKnowLevels = SelectDA.ddlKnowLevels();
            employeeLanguage.SpeakingKnowLevels = SelectDA.ddlKnowLevels();
            return View(employeeLanguage);
        }

        public ActionResult EmployeeEdit(int id)
        {
            DataTable DT = EmployeeLanguageDA.EmployeeLanguageGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeLanguage employeeLanguage = new EmployeeLanguage()
                {
                    ID =id,
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    languageID = Convert.ToInt32(DT.Rows[0]["languageID"].ToString()),
                    ReadingKnowLevelID = Convert.ToInt32(DT.Rows[0]["ReadingKnowLevelID"].ToString()),
                    WritingKnowLevelID = Convert.ToInt32(DT.Rows[0]["WritingKnowLevelID"].ToString()),
                    SpeakingKnowLevelID = Convert.ToInt32(DT.Rows[0]["SpeakingKnowLevelID"].ToString()),

                    languages = SelectDA.ddlLanguages(),
                    ReadingKnowLevels = SelectDA.ddlKnowLevels(),
                    WritingKnowLevels = SelectDA.ddlKnowLevels(),
                    SpeakingKnowLevels = SelectDA.ddlKnowLevels()
                };
                return View(employeeLanguage);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeEdit(EmployeeLanguage employeeLanguage)
        {
            employeeLanguage.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeLanguageDA.EmployeeLanguageAddEdit(employeeLanguage);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employeeLanguage.languages = SelectDA.ddlLanguages();
            employeeLanguage.ReadingKnowLevels = SelectDA.ddlKnowLevels();
            employeeLanguage.WritingKnowLevels = SelectDA.ddlKnowLevels();
            employeeLanguage.SpeakingKnowLevels = SelectDA.ddlKnowLevels();
            return View(employeeLanguage);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmployeeLanguageDA.EmployeeLanguageDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            int EmpID = Convert.ToInt32(DT.Rows[0]["EmpID"].ToString());
            EmployeeLanguageVM vm = EmployeeLanguageDA.GetFilterdEmployeeLanguages(new EmployeeLanguageVM(new EmployeeLanguageFilter(EmpID), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View("EmployeeList", vm);
        }
    }
}