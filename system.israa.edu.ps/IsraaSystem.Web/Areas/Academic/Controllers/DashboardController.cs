using System;
using System.Linq;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Web.Controllers;
using System.Web.Mvc;
using log4net;
using System.Collections;
using IsraaSystem.Application.Academic.TransformationManger;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Data;
using System.Reflection;

namespace IsraaSystem.Web.Areas.Academic.Controllers
{
    public class DashboardController : IsraaBaseController
    {


        public ActionResult Index()
        {




            return View();
        }


        public DashboardController(ILog looger, IUnitOfWork unitOfWork) : base(looger, unitOfWork)
        {


        }
    }
}