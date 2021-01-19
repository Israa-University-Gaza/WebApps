namespace IsraaSystem.Application.Common.Session
{
    public class IsraaSession : IIsraaSession
    {
        public int? UserID { get; set; }
        public string UserName { get; set; }
        public string IP { get; set; }
    }
}