using System.Data;

namespace IsraaSystem.Core.Classic.Academic.Section
{
    public class SectionVM
    {
        public int OfferdCourseID { get; set; }
        public DataTable Data { get; set; }
        public DataTable Data2 { get; set; }
        public SectionVM(int OfferdCourseID)
        {
            this.OfferdCourseID = OfferdCourseID;
        }
    }
}

