using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Common.Alert;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Web.Common;

namespace IsraaSystem.Web.Areas.Academic.Models.Mark
{

    public class MarkIndexVm : HasAlert
    {



        public IEnumerable<MarkDto> Result { get; set; }

        public SectionDto SectionsMarksDto { get; set; }




        [DisplayName("الفصل")]
        [Required(ErrorMessage = "{0} :  الحقل مطلوب.")]
        public int SemesterId { get; set; }


        [DisplayName("البرنامج")]
        [Required(ErrorMessage = "{0} :  الحقل مطلوب.")]
        public int ProgramID { get; set; }

        //[Required]
        //public int SemesterID { get; set; }

        [DisplayName("الكلية")]
        [Required(ErrorMessage = "{0} :  الحقل مطلوب.")]
        public int CollegeID { get; set; }

        [DisplayName("القسم")]
        [Required(ErrorMessage = "{0} :  الحقل مطلوب.")]
        public int DepartmentID { get; set; }


        [DisplayName("المساق")]
        [Required(ErrorMessage = "{0} :  الحقل مطلوب.")]
        public int OfferdCourseID { get; set; }

        [DisplayName("الشعبة")]
        [Required(ErrorMessage = "{0} :  الحقل مطلوب.")]
        public int SectionID { get; set; }

        public string SortKey { get; set; }

        public bool SortOrder { get; set; }

    }








}