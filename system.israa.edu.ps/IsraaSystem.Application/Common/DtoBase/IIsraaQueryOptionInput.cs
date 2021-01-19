namespace IsraaSystem.Application.Common.DtoBase
{
    public interface IIsraaQueryOptionInput
    {
        string GlobalSearch { get; set; }
        int? LimitOffset { get; set; }
        int? LimitRowCount { get; set; }
        string SortColumnName { get; set; }
        bool SortDirection { get; set; }
    }


    public class IsraaQueryOptionInput : IIsraaQueryOptionInput
    {
        public string GlobalSearch { get; set; }
        public int? LimitOffset { get; set; }
        public int? LimitRowCount { get; set; }
        public string SortColumnName { get; set; }
        public bool SortDirection { get; set; }
    }
}