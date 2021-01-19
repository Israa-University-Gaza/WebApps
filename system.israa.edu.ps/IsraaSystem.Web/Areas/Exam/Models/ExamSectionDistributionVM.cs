using System;
using System.Collections.Generic;
using System.Linq;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;

namespace IsraaSystem.Web.Areas.Exam.Models
{
    public class ExamSectionDistributionVM
    {
        public int DepartmentID { get; set; }
        public int OfferdCourseID { get; set; }
        public int SectionID { get; set; }
        public int MaleCount { get; set; }
        public int FemaleCount { get; set; }
        public int RoomId { get; set; }

        public DateTime ExamDate { get; set; }

        public TimeSpan ExamPeriod { get; set; }
        public IEnumerable<ExamSectionDistributionListDto> Data { get; set; }
        public SectionDetails SectionDetails { get; set; }
    }
}