using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace IsraaSystem.Data.Exam
{
    public interface IObserverService
    {

        void AddObserver(string empid, string examsectionid);

        void GetAll();

        void UnSetExamObserver(string empid, string examsectionid);
        void SetExamObserver(string empid, string examsectionid);


    }
}
