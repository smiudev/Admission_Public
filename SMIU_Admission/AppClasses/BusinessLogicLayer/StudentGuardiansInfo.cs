using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using SMIU_Admission.AppClasses.DataAccessLayer;
using System.Data;
using System.Configuration;
using System.Drawing;
using System.Net.Mail;

namespace SMIU_Admission.AppClasses.BusinessLogicLayer
{
    public class StudentGuardiansInfo
    {
        #region Fields & Properties
        public int StudentID { get; set; }
        public string GuardiansName { get; set; }
        public string GuardiansOccupation { get; set; }
        public string GuardiansAddress { get; set; }
        public string GuardiansRelation { get; set; }
        public string GuardiansNatureofJob { get; set; }
        public string GuardiansOrganization { get; set; }
        public string GuardiansDesignation { get; set; }
        public int? GuardiansMonthlyIncome { get; set; }
        public Int64? GuardianMobileNumber { get; set; }

        //

        public string EmergencyContactName { get; set; }
        public string EmergencyMobile { get; set; }
        public string EmergencyAddress { get; set; }
        public string EmergencyRelation { get; set; }

        #endregion

        public int NEW_InsertStudentGuardianEmergencyInfo()
        {
            int result = -1;
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[14];
                sqlparams[0] = new SqlParameter("@StudentId", StudentID);
                sqlparams[1] = new SqlParameter("@GuardianMobileNumber", GuardianMobileNumber);
                sqlparams[2] = new SqlParameter("@GuardiansAddress", GuardiansAddress);
                sqlparams[3] = new SqlParameter("@GuardiansDesignation", GuardiansDesignation);
                sqlparams[4] = new SqlParameter("@GuardiansMonthlyIncome", GuardiansMonthlyIncome);
                sqlparams[5] = new SqlParameter("@GuardiansName", GuardiansName);
                sqlparams[6] = new SqlParameter("@GuardiansNatureofJob", GuardiansNatureofJob);
                sqlparams[7] = new SqlParameter("@GuardiansOccupation", GuardiansOccupation);
                sqlparams[8] = new SqlParameter("@GuardiansOrganization", GuardiansOrganization);
                sqlparams[9] = new SqlParameter("@GuardiansRelation", GuardiansRelation);
                sqlparams[10] = new SqlParameter("@EmergencyRelation", EmergencyRelation);
                sqlparams[11] = new SqlParameter("@EmergencyAddress", EmergencyAddress);
                sqlparams[12] = new SqlParameter("@EmergencyMobile", EmergencyMobile);
                sqlparams[13] = new SqlParameter("@EmergencyContactName", EmergencyContactName);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                result = int.Parse(SqlHelper.ExecuteScalar(conn, CommandType.StoredProcedure, "NEW_InsertStudentGuardianEmergencyInfo", sqlparams).ToString());
            }
            catch (Exception ex)
            {
                return -1;
            }
            return result;
        }

        public DataTable NEW_GetGuardianEmergencyInfoDataByStudentId()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "NEW_GetGuardianEmergencyInfoDataByStudentId", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        #region  Insert Student Guardian Information With Transaction
        public bool InsertStudentGuardianInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[10];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@GuardiansName", GuardiansName);
                sqlparams[2] = new SqlParameter("@GuardiansOccupation", string.IsNullOrEmpty(GuardiansOccupation) ? Convert.DBNull : GuardiansOccupation);
                sqlparams[3] = new SqlParameter("@GuardiansAddress", GuardiansAddress);
                sqlparams[4] = new SqlParameter("@GuardiansRelation", string.IsNullOrEmpty(GuardiansRelation) ? Convert.DBNull : GuardiansRelation);
                sqlparams[5] = new SqlParameter("@GuardiansNatureofJob", string.IsNullOrEmpty(GuardiansNatureofJob) ? Convert.DBNull : GuardiansNatureofJob);
                sqlparams[6] = new SqlParameter("@GuardiansOrganization", string.IsNullOrEmpty(GuardiansOrganization) ? Convert.DBNull : GuardiansOrganization);
                sqlparams[7] = new SqlParameter("@GuardiansDesignation", string.IsNullOrEmpty(GuardiansDesignation) ? Convert.DBNull : GuardiansDesignation);
                sqlparams[8] = new SqlParameter("@GuardiansMonthlyIncome", GuardiansMonthlyIncome);
                sqlparams[9] = new SqlParameter("@GuardianMobileNumber", GuardianMobileNumber);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertStudentGuardianInfo", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion


        #region  Update  Student Guardian Information With Transaction
        public bool UpdateStudentGuardianInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[10];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@GuardiansName", GuardiansName);
                sqlparams[2] = new SqlParameter("@GuardiansOccupation", string.IsNullOrEmpty(GuardiansOccupation) ? Convert.DBNull : GuardiansOccupation);
                sqlparams[3] = new SqlParameter("@GuardiansAddress", GuardiansAddress);
                sqlparams[4] = new SqlParameter("@GuardiansRelation", string.IsNullOrEmpty(GuardiansRelation) ? Convert.DBNull : GuardiansRelation);
                sqlparams[5] = new SqlParameter("@GuardiansNatureofJob", string.IsNullOrEmpty(GuardiansNatureofJob) ? Convert.DBNull : GuardiansNatureofJob);
                sqlparams[6] = new SqlParameter("@GuardiansOrganization", string.IsNullOrEmpty(GuardiansOrganization) ? Convert.DBNull : GuardiansOrganization);
                sqlparams[7] = new SqlParameter("@GuardiansDesignation", string.IsNullOrEmpty(GuardiansDesignation) ? Convert.DBNull : GuardiansDesignation);
                sqlparams[8] = new SqlParameter("@GuardiansMonthlyIncome", GuardiansMonthlyIncome);
                sqlparams[9] = new SqlParameter("@GuardianMobileNumber", GuardianMobileNumber);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "UpdateStudentGuardianInfo", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion

        #region  Delete Student  Guardian Information With Transaction
        public bool DeleteStudentGuardianInformation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "DeleteStudentGuardianInformation", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion



    }
}