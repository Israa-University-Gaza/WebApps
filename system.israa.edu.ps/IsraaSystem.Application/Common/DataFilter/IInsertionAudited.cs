namespace IsraaSystem.Application.Common.DataFilter
{
    public interface IInsertionAudited : IHasInsertionDate
    {
        int InsertEmployeeID { get; set; }
    }
}