using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.DeductionStatus
{
    public class DeductionStatus
    {
        [Key]
        public int ID { get; set; }

        public string Name { get; set; }
    }
}
