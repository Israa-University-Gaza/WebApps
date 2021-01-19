using System;

namespace IsraaSystem.Application.Common.DataFilter
{
    public interface IHasInsertionDate
    {
        DateTime InsertDate { get; set; }
    }
}