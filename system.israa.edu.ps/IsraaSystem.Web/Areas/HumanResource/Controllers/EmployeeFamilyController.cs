using System;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.EmployeeFamily;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeFamilyController : BaseController
    {
        public ActionResult Index()
        {

            EmployeeFamilyVM vm = EmployeeFamilyDA.GetFilterdEmployeeFamilies(new EmployeeFamilyVM(new EmployeeFamilyFilter(-1, "", "", "", "", "", "", "", SelectDA.ddlRelativeTypes(), SelectDA.ddlMaritalStatuses(), SelectDA.ddlPersonStatues()), new Pagging("List", "employee-family", 1, 10)));
            return View(vm);
        }
        public ActionResult EmployeeList(int id)
        {
            EmployeeFamilyVM vm = EmployeeFamilyDA.GetFilterdEmployeeFamilies(new EmployeeFamilyVM(new EmployeeFamilyFilter(id), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View(vm);
        }
        public ActionResult List(EmployeeFamilyFilter filter)
        {
            EmployeeFamilyVM vm = EmployeeFamilyDA.GetFilterdEmployeeFamilies(new EmployeeFamilyVM(filter, new Pagging("list", "form-employee-family", 1, 1000)));
            vm.filter.RelativeTypes = SelectDA.ddlRelativeTypes();
            vm.filter.PersonStatuses = SelectDA.ddlPersonStatues();
            vm.filter.MaritalStatuses = SelectDA.ddlMaritalStatuses();
            return View(vm);
        }

        public ActionResult EmployeeAdd(int empId)
        {
            EmployeeFamily employeefamily = new EmployeeFamily()
            {
                EmployeeID = empId,
                RelativeTypes = SelectDA.ddlRelativeTypes(),
                Genders = SelectDA.ddlGenders(),
                MaritalStatuses = SelectDA.ddlMaritalStatuses(),
                PersonStatuses = SelectDA.ddlPersonStatues()
            };
            return View(employeefamily);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeAdd(EmployeeFamily employeefamily)
        {
            employeefamily.InsertEmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeFamilyDA.EmployeeFamilyAddEdit(employeefamily);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employeefamily.RelativeTypes = SelectDA.ddlRelativeTypes();
            employeefamily.Genders = SelectDA.ddlGenders();
            employeefamily.MaritalStatuses = SelectDA.ddlMaritalStatuses();
            employeefamily.PersonStatuses = SelectDA.ddlPersonStatues();
            return View(employeefamily);
        }

        public ActionResult EmployeeEdit(int id)
        {
            DataTable DT = EmployeeFamilyDA.EmployeeFamilyGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeFamily employeefamily = new EmployeeFamily()
                {
                    ID = id,
                    RelativeTypeID = Convert.ToInt32(DT.Rows[0]["RelativeTypeID"].ToString()),
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    ArFirstName = DT.Rows[0]["ArFirstName"].ToString(),
                    ArSecoundName = DT.Rows[0]["ArSecoundName"].ToString(),
                    ArThirdName = DT.Rows[0]["ArThirdName"].ToString(),
                    ArFamilyName = DT.Rows[0]["ArFamilyName"].ToString(),
                    SSN = DT.Rows[0]["SSN"].ToString(),
                    PlaceOfBirth = DT.Rows[0]["PlaceOfBirth"].ToString(),
                    DateOfBirth = DT.Rows[0]["DateOfBirth"].ToString(),
                    MarriageDate = DT.Rows[0]["MarriageDate"].ToString(),
                    DeathDate = DT.Rows[0]["DeathDate"].ToString(),
                    GenderID = Convert.ToInt32(DT.Rows[0]["GenderID"].ToString()),
                    MaritalStatusID = Convert.ToInt32(DT.Rows[0]["MaritalStatusID"].ToString()),
                    PersonStatusID = Convert.ToInt32(DT.Rows[0]["PersonStatusID"].ToString()),
                    RelativeTypes = SelectDA.ddlRelativeTypes(),
                    Genders = SelectDA.ddlGenders(),
                    MaritalStatuses = SelectDA.ddlMaritalStatuses(),
                    PersonStatuses = SelectDA.ddlPersonStatues()
                };
                return View(employeefamily);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeEdit(EmployeeFamily employeefamily)
        {
            employeefamily.InsertEmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeFamilyDA.EmployeeFamilyAddEdit(employeefamily);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employeefamily.RelativeTypes = SelectDA.ddlRelativeTypes();
            employeefamily.Genders = SelectDA.ddlGenders();
            employeefamily.MaritalStatuses = SelectDA.ddlMaritalStatuses();
            employeefamily.PersonStatuses = SelectDA.ddlPersonStatues();
            return View(employeefamily);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmployeeFamilyDA.EmployeeFamilyDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            int EmpID = Convert.ToInt32(DT.Rows[0]["EmpID"].ToString());
            EmployeeFamilyVM vm = EmployeeFamilyDA.GetFilterdEmployeeFamilies(new EmployeeFamilyVM(new EmployeeFamilyFilter(EmpID), new Pagging("EmployeeList", "employee-page", 1, 10)));
            return View("EmployeeList", vm);
        }

    }
}