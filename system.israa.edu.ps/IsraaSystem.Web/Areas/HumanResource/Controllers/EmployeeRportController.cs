using IsraaSystem.Application.HumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.Web.Areas.HumanResource.Models.EmployeeReport;
using System;
using System.Linq;
using System.Web.Mvc;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeRportController : Controller
    {
        // GET: HumanResource/EmployeeRport
        private IEmloyeeReportService EmloyeeReportService;

        public EmployeeRportController(IEmloyeeReportService emloyeeReportService)
        {
            EmloyeeReportService = emloyeeReportService;
        }

        //public ActionResult Index()
        //{
        //    EmployeeReportVm model = new EmployeeReportVm();
        //    return View(model);
        //}

        public ActionResult Report()
        {
            EmployeeReportVm model = new EmployeeReportVm()
            {
                Countries = SelectDA.ddlCountries(),
                Governorates = SelectDA.ddlGovernorates(-1),
                Cities = SelectDA.ddlCities(-1),
                Departments = SelectDA.ddlDepartments(),
                Jobs = SelectDA.ddlDepartmentJobs(-1)
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult ReprotPost(EmployeeReportVm model)
        {

            var query = EmloyeeReportService.EmployeeReportData()

                //معلومات الموظف الاساسية
                .WhereIf(!string.IsNullOrEmpty(model.ArName), x => x.ArName.Contains(model.ArName))
                .WhereIf(!string.IsNullOrEmpty(model.EnName), x => x.EnName.Contains(model.EnName))
                .WhereIf(!string.IsNullOrEmpty(model.ArFirstName), x => x.ArFirstName.Contains(model.ArFirstName))
                .WhereIf(!string.IsNullOrEmpty(model.ArSecoundName), x => x.ArSecoundName.Contains(model.ArSecoundName))
                .WhereIf(!string.IsNullOrEmpty(model.ArThirdName), x => x.ArThirdName.Contains(model.ArThirdName))
                .WhereIf(!string.IsNullOrEmpty(model.ArFamilyName), x => x.ArFamilyName.Contains(model.ArFamilyName))
                .WhereIf(!string.IsNullOrEmpty(model.SSN), x => x.SSN == model.SSN)
                .WhereIf(model.ChildrensCount.HasValue, x => x.ChildrensCount == model.ChildrensCount)
                .WhereIf(model.DateOfBirth.HasValue, x => x.DateOfBirth == model.DateOfBirth)
                .WhereIf(model.NationalityID.HasValue, x => x.NationalityID == model.NationalityID)
                .WhereIf(model.MaritalStatusID.HasValue, x => x.MaritalStatusID == model.MaritalStatusID)

                 .WhereIf(model.GenderID.HasValue, x => x.GenderID == model.GenderID)

                // العنوان
                .WhereIf(model.CountryID.HasValue, x => x.CountryID == model.CountryID)
                .WhereIf(model.GovernorateID.HasValue, x => x.GovernorateID == model.GovernorateID)
                .WhereIf(model.CityID.HasValue, x => x.CityID == model.CityID)
                .WhereIf(!string.IsNullOrEmpty(model.Address), x => x.Address.Contains(model.Address))

                //معلومات الاتصال

                .WhereIf(!string.IsNullOrEmpty(model.Mobile), x => x.Mobile == model.Mobile)
                .WhereIf(!string.IsNullOrEmpty(model.UniversityEmail), x => x.UniversityEmail == model.UniversityEmail)
                .WhereIf(!string.IsNullOrEmpty(model.Email), x => x.Email == model.Email)


                //حالة الموظف
                .WhereIf(model.ddlEmployeeStatuses != null, x => model.ddlEmployeeStatuses.Contains(x.EmployeeStatusID))



                //نوع التوظيف

                .WhereIf(model.ddlEmploymentTypes != null, x => model.ddlEmploymentTypes.Contains(x.EmploymentTypeID))
                .WhereIf(!string.IsNullOrEmpty(model.EmployeeNo), x => x.EmployeeNo == model.EmployeeNo)
                .WhereIf(model.EndDateEmpStatusFrom.HasValue, x => x.EndDateEmpStatus >= model.EndDateEmpStatusFrom)
                .WhereIf(model.StartDateEmpStatusTo.HasValue, x => x.EndDateEmpStatus <= model.StartDateEmpStatusTo)
                .WhereIf(model.StartDateEmpStatusFrom.HasValue, x => x.StartDateEmpStatus >= model.StartDateEmpStatusFrom)
                .WhereIf(model.EndDateEmpStatusTo.HasValue, x => x.EndDateEmpStatus <= model.EndDateEmpStatusTo)
                .WhereIf(model.StartDateEmpEmploymentTypeFrom.HasValue, x => x.StartDateEmpEmploymentType >= model.StartDateEmpEmploymentType)
                .WhereIf(model.StartDateEmpEmploymentTypeTo.HasValue, x => x.StartDateEmpEmploymentType <= model.StartDateEmpEmploymentTypeTo)
                .WhereIf(model.EndDateEmpEmploymentTypeFrom.HasValue, x => x.EndDateEmpEmploymentType >= model.EndDateEmpEmploymentTypeFrom)
                .WhereIf(model.EndDateEmpEmploymentTypeTo.HasValue, x => x.EndDateEmpEmploymentType <= model.EndDateEmpEmploymentTypeTo)
                //.WhereIf(model.ddlAttendanceFormats != null, x => model.ddlAttendanceFormats.Contains(x.AttendanceFormatID))
                .WhereIf(model.QualificationTypeID.HasValue, x => x.QualificationTypeID == model.QualificationTypeID)
                .WhereIf(!string.IsNullOrEmpty(model.Specialization), x => x.Specialization.Contains(model.Specialization));

            var result = query.ToList();

            //معلومات الموقع الوظيفي
            result = result.WhereIf(model.EmployeeDManagerID.HasValue, x => x.employeePlacementDto != null && x.employeePlacementDto.DManagerID == model.EmployeeDManagerID)
                .WhereIf(model.ddlDepartments != null, x => x.employeePlacementDto != null && (model.ddlDepartments.Contains(x.employeePlacementDto.DepartmentId) || model.ddlDepartments.Contains(x.employeePlacementDto.CollegeId) || model.ddlDepartments.Contains(x.employeePlacementDto.SectionId)))
                .WhereIf(model.JobID.HasValue, x => x.JobID == model.JobID)
                .WhereIf(model.ddlCader != null, x => x.employeePlacementDto != null && model.ddlCader.Contains(x.employeePlacementDto.CaderID))
                .WhereIf(model.PlacementStatusID.HasValue, x => x.employeePlacementDto != null && x.employeePlacementDto.PlacementStatusID == model.PlacementStatusID)
                .WhereIf(model.PlacementTypeID.HasValue, x => x.employeePlacementDto != null && x.employeePlacementDto.PlacementTypeID == model.PlacementTypeID).ToList();





            return PartialView("_ReportList", result);

        }

        public ActionResult ddlGovernorate(int id)
        {
            EmployeeReportVm model = new EmployeeReportVm()
            {
                Governorates = SelectDA.ddlGovernorates(id)
            };
            return View(model);
        }

        public ActionResult ddlCity(int id)
        {
            EmployeeReportVm model = new EmployeeReportVm()
            {
                Cities = SelectDA.ddlCities(id)
            };
            return View(model);
        }

        public ActionResult ddlDepartmentJobs(int id)
        {
            EmployeeReportVm model = new EmployeeReportVm()
            {
                Jobs = SelectDA.ddlDepartmentJobs(id)
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult LoadData(EmployeeReportVm model)
        {

            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            //Find Order Column
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            var searchKey = Request.Form.GetValues("search[value]").FirstOrDefault();


            int pageSize = length != null ? Convert.ToInt32(length) : 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;
            int recordsTotal = 0;


            IsraaHumanResourceEntities db = new IsraaHumanResourceEntities();


            db.Configuration.ProxyCreationEnabled = false;

            var query = db.EmployeeReportData
                 .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.EmployeeNo == searchKey || x.ArFirstName.Contains(searchKey) || x.ArSecoundName.Contains(searchKey) || x.ArThirdName.Contains(searchKey) || x.ArFamilyName.Contains(searchKey))
                 .WhereIf(!string.IsNullOrEmpty(model.EmployeeNo), x => x.EmployeeNo == model.EmployeeNo)
                 .WhereIf(!string.IsNullOrEmpty(model.ArName), x => x.ArName.Contains(model.ArName))
                 .WhereIf(!string.IsNullOrEmpty(model.EnName), x => x.EnName.Contains(model.EnName))
                 .WhereIf(!string.IsNullOrEmpty(model.ArFirstName), x => x.ArFirstName.Contains(model.ArFirstName))

                 .WhereIf(!string.IsNullOrEmpty(model.ArSecoundName), x => x.ArSecoundName.Contains(model.ArSecoundName))
                 .WhereIf(!string.IsNullOrEmpty(model.ArThirdName), x => x.ArThirdName.Contains(model.ArThirdName))
                 .WhereIf(!string.IsNullOrEmpty(model.ArFamilyName), x => x.ArFamilyName.Contains(model.ArFamilyName))
                 .WhereIf(!string.IsNullOrEmpty(model.Gender), x => x.Gender == model.Gender)



                 .WhereIf(model.DateOfBirthFrom.HasValue, x => x.DateOfBirth >= model.DateOfBirthFrom)
                 .WhereIf(model.DateOfBirthTo.HasValue, x => x.DateOfBirth <= model.DateOfBirthTo)

                 .WhereIf(model.MaritalStatusID.HasValue, x => x.MaritalStatusID == model.MaritalStatusID)

                 .WhereIf(!string.IsNullOrEmpty(model.SSN), x => x.SSN == model.SSN)
                 .WhereIf(model.ChildrensCount.HasValue, x => x.ChildrensCount == model.ChildrensCount)
                 .WhereIf(!string.IsNullOrEmpty(model.Address), x => x.Address.Contains(model.Address))
                 .WhereIf(!string.IsNullOrEmpty(model.Mobile), x => x.Mobile == model.Mobile)

                 .WhereIf(!string.IsNullOrEmpty(model.UniversityEmail), x => x.UniversityEmail == model.UniversityEmail)
                 .WhereIf(!string.IsNullOrEmpty(model.Email), x => x.Email == model.Email)
                 .WhereIf(!string.IsNullOrEmpty(model.EmployeeStatus), x => x.EmployeeStatus == model.EmployeeStatus)

                 .WhereIf(model.EndDateEmpStatusFrom.HasValue, x => x.EndDateEmpStatus >= model.EndDateEmpStatusFrom)
                 .WhereIf(model.StartDateEmpStatusTo.HasValue, x => x.EndDateEmpStatus <= model.StartDateEmpStatusTo)

                 .WhereIf(model.StartDateEmpStatusFrom.HasValue, x => x.StartDateEmpStatus >= model.StartDateEmpStatusFrom)
                 .WhereIf(model.EndDateEmpStatusTo.HasValue, x => x.EndDateEmpStatus <= model.EndDateEmpStatusTo)

                 .WhereIf(!string.IsNullOrEmpty(model.JobTitle), x => x.JobTitle == model.JobTitle)

                 .WhereIf(!string.IsNullOrEmpty(model.Department), x => x.Department == model.Department)
                 .WhereIf(model.DepartmentID.HasValue, x => x.DepartmentID == model.DepartmentID)
                 .WhereIf(!string.IsNullOrEmpty(model.ManagerName), x => x.ManagerName == model.ManagerName)
                 .WhereIf(!string.IsNullOrEmpty(model.EmploymentType), x => x.EmploymentType == model.EmploymentType)

                 .WhereIf(model.StartDateEmpEmploymentTypeFrom.HasValue, x => x.StartDateEmpEmploymentType >= model.StartDateEmpEmploymentType)
                 .WhereIf(model.StartDateEmpEmploymentTypeTo.HasValue, x => x.StartDateEmpEmploymentType <= model.StartDateEmpEmploymentTypeTo)

                 .WhereIf(model.EndDateEmpEmploymentTypeFrom.HasValue, x => x.EndDateEmpEmploymentType >= model.EndDateEmpEmploymentTypeFrom)
                 .WhereIf(model.EndDateEmpEmploymentTypeTo.HasValue, x => x.EndDateEmpEmploymentType <= model.EndDateEmpEmploymentTypeTo)

                 .WhereIf(!string.IsNullOrEmpty(model.AttendanceDefault), x => x.AttendanceDefault == model.AttendanceDefault)
                 //.WhereIf(model.CaderID.HasValue, x => x.CaderID == model.CaderID)
                 .WhereIf(model.PlacementStatusID.HasValue, x => x.PlacementStatusID == model.PlacementStatusID)
                 .WhereIf(model.PlacementTypeID.HasValue, x => x.PlacementTypeID == model.PlacementTypeID)

                 .WhereIf(model.QualificationTypeID.HasValue, x => x.QualificationTypeID == model.QualificationTypeID)
                 .WhereIf(!string.IsNullOrEmpty(model.Specialization), x => x.Specialization.Contains(model.Specialization))

                //.WhereIf(model.BasicSalaryFrom.HasValue, x => x.BasicSalary >= model.BasicSalaryFrom)
                //.WhereIf(model.BasicSalaryTo.HasValue, x => x.BasicSalary <= model.BasicSalaryTo)
                ;





            //SORT
            if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
            {
                query = query.Sort(sortColumn, sortColumnDir == "desc");
            }
            else
            {
                query = query.Sort("ArName", sortColumnDir == "desc");
            }


            //totalRecords
            recordsTotal = query.Count();


            //Paging
            query = query.Skip(skip);
            if (pageSize > 0)
            {
                query = query.Take(pageSize);
            }

            //getData
            var result = query.ToList();
            return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = result },
                JsonRequestBehavior.AllowGet);
        }




    }
}