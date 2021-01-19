using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IsraaSystem.Entity.IsraaAcademic;

namespace IsraaSystem.Data.Exam
{
    public interface IExamService
    {
        Task<int> CreateFinalExamSection(int sectionId, int roomId, int countOfStudent);

        Task<int> DeleteFinalExamSection(int finalExamSection);



        IEnumerable<FinalExamSection> GetAllFinalExamSections();
    }
}
