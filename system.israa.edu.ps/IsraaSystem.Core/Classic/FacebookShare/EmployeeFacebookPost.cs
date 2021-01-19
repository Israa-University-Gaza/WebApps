namespace IsraaSystem.Core.Classic.FacebookShare
{
    public class EmployeeFacebookPost
    {
        public int EmployeeID { get; set; }
        public string Permalink { get; set; }
        public string PostID { get; set; }
        public string ShareID { get; set; }
        public int UserID { get; set; }

        public EmployeeFacebookPost(int EmployeeID, string Permalink, string PostID, string ShareID, int UserID) {
            this.EmployeeID = EmployeeID; 
            this.Permalink = Permalink; 
            this.PostID = PostID;
            this.ShareID = ShareID;
            this.UserID = UserID;
        }
    }
}
