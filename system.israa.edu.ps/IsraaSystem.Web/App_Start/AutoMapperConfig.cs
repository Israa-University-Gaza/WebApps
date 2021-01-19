using AutoMapper;
using AutoMapper.Data;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;

namespace IsraaSystem.Web
{
    public static class AutoMapperConfig
    {

        public static void RegisterMappings()
        {

            Mapper.Reset();
            Mapper.Initialize(cfg =>
            {
                cfg.AddDataReaderMapping();
                cfg.ValidateInlineMaps = false;
                cfg.CreateMap<Section, SectionDto>()
                    .ForMember(e => e.DepartmentName,
                    o => o.MapFrom(c => c.OfferdCourse.Course.Department.ArName))
                    .ForMember(e => e.CourseName,
                        o => o.MapFrom(c => c.OfferdCourse.Course.ArName));
            });



        }
    }



}