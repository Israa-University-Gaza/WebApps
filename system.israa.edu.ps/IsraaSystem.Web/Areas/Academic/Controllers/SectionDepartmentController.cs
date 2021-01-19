using IsraaSystem.Application.Academic;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Academic.SectionDepartment;
using IsraaSystem.DataAccess.Sql.Academic;

namespace IsraaSystem.Web.Areas.Academic.Controllers
{
    public class SectionDepartmentController : BaseController
    {
        public ActionResult List(int id)
        {
            DataTable DT = SectionDA.SectionGet(id);
            SectionDepartment model = new SectionDepartment()
            {
                SectionID = id,
                CourseName = DT.Rows[0]["CourseName"].ToString(),
                SectionNum = DT.Rows[0]["SectionNum"].ToString(),

                SectionDepartments = SectionDepartmantDA.GetSectionDepartments(id),
                Departments = SelectDA.ddlDepartments(),
                StudyLevels = SelectDA.ddlStudyLevels()
            };
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult List(SectionDepartment model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SectionDepartmantDA.SectionDepartmentAdd(model);
                TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.SectionDepartments = SectionDepartmantDA.GetSectionDepartments(model.SectionID);
            model.Departments = SelectDA.ddlDepartments();
            model.StudyLevels = SelectDA.ddlStudyLevels();
            return View(model);
        }

        [HttpPost]
        public ActionResult Activate(int sectionId, int departmentId, int studyLevelId, int GenderID)
        {
            DataTable DT = SectionDepartmantDA.SectionDepartmentActivate(sectionId, departmentId, studyLevelId, GenderID, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();

            DataTable DTSection = SectionDA.SectionGet(sectionId);
            SectionDepartment model = new SectionDepartment()
            {
                SectionID = sectionId,
                CourseName = DTSection.Rows[0]["CourseName"].ToString(),
                SectionNum = DTSection.Rows[0]["SectionNum"].ToString(),
                SectionDepartments = SectionDepartmantDA.GetSectionDepartments(sectionId),
                Departments = SelectDA.ddlDepartments(),
                StudyLevels = SelectDA.ddlStudyLevels()
            };
            return View("List", model);
        }



        [HttpPost]
        public ActionResult SectionDepartmentSpecialAdd(int sectionId, int SectionDepartmentID)
        {

            DataTable DT = SectionDepartmantDA.SectionDepartmentSpecialAdd(SectionDepartmentID);
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();

            DataTable DTSection = SectionDA.SectionGet(sectionId);
            SectionDepartment model = new SectionDepartment()
            {
                SectionID = sectionId,
                CourseName = DTSection.Rows[0]["CourseName"].ToString(),
                SectionNum = DTSection.Rows[0]["SectionNum"].ToString(),
                SectionDepartments = SectionDepartmantDA.GetSectionDepartments(sectionId),
                Departments = SelectDA.ddlDepartments(),
                StudyLevels = SelectDA.ddlStudyLevels()
            };
            return View("List", model);
        }
    }
}