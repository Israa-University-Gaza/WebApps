namespace IsraaSystem.Application.Common.DataFilter
{
    public interface IUpdatingAudited : IHasUpdatingDate
    {
        int? UpdateUserID { get; set; }
    }
}