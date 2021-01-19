using IsraaSystem.Application.Academic;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Academic.Section;
using IsraaSystem.DataAccess.Sql.Academic;

namespace IsraaSystem.Web.Areas.Academic.Controllers
{
    public class SectionController : BaseController
    {
        public ActionResult List(int id)
        {
            SectionVM vm = SectionDA.GetOfferdCourseSections(new SectionVM(id));
            return View(vm);
        }

        public ActionResult Add(int id)
        {
            DataTable dtSection = OfferdCourseDA.GetOfferdCourseDetails(id);
            if (dtSection.Rows.Count > 0)
            {
                Section Section = new Section()
                {
                    OfferdCourseID = id,
                    CourseName = dtSection.Rows[0]["CourseName"].ToString(),
                    InstructorID = Convert.ToInt32(dtSection.Rows[0]["InstructorID"].ToString()),
                    Sections = SelectDA.ddlSections(id),
                    Capacity = 50,
                    SectionTypes = SelectDA.ddlSectionTypes(),
                    Instructors = SelectDA.ddlInstructors(),
                    Genders = SelectDA.ddlSectionGenders()
                };
                return View(Section);

            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Section Section)
        {
            Section.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SectionDA.SectionAdd(Section);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            Section.Instructors = SelectDA.ddlInstructors();
            Section.Sections = SelectDA.ddlSections(Section.OfferdCourseID);
            Section.SectionTypes = SelectDA.ddlSectionTypes();
            Section.Genders = SelectDA.ddlSectionGenders();
            return View(Section);
        }

        public ActionResult Edit(int id)
        {
            DataTable dtSection = SectionDA.SectionGet(id);
            if (dtSection.Rows.Count > 0)
            {
                SectionEdit SectionEdit = new SectionEdit()
                {
                    ID = id,
                    OfferdCourseID = Convert.ToInt32(dtSection.Rows[0]["OfferdCourseID"].ToString()),
                    InstructorName = dtSection.Rows[0]["InstructorName"].ToString(),
                    CourseName = dtSection.Rows[0]["CourseName"].ToString(),
                    SectionType = Convert.ToInt32(dtSection.Rows[0]["SectionType"].ToString()),
                    SectionNum = Convert.ToInt32(dtSection.Rows[0]["SectionNum"].ToString()),
                    Gender = Convert.ToInt32(dtSection.Rows[0]["Gender"].ToString()),
                    Capacity = Convert.ToInt32(dtSection.Rows[0]["Capacity"].ToString()),
                    Genders = SelectDA.ddlSectionGenders(),
                    SectionTypes = SelectDA.ddlSectionTypes()
                };
                return View(SectionEdit);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(SectionEdit SectionEdit)
        {
            SectionEdit.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SectionDA.SectionEdit(SectionEdit);
                TempData["edit-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            SectionEdit.Genders = SelectDA.ddlSectionGenders();
            SectionEdit.SectionTypes = SelectDA.ddlSectionTypes();
            return View(SectionEdit);
        }
        public ActionResult InstructorEdit(int id)
        {
            DataTable dtSection = SectionDA.SectionGet(id);
            if (dtSection.Rows.Count > 0)
            {
                SectionInstructorEdit sectionInstructorEdit = new SectionInstructorEdit()
                {
                    ID = id,
                    OfferdCourseID = Convert.ToInt32(dtSection.Rows[0]["OfferdCourseID"].ToString()),
                    InstructorID = Convert.ToInt32(dtSection.Rows[0]["EmployeeID"].ToString()),
                    SectionNum = dtSection.Rows[0]["SectionNum"].ToString(),
                    SectionTypeName = dtSection.Rows[0]["SectionTypeName"].ToString(),
                    CourseName = dtSection.Rows[0]["CourseName"].ToString(),
                    GenderName = dtSection.Rows[0]["GenderName"].ToString(),
                    Instructors = SelectDA.ddlInstructors(),

                };
                return View(sectionInstructorEdit);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult InstructorEdit(SectionInstructorEdit sectionInstructorEdit)
        {
            sectionInstructorEdit.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SectionDA.SectionInstructorEdit(sectionInstructorEdit);
                TempData["edit-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            sectionInstructorEdit.Instructors = SelectDA.ddlInstructors();
            return View(sectionInstructorEdit);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = SectionDA.SectionDelete(id, GetEmployeeID());
            TempData["list-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            int offerdCourseId = Convert.ToInt32(DT.Rows[0]["OfferdCourseID"].ToString());
            SectionVM vm = SectionDA.GetOfferdCourseSections(new SectionVM(offerdCourseId));
            return View("List", vm);
        }
    }
}