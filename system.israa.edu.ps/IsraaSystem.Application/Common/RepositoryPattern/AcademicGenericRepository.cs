using System.Data.Entity;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;

namespace IsraaSystem.Application.Common.RepositoryPattern
{
    public interface IAcademicRepository<TEntity> : IGenericRepository<TEntity>
    {

    }



    public class AcademicRepository<TEntity> : GenericRepository<TEntity>, IAcademicRepository<TEntity> where TEntity : class
    {
        public AcademicRepository(IsraaAcademicEntities context) : base(context)
        {
        }
    }
}