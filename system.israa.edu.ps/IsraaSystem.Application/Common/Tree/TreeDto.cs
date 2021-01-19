namespace IsraaSystem.Application.Common.Tree
{
    public class TreeDto
    {
        public int id { get; set; }
        public string text { get; set; }
        public bool children { get; set; }
        public int? ParentID { get; set; }
        public string type { get; set; }
        public object state { get; set; }
    }
}