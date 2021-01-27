using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataAccess
/// </summary>
public class DataAccess
{
    public DataAccess()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private static SqlConnection GetConnection()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibrarySystem"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnection2()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HumanResources"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnection3()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["israa"].ToString());
        conn.Open();
        return conn;
    }

    #region UserLogin

    public static DataTable IsValidEmployee(string Username, string Password)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsValidEmployee", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", Username);
            DA.SelectCommand.Parameters.AddWithValue("@Password", Password);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable IsEmployeeInSystem(int EmployeeID, int SystemID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsEmployeeInSystem", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SystemID", SystemID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static ArrayList GetEmployeeSystemActions(string EmployeeID, string SystemID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeSystemActions", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SystemID", SystemID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            ArrayList arrayList = new ArrayList();
            foreach (DataRow dr in DT.Rows)
            {
                arrayList.Add(dr["ActionName"]);
            }
            return arrayList;
        }
    }


    #endregion
    #region Employee
    public static DataTable Employee_TB_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Employee_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeePhoto_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeePhoto_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion
    #region Books

    public static int BookAddEdit(string ID,string PublicID,  string CategoryID,string BarcodeID, string BookType, string BookTitle,
         string BookWidth, string BookHeight, string CopyCount, string SubjetHead,
        string BookPlace, string BookSummary, string BookStatus, string Tdmak, string Attachment, string BookLanguage,
        string BookNotes, string BookClarfication, string FolderCount, string FolderNo, string SeriesTitle, string SeriesNo,
        string EditionNo, string LibEntryDate, string BookTitle2, string BookTitle3, string InsertUserID, string UpdateUserID,
        string BookGet,string BookGetName,string PartsCount,string PartsNo,string PagesCount,string BookStatus2)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("BooKAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@PublicID", PublicID);
            cmd.Parameters.AddWithValue("@CategoryID", CategoryID);
            cmd.Parameters.AddWithValue("@BarcodeID", BarcodeID);
            cmd.Parameters.AddWithValue("@BookType", BookType);
            cmd.Parameters.AddWithValue("@BookTitle", BookTitle);
            cmd.Parameters.AddWithValue("@BookGetName", BookGetName);
            cmd.Parameters.AddWithValue("@BookWidth", BookWidth);
            cmd.Parameters.AddWithValue("@BookHeight", BookHeight);
            cmd.Parameters.AddWithValue("@CopyCount", CopyCount);
            cmd.Parameters.AddWithValue("@SubjectHead", SubjetHead);
            cmd.Parameters.AddWithValue("@BookPlace", BookPlace);
            cmd.Parameters.AddWithValue("@BookSummary", BookSummary);
            cmd.Parameters.AddWithValue("@BookStatus", BookStatus);
            cmd.Parameters.AddWithValue("@Tdmak", Tdmak);
            cmd.Parameters.AddWithValue("@Attachment", Attachment);
            cmd.Parameters.AddWithValue("@BookLanguage", BookLanguage);
            cmd.Parameters.AddWithValue("@BookNotes", BookNotes);
            cmd.Parameters.AddWithValue("@BookClarfication", BookClarfication);
            cmd.Parameters.AddWithValue("@FolderCount", FolderCount);
            cmd.Parameters.AddWithValue("@FolderNo", FolderNo);
            cmd.Parameters.AddWithValue("@SeriesTitle", SeriesTitle);
            cmd.Parameters.AddWithValue("@SeriesNo", SeriesNo);
            cmd.Parameters.AddWithValue("@EditionNo", EditionNo);
            cmd.Parameters.AddWithValue("@LibEntryDate", LibEntryDate);
            cmd.Parameters.AddWithValue("@BookTitle2", BookTitle2);
            cmd.Parameters.AddWithValue("@BookTitle3", BookTitle3);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            cmd.Parameters.AddWithValue("@BookGet", BookGet);
            cmd.Parameters.AddWithValue("@PartsCount", PartsCount);
            cmd.Parameters.AddWithValue("@PartsNo", PartsNo);
            cmd.Parameters.AddWithValue("@PagesCount", PagesCount);
            cmd.Parameters.AddWithValue("@Bookstatus2", BookStatus2);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable BookAddEditMain(string ID,string PublicID, string CategoryID,string BarcodeID, string BookType, string BookTitle,
       string LibEntryDate, string BookTitle2, string BookTitle3, string InsertUserID, string UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BooKAddEditMain", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@PublicID", PublicID);
            DA.SelectCommand.Parameters.AddWithValue("@CategoryID", CategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@BarcodeID", BarcodeID);
            DA.SelectCommand.Parameters.AddWithValue("@BookType", BookType);
            DA.SelectCommand.Parameters.AddWithValue("@BookTitle", BookTitle);

            DA.SelectCommand.Parameters.AddWithValue("@LibEntryDate", LibEntryDate);
            DA.SelectCommand.Parameters.AddWithValue("@BookTitle2", BookTitle2);
            DA.SelectCommand.Parameters.AddWithValue("@BookTitle3", BookTitle3);
            DA.SelectCommand.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable BookGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BookGet1(string PublicID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookGet1", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PublicID", PublicID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int BookDelete(string ID,string UserID) {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("BookDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
           
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.Parameters.AddWithValue("@UserID", UserID);
        
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Publisher
     public static int PublisherAddEdit(string ID,string PublisherName,string PublisherPlace,
         string PublisherYear,string BookID, string InsertUserID, string UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("PublisherAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@PublisherName", PublisherName);
            cmd.Parameters.AddWithValue("@PublisherPlace", PublisherPlace);
            cmd.Parameters.AddWithValue("@PublisherYear", PublisherYear);
            cmd.Parameters.AddWithValue("@BookID", BookID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

     #region BookPersonAddEdit
     public static int BookPersonAddEdit(string ID, string PersonName, string SubConstantID,
         string BookID, string InsertUserID, string UpdateUserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlCommand cmd = new SqlCommand("BookPersonAddEdit", conn);
             cmd.CommandType = CommandType.StoredProcedure;
             if (ID != "")
                 cmd.Parameters.AddWithValue("@ID", ID);
             cmd.Parameters.AddWithValue("@PersonName", PersonName);
             cmd.Parameters.AddWithValue("@SubConstantID", SubConstantID);
        
             cmd.Parameters.AddWithValue("@BookID", BookID);
             cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
             cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

             return cmd.ExecuteNonQuery();
         }
     }
     #endregion

     #region borrowCat

     public static DataTable BorrowCatAddEdit(string ID, string BorrowCatType, string BorrowMaxDayCount,
     string BorrowMaxBookCount,  string InsertUserID, string UpdateUserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlDataAdapter DA = new SqlDataAdapter("BorrowCatAddEdit", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             if (ID != "")
                 DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
             DA.SelectCommand.Parameters.AddWithValue("@BorrowCatType", BorrowCatType);
             DA.SelectCommand.Parameters.AddWithValue("@BorrowMaxDayCount", BorrowMaxDayCount);
             DA.SelectCommand.Parameters.AddWithValue("@BorrowMaxBookCount", BorrowMaxBookCount);
            
             DA.SelectCommand.Parameters.AddWithValue("@InsertUserID", InsertUserID);
             DA.SelectCommand.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static DataTable BorrowCatGet(string ID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlDataAdapter DA = new SqlDataAdapter("BorrowCatGet", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static int BorrowCatDelete(string ID, string UserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlCommand cmd = new SqlCommand("BorrowCatDelete", conn);
             cmd.CommandType = CommandType.StoredProcedure;

             cmd.Parameters.AddWithValue("@ID", ID);
             cmd.Parameters.AddWithValue("@UserID", UserID);

             return cmd.ExecuteNonQuery();
         }
     }

     #endregion

     #region borrow

     public static DataTable BorrowAddEdit(string ID,string BookID,string ClientID,string InsertUserID,string UpdateUserID )
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlDataAdapter DA = new SqlDataAdapter("BorrowAddEdit", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             if (ID != "")
             
                 DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            
             DA.SelectCommand.Parameters.AddWithValue("@BookID", BookID);
             DA.SelectCommand.Parameters.AddWithValue("@ClientID", ClientID);
         
            
             DA.SelectCommand.Parameters.AddWithValue("@InsertUserID", InsertUserID);
             DA.SelectCommand.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static int BookReturned(string ID,bool IsReturn, string UserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlCommand cmd = new SqlCommand("BookReturned", conn);
             cmd.CommandType = CommandType.StoredProcedure;

             cmd.Parameters.AddWithValue("@ID", ID);
             cmd.Parameters.AddWithValue("@IsReturn", IsReturn);
             cmd.Parameters.AddWithValue("@UserID", UserID);

             return cmd.ExecuteNonQuery();
         }
     }

     public static DataTable BookRenew(string ID, bool Renew, string UserID)
     {
         using (SqlConnection conn = GetConnection())
         {
     
             SqlDataAdapter DA = new SqlDataAdapter("BookRenew", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;

              DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
              DA.SelectCommand.Parameters.AddWithValue("@Renew", Renew);
              DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
     

             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }
    #endregion

     #region DelayNotification
     public static int FirstNotify(string ID, string UserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlCommand cmd = new SqlCommand("FirstNotify", conn);
             cmd.CommandType = CommandType.StoredProcedure;

             cmd.Parameters.AddWithValue("@ID", ID);
             cmd.Parameters.AddWithValue("@UserID", UserID);

             return cmd.ExecuteNonQuery();
         }
     }

     public static int SecondNotify(string ID, string UserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlCommand cmd = new SqlCommand("SecondNotify", conn);
             cmd.CommandType = CommandType.StoredProcedure;

             cmd.Parameters.AddWithValue("@ID", ID);
             cmd.Parameters.AddWithValue("@UserID", UserID);

             return cmd.ExecuteNonQuery();
         }
     }

     public static int FinallyNotify(string ID, string UserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlCommand cmd = new SqlCommand("FinallyNotify", conn);
             cmd.CommandType = CommandType.StoredProcedure;

             cmd.Parameters.AddWithValue("@ID", ID);
             cmd.Parameters.AddWithValue("@UserID", UserID);

             return cmd.ExecuteNonQuery();
         }
     }


     #endregion
     #region visitor
     public static DataTable VisitorAddEdit(string ID, string SSN, string FullName,
        string Mobile,string Phone,string Email,string Address,string Notes , string InsertUserID, string UpdateUserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlDataAdapter DA = new SqlDataAdapter("VisitorAddEdit", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             if (ID != "")
             DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
             DA.SelectCommand.Parameters.AddWithValue("@SSN", SSN);
             DA.SelectCommand.Parameters.AddWithValue("@FullName", FullName);
             DA.SelectCommand.Parameters.AddWithValue("@Mobile", Mobile);
             DA.SelectCommand.Parameters.AddWithValue("@Phone", Phone);
             DA.SelectCommand.Parameters.AddWithValue("@Email", Email);
             DA.SelectCommand.Parameters.AddWithValue("@Address", Address);
             DA.SelectCommand.Parameters.AddWithValue("@Notes", Notes);
             DA.SelectCommand.Parameters.AddWithValue("@InsertUserID", InsertUserID);
             DA.SelectCommand.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static int VisitorDelete(string ID, string UserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlCommand cmd = new SqlCommand("VisitorDelete", conn);
             cmd.CommandType = CommandType.StoredProcedure;

             cmd.Parameters.AddWithValue("@ID", ID);
             cmd.Parameters.AddWithValue("@UserID", UserID);

             return cmd.ExecuteNonQuery();
         }
     }

     public static DataTable VisitorGet(string ID)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("VisitorGet", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             DA.SelectCommand.Parameters.AddWithValue("@ID", ID);

             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }
    #endregion

    #region reports
     public static DataTable DelayBorrow()
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("DelayBorrow", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;


             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static DataTable ClientBorrowBookGet(string ID)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("ClientBorrowBookGet", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;

             DA.SelectCommand.Parameters.AddWithValue("@ClientID", ID);
             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static DataTable BorrowerRegistration1(string ID)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("Beneficiary registration Report1", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;

             DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }
     public static DataTable BorrowerRegistration2(string ID)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("Beneficiary registration Report2", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;

             DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static DataTable borrowDataView(string from,string to)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("borrowDataView", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             DA.SelectCommand.Parameters.AddWithValue("@From", from);
             DA.SelectCommand.Parameters.AddWithValue("@To", to);

             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }
     public static DataTable LibraryRegisterReport(string from, string to)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("LibraryRegisterReport", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             DA.SelectCommand.Parameters.AddWithValue("@From", from);
             DA.SelectCommand.Parameters.AddWithValue("@To", to);

             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static DataTable BookStatusView(string bookstatus)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("BookStatusView", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             DA.SelectCommand.Parameters.AddWithValue("@BookStatus", bookstatus);
  

             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static DataTable MostFrequentBooksYearly(string year)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("MostFrequentBooksYearly", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             DA.SelectCommand.Parameters.AddWithValue("@year", year);


             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static DataTable LostBooks()
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("LostBooks", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            


             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static DataTable DelayNotificationReport(string Notify)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("DelayNotification", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             DA.SelectCommand.Parameters.AddWithValue("@NotifyNo", Notify);


             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

    #endregion


    #region Digital Library

     public static int DigitalBookAddEdit(string ID, string BookTitle, string AuthorName,
        string CategoryID, string ISBN,string LanguageID,string BookURL,string BookPhoto, string InsertUserID, string UpdateUserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlCommand cmd = new SqlCommand("DigitalBookAddEdit", conn);
             cmd.CommandType = CommandType.StoredProcedure;
             if (ID != "")
                 cmd.Parameters.AddWithValue("@ID", ID);
             cmd.Parameters.AddWithValue("@BookTitle", BookTitle);
             cmd.Parameters.AddWithValue("@AuthorName", AuthorName);
             cmd.Parameters.AddWithValue("@CategoryID", CategoryID);
             cmd.Parameters.AddWithValue("@ISBN", ISBN);
             cmd.Parameters.AddWithValue("@LanguageID", LanguageID);
             cmd.Parameters.AddWithValue("@BookURL", BookURL);
             cmd.Parameters.AddWithValue("@BookPhoto", BookPhoto);
             cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
             cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

             return cmd.ExecuteNonQuery();
         }
     }

     public static DataTable E_BookGet(string ID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlDataAdapter DA = new SqlDataAdapter("E_BookGet", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

    #endregion

     #region LibraryRegister
     public static int LibraryRegisterAddEdit(string ID, string ClientID,  string InsertUserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlCommand cmd = new SqlCommand("LibraryRegisterAddEdit", conn);
             cmd.CommandType = CommandType.StoredProcedure;
             if (ID != "")
                 cmd.Parameters.AddWithValue("@ID", ID);
             cmd.Parameters.AddWithValue("@ClientID", ClientID);
        
             cmd.Parameters.AddWithValue("@UserID", InsertUserID);
     

             return cmd.ExecuteNonQuery();
         }
     }
     #endregion

     public static DataTable BorrowerDataGet(string ID)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("BorrowerDataGet", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             DA.SelectCommand.Parameters.AddWithValue("@BorrowerNo", ID);

             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     #region PeriodicBook
     public static int PeriodicNoAddEdit(string ID, string BookID,string FolderNo,string PeriodicNo,string PeriodicNoDate, string UserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlCommand cmd = new SqlCommand("PeriodicNoAddEdit", conn);
             cmd.CommandType = CommandType.StoredProcedure;
             if (ID != "")
                 cmd.Parameters.AddWithValue("@ID", ID);
             cmd.Parameters.AddWithValue("@BookID", BookID);
             cmd.Parameters.AddWithValue("@FolderNo", FolderNo);
             cmd.Parameters.AddWithValue("@PeriodicNo", PeriodicNo);
             cmd.Parameters.AddWithValue("@Date", PeriodicNoDate);
             cmd.Parameters.AddWithValue("@UserID", UserID);
   

             return cmd.ExecuteNonQuery();
         }
     }

     public static DataTable PeriodicDetailsGet(string BookID)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("PeriodicDetailsGet", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             DA.SelectCommand.Parameters.AddWithValue("@BookID", BookID);

             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }
     public static DataTable PeriodicDetailsNoGet(string ID)
     {
         using (SqlConnection conn = GetConnection())
         {

             SqlDataAdapter DA = new SqlDataAdapter("PeriodicDetailsNoGet", conn);
             DA.SelectCommand.CommandType = CommandType.StoredProcedure;
             DA.SelectCommand.Parameters.AddWithValue("@ID", ID);

             DataTable DT = new DataTable();
             DA.Fill(DT);
             return DT;
         }
     }

     public static int ArticlesAddEdit(string Articles_ID, string Periodic_ID, string Article_Title, string PageNo, string Author, string UserID)
     {
         using (SqlConnection conn = GetConnection())
         {
             SqlCommand cmd = new SqlCommand("ArticlesAddEdit", conn);
             cmd.CommandType = CommandType.StoredProcedure;
             if (Articles_ID != "")
                 cmd.Parameters.AddWithValue("@Articles_ID", Articles_ID);
             cmd.Parameters.AddWithValue("@Periodic_ID", Periodic_ID);
             cmd.Parameters.AddWithValue("@Article_Title", Article_Title);
             cmd.Parameters.AddWithValue("@PageNo", PageNo);
             cmd.Parameters.AddWithValue("@Author", Author);
             cmd.Parameters.AddWithValue("@UserID", UserID);


             return cmd.ExecuteNonQuery();
         }
     }
    #endregion
    public static DataTable GetBooksByCategorySurvay(string BookCategoryID)
    {
        using (SqlConnection conn = GetConnection())
        {

            SqlDataAdapter DA = new SqlDataAdapter("GetBooksByCategorySurvay", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@BookCategoryID", BookCategoryID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
}



