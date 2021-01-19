using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.Core.Classic.HumanResource.Vacation;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;


namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeVacationStatisticsController : BaseController
    {
        // GET: HumanResource/EmployeeVacationStatistics
        public ActionResult Index(string EmployeeName, string VacationTypeID, string VacationBalanceYearID, string AccreditationStatusID, string DateFrom, string DateTo)
        {
            EmployeeVacationVM vm = new EmployeeVacationVM(
                new EmployeeVacationsFilter("", "", "", "", "", "", SelectDA.ddlVacationTypes(),
                    SelectDA.ddlAccreditationStatuses(), SelectDA.ddlVacationBalanceYears()),
                new Pagging("List", "form-employee-vacation", 1, 50));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmployeeVacationsFilter filter, Pagging pagging)
        {

            //EmpInfo
            DataTable dtEmpInfo = EmployeeDA.GetEmployeeByEmployeeNo(filter.EmployeeName);
            //EmpVacation
            EmployeeVacationVM vm = VacationDA.GetFilterdEmployeeVacations(new EmployeeVacationVM(filter, new Pagging("List", "form-employee-vacation", 0, 1000)));
            vm.filter.VacationTypes = SelectDA.ddlVacationTypes();
            vm.filter.AccreditationStatuses = SelectDA.ddlAccreditationStatuses();
            vm.filter.VacationBalanceYears = SelectDA.ddlVacationBalanceYears();

            //EmpVacBalance
            VacationBalanceVM vb = VacationDA.GetFilterdEmployeeVacationBalances(new VacationBalanceVM(
                new VacationBalanceFilter()
                {
                    VacationBalanceYearID = filter.VacationBalanceYearID,
                    VacationTypeID = "1",
                    EmployeeName = filter.EmployeeName
                },
                new Pagging("List", "form-vacation-balance", 0, 1000)));

            Dictionary<int, int> vbDictionary = vb.data.AsEnumerable().ToDictionary<DataRow, int, int>(row => (int)row["ID"], row => (int)row["DefualtDays"]);

            // EmpMonthlyAttendance
            AttendanceMonthlyVM am = AttendanceDA.GetFilterdAttendanceMonthly(new AttendanceMonthlyVM(
                new AttendanceMonthlyFilter()
                {
                    EmployeeName = filter.EmployeeName,
                    VacationBalanceYearID = filter.VacationBalanceYearID


                },
                new Pagging("List", "form-attendance-monthly", 0, 1000)));





            ViewBag.VacationBalance = vb.data;
            ViewBag.AttendanceMonthly = am.data;
            ViewBag.vbDictionary = vbDictionary;
            ViewBag.dtEmpInfo = dtEmpInfo;
            ViewBag.selectedYear =
                vm.filter.VacationBalanceYears.First(x => x.Value == filter.VacationBalanceYearID).Text;
            return View(vm);
        }

        public ActionResult PlanVacation(string EmployeeName, string VacationTypeID, string VacationBalanceYearID, string AccreditationStatusID, string DateFrom, string DateTo)
        {
            EmployeeVacationVM vm = new EmployeeVacationVM(
                new EmployeeVacationsFilter("", "", "", "", "", "", SelectDA.ddlVacationTypes(),
                    SelectDA.ddlAccreditationStatuses(), SelectDA.ddlVacationBalanceYears()),
                new Pagging("ListPlan", "form-employee-vacation", 1, 50));
            return View(vm);
        }
        [HttpPost]
        public ActionResult ListPlan(EmployeeVacationsFilter filter, Pagging pagging)
        {
            //EmpInfo
            DataTable dtEmpInfo = EmployeeDA.GetEmployeeByEmployeeNo(filter.EmployeeName);
            //EmpVacation
            EmployeeVacationVM vm = VacationDA.GetFilterdEmployeeVacations(new EmployeeVacationVM(filter, new Pagging("ListPlan", "form-employee-vacation", 0, 1000)));
            vm.filter.VacationTypes = SelectDA.ddlVacationTypes();
            vm.filter.AccreditationStatuses = SelectDA.ddlAccreditationStatuses();
            vm.filter.VacationBalanceYears = SelectDA.ddlVacationBalanceYears();

            //EmpVacBalance
            VacationBalanceVM vb = VacationDA.GetFilterdEmployeeVacationBalances(new VacationBalanceVM(
                new VacationBalanceFilter()
                {
                    VacationBalanceYearID = filter.VacationBalanceYearID,
                    VacationTypeID = "1",
                    EmployeeName = filter.EmployeeName
                },
                new Pagging("ListPlan", "form-vacation-balance", 0, 1000)));

            Dictionary<int, int> vbDictionary = vb.data.AsEnumerable().ToDictionary<DataRow, int, int>(row => (int)row["ID"], row => (int)row["DefualtDays"]);

            // EmpMonthlyAttendance
            AttendanceMonthlyVM am = AttendanceDA.GetFilterdAttendanceMonthly(new AttendanceMonthlyVM(
                new AttendanceMonthlyFilter()
                {
                    EmployeeName = filter.EmployeeName,
                    VacationBalanceYearID = filter.VacationBalanceYearID


                },
                new Pagging("ListPlan", "form-attendance-monthly", 0, 1000)));





            ViewBag.VacationBalance = vb.data;
            ViewBag.AttendanceMonthly = am.data;
            ViewBag.vbDictionary = vbDictionary;
            ViewBag.dtEmpInfo = dtEmpInfo;
            ViewBag.selectedYear =
                vm.filter.VacationBalanceYears.First(x => x.Value == filter.VacationBalanceYearID).Text;
            return View(vm);
        }

    }
}