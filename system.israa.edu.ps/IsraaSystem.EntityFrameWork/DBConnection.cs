using System.Data.SqlClient;

namespace IsraaSystem.DataAccess
{
    public class DBConnection
    {
        public static SqlConnection GetIsraaHumanResourceConnection()
        {
            string connetionString = "Data Source=israa.edu.ps;Initial Catalog=IsraaHumanResource;User Id=dbuser;Password=isr@adb342!@#BKA;";
            SqlConnection israaHumanResourceConnection = new SqlConnection(connetionString);
            return israaHumanResourceConnection;
        }

        protected static SqlConnection GetIsraaAcademicConnection()
        {
            //string connetionString = "Data Source=DESKTOP-0QD1UV6;Initial Catalog=IsraaAcademic;Integrated Security=True;";
            string connetionString = "Data Source=israa.edu.ps;Initial Catalog=IsraaAcademic;User Id=dbuser;Password=isr@adb342!@#BKA;";
            SqlConnection israaAcademicConnection = new SqlConnection(connetionString);
            return israaAcademicConnection;
        }

        protected static SqlConnection GetIsraPermissions()
        {
            string connetionString = "Data Source=israa.edu.ps;Initial Catalog=IsraPermission;User Id=dbuser;Password=isr@adb342!@#BKA;";
            //string connetionString = "data source=DESKTOP-0QD1UV6;initial catalog=IsraPermission;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework;";
            SqlConnection israaHumanResourceConnection = new SqlConnection(connetionString);
            return israaHumanResourceConnection;
        }

        protected static SqlConnection GetIsraPermissionsElibApi()
        {
            string connetionString = "Data Source=israa.edu.ps;Initial Catalog=IsraPermissions;User Id=dbuser;Password=isr@adb342!@#BKA;";
            //string connetionString = "data source=DESKTOP-0QD1UV6;initial catalog=IsraPermission;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework;";
            SqlConnection israaHumanResourceConnection = new SqlConnection(connetionString);
            return israaHumanResourceConnection;
        }


        protected static SqlConnection GetIsraDataConnection()
        {
            string connetionString = "Data Source=israa.edu.ps;Initial Catalog=IsraData;User Id=dbuser;Password=isr@adb342!@#BKA;";
            //string connetionString = "data source=DESKTOP-0QD1UV6;initial catalog=IsraPermission;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework;";
            SqlConnection IsraDataConnection = new SqlConnection(connetionString);
            return IsraDataConnection;
        }

    }
}
