using System;
using System.Collections.Generic;
using IsraaSystem.Application.HumanResource;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using IsraaSystem.Web.Controllers;
using System.IO;
using System.Drawing;
using IsraaSystem.Core.Classic.HumanResource.EmployeePersonal;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeePersonalController : BaseController
    {
        #region EmployeeMainData

        public ActionResult EmployeeMainData(int id)
        {
            DataTable DT = EmployeePersonalDA.EmployeePersonalGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeMainData employeeMainData = new EmployeeMainData()
                {
                    EmployeeID = id,
                    ArFirstName = DT.Rows[0]["ArFirstName"].ToString(),
                    ArSecoundName = DT.Rows[0]["ArSecoundName"].ToString(),
                    ArThirdName = DT.Rows[0]["ArThirdName"].ToString(),
                    ArFamilyName = DT.Rows[0]["ArFamilyName"].ToString(),
                    EnFirstName = DT.Rows[0]["EnFirstName"].ToString(),
                    EnSecoundName = DT.Rows[0]["EnSecoundName"].ToString(),
                    EnThirdName = DT.Rows[0]["EnThirdName"].ToString(),
                    EnFamilyName = DT.Rows[0]["EnFamilyName"].ToString(),
                    ArNameTitle = DT.Rows[0]["ArNameTitle"].ToString(),
                    EnNameTitle = DT.Rows[0]["EnNameTitle"].ToString(),
                    SSN = DT.Rows[0]["SSN"].ToString(),
                    MotherName = DT.Rows[0]["MotherName"].ToString(),
                    GenderID = Convert.ToInt32(DT.Rows[0]["GenderID"].ToString()),
                    MaritalStatusID = Convert.ToInt32(DT.Rows[0]["MaritalStatusID"].ToString()),
                    ReligionID = Convert.ToInt32(DT.Rows[0]["ReligionID"].ToString()),
                    DateOfBirth = DT.Rows[0]["DateOfBirth"].ToString(),
                    PlaceOfBirth = DT.Rows[0]["PlaceOfBirth"].ToString(),
                    Passport = DT.Rows[0]["Passport"].ToString(),
                    NationalityID = Convert.ToInt32(DT.Rows[0]["NationalityID"].ToString()),
                    Genders = SelectDA.ddlGenders(),
                    MaritalStatuses = SelectDA.ddlMaritalStatuses(),
                    Religions = SelectDA.ddlReligions(),
                    Nationalities = SelectDA.ddlNationalities(),
                  
                };
                return View(employeeMainData);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeMainData(EmployeeMainData employeeMainData)
        {
            employeeMainData.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeePersonalDA.EmployeePersonalMainDataUpdate(employeeMainData);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            else
            {
                TempData["add-msg"] = "0;" + "الرجاء تعبئة الحقول المطلوبة بالشكل الصحيح";
            }
            employeeMainData.Genders = SelectDA.ddlGenders();
            employeeMainData.MaritalStatuses = SelectDA.ddlMaritalStatuses();
            employeeMainData.Religions = SelectDA.ddlReligions();
            employeeMainData.Nationalities = SelectDA.ddlNationalities();
            return View(employeeMainData);
        }

        #endregion

        #region EmployeeContactData

        public ActionResult EmployeeContactData(int id)
        {
            DataTable DT = EmployeePersonalDA.EmployeePersonalGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeContactData employeeContactData = new EmployeeContactData()
                {
                    EmployeeID = id,
                    CountryID = Convert.ToInt32(DT.Rows[0]["CountryID"].ToString()),
                    GovernorateID = Convert.ToInt32(DT.Rows[0]["GovernorateID"].ToString()),
                    CityID = Convert.ToInt32(DT.Rows[0]["CityID"].ToString()),
                    Neighborhood = DT.Rows[0]["Neighborhood"].ToString(),
                    Street = DT.Rows[0]["Street"].ToString(),
                    HomeNo = DT.Rows[0]["HomeNo"].ToString(),
                    AddressDetails = DT.Rows[0]["AddressDetails"].ToString(),
                    Phone = DT.Rows[0]["Phone"].ToString(),
                    Mobile = DT.Rows[0]["Mobile"].ToString(),
                    Fax = DT.Rows[0]["Fax"].ToString(),
                    Email = DT.Rows[0]["Email"].ToString(),
                    UniversityEmail = DT.Rows[0]["UniversityEmail"].ToString(),

                    Countries = SelectDA.ddlCountries(),
                    Governorates = SelectDA.ddlGovernorates(Convert.ToInt32(DT.Rows[0]["CountryID"].ToString())),
                    Cities = SelectDA.ddlCities(Convert.ToInt32(DT.Rows[0]["GovernorateID"].ToString()))
                };
                return View(employeeContactData);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        public ActionResult ddlGovernorate(int id)
        {
            EmployeeContactData employeecontactdata = new EmployeeContactData()
            {
                Governorates = SelectDA.ddlGovernorates(id)
            };
            return View(employeecontactdata);
        }

        public ActionResult ddlCity(int id)
        {
            EmployeeContactData employeecontactdata = new EmployeeContactData()
            {
                Cities = SelectDA.ddlCities(id)
            };
            return View(employeecontactdata);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeContactData(EmployeeContactData employeeContactData)
        {
            employeeContactData.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeePersonalDA.EmployeePersonalContactDataUpdate(employeeContactData);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            else
            {
                TempData["add-msg"] = "0;" + "الرجاء تعبئة الحقول المطلوبة بالشكل الصحيح";
            }
            employeeContactData.Countries = SelectDA.ddlCountries();
            employeeContactData.Governorates = SelectDA.ddlGovernorates(employeeContactData.CountryID);
            employeeContactData.Cities = SelectDA.ddlCities(employeeContactData.GovernorateID);
            return View(employeeContactData);
        }

        #endregion

        #region EmployeeImage

        public ActionResult EmployeeImage(int id)
        {
            DataTable DT = EmployeePersonalDA.EmployeePersonalGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeImage employeeImage = new EmployeeImage()
                {
                    EmployeeID = id,
                    ImageURL = DT.Rows[0]["EmployeeImageURL"].ToString(),
                };
                return View(employeeImage);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeImage(int employeeId, string image)
        {
            if (image.StartsWith("data:image/png;base64,"))
            {
                string filename = employeeId.ToString() + "_" + DateTime.Now.ToString("ss.mm.hh.dd.MM.yyyy") + ".png";
                Base64ToImage(image.Replace("data:image/png;base64,", "")).Save(Server.MapPath("~/Uploads/Employees/Profile/") + filename);
                string ImageURL = "/Uploads/Employees/Profile/" + filename;
                DataTable DT = EmployeeDA.EmployeePersonalImageUpdate(employeeId, ImageURL, GetEmployeeID());
                TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                EmployeeImage employeeImage = new EmployeeImage()
                {
                    EmployeeID = employeeId,
                    ImageURL = DT.Rows[0]["EmployeeImageURL"].ToString()
                };
                return View(employeeImage);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        public Image Base64ToImage(string base64)
        {
            byte[] imageBytes = Convert.FromBase64String(base64.Replace("data:image/png;base64,", ""));
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
            ms.Write(imageBytes, 0, imageBytes.Length);
            Image image = Image.FromStream(ms, true);
            return image;
        }

        #endregion
    }
}