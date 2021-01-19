using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmployeePersonal;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmployeePersonalDA: DBConnection
    {
        #region EmployeeMainData

        public static DataTable EmployeePersonalGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeePersonalGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeePersonalMainDataUpdate(EmployeeMainData model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeePersonalMainDataUpdate", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@ArNameTitle", model.ArNameTitle);
                DA.SelectCommand.Parameters.AddWithValue("@EnNameTitle", model.EnNameTitle);
                DA.SelectCommand.Parameters.AddWithValue("@ArFirstName", model.ArFirstName);
                DA.SelectCommand.Parameters.AddWithValue("@ArSecoundName", model.ArSecoundName);
                DA.SelectCommand.Parameters.AddWithValue("@ArThirdName", model.ArThirdName);
                DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName", model.ArFamilyName);
                DA.SelectCommand.Parameters.AddWithValue("@EnFirstName", model.EnFirstName);
                DA.SelectCommand.Parameters.AddWithValue("@EnSecoundName", model.EnSecoundName);
                DA.SelectCommand.Parameters.AddWithValue("@EnThirdName", model.EnThirdName);
                DA.SelectCommand.Parameters.AddWithValue("@EnFamilyName", model.EnFamilyName);
                DA.SelectCommand.Parameters.AddWithValue("@SSN", model.SSN);
                DA.SelectCommand.Parameters.AddWithValue("@GenderID", model.GenderID);
                DA.SelectCommand.Parameters.AddWithValue("@MaritalStatusID", model.MaritalStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@Passport", model.Passport);
                DA.SelectCommand.Parameters.AddWithValue("@PlaceOfBirth", model.PlaceOfBirth);
                DA.SelectCommand.Parameters.AddWithValue("@DateOfBirth", model.DateOfBirth);
                DA.SelectCommand.Parameters.AddWithValue("@ReligionID", model.ReligionID);
                DA.SelectCommand.Parameters.AddWithValue("@NationalityID", model.NationalityID);
                DA.SelectCommand.Parameters.AddWithValue("@MotherName", model.MotherName);
                DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region EmployeeContactData

        public static DataTable EmployeePersonalContactDataUpdate(EmployeeContactData model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeePersonalContactDataUpdate", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@CountryID", model.CountryID);
                DA.SelectCommand.Parameters.AddWithValue("@GovernorateID", model.GovernorateID);
                DA.SelectCommand.Parameters.AddWithValue("@CityID", model.CityID);
                DA.SelectCommand.Parameters.AddWithValue("@Neighborhood", model.Neighborhood);
                DA.SelectCommand.Parameters.AddWithValue("@Street", model.Street);
                DA.SelectCommand.Parameters.AddWithValue("@HomeNo", model.HomeNo);
                DA.SelectCommand.Parameters.AddWithValue("@AddressDetails", model.AddressDetails);
                DA.SelectCommand.Parameters.AddWithValue("@Phone", model.Phone);
                DA.SelectCommand.Parameters.AddWithValue("@Mobile", model.Mobile);
                DA.SelectCommand.Parameters.AddWithValue("@Email", model.Email);
                DA.SelectCommand.Parameters.AddWithValue("@UniversityEmail", model.UniversityEmail);
                DA.SelectCommand.Parameters.AddWithValue("@Fax", model.Fax);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

    }
}
