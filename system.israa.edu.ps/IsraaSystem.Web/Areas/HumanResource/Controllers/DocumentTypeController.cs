using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.Document;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class DocumentTypeController : BaseController
    {
        public ActionResult Index()
        {
            DataTable DT = DocumentDA.GetDocumentTypes();
            return View(DT);
        }

        public ActionResult List()
        {
            DataTable DA = DocumentDA.GetDocumentTypes();
            return View(DA);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(DocumentType documentType)
        {
            documentType.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = DocumentDA.DocumentTypeAddEdit(documentType);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();

            }
            return View(documentType);
        }

        public ActionResult Edit(int id)
        {
            DataTable dtDocumentType = DocumentDA.DocumentTypeGet(id);
            if (dtDocumentType.Rows.Count > 0)
            {
                DocumentType DocumentType = new DocumentType()
                {
                    ID = id,
                    ArName = dtDocumentType.Rows[0]["ArName"].ToString()
                };
                return View(DocumentType);
            }
            else
            {
                return HttpNotFound();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(DocumentType documentType)
        {
            documentType.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = DocumentDA.DocumentTypeAddEdit(documentType);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(documentType);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT1 = DocumentDA.DocumentTypeDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT1.Rows[0]["status"].ToString() + ";" + DT1.Rows[0]["msg"].ToString();
            DataTable DT2 = DocumentDA.GetDocumentTypes();
            return View("List", DT2);
        }
    }
}