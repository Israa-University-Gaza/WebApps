namespace IsraaSystem.Application.Common.Session
{
    public interface IIsraaSession
    {
        int? UserID { get; set; }
        string UserName { get; set; }
        string IP { get; set; }

    }
}