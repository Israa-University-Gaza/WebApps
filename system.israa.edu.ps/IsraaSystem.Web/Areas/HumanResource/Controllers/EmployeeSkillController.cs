using System;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.EmployeeSkill;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeSkillController : BaseController
    {
        public ActionResult Index()
        {
            EmployeeSkillVM vm = EmployeeSkillDA.GetFilterdEmployeeSkills(new EmployeeSkillVM(new EmployeeSkillFilter(-1, "", "", SelectDA.ddlSkillTypes(), SelectDA.ddlKnowLevels()), new Pagging("List", "employee-skill", 1, 10)));
            return View(vm);
        }

        public ActionResult List(EmployeeSkillFilter filter)
        {
            EmployeeSkillVM vm = EmployeeSkillDA.GetFilterdEmployeeSkills(new EmployeeSkillVM(filter, new Pagging("list", "form-employee-skill", 1, 1000)));
            vm.filter.SkillTypes = SelectDA.ddlSkillTypes();
            vm.filter.KnowLevels = SelectDA.ddlKnowLevels();
            return View(vm);
        }

        public ActionResult EmployeeList(int id)
        {
            EmployeeSkillVM vm = EmployeeSkillDA.GetFilterdEmployeeSkills(new EmployeeSkillVM(new EmployeeSkillFilter(id), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View(vm);
        }

        public ActionResult EmployeeAdd(int empId)
        {
            EmployeeSkill employeeSkill = new EmployeeSkill()
            {
                EmployeeID = empId,
                SkillTypes = SelectDA.ddlSkillTypes(),
                KnowLevels = SelectDA.ddlKnowLevels()
            };
            return View(employeeSkill);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeAdd(EmployeeSkill employeeSkill)
        {
            employeeSkill.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeSkillDA.EmployeeSkillAddEdit(employeeSkill);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employeeSkill.SkillTypes = SelectDA.ddlBanks();
            employeeSkill.KnowLevels = SelectDA.ddlKnowLevels();
            return View(employeeSkill);
        }

        public ActionResult EmployeeEdit(int id)
        {
            DataTable DT = EmployeeSkillDA.EmployeeSkillGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeSkill employeeSkill = new EmployeeSkill()
                {
                    ID = id,
                    SkillTypeID = Convert.ToInt32(DT.Rows[0]["SkillTypeID"].ToString()),
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    Name = DT.Rows[0]["Name"].ToString(),
                    KnowLevelID = Convert.ToInt32(DT.Rows[0]["KnowLevelID"].ToString()),
                    SkillTypes = SelectDA.ddlSkillTypes(),
                    KnowLevels = SelectDA.ddlKnowLevels()
                };
                return View(employeeSkill);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeEdit(EmployeeSkill employeeSkill)
        {
            employeeSkill.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeSkillDA.EmployeeSkillAddEdit(employeeSkill);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employeeSkill.SkillTypes = SelectDA.ddlSkillTypes();
            employeeSkill.KnowLevels = SelectDA.ddlKnowLevels();
            return View(employeeSkill);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmployeeSkillDA.EmployeeSkillDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            int EmpID = Convert.ToInt32(DT.Rows[0]["EmpID"].ToString());
            EmployeeSkillVM vm = EmployeeSkillDA.GetFilterdEmployeeSkills(new EmployeeSkillVM(new EmployeeSkillFilter(EmpID), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View("EmployeeList", vm);
        }
    }
}