using System;

namespace IsraaSystem.Application.Common.DataFilter
{
    public interface IHasUpdatingDate
    {
        DateTime? UpdateDate { get; set; }
    }
}