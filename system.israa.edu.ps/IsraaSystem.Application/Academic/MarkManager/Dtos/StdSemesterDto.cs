namespace IsraaSystem.Application.Academic.MarkManager.Dtos
{
    public class StdSemesterDto
    {
        public int StdSemesterId { get; set; }
        public string SemesterArShortName { get; set; }
        public double? SemesterGPA { get; set; }
        public double? SemesterCumulativeGPA { get; set; }
        public int? SemesterRegestedHour { get; set; }
        public int? SemesterCumulativeHours { get; set; }
        public double? SemesterGraduateGpa { get; set; }
    }
}