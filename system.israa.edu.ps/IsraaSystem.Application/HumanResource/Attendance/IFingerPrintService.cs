using System;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Migrations.Model;
using System.Linq;
using Hangfire.Dashboard;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.Sql.HumanResource;
using log4net;
using Newtonsoft.Json;

namespace IsraaSystem.Application.HumanResource.Attendance
{
    public interface IFingerPrintService : IIsraaService
    {
        void DeAccerdiateManualFingerPrint(int fingerPrintId);
        void ApllyMachineFingerPrints(int manualFingerprintId);
        void ApplyManualFingerPrints(int manualFingerprintId);
    }


    public class FingerPrintService : IsraaService, IFingerPrintService
    {
        public FingerPrintService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }


        public void DeAccerdiateManualFingerPrint(int id)
        {
            var f = unitOfWork.HumanResource.ManualFingerprint.Find(id);
            f.AccreditationStatusID = 1;

            var date = f.FingerprintDate.Date;
            var employeeId = f.EmployeeID;

            var attdaily = unitOfWork.HumanResource.AttendanceDaily.Clean()
                 .FirstOrDefault(x => x.AttendanceDate == date && x.EmployeeID == employeeId);

            if (attdaily != null)
            {
                if (attdaily.ManualFingerID1 == id)
                {

                    attdaily.IsDelete = true;
                }

                if ((attdaily.ManualFingerID1 == null || attdaily.ManualFingerID1 != id) && attdaily.ManualFingerID2 == id)
                {

                    attdaily.AttendanceTo = null;
                    attdaily.ManualFingerID2 = null;
                }

            }


            var attinstr = unitOfWork.HumanResource.AttendanceInstructor.Clean()
                .Where(x => x.LectureDate == date && x.InstructorID == employeeId).ToList();
            if (attinstr != null)
            {

                foreach (var c in attinstr)
                {
                    c.AttendanceFrom = f.FingerprintDate.TimeOfDay == c.AttendanceFrom ? null : c.AttendanceFrom;
                    c.AttendanceTo = f.FingerprintDate.TimeOfDay == c.AttendanceTo ? null : c.AttendanceTo;
                }

            }



        }

        public void ApllyMachineFingerPrints(int manualFingerprintId)
        {
            var f = unitOfWork.HumanResource.ManualFingerprint.Find(manualFingerprintId);
            var date = f.FingerprintDate.Date;
            var employeeId = f.EmployeeID;
            var m = unitOfWork.HumanResource.MachineFingerprint
                                            .Where(x => x.EmployeeID == employeeId)
                                            .Clean()
                                            .ToList()
                                            .Where(x => x.FingerprintDate.Date == date)
                                            .Distinct();
            if (m != null)
            {
                foreach (var c in m)
                {
                    AttendanceDA.MachineFingerprintApply(c.ID);
                }

            }
        }

        public void ApplyManualFingerPrints(int manualFingerprintId)
        {
            var f = unitOfWork.HumanResource.ManualFingerprint.Find(manualFingerprintId);
            var date = f.FingerprintDate.Date;
            var employeeId = f.EmployeeID;
            var m = unitOfWork.HumanResource.ManualFingerprint
                .Where(x => x.EmployeeID == employeeId && x.ID != manualFingerprintId)
                .Clean()
                .ToList()
                .Where(x => x.FingerprintDate.Date == date)
                .Distinct();
            if (m != null)
            {
                foreach (var c in m)
                {
                    ManualFingerprintDA.ManualFingerprintApply(c.ID);
                }

            }
        }

    }
}