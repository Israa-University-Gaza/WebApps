using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.Enums.Administration;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Exam.Observer.DTO;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using log4net;

namespace IsraaSystem.Application.Academic.ExamManager.ObserverService
{
    public interface IObserverService : IIsraaService
    {


        void ObserversDistribution(ObserversDistribution_Input dto);

        IEnumerable<ObserversDistributionList_Output> ObserversDistributionList(ObserversDistribution_Input dto);

        IEnumerable<EmployeePersonal> ListTest(out int totalRecords, int? GetLimitOffset, int? GetLimitRowcount, string SortColumnName, bool SortDirection);
    }


    public class ObserverService : IsraaService, IObserverService
    {


        public ObserverService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }

        public void ObserversDistribution(ObserversDistribution_Input dto)
        {
            //try
            //{
            int day = DateTime.Now.IsraaCDayID();



            #region allEmps

            var Employeeobserver = unitOfWork.Permission.GetFillterdObserver((int)EnumEmploymentType.Employeeobserver, -1);
            var SemesterObserver = unitOfWork.Permission.GetFillterdObserver((int)EnumEmploymentType.SemesterObserver, -1);
            var VolanteerObserver = unitOfWork.Permission.GetFillterdObserver((int)EnumEmploymentType.VolanteerObserver, -1);
            var PracticeObserver = unitOfWork.Permission.GetFillterdObserver((int)EnumEmploymentType.PracticeObserver, -1);



            //var extendedEmps = unitOfWork.Permission.GetFillterdObserver(100, -1);
            //var allEmps = Employeeobserver.Concat(SemesterObserver).Concat(VolanteerObserver).Concat(PracticeObserver).Concat(extendedEmps).Distinct().ToList();
            var allEmps = Employeeobserver.Concat(SemesterObserver).Concat(VolanteerObserver).Concat(PracticeObserver).Distinct().ToList();


            #endregion

            #region allInstructors

            // cource count chick
            var query = unitOfWork.Permission.GetFillterdObserver((int)EnumEmploymentType.HourInstructorObserver, -1).Where(x => x.ObservesCount < x.CourseCount);

            //query = query.Where(x => x.ObservesCount < x.CourseCount);


            // 1 observe per day chick
            var midtermExamSections = unitOfWork.Academic.MidtermExamSection.Where(x => x.Section.OfferdCourse.MidtermExamDate == dto.Date).ToList();
            var allHourInstructors = query.Where(x => !midtermExamSections.Any(c => c.EmployeeID1 == x.ID || c.EmployeeID2 == x.ID)).ToList();

            #endregion


            #region InstructorsChick

            var InsIdsYafa = (from lec in unitOfWork.Academic.Lecture.Clean()
                              where (lec.CDayID == day && lec.Room.Building.BranchID == 2 && lec.Section.OfferdCourse.SemesterID == (int)SemestersEnum.ExamSemester)
                              select lec.Section.EmployeeID);


            var InsIdsZahra = (from lec in unitOfWork.Academic.Lecture.Clean()
                               where (lec.CDayID == day && lec.Room.Building.BranchID == 1 && lec.Section.OfferdCourse.SemesterID == (int)SemestersEnum.ExamSemester)
                               select lec.Section.EmployeeID);



            var allHourInstructorsYafa = allHourInstructors.Where(o => InsIdsYafa.Any(z => z == o.ID) && !InsIdsZahra.Any(z => z == o.ID)).ToList();
            var allHourInstructorsZahra = allHourInstructors.Where(o => InsIdsZahra.Any(z => z == o.ID) && !InsIdsYafa.Any(z => z == o.ID)).ToList();
            var allHourInstructorsAll = allHourInstructors.Where(o => InsIdsZahra.Any(z => z == o.ID) && InsIdsYafa.Any(z => z == o.ID)).ToList();



            int count = allHourInstructorsAll.Count();
            if (count % 2 == 0)
            {
                allHourInstructorsYafa.AddRange(allHourInstructorsAll.Take(count / 2));
                allHourInstructorsZahra.AddRange(allHourInstructorsAll.Skip(count / 2));
            }
            else
            {
                allHourInstructorsYafa.AddRange(allHourInstructorsAll.Take(((count - 1) / 2) + 1));
                allHourInstructorsZahra.AddRange(allHourInstructorsAll.Skip(((count - 1) / 2) + 1));
            }


            var allempsyafa = allEmps.Where(o => o.ObserverBranchID == 2).Concat(allHourInstructorsYafa).ToList();
            var allempzahra = allEmps.Where(o => o.ObserverBranchID == 1).Concat(allHourInstructorsZahra).ToList();

            #endregion



            if (dto.ExamType == 1)
            {

                #region GetExamRooms


                //var rr = unitOfWork.Academic.Room.Where(r =>
                //        r.MidtermExamSection.Any(fe => fe.Section.OfferdCourse.SemesterID == (int)SemestersEnum.ExamSemester && !fe.IsDelete) && !r.IsDelete && r.IsActive)
                //    .ToList();



                var roomAll = (from oc in unitOfWork.Academic.OfferdCourse
                               from s in oc.Section
                               from me in s.MidtermExamSection
                               where (oc.IsMidtermExam.Value &
                                      oc.AcademicAccreditation &
                                      (oc.OfferdCourseTypeID == 1 || oc.OfferdCourseTypeID == 4) &
                                      oc.MidtermExamDate == dto.Date &
                                      oc.MidtermExamTimeFrom1 == dto.TimeFrom &
                                      !me.IsDelete &
                                      (me.EmployeeID1 == null || me.EmployeeID2 == null))
                               select me.Room).Include(x => x.MidtermExamSection).ToList();

                #endregion


                foreach (var room in roomAll)
                {
                    try
                    {
                        var emps = new List<GetFillterdObserver_Output>();
                        var emp1Data = new GetFillterdObserver_Output();
                        var emp2Data = new GetFillterdObserver_Output();


                        #region BranchChick

                        emps = room.Building.BranchID == 2 ? allempsyafa : allempzahra;

                        #endregion



                        #region GetMidtermExamSection

                        var MidtermExamSections = unitOfWork.Academic.MidtermExamSection.Where(fe =>
                            fe.Room.ID == room.ID && fe.Section.OfferdCourse.SemesterID == (int)SemestersEnum.ExamSemester &&
                            fe.Section.OfferdCourse.MidtermExamDate == dto.Date &&
                            fe.Section.OfferdCourse.MidtermExamTimeFrom1 == dto.TimeFrom &&
                            !fe.Section.OfferdCourse.IsDelete &&
                            !fe.IsDelete).ToList();

                        // var MidtermExamSections = room.MidtermExamSection;


                        #endregion

                        #region EmpSectionChick

                        //المراقبين اللي درسو المواد في القاعة
                        var sectionEmps = MidtermExamSections.Select(x => x.Section.EmployeeID);
                        emps = emps.Where(o => !sectionEmps.Contains(o.ID)).ToList();

                        #endregion

                        #region GenderChick

                        var IsFemale = MidtermExamSections.Any(d => d.Section.Gender == 2 || d.Section.Gender == 3);
                        if (IsFemale)
                        {
                            emp1Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.GenderID == 2 && o.EmploymentTypeID != (int)EnumEmploymentType.HourInstructorObserver);

                            if (emp1Data == null)
                            {
                                //random emp
                                emp1Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.EmploymentTypeID != (int)EnumEmploymentType.HourInstructorObserver);
                            }

                            //update ObservesCount
                            var emp = unitOfWork.Permission.Employee.Find(emp1Data.ID);
                            emp.ObservesCount++;

                            //dont take him again
                            emps.Remove(emp1Data);

                            allempsyafa.Remove(emp1Data);
                            allempzahra.Remove(emp1Data);


                            emp2Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.EmploymentTypeID == (int)EnumEmploymentType.HourInstructorObserver);

                            if (emp2Data == null)
                            {
                                emp2Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault();

                            }


                            //update ObservesCount
                            var emp2 = unitOfWork.Permission.Employee.Find(emp2Data.ID);
                            emp2.ObservesCount++;

                            //dont take him again
                            emps.Remove(emp2Data);
                            allempsyafa.Remove(emp2Data);
                            allempzahra.Remove(emp2Data);
                        }
                        else
                        {
                            emp1Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.GenderID == 1 && o.EmploymentTypeID != (int)EnumEmploymentType.HourInstructorObserver);


                            //update ObservesCount
                            var emp = unitOfWork.Permission.Employee.Find(emp1Data.ID);
                            emp.ObservesCount++;

                            //dont take him again
                            emps.Remove(emp1Data);
                            allempsyafa.Remove(emp1Data);
                            allempzahra.Remove(emp1Data);


                            emp2Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.GenderID == 1 && o.EmploymentTypeID == (int)EnumEmploymentType.HourInstructorObserver);
                            if (emp2Data == null)
                            {
                                emp2Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.GenderID == 1);

                            }

                            //update ObservesCount
                            var emp2 = unitOfWork.Permission.Employee.Find(emp2Data.ID);
                            emp2.ObservesCount++;


                            //dont take him again
                            emps.Remove(emp2Data);
                            allempsyafa.Remove(emp2Data);
                            allempzahra.Remove(emp2Data);
                        }

                        #endregion

                        #region AsighnEmpToExamRoom

                        if (MidtermExamSections.Count == 1)
                        {
                            MidtermExamSections.First().EmployeeID1 = emp1Data.ID;
                            MidtermExamSections.First().EmployeeID2 = emp2Data.ID;
                        }
                        else
                        {
                            MidtermExamSections.First().EmployeeID1 = emp1Data.ID;
                            MidtermExamSections.First().EmployeeID2 = emp2Data.ID;
                            MidtermExamSections.Skip(1).ToList().ForEach(f =>
                            {
                                f.EmployeeID2 = emp1Data.ID;
                                f.EmployeeID1 = emp2Data.ID;

                            });
                        }

                        #endregion
                    }
                    catch
                    {
                        // ignored
                    }
                }
                //}
                //catch (Exception e)
                //{
                //    _logger.Error(dto, e);

                //}

            }

            else
            {

                #region GetExamRooms


                //var rr = unitOfWork.Academic.Room.Where(r =>
                //        r.FinalExamSection.Any(fe => fe.Section.OfferdCourse.SemesterID == (int)SemestersEnum.ExamSemester && !fe.IsDelete) && !r.IsDelete && r.IsActive)
                //    .ToList();



                var roomAll = (from oc in unitOfWork.Academic.OfferdCourse
                               from s in oc.Section
                               from fe in s.FinalExamSection
                               where (oc.IsFinalExam &
                                      oc.AcademicAccreditation &
                                      (oc.OfferdCourseTypeID == 1 || oc.OfferdCourseTypeID == 4) &
                                      oc.FinalExamDate == dto.Date &
                                      oc.FinalExamTimeFrom1 == dto.TimeFrom &
                                      !fe.IsDelete &
                                      (fe.EmployeeID1 != null && fe.EmployeeID2 == null))
                               select fe.Room).Include(x => x.FinalExamSection).ToList();

                #endregion


                foreach (var room in roomAll)
                {
                    try
                    {
                        var emps = new List<GetFillterdObserver_Output>();
                        var emp1Data = new GetFillterdObserver_Output();
                        var emp2Data = new GetFillterdObserver_Output();


                        #region BranchChick

                        emps = room.Building.BranchID == 2 ? allempsyafa : allempzahra;

                        #endregion

                        #region priod check

                        var queryable = unitOfWork.Academic.FinalExamSection.Where(fe =>
                            fe.Section.OfferdCourse.SemesterID == (int)SemestersEnum.ExamSemester &&
                            fe.Section.OfferdCourse.FinalExamDate == dto.Date &&
                            fe.Section.OfferdCourse.FinalExamTimeFrom1 == dto.TimeFrom &&
                            !fe.Section.OfferdCourse.IsDelete &&
                            !fe.IsDelete

                            );

                        var empsT = queryable.Select(x => x.EmployeeID1).ToList()
                            .Concat(queryable.Select(x => x.EmployeeID2).ToList());

                        emps = emps.Where(x => !empsT.Contains(x.ID)).ToList();


                        #endregion


                        #region GetFinalExamSection



                        var FinalExamSections = unitOfWork.Academic.FinalExamSection.Where(fe =>
                            fe.Room.ID == room.ID && fe.Section.OfferdCourse.SemesterID == (int)SemestersEnum.ExamSemester &&
                            fe.Section.OfferdCourse.FinalExamDate == dto.Date &&
                            fe.Section.OfferdCourse.FinalExamTimeFrom1 == dto.TimeFrom &&
                            !fe.Section.OfferdCourse.IsDelete
                            && (fe.EmployeeID1 != null && fe.EmployeeID2 == null) &
                            !fe.IsDelete).ToList();


                        //var FinalExamSections = room.FinalExamSection;


                        #endregion

                        #region EmpSectionChick

                        //المراقبين اللي درسو المواد في القاعة
                        var sectionEmps = FinalExamSections.Select(x => x.Section.EmployeeID);
                        emps = emps.Where(o => !sectionEmps.Contains(o.ID)).ToList();

                        #endregion

                        #region GenderChick

                        var IsFemale = FinalExamSections.Any(d => d.Section.Gender == 2 || d.Section.Gender == 3);
                        if (IsFemale)
                        {
                            emp1Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.GenderID == 2);

                            if (emp1Data == null)
                            {
                                //random emp
                                emp1Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault();
                            }

                            //update ObservesCount
                            var emp = unitOfWork.Permission.Employee.Find(emp1Data.ID);
                            emp.ObservesCount++;

                            //dont take him again
                            // emps.Remove(emp1Data);

                            //allempsyafa.Remove(emp1Data);
                            //allempzahra.Remove(emp1Data);


                            emp2Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.GenderID == 1);

                            if (emp2Data == null)
                            {
                                emp2Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault();

                            }


                            //update ObservesCount
                            var emp2 = unitOfWork.Permission.Employee.Find(emp2Data.ID);
                            emp2.ObservesCount++;

                            //dont take him again
                            emps.Remove(emp2Data);
                            allempsyafa.Remove(emp2Data);
                            allempzahra.Remove(emp2Data);
                        }
                        else
                        {
                            emp1Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.GenderID == 1);
                            //&& o.EmploymentTypeID != (int)EnumEmploymentType.HourInstructorObserver);


                            //update ObservesCount
                            var emp = unitOfWork.Permission.Employee.Find(emp1Data.ID);
                            emp.ObservesCount++;

                            //dont take him again
                            //emps.Remove(emp1Data);
                            //allempsyafa.Remove(emp1Data);
                            //allempzahra.Remove(emp1Data);


                            emp2Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.GenderID == 1);

                            //emp2Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.GenderID == 1 && o.EmploymentTypeID == (int)EnumEmploymentType.HourInstructorObserver);
                            //if (emp2Data == null)
                            //{
                            //    emp2Data = emps.OrderBy(y => Guid.NewGuid()).FirstOrDefault(o => o.GenderID == 1);

                            //}

                            //update ObservesCount
                            var emp2 = unitOfWork.Permission.Employee.Find(emp2Data.ID);
                            emp2.ObservesCount++;


                            //dont take him again
                            emps.Remove(emp2Data);
                            allempsyafa.Remove(emp2Data);
                            allempzahra.Remove(emp2Data);
                        }

                        #endregion

                        #region AsighnEmpToExamRoom

                        if (FinalExamSections.Count == 1)
                        {
                            //FinalExamSections.First().EmployeeID1 = emp1Data.ID;
                            FinalExamSections.First().EmployeeID2 = emp2Data.ID;
                        }
                        else
                        {
                            //FinalExamSections.First().EmployeeID1 = emp1Data.ID;
                            FinalExamSections.First().EmployeeID2 = emp2Data.ID;
                            FinalExamSections.Skip(1).ToList().ForEach(f =>
                            {
                                f.EmployeeID2 = emp1Data.ID;
                                //f.EmployeeID1 = emp2Data.ID;

                            });
                        }

                        #endregion
                    }
                    catch
                    {
                        // ignored
                    }
                }
                //}
                //catch (Exception e)
                //{
                //    _logger.Error(dto, e);

                //}
            }


        }

        public IEnumerable<ObserversDistributionList_Output> ObserversDistributionList(ObserversDistribution_Input dto)
        {
            var empsPersonals = unitOfWork.HumanResource.EmployeePersonal.Clean().ToList();

            List<ObserversDistributionList_Output> result = new List<ObserversDistributionList_Output>();
            if (dto.ExamType == 1)
            {
                result = unitOfWork.Academic.MidtermExamSection
                       .Where(me =>
                           me.Section.OfferdCourse.MidtermExamDate == dto.Date &
                           me.Section.OfferdCourse.MidtermExamTimeFrom1 == dto.TimeFrom &
                           me.Section.OfferdCourse.SemesterID == (int)SemestersEnum.ExamSemester)
                       .Select(me => new ObserversDistributionList_Output
                       {
                           Date = me.Section.OfferdCourse.MidtermExamDate,
                           Period =
                               me.Section.OfferdCourse.MidtermExamTimeFrom1.ToString() + "_" +
                               me.Section.OfferdCourse.MidtermExamTimeTo1.ToString(),
                           OfferdCourceName = me.Section.OfferdCourse.Course.ArName,
                           RoomName = me.Room.Name,
                           Emp1Name = me.EmployeeID1.ToString(),
                           Emp2Name = me.EmployeeID2.ToString()
                       }).ToList();
            }
            else if (dto.ExamType == 2)
            {
                result = (unitOfWork.Academic.FinalExamSection
                   .Where(fe =>
                       fe.Section.OfferdCourse.FinalExamDate == dto.Date &
                       fe.Section.OfferdCourse.FinalExamTimeFrom1 == dto.TimeFrom &
                       fe.Section.OfferdCourse.SemesterID == (int)SemestersEnum.ExamSemester)
                   .Select(fe => new ObserversDistributionList_Output
                   {
                       Date = fe.Section.OfferdCourse.FinalExamDate,
                       Period =
                           fe.Section.OfferdCourse.FinalExamTimeFrom1.ToString() + "_" +
                           fe.Section.OfferdCourse.FinalExamTimeTo1.ToString(),
                       OfferdCourceName = fe.Section.OfferdCourse.Course.ArName,
                       RoomName = fe.Room.Name,
                       Emp1Name = fe.EmployeeID1.ToString(),
                       Emp2Name = fe.EmployeeID2.ToString()
                   })).ToList();
            }



            result.ForEach(o =>
            {
                int id;
                if (int.TryParse(o.Emp1Name, out id))
                {
                    o.Emp1Name = $"{empsPersonals.FirstOrDefault(x => x.EmployeeID == id)?.ArFirstName} " +
                                 $"{empsPersonals.FirstOrDefault(x => x.EmployeeID == id)?.ArSecoundName} " +
                                 $"{empsPersonals.FirstOrDefault(x => x.EmployeeID == id)?.ArFamilyName}";


                }
                if (int.TryParse(o.Emp2Name, out id))
                {
                    o.Emp2Name = $"{empsPersonals.FirstOrDefault(x => x.EmployeeID == id)?.ArFirstName} " +
                                 $"{empsPersonals.FirstOrDefault(x => x.EmployeeID == id)?.ArSecoundName} " +
                                 $"{empsPersonals.FirstOrDefault(x => x.EmployeeID == id)?.ArFamilyName}";

                }
            });








            //var result = from fe in unitOfWork.Acadmic.FinalExamSection.Where(x => x.Section.OfferdCourse.SemesterID == 11).AsEnumerable()
            //             join emp in unitOfWork.Acadmic.EmplyeeView.AsEnumerable() on fe.EmployeeID1 equals emp.ID
            //             select new ObserversDistributionList_Output()
            //             {
            //                 Date = fe.Section.OfferdCourse.FinalExamDate,
            //                 Period = fe.Section.OfferdCourse.FinalExamTimeFrom1.ToString(),
            //                 OfferdCourceName = fe.Section.OfferdCourse.Course.ArName,
            //                 RoomName = fe.Room.Name,
            //                 Emp1Name = emp.ArFamilyName,
            //                 Emp2Name = ""
            //             };



            #region Best Practice

            //var finalExamSections = unitOfWork.Acadmic.FinalExamSection.Where(x => x.Section.OfferdCourse.SemesterID == 11).Clear().AsEnumerable();

            //var EmplyeeViews = unitOfWork.Acadmic.EmplyeeView.Clear().Where(x => finalExamSections.Any(f => f.EmployeeID1 == x.ID || f.EmployeeID2 == x.ID)).Clear().AsEnumerable();



            //var fl = finalExamSections;
            //var el = EmplyeeViews;


            //var result = fl.Join(el, x => x.EmployeeID1, c => c.ID, (a, b) => new ObserversDistributionList_Output()
            //{
            //    Date = DateTime.Now,
            //    Period = "",
            //    OfferdCourceName = "",
            //    RoomName = "",
            //    Emp1Name = b.ArFamilyName,
            //    Emp2Name = b.ArFamilyName
            //});


            //var y = result.ToList();
            //int u = y.Count;

            #endregion



            return result;
        }

        public IEnumerable<EmployeePersonal> ListTest(out int totalRecords, int? GetLimitOffset, int? GetLimitRowcount, string SortColumnName, bool SortDirection)
        {
            totalRecords = 0;
            var result = unitOfWork.HumanResource.EmployeePersonal;
            return result;
        }


    }







}