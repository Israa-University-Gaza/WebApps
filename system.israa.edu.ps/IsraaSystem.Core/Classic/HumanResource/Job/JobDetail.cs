using System.Data;

namespace IsraaSystem.Core.Classic.HumanResource.Job
{
    public class JobDetail
    {
        public DataTable Job { get; set; }
        public DataTable JobTasks { get; set; }
        public DataTable JobTaskPointers { get; set; }
        public DataTable JobTerms { get; set; }
        public DataTable JobPersonals { get; set; }
        public DataTable JobRequirements { get; set; }
    }
}
