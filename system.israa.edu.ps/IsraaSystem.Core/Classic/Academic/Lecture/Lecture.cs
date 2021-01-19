using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.Academic.Lecture
{
    public class Lecture
    {

        public int ID { get; set; }
        public int DepartmentID { get; set; }
        public int StudyLevelID { get; set; }

        public string CourseName { get; set; }
        public string SectionNum { get; set; }


        [Required(ErrorMessage = "الرجاء اختيار المساق")]
        public int OfferdCourseID { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار الشعبة")]
        public int SectionID { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار القاعة")]
        public int RoomID { get; set; }

        [Required(ErrorMessage = "الرجاء اختيار اليوم")]
        public int CDayID { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال موعد المحاضرة")]
        public string FromHour { get; set; }

        [Required(ErrorMessage = "الرجاء ادخال موعد المحاضرة")]
        public string ToHour { get; set; }
        public int UserID { get; set; }

        public int SemesterID { get; set; }

        public bool IsPined { get; set; }

        public DateTime PinDate { get; set; }

        public int PinEmployeeID { get; set; }



        public List<SelectListItem> OfferdCourses { get; set; }
        public List<SelectListItem> Sections { get; set; }
        public List<SelectListItem> Rooms { get; set; }
        public List<SelectListItem> CDays { get; set; }

        public Lecture()
        {

        }

        public Lecture(int ID, int CDayID, string FromHour, string ToHour, int UserID)
        {
            this.ID = ID;
            this.CDayID = CDayID;
            this.FromHour = FromHour;
            this.ToHour = ToHour;
            this.UserID = UserID;
        }

        public Lecture(int ID, int UserID)
        {
            this.ID = ID;
            this.UserID = UserID;
        }
    }
}
