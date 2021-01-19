using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Classic.HumanResource.Department
{
    public class DepartmentType
    {
        [Key]
        public int ID { get; set; }

        public string Name { get; set; }
    }
}
