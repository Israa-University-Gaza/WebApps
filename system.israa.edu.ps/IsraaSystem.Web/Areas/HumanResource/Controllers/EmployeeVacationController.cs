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
using IsraaSystem.Core.Classic.HumanResource.Vacation;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Web.ActionFillters;
using System.Collections;
using IsraaSystem.Application.HumanResource.Vacation;
using IsraaSystem.Application.Common.UnitOfWork;
using log4net;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeVacationController : IsraaBaseController
    {
        private readonly IVacationManager _IVacationManager;
        public EmployeeVacationController(ILog looger, IUnitOfWork unitOfWork, IVacationManager vacationManager) : base(looger, unitOfWork)
        {
            _IVacationManager = vacationManager ;
        }
        public ActionResult Index()
        {
            EmployeeVacationVM vm = VacationDA.GetFilterdEmployeeVacations(new EmployeeVacationVM(new EmployeeVacationsFilter("", "", "", "", "", "", SelectDA.ddlVacationTypes(), SelectDA.ddlAccreditationStatuses(), SelectDA.ddlVacationBalanceYears()), new Pagging("List", "form-employee-vacation", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmployeeVacationsFilter filter, Pagging pagging)
        {
            EmployeeVacationVM vm = VacationDA.GetFilterdEmployeeVacations(new EmployeeVacationVM(filter, new Pagging("List", "form-employee-vacation", pagging.currentPage, pagging.pageSize)));
            vm.filter.VacationTypes = SelectDA.ddlVacationTypes();
            vm.filter.AccreditationStatuses = SelectDA.ddlAccreditationStatuses();
            vm.filter.VacationBalanceYears = SelectDA.ddlVacationBalanceYears();


            return View(vm);
        }


        //[HttpPost]
        //public ActionResult Statistics(EmployeeVacationsFilter filter, Pagging pagging)
        //{
        //    EmployeeVacationVM vm = VacationDA.GetFilterdEmployeeVacations(new EmployeeVacationVM(filter, new Pagging("List", "form-employee-vacation", pagging.currentPage, pagging.pageSize)));
        //    vm.filter.VacationTypes = SelectDA.ddlVacationTypes();
        //    vm.filter.AccreditationStatuses = SelectDA.ddlAccreditationStatuses();
        //    vm.filter.VacationBalanceYears = SelectDA.ddlVacationBalanceYears();


        //    return View(vm);
        //}

        public string Excel(string EmployeeName, string VacationTypeID, string VacationBalanceYearID, string AccreditationStatusID, string DateFrom, string DateTo)
        {


            EmployeeVacationVM vm = VacationDA.GetFilterdEmployeeVacations(new EmployeeVacationVM
            (
                new EmployeeVacationsFilter()
                {
                    EmployeeName = EmployeeName,
                    VacationTypeID = VacationTypeID,
                    VacationBalanceYearID = VacationBalanceYearID,
                    AccreditationStatusID = AccreditationStatusID,
                    DateFrom = DateFrom,
                    DateTo = DateTo
                },
                new Pagging("List", "form-employee-vacation", 1, 1000)));



            var result = vm.data.AsEnumerable()
                .Select(p => new
                {
                    EmployeeNo = p.Field<string>("EmployeeNo"),
                    EmployeeName = p.Field<string>("EmployeeName"),
                    VacationStartDate = p.Field<string>("VacationStartDate"),
                    VacationEndDate = p.Field<string>("VacationEndDate"),
                    VacationDays = p.Field<int>("VacationDays"),
                    VacationType = p.Field<string>("VacationType"),
                    VacationStatus = p.Field<string>("VacationStatus"),
                });



            var gv = new GridView();
            gv.DataSource = result;
            gv.DataBind();

            //Change the Header Row back to white color
            gv.HeaderRow.Style.Add("background-color", "#FFFFFF");




            //Apply style to Individual Cells
            gv.HeaderRow.Cells[0].Style.Add("background-color", "cornflowerblue");
            gv.HeaderRow.Cells[0].Text = "رقم الموظف";
            gv.HeaderRow.Cells[1].Style.Add("background-color", "cornflowerblue");
            gv.HeaderRow.Cells[1].Text = "اسم الموظف";
            gv.HeaderRow.Cells[2].Style.Add("background-color", "cornflowerblue");
            gv.HeaderRow.Cells[2].Text = "من";

            gv.HeaderRow.Cells[3].Style.Add("background-color", "cornflowerblue");
            gv.HeaderRow.Cells[3].Text = "الى";
            gv.HeaderRow.Cells[4].Style.Add("background-color", "cornflowerblue");
            gv.HeaderRow.Cells[4].Text = "عدد الايام";

            gv.HeaderRow.Cells[5].Style.Add("background-color", "cornflowerblue");
            gv.HeaderRow.Cells[5].Text = "نوع الاجازة";

            gv.HeaderRow.Cells[6].Style.Add("background-color", "cornflowerblue");
            gv.HeaderRow.Cells[6].Text = "حالة الاجازة";




            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment; filename=DemoExcel.xls");
            Response.ContentType = "application/ms-excel";
            Response.Charset = "";
            StringWriter objStringWriter = new StringWriter();
            HtmlTextWriter objHtmlTextWriter = new HtmlTextWriter(objStringWriter);
            gv.RenderControl(objHtmlTextWriter);
            Response.Output.Write(objStringWriter.ToString());
            Response.Flush();
            Response.End();

            return "";
        }

        public ActionResult Add()
        {
            EmployeeVacation employeeVacation = new EmployeeVacation()
            {
                VacationTypes = SelectDA.ddlVacationTypes(),
                VacationPlaces = SelectDA.ddlVacationPlaces(),
                Employees = SelectDA.ddlEmployees()
            };
            return View(employeeVacation);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(EmployeeVacation employeeVacation)
        {
            employeeVacation.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = VacationDA.EmployeeVacationAddEdit(employeeVacation);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employeeVacation.VacationTypes = SelectDA.ddlVacationTypes();
            employeeVacation.VacationPlaces = SelectDA.ddlVacationPlaces();
            employeeVacation.Employees = SelectDA.ddlEmployees();
            return View(employeeVacation);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = VacationDA.EmployeeVacationGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeVacation employeeVacation = new EmployeeVacation()
                {
                    ID = id,
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    VacationTypeID = Convert.ToInt32(DT.Rows[0]["VacationTypeID"].ToString()),
                    VacationPlaceID = Convert.ToInt32(DT.Rows[0]["VacationPlaceID"].ToString()),
                    VacationStartDate = DT.Rows[0]["VacationStartDate"].ToString(),
                    VacationEndDate = DT.Rows[0]["VacationEndDate"].ToString(),
                    VacationReason = DT.Rows[0]["VacationReason"].ToString(),

                    Employees = SelectDA.ddlEmployees(),
                    VacationTypes = SelectDA.ddlVacationTypes(),
                    VacationPlaces = SelectDA.ddlVacationPlaces()
                };
                return View(employeeVacation);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(EmployeeVacation employeeVacation)
        {
            employeeVacation.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = VacationDA.EmployeeVacationAddEdit(employeeVacation);
                TempData["edit-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employeeVacation.Employees = SelectDA.ddlEmployees();
            employeeVacation.VacationTypes = SelectDA.ddlVacationTypes();
            employeeVacation.VacationPlaces = SelectDA.ddlVacationPlaces();
            return View(employeeVacation);
        }
        [Authenticate]
        public ActionResult HRAccreditation(int id)
        {
            EmployeeVacation employeeVacation = new EmployeeVacation { ID = id };
            return View(employeeVacation);
        }
        [Authenticate]
        [HttpPost]
        public ActionResult HRAccreditation(EmployeeVacation employeeVacation)
        {
            DataTable DT = VacationDA.EmployeeVacationAccreditation(2, 2, employeeVacation, GetEmployeeID());
            TempData["update-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();

            return View(employeeVacation);
        }
        [Authenticate]
        [HttpPost]
        public ActionResult HRUnAccreditation(int id)
        {
            EmployeeVacation employeeVacation = new EmployeeVacation { ID = id, HumanResourceNote = "" };
            DataTable DT = VacationDA.EmployeeVacationAccreditation(3, 2, employeeVacation, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-employee-vacation");
        }
        [Authenticate]
        [HttpPost]
        public ActionResult HRDeAccreditation(int id)
        {
            EmployeeVacation employeeVacation = new EmployeeVacation { ID = id, HumanResourceNote = "", UserID = GetEmployeeID() };
            DataTable DT = VacationDA.EmployeeVacationDeAccreditation(employeeVacation);
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-employee-vacation");
        }

        [Authenticate]
        [HttpPost]
        public ActionResult Delete(int id)
        {
            EmployeeVacation model = new EmployeeVacation { ID = id, UserID = GetEmployeeID() };
            DataTable DT = VacationDA.EmployeeVacationDelete(model);
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-employee-vacation");
        }

        public ActionResult Details(int id)
        {
            DataTable DT = VacationDA.EmployeeVacationGet(id);
            EmployeeVacationDetails model = new EmployeeVacationDetails()
            {
                EmployeeNo = DT.Rows[0]["EmployeeNo"].ToString(),
                EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                VacationType = DT.Rows[0]["VacationType"].ToString(),
                VacationStartDate = DT.Rows[0]["VacationStartDate"].ToString(),
                VacationEndDate = DT.Rows[0]["VacationEndDate"].ToString(),
                ReplaceEmployeName = DT.Rows[0]["ReplaceEmployeName"].ToString(),
                VacationDays = DT.Rows[0]["VacationDays"].ToString(),
                VacationPlace = DT.Rows[0]["VacationPlace"].ToString(),
                VacationReason = DT.Rows[0]["VacationReason"].ToString()
            };
            return View(model);
        }

        public ActionResult TypeUpdate(int id)
        {

            DataTable DT = VacationDA.EmployeeVacationGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeVacationTypeEdit EmployeeVacationTypeEdit = new EmployeeVacationTypeEdit()
                {
                    ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                    VacationTypeID = Convert.ToInt32(DT.Rows[0]["VacationTypeID"].ToString()),
                    VacationStartDate = DT.Rows[0]["VacationStartDate"].ToString(),
                    VacationDays = DT.Rows[0]["VacationDays"].ToString(),
                    VacationEndDate = DT.Rows[0]["VacationEndDate"].ToString(),
                    HumanResourceNote = DT.Rows[0]["HumanResourceNote"].ToString(),

                    VacationTypes = SelectDA.ddlVacationTypes(),
                };
                return View(EmployeeVacationTypeEdit);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TypeUpdate(EmployeeVacationTypeEdit EmployeeVacationTypeEdit)
        {
            EmployeeVacationTypeEdit.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = VacationDA.EmployeeVacationTypeEdit(EmployeeVacationTypeEdit);
                TempData["update-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            EmployeeVacationTypeEdit.VacationTypes = SelectDA.ddlVacationTypes();
            return View(EmployeeVacationTypeEdit);
        }

        public string EmployeeVacationReport(int id)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsGetEmpVacationData");
            
            ArrayList a2 = new ArrayList();
            a2.Add(VacationDA.EmployeeVacationGet(id));
            
            CreatePDF("EmployeeSalary", @"Areas\HumanResource\Reports\EmployeeVacationReport.rdlc", a1, a2);
            return "";
        }

        public ActionResult PrintEmploeeVacation(int id)
        {
            var model=_IVacationManager.EmployeeVacationGet(id);
            //DataTable DT = VacationDA.EmployeeVacationGet(id);
            //EmployeeVacationDetails model = new EmployeeVacationDetails()
            //{
            //    EmployeeNo = DT.Rows[0]["EmployeeNo"].ToString(),
            //    EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
            //    VacationType = DT.Rows[0]["VacationType"].ToString(),
            //    VacationStartDate = DT.Rows[0]["VacationStartDate"].ToString(),
            //    VacationEndDate = DT.Rows[0]["VacationEndDate"].ToString(),
            //    ReplaceEmployeName = DT.Rows[0]["ReplaceEmployeName"].ToString(),
            //    VacationDays = DT.Rows[0]["VacationDays"].ToString(),
            //    VacationPlace = DT.Rows[0]["VacationPlace"].ToString(),
            //    VacationReason = DT.Rows[0]["VacationReason"].ToString(),
            //    DManagerName= DT.Rows[0]["DManagerName"].ToString(),
            //    job= DT.Rows[0]["job"].ToString(),
            //    VacationTypeID= DT.Rows[0]["VacationTypeID"].ToString()
            //};

            return new Rotativa.ViewAsPdf(model);
            //return View(model);
        }

    }
}