using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class AttendanceDailyController : BaseController
    {
        public ActionResult Index()
        {
            AttendanceDailyVM vmAttendance = AttendanceDA.GetDateAttendanceDaily(new AttendanceDailyVM(new AttendanceDailyFilter(), new Pagging()));
            return View(vmAttendance);
        }

        [HttpPost]
        public ActionResult List(AttendanceDailyFilter filter)
        {
            filter.AttendanceDate = (!String.IsNullOrEmpty(filter.AttendanceDate)) ? filter.AttendanceDate : DateTime.Now.ToString("yyyy/MM/dd");
            AttendanceDailyVM vmAttendance = AttendanceDA.GetDateAttendanceDaily(new AttendanceDailyVM(filter, new Pagging()));
            return View(vmAttendance);
        }

        public ActionResult Details(int id)
        {
            DataTable DT = AttendanceDA.AttendanceDailyGet(id);
            AttendanceDailyDetails model = new AttendanceDailyDetails()
            {
                EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                AttendanceDate = DT.Rows[0]["AttendanceDate"].ToString(),
                DefaultFrom = DT.Rows[0]["DefaultFrom"].ToString(),
                DefaultTo = DT.Rows[0]["DefaultTo"].ToString(),
                AttendanceFrom = DT.Rows[0]["AttendanceFrom"].ToString(),
                AttendanceTo = DT.Rows[0]["AttendanceTo"].ToString(),
                MorningLateMinutes = DT.Rows[0]["MorningLateMinutes"].ToString(),
                EveningLateMinutes = DT.Rows[0]["EveningLateMinutes"].ToString(),
                ExitMinutes = DT.Rows[0]["ExitMinutes"].ToString(),
                OtherLateMinutes = DT.Rows[0]["OtherLateMinutes"].ToString(),

                AttendanceExits = AttendanceDA.GetAttendanceDailyExits(id)
            };
            return View(model);
        }
    }
}