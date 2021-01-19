using System;
using System.ComponentModel.DataAnnotations;

namespace IsraaSystem.Core.Exam.Observer.DTO
{
    public class ObserversDistribution_Input
    {



        [Required]
        public DateTime Date { get; set; }

        [Required]
        public TimeSpan TimeFrom { get; set; }

        public int ExamType { get; set; }

    }
}