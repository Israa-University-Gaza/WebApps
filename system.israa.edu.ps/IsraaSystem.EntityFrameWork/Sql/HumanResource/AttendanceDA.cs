using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.Core.Classic.HumanResource.MachineFingerprint;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class AttendanceDA : DBConnection
    {

        #region MachineFingerprint

        public static MachineFingerprintVM GetFilterdMachineFingerprints(MachineFingerprintVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdMachineFingerprints", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.FingerprintTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@FingerPrintTypeID", model.filter.FingerprintTypeID);
                if (!String.IsNullOrEmpty(model.filter.DateFrom))
                    DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.filter.DateFrom);
                if (!String.IsNullOrEmpty(model.filter.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.filter.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }

        public static DataTable MachineFingerprintApply(int MachineFingerprintID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("MachineFingerprintApply", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@MachineFingerprintID", MachineFingerprintID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region AttendanceDaily

        public static AttendanceDailyVM GetDateAttendanceDaily(AttendanceDailyVM vm)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetDateAttendanceDaily", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@AttendanceDate", vm.filter.AttendanceDate);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", vm.filter.EmployeeName);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                vm.data = DT;
                return vm;
            }
        }

        public static DataTable AttendanceDailyGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceDailyGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable ReCalculateEmployeeDateRangeAttendanceDaily(EmployeeAttendanceFormat model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ReCalculateEmployeeDateRangeAttendanceDaily", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.ActiveFromDate);
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.ActiveToDate);

                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }



        #endregion

        #region AttendanceDailyDetails

        public static DataTable GetAttendanceDailyExits(int AttendanceDailyID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetAttendanceDailyExits", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@AttendanceDailyID", AttendanceDailyID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region AttendanceInstructor

        public static AttendanceInstructorVM GetFilterdAttendanceInstructor(AttendanceInstructorVM vm)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdAttendanceInstructor", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", vm.filter.SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@InstructorName", vm.filter.InstructorName);
                DA.SelectCommand.Parameters.AddWithValue("@LectureDateFrom", vm.filter.LectureDateFrom);
                DA.SelectCommand.Parameters.AddWithValue("@LectureDateTo", vm.filter.LectureDateTo);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                vm.data = DT;
                return vm;
            }
        }

        public static AttendanceInstructorVM GetInstructorsAttendance(AttendanceInstructorVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetInstructorsAttendance", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.SemesterID))
                    DA.SelectCommand.Parameters.AddWithValue("@SemesterID", model.filter.SemesterID);
                if (!String.IsNullOrEmpty(model.filter.EmploymentTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID", model.filter.EmploymentTypeID);
                if (!String.IsNullOrEmpty(model.filter.InstructorName))
                    DA.SelectCommand.Parameters.AddWithValue("@InstructorName", model.filter.InstructorName);
                if (!String.IsNullOrEmpty(model.filter.LectureDateFrom))
                    DA.SelectCommand.Parameters.AddWithValue("@LectureDateFrom", model.filter.LectureDateFrom);
                if (!String.IsNullOrEmpty(model.filter.LectureDateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@LectureDateTo", model.filter.LectureDateTo);
                if (!String.IsNullOrEmpty(model.filter.AttendanceInstructorStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@AttendanceInstructorStatusID", model.filter.AttendanceInstructorStatusID);

                DataTable DT = new DataTable();
                DA.Fill(DT);
                model.data = DT;
                return model;
            }
        }

        public static AttendanceInstructorVM GetInstructorDateRangeAttendance(AttendanceInstructorVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA1 = new SqlDataAdapter("GetInstructorDateRangeAttendance", conn);
                DA1.SelectCommand.CommandType = CommandType.StoredProcedure;

                DA1.SelectCommand.Parameters.AddWithValue("@SemesterID", model.filter.SemesterID);
                DA1.SelectCommand.Parameters.AddWithValue("@InstructorID", model.filter.InstructorID);
                DA1.SelectCommand.Parameters.AddWithValue("@LectureDateFrom", model.filter.LectureDateFrom);
                DA1.SelectCommand.Parameters.AddWithValue("@LectureDateTo", model.filter.LectureDateTo);
                if (!String.IsNullOrEmpty(model.filter.AttendanceInstructorStatusID))
                    DA1.SelectCommand.Parameters.AddWithValue("@AttendanceInstructorStatusID", model.filter.AttendanceInstructorStatusID);

                DataTable DT1 = new DataTable();
                DA1.Fill(DT1);

                SqlDataAdapter DA2 = new SqlDataAdapter("GetFilterdContractInstructors", conn);
                DA2.SelectCommand.CommandType = CommandType.StoredProcedure;

                DA2.SelectCommand.Parameters.AddWithValue("@SemesterID", model.filter.SemesterID);
                DA2.SelectCommand.Parameters.AddWithValue("@InstructorID", model.filter.InstructorID);
                DA2.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID", model.filter.EmploymentTypeID);
                DataTable DT2 = new DataTable();
                DA2.Fill(DT2);
                model.data = DT1;
                model.contract = DT2;
                return model;
            }
        }

        public static DataTable LectureGet(int LectureID)

        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("LectureGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", LectureID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable AttendanceInstructorAdd(AttendanceInstructor model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceInstructorAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", model.SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@InstructorID", model.InstructorID);
                DA.SelectCommand.Parameters.AddWithValue("@LectureID", model.LectureID);
                DA.SelectCommand.Parameters.AddWithValue("@LectureDate", model.LectureDate);
                DA.SelectCommand.Parameters.AddWithValue("@LectureFrom", model.LectureFrom);
                DA.SelectCommand.Parameters.AddWithValue("@LectureTo", model.LectureTo);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable AttendanceInstructorEdit(AttendanceInstructorEdit model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceInstructorEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@LectureDate", model.LectureDate);
                DA.SelectCommand.Parameters.AddWithValue("@LectureFrom", model.LectureFrom);
                DA.SelectCommand.Parameters.AddWithValue("@LectureTo", model.LectureTo);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable AttendanceInstructorGet(int id)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceInstructorGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", id);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable AttendanceInstructorDelete(AttendanceInstructorDelete model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceInstructorDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@DeleteReason", model.DeleteReason);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable AttendanceInstructorAbsence(int ID, int UserID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceInstructorAbsence", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region AttendanceFormat

        public static DataTableVM GetAttendanceFormats(DataTableVM vm)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetAttendanceFormats", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", vm.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", vm.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                vm.data = DT;
                vm.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return vm;
            }
        }

        public static DataTable AttendanceFormatAddEdit(AttendanceFormat model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceFormatAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@ArName", model.ArName);
                DA.SelectCommand.Parameters.AddWithValue("@EnName", model.EnName);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.InsertEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable AttendanceFormatDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceFormatDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable AttendanceFormatDetailsDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceFormatDetailsDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable AttendanceFormatGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceFormatGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable AttendanceFormatDetailsGet(int AttendanceFormatID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceFormatDetailsGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", AttendanceFormatID);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                return DT;
            }
        }

        public static DataTable AttendanceFormatDetailsAddEdit(AttendanceFormatDetails model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceFormatDetailsAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                
                DA.SelectCommand.Parameters.AddWithValue("@AttendanceFormatID", model.AttendanceFormatID);
                DA.SelectCommand.Parameters.AddWithValue("@AttendanceFrom", model.AttendanceFrom);
                DA.SelectCommand.Parameters.AddWithValue("@AttendanceTo", model.AttendanceTo);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@DayID", model.DayID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region EmployeeAttendanceFormat

        public static EmployeeAttendanceFormatVM GetFilterdEmployeeAttendanceFormats(EmployeeAttendanceFormatVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeAttendanceFormats", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.AttendanceFormatID))
                    DA.SelectCommand.Parameters.AddWithValue("@AttendanceFormatID", model.filter.AttendanceFormatID);
                if (!String.IsNullOrEmpty(model.filter.AttendanceFormatDate))
                    DA.SelectCommand.Parameters.AddWithValue("@AttendanceFormatDate", model.filter.AttendanceFormatDate);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }

        public static DataTable EmployeeAttendanceFormatAdd(EmployeeAttendanceFormat model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeAttendanceFormatAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@AttendanceFormatID", model.AttendanceFormatID);
                DA.SelectCommand.Parameters.AddWithValue("@ActiveFromDate", model.ActiveFromDate);
                DA.SelectCommand.Parameters.AddWithValue("@ActiveToDate", model.ActiveToDate);
                DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }



        public static DataTable EmployeeAttendanceFormatEdit(EmployeeAttendanceFormat model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeAttendanceFormatEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@ActiveToDate", model.ActiveToDate);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }



        #endregion

        #region EmployeeAttendanceLate

        public static EmployeeAttendanceLateVM GetFilterdAttendanceLates(EmployeeAttendanceLateVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdAttendanceLates", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.filter.DateFrom);
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.filter.DateTo);
                if (!String.IsNullOrEmpty(model.filter.LateTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@LateTypeID", model.filter.LateTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }

        public static EmployeeAttendanceRangeLateVM GetFilterdEmployeeDateRangelate(EmployeeAttendanceRangeLateVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeDateRangelate", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.filter.EmployeeID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.DateFrom))
                    DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.filter.DateFrom);
                if (!String.IsNullOrEmpty(model.filter.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.filter.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@LateTypeID", model.filter.LateTypeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                return model;
            }
        }

        #endregion

        #region EmployeeDateRangeStatus

        public static EmployeeDateRangeStatusVM GetFilterdEmployeeDateRangeStatuses(EmployeeDateRangeStatusVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeDateRangeStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeID))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.DayStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@DayStatusID", model.filter.DayStatusID);
                if (!String.IsNullOrEmpty(model.filter.DateFrom))
                    DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.filter.DateFrom);
                if (!String.IsNullOrEmpty(model.filter.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.filter.DateTo);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                return model;
            }
        }

        #endregion

        #region EmployeesDateStatus

        public static EmployeesDateStatusVM GetFilterdEmployeesDateStatuses(EmployeesDateStatusVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeesDateStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.AttendanceDate))
                    DA.SelectCommand.Parameters.AddWithValue("@AttendanceDate", model.filter.AttendanceDate);
                if (!String.IsNullOrEmpty(model.filter.DayStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@DayStatusID", model.filter.DayStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }

        #endregion

        #region AttendanceMonthly

        public static AttendanceMonthlyVM GetFilterdAttendanceMonthly(AttendanceMonthlyVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdAttendanceMonthly", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.Year))
                    DA.SelectCommand.Parameters.AddWithValue("@Year", model.filter.Year);
                if (!String.IsNullOrEmpty(model.filter.MonthID))
                    DA.SelectCommand.Parameters.AddWithValue("@MonthID", model.filter.MonthID);
                if (!String.IsNullOrEmpty(model.filter.VacationBalanceYearID))
                    DA.SelectCommand.Parameters.AddWithValue("@VacationBalanceYearID", model.filter.VacationBalanceYearID);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }


        public static DataTable AttendanceMonthlyDeductFromSalary(int id, int deductedFromSalary)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceMonthlyDeductFromSalary", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", id);
                DA.SelectCommand.Parameters.AddWithValue("@DeductedFromSalary", deductedFromSalary);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region MissedFingerprints
        public static MissedFingerprintsVM GetFilteredMissedFingerprints(MissedFingerprintsVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilteredMissedFingerprints", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                DA.SelectCommand.Parameters.AddWithValue("@AttendanceDate", model.filter.AttendanceDate);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }

        public static InstructorMissedFingerprintsVM GetFilteredInstructorsMissedFingerprints(InstructorMissedFingerprintsVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilteredInstructorsMissedFingerprints", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@InstructorID", model.filter.InstructorID);
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", model.filter.SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@LectureDateFrom", model.filter.LectureDateFrom);
                DA.SelectCommand.Parameters.AddWithValue("@LectureDateTo", model.filter.LectureDateTo);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }
        #endregion
        public static EmployeesDateRangeStatusesVM GetFilterdEmployeesDateRangeStatuses(EmployeesDateRangeStatusesVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeesDateRangeStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.DateFrom))
                    DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.filter.DateFrom);
                if (!String.IsNullOrEmpty(model.filter.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.filter.DateTo);
                if (!String.IsNullOrEmpty(model.filter.DayStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@DayStatusID", model.filter.DayStatusID);
                if (!String.IsNullOrEmpty(model.filter.EmployeeStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeStatusID", model.filter.EmployeeStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }
    }
}
