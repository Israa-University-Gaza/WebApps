using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using ClosedXML.Excel;
using System.Web.UI.WebControls;
using System.Configuration;
//using Microsoft.Office.Interop.Excel;

public partial class Excel : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string filePath = Server.MapPath("~/Filess/") + Path.GetFileName(DateTime.Now.Ticks.ToString()+FileUpload1.PostedFile.FileName );
        FileUpload1.SaveAs(filePath);
        DataTable dt = new DataTable();
        //Open the Excel file using ClosedXML.
        using (XLWorkbook workBook = new XLWorkbook(filePath))
        {
            //Read the first Sheet from Excel file.
            IXLWorksheet workSheet = workBook.Worksheet(1);

            //Create a new DataTable.


            //Loop through the Worksheet rows.
            bool firstRow = true;
            foreach (IXLRow row in workSheet.Rows())
            {
                //Use the first row to add columns to DataTable.
                if (firstRow)
                {
                    foreach (IXLCell cell in row.Cells())
                    {
                        dt.Columns.Add(cell.Value.ToString());
                    }
                    firstRow = false;
                }
                else
                {
                    //Add rows to DataTable.
                    dt.Rows.Add();
                    int i = 0;
                    foreach (IXLCell cell in row.Cells())
                    {
                        dt.Rows[dt.Rows.Count - 1][i] = cell.Value.ToString();

                        i++;
                    }
                }
            }
        }

        SqlCommand cmd11 = new SqlCommand("delete from e_excel ", conn);
        

        conn.Open();
        cmd11.ExecuteNonQuery();
        conn.Close();
        for (int i = 1; i < dt.Rows.Count; i++)
        {


            SqlCommand cmd = new SqlCommand("INSERT INTO e_excel ([c1],[c2])VALUES(@c1,@c2)", conn);
            cmd.Parameters.Add("@c1", dt.Rows[i][0].ToString());
            cmd.Parameters.Add("@c2", dt.Rows[i][1].ToString());

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
        //if (FileUpload1.HasFile)
        //{
        //    string path = string.Concat(Server.MapPath("~/File/" + FileUpload1.FileName));
        //    FileUpload1.SaveAs(path);

        //    Microsoft.Office.Interop.Excel.Application appExcel;
        //    Microsoft.Office.Interop.Excel.Workbook workbook;
        //    Microsoft.Office.Interop.Excel.Range range;
        //    Microsoft.Office.Interop.Excel._Worksheet worksheet;

        //    appExcel = new Microsoft.Office.Interop.Excel.Application();
        //    workbook = appExcel.Workbooks.Open(path, 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
        //    worksheet = (Microsoft.Office.Interop.Excel._Worksheet)workbook.Sheets[1];
        //    range = worksheet.UsedRange;

        //    int rowCount = range.Rows.Count;
        //    int colCount = range.Columns.Count;

        //    System.Data.DataTable dt = new System.Data.DataTable();
        //    dt.Columns.Add("npm");
        //    dt.Columns.Add("prodi");
        //    dt.Columns.Add("grade");

        //    for (int Rnum = 3; Rnum <= rowCount; Rnum++)
        //    {
        //        DataRow dr = dt.NewRow();
        //        Reading Each Column value From sheet to datatable Colunms
        //        for (int Cnum = 1; Cnum <= colCount; Cnum++)
        //        {
        //            dr[Cnum - 1] = (range.Cells[Rnum, Cnum]).Value2.ToString();
        //        }
        //        dt.Rows.Add(dr); // adding Row into DataTable
        //        dt.AcceptChanges();
        //    }

        //    workbook.Close(true);
        //    appExcel.Quit();

        //    try
        //    {
        //        string connSql = @"Data Source=.; Database=dbkuring; User Id=sa; Password=pohodeui;";

        //        SqlBulkCopy bulkcopy = new SqlBulkCopy(connSql);

        //        SqlBulkCopyColumnMapping mapNPM = new SqlBulkCopyColumnMapping("npm", "npm");
        //        bulkcopy.ColumnMappings.Add(mapNPM);
        //        SqlBulkCopyColumnMapping mapProdi = new SqlBulkCopyColumnMapping("prodi", "prodi");
        //        bulkcopy.ColumnMappings.Add(mapProdi);
        //        SqlBulkCopyColumnMapping mapGrade = new SqlBulkCopyColumnMapping("grade", "grade");
        //        bulkcopy.ColumnMappings.Add(mapGrade);

        //        bulkcopy.DestinationTableName = "testUpload";
        //        bulkcopy.WriteToServer(dt);

        //        msg.Text = "success";
        //    }
        //    catch (Exception ex)
        //    {
        //        msg.Text = ex.Message.ToString();
        //    }


        //}
        //String strConnection = "ConnectionString";
        //string connectionString = "";
        //if (FileUpload1.HasFile)
        //{
        //    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        //    string fileExtension = Path.GetExtension(FileUpload1.PostedFile.FileName);

        //    string newname = DateTime.Now.Ticks.ToString() + "." + fileExtension;

        //    string fileLocation = Server.MapPath("~/Filess/" + newname);
        //    FileUpload1.SaveAs(fileLocation);
        //    HiddenField1.Value = newname;
        //    if (fileExtension == ".xls")
        //    {
        //        connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
        //     fileLocation + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
        //    }
        //    else if (fileExtension == ".xlsx")
        //    {
        //        connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" +
        //          fileLocation + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
        //    }
        //    OleDbConnection con = new OleDbConnection(connectionString);
        //    OleDbCommand cmd = new OleDbCommand();
        //    cmd.CommandType = System.Data.CommandType.Text;
        //    cmd.Connection = con;
        //    OleDbDataAdapter dAdapter = new OleDbDataAdapter(cmd);
        //    DataTable dtExcelRecords = new DataTable();
        //    con.Open();
        //    DataTable dtExcelSheetName = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        //    string getExcelSheetName = dtExcelSheetName.Rows[0]["Table_Name"].ToString();
        //    cmd.CommandText = "SELECT * FROM [" + getExcelSheetName + "]";
        //    dAdapter.SelectCommand = cmd;
        //    dAdapter.Fill(dtExcelRecords);
        //    GridView1.DataSource = dtExcelRecords;
        //    GridView1.DataBind();
        //}
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Excel1.aspx?id=" + HiddenField1.Value);
    }
}