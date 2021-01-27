using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class NewDataAccess
{
    private static SqlConnection GetConnection()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaLibrary"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnection2()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaAcademic"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnection3()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HumanResources"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnection4()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["israa"].ToString());
        conn.Open();
        return conn;
    }


    public static DataTable ContainerAddEdit(string ID, string ContainerNo, string Title, string LanguageID, string ContainerCategory, string ContainerCategoryID, string KTR, string ContainerTypeID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ContainerAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@ContainerNo", ContainerNo);
            DA.SelectCommand.Parameters.AddWithValue("@Title", Title);
            DA.SelectCommand.Parameters.AddWithValue("@LanguageID", LanguageID);
            DA.SelectCommand.Parameters.AddWithValue("@ContainerCategory", ContainerCategory);
            DA.SelectCommand.Parameters.AddWithValue("@ContainerCategoryID", ContainerCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@KTR", KTR);
            DA.SelectCommand.Parameters.AddWithValue("@ContainerTypeID", ContainerTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ContainerGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ContainerGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ContainerDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ContainerDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BookAddEdit(string ID, string BookCopyID, string BookTitle1, string BookTitle2, string BookTitle3,
        string SeriesTitle, string SeriesNo, string BookNo, string ContainerID, string BookGetTypeID, string BookGetName, string BookGetDate,
        string BookPrice, string BookTypeID, string BookStatusID, bool IsBorrow, string ISBN, string PageCount, string CopyNo,
        string EditionNo, string PartNo, string FloorID, string Details, string Notes,string PeriodicalNumber, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            if (BookCopyID != "")
                DA.SelectCommand.Parameters.AddWithValue("@BookCopyID", BookCopyID);
            DA.SelectCommand.Parameters.AddWithValue("@BookTitle1", BookTitle1);
            DA.SelectCommand.Parameters.AddWithValue("@BookTitle2", BookTitle2);
            DA.SelectCommand.Parameters.AddWithValue("@BookTitle3", BookTitle3);
            DA.SelectCommand.Parameters.AddWithValue("@SeriesTitle", SeriesTitle);
            DA.SelectCommand.Parameters.AddWithValue("@SeriesNo", SeriesNo);
            DA.SelectCommand.Parameters.AddWithValue("@BookNo", BookNo);
            DA.SelectCommand.Parameters.AddWithValue("@ContainerID", ContainerID);
            DA.SelectCommand.Parameters.AddWithValue("@BookGetTypeID", BookGetTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@BookGetDate", BookGetDate);
            DA.SelectCommand.Parameters.AddWithValue("@BookGetName", BookGetName);
            DA.SelectCommand.Parameters.AddWithValue("@BookPrice", BookPrice);
            DA.SelectCommand.Parameters.AddWithValue("@BookTypeID", BookTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@BookStatusID", BookStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@IsBorrow", IsBorrow);
            DA.SelectCommand.Parameters.AddWithValue("@ISBN", ISBN);
            DA.SelectCommand.Parameters.AddWithValue("@PageCount", PageCount);
            DA.SelectCommand.Parameters.AddWithValue("@CopyNo", CopyNo);
            DA.SelectCommand.Parameters.AddWithValue("@EditionNo", EditionNo);
            DA.SelectCommand.Parameters.AddWithValue("@PartNo", PartNo);
            DA.SelectCommand.Parameters.AddWithValue("@FloorID", FloorID);
            DA.SelectCommand.Parameters.AddWithValue("@Details", Details);
            DA.SelectCommand.Parameters.AddWithValue("@Notes", Notes);
            DA.SelectCommand.Parameters.AddWithValue("@PeriodicalNumber", PeriodicalNumber);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
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

    public static DataTable BookDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BookPersonAddEdit(string ID, string BookID, string PersonName, string PersonTypeID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookPersonAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@BookID", BookID);
            DA.SelectCommand.Parameters.AddWithValue("@PersonName", PersonName);
            DA.SelectCommand.Parameters.AddWithValue("@PersonTypeID", PersonTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BookPersonGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookPersonGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BookPersonDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookPersonDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable BookPublisherAddEdit(string ID, string BookID, string PublisherName, string PublisherPlace, string PublisherYear, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookPublisherAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@BookID", BookID);
            DA.SelectCommand.Parameters.AddWithValue("@PublisherName", PublisherName);
            DA.SelectCommand.Parameters.AddWithValue("@PublisherPlace", PublisherPlace);
            DA.SelectCommand.Parameters.AddWithValue("@PublisherYear", PublisherYear);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BookPublisherGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookPublisherGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BookPublisherDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookPublisherDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable PublisherAddEdit(string ID, string Name, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PublisherAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@Name", Name);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable PublisherDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {

            SqlDataAdapter DA = new SqlDataAdapter("PublisherDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable PublisherGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PublisherGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentImageGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentImageGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CheckStudent(string StudentNo)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CheckStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentNo", StudentNo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmployeePhoto_Get(string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeePhoto_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CheckEmployee(string EmployeeNo)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CheckEmployee", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", EmployeeNo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CheckVisitor(string SSN)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CheckVisitor", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SSN", SSN);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentMobile(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentMobile", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetEmployeeMobile(string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeMobile", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetVisitorMobile(string VisitorID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetVisitorMobile", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@VisitorID", VisitorID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BorrowBook(string BookID, string ClientID, string BorrowCategoryID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BorrowBook", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@BookID", BookID);
            DA.SelectCommand.Parameters.AddWithValue("@ClientID", ClientID);
            DA.SelectCommand.Parameters.AddWithValue("@BorrowCategoryID", BorrowCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ReturnBorrowClient(string BorrowClientID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ReturnBorrowClient", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@BorrowClientID", BorrowClientID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable RenewBorrowClient(string BorrowClientID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RenewBorrowClient", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@BorrowClientID", BorrowClientID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable VisitorAddEdit(string ID, string SSN, string FullName, string Email, string Phone, string Mobile, string Address, string Notes, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("VisitorAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SSN", SSN);
            DA.SelectCommand.Parameters.AddWithValue("@FullName", FullName);
            DA.SelectCommand.Parameters.AddWithValue("@Email", Email);
            DA.SelectCommand.Parameters.AddWithValue("@Phone", Phone);
            DA.SelectCommand.Parameters.AddWithValue("@Mobile", Mobile);
            DA.SelectCommand.Parameters.AddWithValue("@Address", Address);
            DA.SelectCommand.Parameters.AddWithValue("@Notes", Notes);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
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

    public static DataTable VisitorDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("VisitorDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ContainerCategoryAddEdit(string ID, string Name, string NumberFrom, string NumberTo, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ContainerCategoryAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@Name", Name);
            DA.SelectCommand.Parameters.AddWithValue("@NumberFrom", NumberFrom);
            DA.SelectCommand.Parameters.AddWithValue("@NumberTo", NumberTo);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ContainerCategoryGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ContainerCategoryGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ContainerCategoryDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ContainerCategoryDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StdMessageAdd(string EmployeeID, string StudentID, string Jawwal, string MessageBody, bool SendStatus)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdMessageAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Jawwal", Jawwal);
            DA.SelectCommand.Parameters.AddWithValue("@MessageBody", MessageBody);
            DA.SelectCommand.Parameters.AddWithValue("@SendStatus", SendStatus);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetClientBorrowedBooks(string ClientID, string BorrowCategoryID, string DateFrom, string DateTo)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetClientBorrowedBooks", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ClientID", ClientID);
            DA.SelectCommand.Parameters.AddWithValue("@BorrowCategoryID", BorrowCategoryID);
            if (DateFrom != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", DateFrom);
            if (DateTo != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", DateTo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetClientInfo(string ClientID, string BorrowCategoryID, string DateFrom, string DateTo)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetClientInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ClientID", ClientID);
            DA.SelectCommand.Parameters.AddWithValue("@BorrowCategoryID", BorrowCategoryID);
            if (DateFrom != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", DateFrom);
            if (DateTo != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", DateTo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetBookBorrow(string BookID, string BorrowDateFrom, string BorrowDateTo, string ReturnDateFrom, string ReturnDateTo, string BorrowStatusID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetBookBorrow", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (BookID != "")
                DA.SelectCommand.Parameters.AddWithValue("@BookID", BookID);
            if (BorrowDateFrom != "")
                DA.SelectCommand.Parameters.AddWithValue("@BorrowDateFrom", BorrowDateFrom);
            if (BorrowDateTo != "")
                DA.SelectCommand.Parameters.AddWithValue("@BorrowDateTo", BorrowDateTo);
            if (ReturnDateFrom != "")
                DA.SelectCommand.Parameters.AddWithValue("@ReturnDateFrom", BorrowDateFrom);
            if (ReturnDateTo != "")
                DA.SelectCommand.Parameters.AddWithValue("@ReturnDateTo", BorrowDateTo);
            DA.SelectCommand.Parameters.AddWithValue("@BorrowStatusID", BorrowStatusID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetBookReportInfo(string BookID, string DateFrom, string DateTo)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetBookReportInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (BookID != "")
                DA.SelectCommand.Parameters.AddWithValue("@BookID", BookID);
            if (DateFrom != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", DateFrom);
            if (DateTo != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", DateTo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetBookLanguageStatistics(string DateFrom, string DateTo)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetBookLanguageStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (DateFrom != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", DateFrom);
            if (DateTo != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", DateTo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetBookContainerTypeStatistics(string DateFrom, string DateTo)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetBookContainerTypeStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (DateFrom != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", DateFrom);
            if (DateTo != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", DateTo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetBookContainerCategoryStatistics(string DateFrom, string DateTo)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetBookContainerCategoryStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (DateFrom != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", DateFrom);
            if (DateTo != "")
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", DateTo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetFilterdBooksQR(string ID, string ContainerNo, string BookNo, string ISBN, string ContainerTitel, string BookTitlel1, string ContainerID, string PersonName, string PublisherYear, string Flag)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetFilterdBooksQR", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", @ID);
            if (ContainerNo != "")
                DA.SelectCommand.Parameters.AddWithValue("@ContainerNo", ContainerNo);
            if (BookNo != "")
                DA.SelectCommand.Parameters.AddWithValue("@BookNo", BookNo);
            if (ISBN != "")
                DA.SelectCommand.Parameters.AddWithValue("@ISBN", ISBN);
            if (ContainerTitel != "")
                DA.SelectCommand.Parameters.AddWithValue("@ContainerTitel", ContainerTitel);
            if (BookTitlel1 != "")
                DA.SelectCommand.Parameters.AddWithValue("@BookTitlel1", BookTitlel1);
            if (ContainerID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ContainerID", ContainerID);
            if (PersonName != "")
                DA.SelectCommand.Parameters.AddWithValue("@PersonName", PersonName);
            if (PublisherYear != "")
                DA.SelectCommand.Parameters.AddWithValue("@PublisherYear", PublisherYear);
            if (Flag != "")
                DA.SelectCommand.Parameters.AddWithValue("@Flag", Flag);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetFilterdContainersReport(string ContainerNo, string ContainerTitle, string ContainerCategoryFrom, string ContainerCategoryTo)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetFilterdContainersReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ContainerNo != "")
                DA.SelectCommand.Parameters.AddWithValue("@ContainerNo", ContainerNo);
            if (ContainerTitle != "")
                DA.SelectCommand.Parameters.AddWithValue("@Title", ContainerTitle);
            if (ContainerCategoryFrom != "")
                DA.SelectCommand.Parameters.AddWithValue("@ContainerCategoryFrom", ContainerCategoryFrom);
            if (ContainerCategoryTo != "")
                DA.SelectCommand.Parameters.AddWithValue("@ContainerCategoryTo", ContainerCategoryTo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetFilterdContainersReport2(string ContainerNo, string ContainerTitle, string ContainerCategoryFrom, string ContainerCategoryTo)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetFilterdContainersReport2", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ContainerNo != "")
                DA.SelectCommand.Parameters.AddWithValue("@ContainerNo", ContainerNo);
            if (ContainerTitle != "")
                DA.SelectCommand.Parameters.AddWithValue("@Title", ContainerTitle);
            if (ContainerCategoryFrom != "")
                DA.SelectCommand.Parameters.AddWithValue("@ContainerCategoryFrom", ContainerCategoryFrom);
            if (ContainerCategoryTo != "")
                DA.SelectCommand.Parameters.AddWithValue("@ContainerCategoryTo", ContainerCategoryTo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region BookPeriodical

    public static DataTable BookPeriodicalTitleGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookPeriodicalTitleGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BookPeriodicalTitleDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookPeriodicalTitleDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BookPeriodicalTitlesAddEdit(string ID, string BookID, string PeriodicalSubTitle, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookPeriodicalTitlesAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@BookID", BookID);
            DA.SelectCommand.Parameters.AddWithValue("@PeriodicalSubTitle", PeriodicalSubTitle);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable PeriodicalTitlePersonAddEdit(string ID, string PeriodicalTitleID, string TitlePersonName, string PersonTypeID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PeriodicalTitlePersonAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@PeriodicalTitleID", PeriodicalTitleID);
            DA.SelectCommand.Parameters.AddWithValue("@TitlePersonName", TitlePersonName);
            DA.SelectCommand.Parameters.AddWithValue("@PersonTypeID", PersonTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable PeriodicalTitlePersonGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PeriodicalTitlePersonGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable PeriodicalTitlePersonDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PeriodicalTitlePersonDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetPeriodicalTitlePerson(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPeriodicalTitlePerson", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PeriodicalTitleID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion



    public static DataTable GetBookNos()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetBookNos", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable BookAddBarCode(int BookID, byte[] image)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BookAddBarCode", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@BookID", BookID);
            DA.SelectCommand.Parameters.AddWithValue("@image", image);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



}