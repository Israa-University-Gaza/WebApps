using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.Core.Classic.HumanResource.EmpEmploymentType;
using IsraaSystem.Core.Classic.HumanResource.EmployeeAddNew;
using IsraaSystem.Core.Classic.HumanResource.EmployeePersonal;
using IsraaSystem.Core.Classic.HumanResource.EmployeePlacement;
using IsraaSystem.Core.Classic.HumanResource.EmpStatus;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;


namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeAddNewController : BaseController
    {
        // GET: HumanResource/EmployeeAddNew
        public ActionResult Index()
        {
            EmployeeAddNewVM EmployeeAddNewVM = new EmployeeAddNewVM()
            {
                // المعلومات الاساسية
                EmployeeMainData = new EmployeeMainData()
                {
                    Genders = SelectDA.ddlGenders(),
                    MaritalStatuses = SelectDA.ddlMaritalStatuses(),
                    Religions = SelectDA.ddlReligions(),
                    Nationalities = SelectDA.ddlNationalities(),
                    HrDManagers=SelectDA.ddlEmployees(),
                },



                //معلومات الاتصال
                EmployeeContactData = new EmployeeContactData()
                {
                    Countries = SelectDA.ddlCountries(),
                    Governorates = SelectDA.ddlGovernorates(-1),
                    Cities = SelectDA.ddlCities(-1),
                },

                //الموقع الوظيفي
                EmployeePlacement = new EmployeePlacement()
                {
                    Departments = SelectDA.ddlDepartments(),
                    Jobs = SelectDA.ddlDepartmentJobs(-1),
                    Caders = SelectDA.ddlCaders(),
                    PlacementStatuses = SelectDA.ddlPlacementStatuses(),
                    PlacementTypes = SelectDA.ddlPlacementTypes(),
                },

                //حالة الموظغ
                EmpStatus = new EmpStatus()
                {
                    Employees = SelectDA.ddlEmployees(),
                    DateFrom = "2017/09/01",
                    DateTo = "2018/06/15",
                    EmployeeStatuses = SelectDA.ddlEmployeeStatuses(true)
                },

                //نوع التوظيف
                EmpEmploymentType = new EmpEmploymentType()
                {
                    Employees = SelectDA.ddlEmployees(),
                    EmploymentTypes = SelectDA.ddlEmploymentTypes(true)
                },

                //الدوام الافتراضي
                EmployeeAttendanceFormat = new EmployeeAttendanceFormat()
                {
                    Employees = SelectDA.ddlEmployees(),
                    AttendanceFormats = SelectDA.ddlAttendanceFormats()
                }



            };
            return View(EmployeeAddNewVM);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(EmployeeAddNewVM model)
        {

            ModelState.Remove("EmpStatus.EmployeeID");

            if (ModelState.IsValid)
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors);
                //EmployeeAddNew         to permestions db and hr db main data
                DataTable DT_EmployeeAddToIsraPermissions = EmployeeDA.EmployeeAddToIsraPermissions(model);
                TempData["add-msg"] = DT_EmployeeAddToIsraPermissions.Rows[0]["status"].ToString() + ";" + DT_EmployeeAddToIsraPermissions.Rows[0]["msg"].ToString();
                try
                {
                    int newID = Convert.ToInt32(DT_EmployeeAddToIsraPermissions.Rows[0]["ID"]);


                    // personal data
                    model.EmployeeMainData.UserID = GetEmployeeID();
                    model.EmployeeMainData.EmployeeID = newID;
                    DataTable dtEmployeePersonalMainDataUpdate = EmployeePersonalDA.EmployeePersonalMainDataUpdate(model.EmployeeMainData);

                    //contact data
                    model.EmployeeContactData.EmployeeID = newID;
                    model.EmployeeContactData.UserID = GetEmployeeID();
                    DataTable dtEmployeePersonalContactDataUpdate = EmployeePersonalDA.EmployeePersonalContactDataUpdate(model.EmployeeContactData);

                    //Placement
                    model.EmployeePlacement.EmployeeID = newID;
                    model.EmployeePlacement.UserID = GetEmployeeID();
                    DataTable dtEmployeePlacementAdd = EmployeePlacementDA.EmployeePlacementAdd(model.EmployeePlacement);

                    //EmpStatus
                    model.EmpStatus.EmployeeID = newID;
                    model.EmpStatus.UserID = GetEmployeeID(); ;
                    DataTable dtEmpStatusAdd = EmpStatusDA.EmpStatusAdd(model.EmpStatus);

                    //EmploymentType
                    model.EmpEmploymentType.EmployeeID = newID;
                    model.EmpEmploymentType.UserID = GetEmployeeID();
                    DataTable dtEmpEmploymentTypeAdd = EmpEmploymentTypeDA.EmpEmploymentTypeAdd(model.EmpEmploymentType);

                    //AttendanceFormat
                    if (model.EmployeeAttendanceFormat.AttendanceFormatID > 0)
                    {
                        model.EmployeeAttendanceFormat.UserID = GetEmployeeID();
                        model.EmployeeAttendanceFormat.EmployeeID = newID;
                        DataTable dtEmployeeAttendanceFormat = AttendanceDA.EmployeeAttendanceFormatAdd(model.EmployeeAttendanceFormat);

                    }

                    return Json(
                        new
                        {
                            type = "success",
                            message = "تمت الاضافة بنجاح",
                            newID,
                            EmpNo = model.EmpEmploymentType.EmployeeNo
                        }, JsonRequestBehavior.AllowGet);
                }
                catch
                {
                    return Json(
                   new
                   {
                       type = "warning",
                       message = DT_EmployeeAddToIsraPermissions.Rows[0]["msg"].ToString(),
                   }, JsonRequestBehavior.AllowGet);
                }

            }
            else
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors);


                return Json(
                    new
                    {
                        type = "danger",
                        message = "خطأ داخلي .. تأكد من البيانات !  !" + errors.FirstOrDefault()?.ErrorMessage,
                    }, JsonRequestBehavior.AllowGet);


            }


        }

        [HttpPost]
        public ActionResult GenerateEmpNumber(string EmploymentTypeID)
        {
            int empnum = EmployeeDA.GenerateEmpNumber(Convert.ToInt32(EmploymentTypeID));
            return Json(new { empnum });
        }

        public ActionResult ddlGovernorate(int id)
        {
            EmployeeAddNewVM EmployeeAddNewVM = new EmployeeAddNewVM()
            {
                EmployeeContactData = new EmployeeContactData()
                {
                    Governorates = SelectDA.ddlGovernorates(id)
                }

            };
            return View(EmployeeAddNewVM);
        }

        public ActionResult ddlCity(int id)
        {

            EmployeeAddNewVM EmployeeAddNewVM = new EmployeeAddNewVM()
            {
                EmployeeContactData = new EmployeeContactData()
                {
                    Cities = SelectDA.ddlCities(id)
                }

            };
            return View(EmployeeAddNewVM);
        }

        public ActionResult ddlDepartmentJobs(int id)
        {
            EmployeeAddNewVM EmployeeAddNewVM = new EmployeeAddNewVM()
            {
                EmployeePlacement = new EmployeePlacement()
                {
                    Jobs = SelectDA.ddlDepartmentJobs(id)

                }
            };
            return View(EmployeeAddNewVM);
        }

    }
}