using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Debug.WriteLine("Start");
        SqlDependency.Start(ConfigurationManager.ConnectionStrings["isra"].ToString());
    }

    void SomeMethod()
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra"].ToString());
        conn.Open();
        
        using (SqlCommand command = new SqlCommand(
            "SELECT ID, ArName FROM dbo.Department",
            conn))
        {

            // Create a dependency and associate it with the SqlCommand.
            SqlDependency dependency = new SqlDependency(command);
            // Maintain the refence in a class member.

            // Subscribe to the SqlDependency event.
            dependency.OnChange += new
               OnChangeEventHandler(OnDependencyChange);

            // Execute the command.
            using (SqlDataReader reader = command.ExecuteReader())
            {
                Debug.WriteLine("reader");
            }
        }
    }

    // Handler method
    void OnDependencyChange(object sender,
       SqlNotificationEventArgs e)
    {
        Debug.WriteLine("OnDependencyChange");
    }

    void Termination()
    {
        // Release the dependency.
        SqlDependency.Stop(ConfigurationManager.ConnectionStrings["isra"].ToString());
    }
}