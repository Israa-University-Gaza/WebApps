using System;
using System.Linq;
using System.Linq.Expressions;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.SpecificationPattern;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;

namespace IsraaSystem.Application.Academic.StudentManager.Specifications
{
    public class RegularStudentAcademicSpecification : Specification<StudentAcademic>
    {
        private SemesterStatusEnum SemesterStatusEnum { get; }


        public RegularStudentAcademicSpecification(SemesterStatusEnum semesterStatusEnum = SemesterStatusEnum.Registration)
        {
            SemesterStatusEnum = semesterStatusEnum;
        }


        public override Expression<Func<StudentAcademic, bool>> ToExpression()
        {
            return studentAcademic => studentAcademic
                .StdSection
                .Any(stdSection => (stdSection.CourseStatusID == (int)CourseStatusEnum.Register ||
                                    stdSection.CourseStatusID == (int)CourseStatusEnum.OfficeRegister ||
                                    stdSection.CourseStatusID == (int)CourseStatusEnum.Successful ||
                                    stdSection.CourseStatusID == (int)CourseStatusEnum.Failure)
                                   &&
                                   stdSection.StdSemester.SemesterStatus.ID == (int)SemesterStatusEnum);
        }
    }



}