using System.Collections.Generic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;

namespace IsraaSystem.Web.Areas.Exam.Models
{
    public class ExamSectionDistributionListDto
    {
        public string roomName { get; set; }
        public List<ExamSectionDistribution> data { get; set; }
        public int count { get; set; }
        public int StudentCount { get; set; }
        public int MaleCount { get; set; }
        public int FemaleCount { get; set; }
        public int ExamCapacity { get; set; }
        public int? LectureCapacity { get; set; }
        public int SeatNum { get; set; }
    }
}