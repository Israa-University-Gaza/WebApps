//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic
{
    using System;
    using System.Collections.Generic;
    
    public partial class ExamSectionDistribution
    {
        public int Id { get; set; }
        public int SectionId { get; set; }
        public int RoomId { get; set; }
        public int MaleCount { get; set; }
        public int FemaleCount { get; set; }
        public int Emp1Id { get; set; }
        public int Emp2Id { get; set; }
    
        public virtual Room Room { get; set; }
        public virtual Section Section { get; set; }
    }
}