using System;

namespace IsraaSystem.Application.Common.DataFilter
{
    public interface IDeletionAudited : ISoftDelete
    {

        int? DeleteEmployeeID { get; set; }

        DateTime? DeleteDate { get; set; }

    }
}