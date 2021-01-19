using System.Data;

namespace IsraaSystem.Core.Classic.HumanResource.Job
{
    public class JobRequirement
    {
        public int? ID { get; set; }
        public int JobID { get; set; }
        public int JobPersonalID { get; set; }
        public string Required { get; set; }
        public string Favorite { get; set; }
        public int UserID { get; set; }

        public DataTable PersonalRequirements { get; set; }
    }
}
