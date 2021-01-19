using System;
using System.Data;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.Document;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeDocumentController : BaseController
    {
        public ActionResult Index()
        {
            EmployeeDocumentsVM vm = DocumentDA.GetFilterdEmployeeDocuments(new EmployeeDocumentsVM(new EmployeeDocumentsFilter("", "", SelectDA.ddlDocumentTypes()), new Pagging("List", "form-employee-document", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmployeeDocumentsFilter filter, Pagging pagging)
        {
            EmployeeDocumentsVM vm = DocumentDA.GetFilterdEmployeeDocuments(new EmployeeDocumentsVM(filter, new Pagging("List", "form-employee-document", pagging.currentPage, pagging.pageSize)));
            vm.filter.DocumentTypes = SelectDA.ddlDocumentTypes();
            return View(vm);
        }





        public ActionResult Add(int? EmployeeID)
        {
            EmployeeDocument employeeDocument = new EmployeeDocument()
            {
                DocumentTypes = SelectDA.ddlDocumentTypes(),
                Employees = SelectDA.ddlEmployees()
            };
            if (EmployeeID != null)
            {
                employeeDocument.EmployeeID = EmployeeID.Value;
                ViewBag.EmployeeID = EmployeeID.Value;
            }
            return View(employeeDocument);
        }

        [HttpPost]
        public ActionResult Add(EmployeeDocument employeeDocument, HttpPostedFileBase file)
        {
            if (file != null && file.ContentLength > 0)
            {
                string fileExtension = Path.GetExtension(file.FileName);
                if (fileExtension == ".png" || fileExtension == ".jpg" || fileExtension == ".pdf" || fileExtension == ".doc" || fileExtension == ".docx")
                {
                    employeeDocument.DocumentURL = employeeDocument.EmployeeID + "_" + DateTime.Now.ToString("ss-mm-hh-dd-MM-yyyy") + Path.GetExtension(file.FileName);
                    file.SaveAs(Server.MapPath("~/Uploads/Employees/Documents/") + employeeDocument.DocumentURL);
                    employeeDocument.UserID = GetEmployeeID();
                    if (ModelState.IsValid)
                    {
                        DataTable DT = DocumentDA.EmployeeDocumentAdd(employeeDocument);
                        TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                    }
                }
                else
                {
                    TempData["add-msg"] = 0 + ";" + "الرجاء اختيار المستند بالصيغة الصحيحة";
                }
            }
            else
            {
                TempData["add-msg"] = 0 + ";" + "الرجاء اختيار المستند للرفع";
            }

            employeeDocument.DocumentTypes = SelectDA.ddlDocumentTypes();
            employeeDocument.Employees = SelectDA.ddlEmployees();
            return View(employeeDocument);
        }


        public ActionResult DocumentAdd(int documentId)
        {
            DataTable DT = DocumentDA.EmployeeDocumentGet(documentId);
            EmployeeDocument employeeDocument = new EmployeeDocument()
            {
                EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                DocumentTypeID = Convert.ToInt32(DT.Rows[0]["DocumentTypeID"].ToString()),
                DocumentTypeName = DT.Rows[0]["DocumentTypeName"].ToString(),
                DocumentPID = documentId,
                DocumentTypes = SelectDA.ddlDocumentTypes(),
                Employees = SelectDA.ddlEmployees()
            };
            return View(employeeDocument);
        }

        [HttpPost]
        public ActionResult DocumentAdd(EmployeeDocument employeeDocument, HttpPostedFileBase file)
        {
            if (file != null && file.ContentLength > 0)
            {
                string fileExtension = Path.GetExtension(file.FileName);
                if (fileExtension == ".png" || fileExtension == ".jpg" || fileExtension == ".pdf" || fileExtension == ".doc" || fileExtension == ".docx")
                {
                    employeeDocument.DocumentURL = employeeDocument.EmployeeID + "_" + DateTime.Now.ToString("ss-mm-hh-dd-MM-yyyy") + Path.GetExtension(file.FileName);
                    file.SaveAs(Server.MapPath("~/Uploads/Employees/Documents/") + employeeDocument.DocumentURL);
                    employeeDocument.UserID = GetEmployeeID();
                    if (ModelState.IsValid)
                    {
                        DataTable DT = DocumentDA.EmployeeDocumentAdd(employeeDocument);
                        TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                    }
                }
                else
                {
                    TempData["add-msg"] = 0 + ";" + "الرجاء اختيار المستند بالصيغة الصحيحة";
                }
            }
            else
            {
                TempData["add-msg"] = 0 + ";" + "الرجاء اختيار المستند للرفع";
            }

            employeeDocument.DocumentTypes = SelectDA.ddlDocumentTypes();
            employeeDocument.Employees = SelectDA.ddlEmployees();
            return View(employeeDocument);
        }


        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = DocumentDA.EmployeeDocumentDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-employee-document");
        }

        #region ProfileList

        public ActionResult ProfileList(string employeeId, string employeeNo)
        {
            var filter = new EmployeeDocumentsFilter()
            {
                EmployeeID = Convert.ToInt32(employeeId),
                DocumentTypeID = "",
                DocumentTypes = SelectDA.ddlDocumentTypes(),
                EmployeeName = employeeNo

            };
            EmployeeDocumentsVM vm = DocumentDA.GetFilterdEmployeeDocuments(new EmployeeDocumentsVM(filter, new Pagging("List", "form-employee-document", 0, 50)));


            return View(vm);

        }

        [HttpPost]
        public ActionResult ProfileListAfter(EmployeeDocumentsFilter filter, Pagging pagging)
        {
            EmployeeDocumentsVM vm = DocumentDA.GetFilterdEmployeeDocuments(new EmployeeDocumentsVM(filter, new Pagging("List", "form-employee-document", pagging.currentPage, pagging.pageSize)));
            vm.filter.DocumentTypes = SelectDA.ddlDocumentTypes();
            return View(vm);



        }

        #endregion
    }
}