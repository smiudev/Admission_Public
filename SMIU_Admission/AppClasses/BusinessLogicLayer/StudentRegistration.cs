using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using SMIU_Admission.AppClasses.DataAccessLayer;
using System.Data;
using System.Configuration;
using SMIU_Admission.AppClasses.UtilityClasses;

namespace SMIU_Admission.AppClasses.BusinessLogicLayer
{
    public class StudentRegistration
    {
        #region Fields & Properties
        public int RegistrationID { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public string CNICNumber { get; set; }
        public DateTime DateofBirth { get; set; }
        public string EmailAddress { get; set; }
        public Int64 MobileNumber { get; set; }
        public Int64? HomePhoneNumber { get; set; }
        public string Password { get; set; }
        public int SemesterId { get; set; }

        
        //New Initial Registration
        public string Degree { get; set; }
        public int DegreeCode { get; set; }
        public string Program { get; set; }
        public int ProgramCode { get; set; }
        public bool ResultAwaiting { get; set; }
        public string Percentage { get; set; }
        public string CGPA { get; set; }

        #endregion

        #region  Insert Student Registration Informaiton

        public bool New_InsertStudentRegistrationlInfo()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[13];
                sqlparams[0] = new SqlParameter("@Name", FirstName);
                sqlparams[1] = new SqlParameter("@Degree",Degree);
                sqlparams[2] = new SqlParameter("@DegreeCode", DegreeCode);
                sqlparams[3] = new SqlParameter("@Program", Program);
                sqlparams[4] = new SqlParameter("@ProgramCode", ProgramCode);
                sqlparams[5] = new SqlParameter("@ResultAwaiting", ResultAwaiting);
                sqlparams[6] = new SqlParameter("@Percentage", Percentage);
                sqlparams[7] = new SqlParameter("@CGPA", CGPA);
                sqlparams[8] = new SqlParameter("@CNIC", CNICNumber);
                sqlparams[9] = new SqlParameter("@Email", EmailAddress);
                sqlparams[10] = new SqlParameter("@Mobile", MobileNumber);
                sqlparams[11] = new SqlParameter("@Password", Password);
                sqlparams[12] = new SqlParameter("@SemesterId", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "NEW_InsertInitialRegInfo", sqlparams).ToString();
            }
            catch(Exception ex)
            {
                return false;
            }
            return true;
        }

        public bool InsertStudentRegistrationlInfo()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[11];
                sqlparams[0] = new SqlParameter("@FirstName", FirstName);
                sqlparams[1] = new SqlParameter("@MiddleName", string.IsNullOrEmpty(MiddleName) ? Convert.DBNull : MiddleName);
                sqlparams[2] = new SqlParameter("@LastName", string.IsNullOrEmpty(LastName) ? Convert.DBNull : LastName);
                sqlparams[3] = new SqlParameter("@Gender", Gender);
                sqlparams[4] = new SqlParameter("@CNICNumber", CNICNumber);
                sqlparams[5] = new SqlParameter("@DateofBirth", DateofBirth.Year==1?DateTime.Now: DateofBirth);
                sqlparams[6] = new SqlParameter("@EmailAddress", EmailAddress);
                sqlparams[7] = new SqlParameter("@MobileNumber", MobileNumber);
                sqlparams[8] = new SqlParameter("@HomePhoneNumber", HomePhoneNumber);               
                sqlparams[9] = new SqlParameter("@Password", Password);
                sqlparams[10] = new SqlParameter("@SemesterId", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "InsertStudentRegistrationInfo", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion

        #region Check if CNIC  is already exist
        public DataTable CheckIfCNICAleadyExist()
        {
            DataTable dtEmailInfo = new DataTable();
            try
            {
                SqlParameter[] sqlParams = new SqlParameter[2];
                sqlParams[0] = new SqlParameter("@CNICNumber", CNICNumber);
                sqlParams[1] = new SqlParameter("@SemesterId", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dtEmailInfo = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "CheckIfStudentCNICAleadyExist", sqlParams).Tables[0];
            }
            catch { }
            return dtEmailInfo;
        }

        public DataTable CheckIfEmailAleadyExist()
        {
            DataTable dtEmailInfo = new DataTable();
            try
            {
                SqlParameter[] sqlParams = new SqlParameter[2];
                sqlParams[0] = new SqlParameter("@EmailAddress", EmailAddress);
                sqlParams[1] = new SqlParameter("@SemesterId", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dtEmailInfo = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "CheckIfStudentEmailAleadyExist", sqlParams).Tables[0];
            }
            catch { }
            return dtEmailInfo;
        }
        #endregion
        public DataTable GetStudentInfobyUserNamePassword()
        {
            DataTable dttudentInfo = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@EmailAddress", EmailAddress);
                sqlparams[1] = new SqlParameter("@Password", Password);
                sqlparams[2] = new SqlParameter("@SemesterId", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dttudentInfo = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfobyUserNamePassword", sqlparams).Tables[0];
            }
            catch(Exception ex)
            {
            }
            return dttudentInfo;
        }

        public bool UpdateStudentCredentailsByRegistrationID()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[4];
                sqlparams[0] = new SqlParameter("@RegistrationID", RegistrationID);
                sqlparams[1] = new SqlParameter("@EmailAddress", EmailAddress);
                sqlparams[2] = new SqlParameter("@Password", Password);
                sqlparams[3] = new SqlParameter("@SemesterId", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "UpdateStudentCredentailsByRegistrationID", sqlparams);
                return true;
            }
            catch (Exception ex)
            {
            }
            return false;
        }
        //public bool DeleteStudentCredentailsByRegistrationID()
        //{
        //    try
        //    {
        //        SqlParameter[] sqlparams = new SqlParameter[3];
        //        sqlparams[0] = new SqlParameter("@RegistrationID", RegistrationID);
        //        sqlparams[3] = new SqlParameter("@SemesterId", SemesterId);
        //        string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
        //        SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "DeleteStudentCredentailsByRegistrationID", sqlparams);
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    return false;
        //}
        public DataTable GetStudentInfoByRegistrationID()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@RegistrationID", RegistrationID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfoByRegistrationID", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetStudentAccountByCNIC()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@CNICNumber", CNICNumber);
                sqlparams[1] = new SqlParameter("@SemesterID", SemesterId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentAccountByCNIC", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }
        public DataTable GetStudentInfobyEmailAddressAndCNICNUmber()
        {
            DataTable dttudentInfo = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@EmailAddress", EmailAddress);
                sqlparams[1] = new SqlParameter("@CNICNumber", CNICNumber);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dttudentInfo = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentInfobyEmailAddressAndCNICNUmber", sqlparams).Tables[0];
            }
            catch
            {
            }
            return dttudentInfo;
        }

    }
}