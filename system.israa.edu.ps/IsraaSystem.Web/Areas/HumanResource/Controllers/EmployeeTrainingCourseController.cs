using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.EmployeeTrainingCourse;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeTrainingCourseController : BaseController
    {
        // GET: HumanResource/EmployeeTrainingCourse
        public ActionResult Index()
        {
            EmployeeTrainingCourseVM vm = EmployeeTrainingCourseDA.GetFilterdEmployeeTrainingCourses(new EmployeeTrainingCourseVM(new EmployeeTrainingCourseFilter(-1, ""), new Pagging("List", "employee-training-course", 1, 10)));
            return View(vm);
        }

        public ActionResult List(EmployeeTrainingCourseFilter filter)
        {
            EmployeeTrainingCourseVM vm = EmployeeTrainingCourseDA.GetFilterdEmployeeTrainingCourses(new EmployeeTrainingCourseVM(filter, new Pagging("list", "form-employee-training-course", 1, 1000)));
            return View(vm);
        }

        public ActionResult EmployeeList(int id)
        {
            EmployeeTrainingCourseVM vm = EmployeeTrainingCourseDA.GetFilterdEmployeeTrainingCourses(new EmployeeTrainingCourseVM(new EmployeeTrainingCourseFilter(id), new Pagging("Employeelist", "form-employee-training-course", 1, 1000)));
            return View(vm);
        }

        public ActionResult EmployeeAdd(int empId)
        {
            EmployeeTrainingCourse employeeTrainingCourse = new EmployeeTrainingCourse()
            {
                EmployeeID = empId
            };
            return View(employeeTrainingCourse);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeAdd(EmployeeTrainingCourse employeeTrainingCourse, HttpPostedFileBase file)
        {
            employeeTrainingCourse.UserID = GetEmployeeID();

            if (ModelState.IsValid)
            {
                if (file != null && file.ContentLength > 0)
                {
                    string fileName = DateTime.Now.ToString("ss.mm.hh.dd.MM.yyyy") +
                    Guid.NewGuid() + Path.GetExtension(file.FileName);
                    employeeTrainingCourse.CourseCertificateUrl = fileName;
                    string path = Server.MapPath("/Uploads/Employees/Documents/" + employeeTrainingCourse.CourseCertificateUrl);
                    file.SaveAs(path);
                    DataTable DT = EmployeeTrainingCourseDA.EmployeeTrainingCourseAddEdit(employeeTrainingCourse);
                    TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                    //return RedirectToAction("EmployeeEdit", new { id = DT.Rows[0]["id"].ToString() });
                }
                else
                {
                    TempData["add-msg"] = 0 + "; الرجاء اختر شهادة الكورس";
                }
            }
            return View(employeeTrainingCourse);
        }

        //[HttpPost]
        //public JsonResult FileUpload(HttpPostedFileBase file, EmployeeTrainingCourse employeeTrainingCourse)
        //{
        //    string fileName = DateTime.Now.ToString("ss.mm.hh.dd.MM.yyyy") +
        //            Guid.NewGuid() + Path.GetExtension(file.FileName);
        //    employeeTrainingCourse.CourseCertificateUrl = fileName;
        //    file.SaveAs(Server.MapPath("~/Uploads/Employees/Documents/") + file.FileName);
        //    return Json("تم تحميل الملف بنجاح");
        //}

        public ActionResult EmployeeEdit(int id)
        {
            DataTable DT = EmployeeTrainingCourseDA.EmployeeTrainingCourseGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeTrainingCourse employeeTrainingCourse = new EmployeeTrainingCourse()
                {
                    ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    CourseName = DT.Rows[0]["CourseName"].ToString(),
                    CourseOrganisers = DT.Rows[0]["CourseOrganisers"].ToString(),
                    CourseSpecialization = DT.Rows[0]["CourseSpecialization"].ToString(),
                    CourseHours = DT.Rows[0]["CourseHours"].ToString(),
                    CourseFromDate = DT.Rows[0]["CourseFromDate"].ToString(),
                    CourseToDate = DT.Rows[0]["CourseToDate"].ToString(),
                    CourseCertificateUrl = DT.Rows[0]["CourseCertificateUrl"].ToString(),
                    Note = DT.Rows[0]["Note"].ToString()
                };
                return View(employeeTrainingCourse);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeEdit(EmployeeTrainingCourse employeeTrainingCourse, HttpPostedFileBase file)
        {
            employeeTrainingCourse.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                if (file != null && file.ContentLength > 0)
                {
                    string fileName = DateTime.Now.ToString("ss.mm.hh.dd.MM.yyyy") +
                    Guid.NewGuid() + Path.GetExtension(file.FileName);
                    employeeTrainingCourse.CourseCertificateUrl = fileName;
                    string path = Server.MapPath("/Uploads/Employees/Documents/" + employeeTrainingCourse.CourseCertificateUrl);
                    file.SaveAs(path);
                    DataTable DT = EmployeeTrainingCourseDA.EmployeeTrainingCourseAddEdit(employeeTrainingCourse);
                    TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                }
                else
                {
                    TempData["add-msg"] = 0 + "الرجاء اختر شهادة الكورس";
                }
            };
            return View(employeeTrainingCourse);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmployeeTrainingCourseDA.EmployeeTrainingCourseDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            EmployeeTrainingCourseVM vm = EmployeeTrainingCourseDA.GetFilterdEmployeeTrainingCourses(new EmployeeTrainingCourseVM(new EmployeeTrainingCourseFilter(-1, ""), new Pagging("Employeelist", "employee-training-course", 1, 10)));
            //EmployeeTrainingCourseVM vm = EmployeeTrainingCourseDA.GetFilterdEmployeeTrainingCourses(new EmployeeTrainingCourseVM(new EmployeeTrainingCourseFilter(Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString())), new Pagging("List", "employee-training-course", 1, 10)));
            return View("EmployeeList", vm);
            //return RedirectToAction("EmployeeList", Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()));
        }
    }
}