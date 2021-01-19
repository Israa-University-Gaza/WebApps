using System.Linq.Dynamic;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Exam.Observer.DTO;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;

[assembly: WebActivatorEx.PreApplicationStartMethod(typeof(IsraaSystem.Web.MVCGridConfig), "RegisterGrids")]

namespace IsraaSystem.Web
{
    using System;
    using System.Web;
    using System.Web.Mvc;
    using System.Linq;
    using System.Collections.Generic;

    //using MVCGrid.Models;
    //using MVCGrid.Web;


    public static class MVCGridConfig
    {
        public static void RegisterGrids()
        {
            MVCGridTest.RegisterGrids();

        }
    }
}