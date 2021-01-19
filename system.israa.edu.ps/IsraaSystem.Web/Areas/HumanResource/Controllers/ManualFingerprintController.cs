using System.Data;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Application.HumanResource.Attendance;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Web.ActionFillters;
using log4net;
using System;
using IsraaSystem.Core.Classic.HumanResource.ManualFingerprint;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using System.Collections.Generic;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class ManualFingerprintController : IsraaBaseController
    {

        private readonly IFingerPrintService _fingerPrintService;

        public ActionResult Index()
        {
            ManualFingerprintVM vmManualfingerprint = ManualFingerprintDA.GetFilterdManualFingerprints(new ManualFingerprintVM(new ManualFingerprintFilter("", "-1", "1","","", SelectDA.ddlFingerprintTypes(), SelectDA.ddlAccreditationStatuses(),SelectDA.ddlBranch()), new Pagging("List", "form-manual-fingerprint", 1, 50)));
            return View(vmManualfingerprint);
        }

        [HttpPost]
        public ActionResult List(ManualFingerprintFilter filter, Pagging pagging, List<int> foo)
        {
            ManualFingerprintVM vmManualmingerprint = ManualFingerprintDA.GetFilterdManualFingerprints(new ManualFingerprintVM(filter, new Pagging("List", "form-manual-fingerprint", pagging.currentPage, pagging.pageSize)));
            filter.FingerprintTypes = SelectDA.ddlFingerprintTypes();
            filter.AccreditationStatuses = SelectDA.ddlAccreditationStatuses();
            filter.Branches = SelectDA.ddlBranch();

            if(foo!=null)
            {
                //return Content("ccc");
                foreach(var id in foo)
                {
                     ManualFingerprintDA.ManualFingerprintAccreditation(id, 2, GetEmployeeID());
                    _fingerPrintService.ApllyMachineFingerPrints(id);
                    _fingerPrintService.ApplyManualFingerPrints(id);
                    vmManualmingerprint = ManualFingerprintDA.GetFilterdManualFingerprints(new ManualFingerprintVM(filter, new Pagging("List", "form-manual-fingerprint", pagging.currentPage, pagging.pageSize)));
                    TempData["refresh-msg"] = "1;" + "تمت العملية بنجاح";
                }
               
            }
            return View(vmManualmingerprint);
        }

        public ActionResult Add()
        {
            ManualFingerprint manualFingerprint = new ManualFingerprint()
            {
                Employees = SelectDA.ddlEmployees(),
                FingerprintTypes = SelectDA.ddlFingerprintTypes(),
                Branch = SelectDA.ddlBranch()
        };
            return View(manualFingerprint);
        }

        public ActionResult EmployeeAdd(int id)
        {
            DataTable DT = EmployeeDA.GetEmployeeByEmployeeID(id);
            if (DT.Rows.Count > 0)
            {
                ManualFingerprint manualFingerprint = new ManualFingerprint()
                {
                    EmployeeID = id,
                    EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                    FingerprintTypes = SelectDA.ddlFingerprintTypes()
                };
                return View(manualFingerprint);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(ManualFingerprint manualFingerprint)
        {
            manualFingerprint.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = ManualFingerprintDA.ManualFingerprintAdd(manualFingerprint);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }

            manualFingerprint.Employees = SelectDA.ddlEmployees();
            manualFingerprint.FingerprintTypes = SelectDA.ddlFingerprintTypes();
            manualFingerprint.Branch = SelectDA.ddlBranch();
            return View(manualFingerprint);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = ManualFingerprintDA.ManualFingerprintDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-manual-fingerprint");
        }

       

        [Authenticate]
        [HttpPost]
        public ActionResult Accreditation(int id)
        {
            DataTable DT = ManualFingerprintDA.ManualFingerprintAccreditation(id, 2, GetEmployeeID());
            _fingerPrintService.ApllyMachineFingerPrints(id);
            _fingerPrintService.ApplyManualFingerPrints(id);
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-manual-fingerprint");
        }

        public ActionResult DeAccredit(int id)
        {
            _fingerPrintService.DeAccerdiateManualFingerPrint(id);
            UnitOfWork.Complete();
            TempData["refresh-msg"] = "1;" + "تمت العملية بنجاح";
            return View("_Refresh", null, "form-manual-fingerprint");
        }



        [HttpPost]
        public ActionResult Rejection(int id)
        {
            DataTable DT = ManualFingerprintDA.ManualFingerprintAccreditation(id, 3, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-manual-fingerprint");
        }

        [HttpPost]
        public ActionResult Apply(int id)
        {
            DataTable DT = ManualFingerprintDA.ManualFingerprintApply(id);
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-manual-fingerprint");
        }


        public ActionResult Details(int id)
        {
            DataTable DT = ManualFingerprintDA.ManualFingerprintGet(id);
            ManualFingerprint model = new ManualFingerprint()
            {
                EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                FingerprintTypeID = (int)DT.Rows[0]["FingerprintTypeID"],
                FingerprintDate = DT.Rows[0]["FingerprintDate"].ToString(),
                FingerprintTime = DT.Rows[0]["FingerprintTime"].ToString(),
                Note = DT.Rows[0]["Note"].ToString()
            };
            return View(model);
        }

        public ManualFingerprintController(ILog looger, IUnitOfWork unitOfWork, IFingerPrintService fingerPrintService) : base(looger, unitOfWork)
        {
            _fingerPrintService = fingerPrintService;
        }
    }
}