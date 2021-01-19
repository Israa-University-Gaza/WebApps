using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;

namespace IsraaSystem.Web.Areas.Academic.Models.Mark
{

    public class MarkUpdateVM
    {
        public MarkDto MarkDto { get; set; }
        public MarkTitle MarkTitle { get; set; }
        public string msg { get; set; }


    }
}