using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Excel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //String strConnection = "ConnectionString";
        //string connectionString = "";
        //string fileLocation = Server.MapPath("~/ex/" + "coll.xlsx");
        //connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" +
        //          fileLocation + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";

        //OleDbConnection con = new OleDbConnection(connectionString);
        //OleDbCommand cmd = new OleDbCommand();
        //cmd.CommandType = System.Data.CommandType.Text;
        //cmd.Connection = con;
        //OleDbDataAdapter dAdapter = new OleDbDataAdapter(cmd);
        //    DataTable dtExcelRecords = new DataTable();
        //con.Open();
        //DataTable dtExcelSheetName = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        //string getExcelSheetName = dtExcelSheetName.Rows[0]["Table_Name"].ToString();
        //cmd.CommandText = "SELECT * FROM [" + getExcelSheetName + "]";
        //    dAdapter.SelectCommand = cmd;
        //    dAdapter.Fill(dtExcelRecords);
        //    GridView1.DataSource = dtExcelRecords;
        //    GridView1.DataBind();
        }
    }
