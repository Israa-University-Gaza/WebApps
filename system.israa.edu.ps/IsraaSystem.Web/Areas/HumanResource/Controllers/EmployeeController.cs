using System;
using System.Data;
using System.Linq;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.Employee;
using IsraaSystem.Core.Classic.HumanResource.EmployeePlacement;
using IsraaSystem.Core.Classic.HumanResource.Vacation;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermissions;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeController : BaseController
    {


        [HttpPost]
        public ActionResult Details(int id)
        {
            DataTable DT = EmployeeDA.GetEmployeeByEmployeeID(id);
            if ((DT.Rows[0]["EmployeeID"].ToString() == "0"))
                return RedirectToAction("Error404", "Error");
            else
                return View(DT);
        }

        public ActionResult Index()
        {
            var vm = EmployeeDA.GetFilterdEmployees(new EmployeeVM(new EmployeeFilter("1", "", SelectDA.ddlEmployeeStatuses(null), SelectDA.ddlEmploymentTypes(null)), new Pagging("List", "form-employee", 1, 18)));
            return View(vm);
        }



        [HttpPost]
        public ActionResult List(EmployeeFilter filter, Pagging pagging)
        {
            EmployeeVM vm = EmployeeDA.GetFilterdEmployees(new EmployeeVM(filter, new Pagging("List", "form-employee", pagging.currentPage, 1000)));
            vm.filter.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(null);
            vm.filter.EmploymentTypes = SelectDA.ddlEmploymentTypes(null);








            return View(vm);
        }


        [HttpPost]
        public ActionResult Layout(int employeeId, string employeeNo)
        {
            DataTable DT = EmployeeDA.GetEmployeeByEmployeeNo(employeeNo);
            if ((DT.Rows[0]["EmployeeID"].ToString() == "0"))
            {
                TempData["toast-msg"] = DT.Rows[0]["EmployeeID"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                DT = EmployeeDA.GetEmployeeByEmployeeID(employeeId);
            }
            return View(DT);
        }


        public ActionResult Image(int id)
        {
            DataTable DT = EmployeePersonalDA.EmployeePersonalGet(id);
            if (DT.Rows.Count > 0)
                return View(DT);
            else
                return RedirectToAction("Error404", "Error");
        }

        public ActionResult Home(int employeeId, string employeeNo)
        {


            DataTable DT = EmployeeDA.GetEmployeeByEmployeeNo(employeeNo);
            if ((DT.Rows[0]["EmployeeID"].ToString() == "0"))
            {
                TempData["toast-msg"] = DT.Rows[0]["EmployeeID"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                DT = EmployeeDA.GetEmployeeByEmployeeID(employeeId);
            }


            //Emplyee personal data
            DataTable dtEmployeePersonal = EmployeePersonalDA.EmployeePersonalGet(employeeId);


            //country
            var ddl = SelectDA.ddlCities(Convert.ToInt32(dtEmployeePersonal.Rows[0]["GovernorateID"]));
            var City = (Convert.ToInt32(dtEmployeePersonal.Rows[0]["CityID"]) > 0) ? ddl
                .Where(x => x.Value == dtEmployeePersonal.Rows[0]["CityID"].ToString())
                .Select(x => x.Text)
                .First() : "";


            // vacation balance
            var filtter = new VacationBalanceFilter()
            {
                EmployeeName = employeeNo,
                VacationTypeID = "",
                VacationBalanceYearID = "2", // SelectDA.ddlVacationBalanceYears().First(x => x.Text.Contains(DateTime.Now.Year.ToString())).Value,
                VacationBalanceYears = null,
                VacationTypes = null

            };
            VacationBalanceVM vacationBalanceVm = VacationDA.GetFilterdEmployeeVacationBalances(new VacationBalanceVM(filtter, new Pagging("List", "form-vacation-balance", 0, 1000)));


            // Employee Placement
            EmployeePlacementVM vmeEmployeePlacement = EmployeePlacementDA.GetFilterdEmployeePlacements(new EmployeePlacementVM(new EmployeePlacementsFilter(employeeId), new Pagging("Employeelist", "employee-page", 1, 1000)));



            ViewBag.dtEmployeePersonal = dtEmployeePersonal;
            ViewBag.City = City;

            ViewBag.vacationBalanceVm = vacationBalanceVm;

            ViewBag.vmeEmployeePlacement = vmeEmployeePlacement;
            return View(DT);
        }

        [HttpPost]
        public ActionResult SendNewPassword(int employeeId)
        {
            bool sendStatus;
            DataTable DTP;
            DataTable DT = EmployeePersonalDA.EmployeePersonalGet(employeeId);
            if ((DT.Rows[0]["EmployeeID"].ToString() == "0"))
            {
                return RedirectToAction("Error404", "Error");
            }
            else
            {
                DTP = EmployeeDA.UpdateEmployeePassword(employeeId);
                sendStatus = EmployeeDA.SendSMS(DT.Rows[0]["Mobile"].ToString(), "كلمة المرور الجديدة : " + DTP.Rows[0]["NewPassword"].ToString());

            }
            return Json(new { res = DTP.Rows[0]["Status"].ToString() });

        }

    }
}