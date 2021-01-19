using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using IsraaSystem.Web.Controllers;
using System.Collections;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.Contract;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.ActionFillters;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class ContractInstructorController : BaseController
    {
        public ActionResult Index()
        {
            ContractInstructorVM vm = ContractDA.GetFilterdContractInstructors(new ContractInstructorVM(new ContractInstructorFilter("", "", SelectDA.ddlSemesters(), SelectDA.ddlEmploymentTypes(null)), new Pagging("List", "form-instructor", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(ContractInstructorFilter filter, Pagging pagging, string excel)
        {
            ContractInstructorVM vm = ContractDA.GetFilterdContractInstructors(new ContractInstructorVM(filter, new Pagging("List", "form-instructor", pagging.currentPage, pagging.pageSize)));
            vm.filter.Semesters = SelectDA.ddlSemesters();
            vm.filter.EmploymentTypes = SelectDA.ddlEmploymentTypes(null);

            return View(vm);
        }
        [Authenticate]
        public ActionResult Edit(int id)
        {
            DataTable DT = ContractDA.ContractInstructorGet(id);
            if (DT.Rows.Count > 0)
            {
                ContractInstructorEdit ContractInstructorEdit = new ContractInstructorEdit()
                {
                    ID = id,
                    HourPrice = Convert.ToDecimal(DT.Rows[0]["HourPrice"].ToString()),
                    CurrencyID = Convert.ToInt32(DT.Rows[0]["CurrencyID"].ToString()),
                    InstructorName = DT.Rows[0]["InstructorName"].ToString(),
                    InstructorTypeID = Convert.ToInt32(DT.Rows[0]["InstructorTypeID"].ToString()),
                    ProgramID = Convert.ToInt32(DT.Rows[0]["ProgramID"].ToString()),
                    EmploymentTypeID = Convert.ToInt32(DT.Rows[0]["EmploymentTypeID"].ToString()),
                    DateFrom = DT.Rows[0]["DateFrom"].ToString(),
                    DateTo = DT.Rows[0]["DateTo"].ToString(),
                    Currencies = SelectDA.ddlCurrencies(),
                    InstructorTypes = SelectDA.ddlInstructorTypes(),
                    EmploymentTypes = SelectDA.ddlEmploymentTypes(null),
                    Programs = SelectDA.ddlPrograms(),
                };
                return View(ContractInstructorEdit);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ContractInstructorEdit ContractInstructorEdit)
        {
            ContractInstructorEdit.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = ContractDA.ContractInstructorEdit(ContractInstructorEdit);
                TempData["edit-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            ContractInstructorEdit.Currencies = SelectDA.ddlCurrencies();
            ContractInstructorEdit.InstructorTypes = SelectDA.ddlInstructorTypes();
            ContractInstructorEdit.EmploymentTypes = SelectDA.ddlEmploymentTypes(null);
            ContractInstructorEdit.Programs = SelectDA.ddlPrograms();
            return View(ContractInstructorEdit);
        }

        public string Print(int id)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsContractInstructor");

            ArrayList a2 = new ArrayList();
            a2.Add(ContractDA.ContractInstructorGet(id));
            CreatePDF("ContractInstructorReport", @"Areas\HumanResource\Reports\ContractInstructorReport.rdlc", a1, a2);
            return "";
        }

        public string Excel()
        {
            ContractInstructorVM vm = ContractDA.GetFilterdContractInstructors(new ContractInstructorVM(new ContractInstructorFilter("", "10", SelectDA.ddlSemesters(), SelectDA.ddlEmploymentTypes(null)), new Pagging("List", "form-instructor", 1, 1000)));

            var gv = new GridView();
            gv.DataSource = vm.data;
            gv.DataBind();
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

    }
}