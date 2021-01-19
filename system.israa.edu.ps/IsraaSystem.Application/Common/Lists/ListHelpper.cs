using System.Collections.Generic;
using IsraaSystem.Application.Common.Enums.Academic;

namespace IsraaSystem.Application.Common.Lists
{
    public static class ListHelpper
    {

        public static List<int> ActiveCourseStatus()
        {
            return new List<int>()
            {
                (int)CourseStatusEnum.Register,
                (int)CourseStatusEnum.Successful,
                (int)CourseStatusEnum.Failure,
                (int)CourseStatusEnum.OfficeRegister

            };
        }
    }
}