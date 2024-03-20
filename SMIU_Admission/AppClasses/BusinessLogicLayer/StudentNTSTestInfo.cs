using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using SMIU_Admission.AppClasses.DataAccessLayer;
using System.Data;
using System.Configuration;


namespace SMIU_Admission.AppClasses.BusinessLogicLayer
{
    public class StudentNTSTestInfo
    {

        #region Fields & Properties
        public int StudentID { get; set; }
        public string NTSTestType { get; set; }
        public DateTime? NTSDate { get; set; }
        public string NTSRollNumber { get; set; }
        public int? NTSTestScore { get; set; }
        public int? NTSTestMaxScore { get; set; }
        public string NTSTestingService { get; set; }

        #endregion

        #region  Insert Student NTS Test Information With Transaction
        public bool InsertStudentNTSTestInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[7];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@NTSTestType", NTSTestType);
                sqlparams[2] = new SqlParameter("@NTSDate", NTSDate);
                sqlparams[3] = new SqlParameter("@NTSRollNumber", NTSRollNumber);
                sqlparams[4] = new SqlParameter("@NTSTestScore", NTSTestScore);
                sqlparams[5] = new SqlParameter("@NTSTestingService", NTSTestingService);
                sqlparams[6] = new SqlParameter("@NTSTestMaxScore", NTSTestMaxScore);               
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertStudentNTSTestInfo", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion


        #region  Update Student NTS Test Information With Transaction
        public bool UpdateStudentNTSTestInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[7];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@NTSTestType", NTSTestType);
                sqlparams[2] = new SqlParameter("@NTSDate", NTSDate);
                sqlparams[3] = new SqlParameter("@NTSRollNumber", NTSRollNumber);
                sqlparams[4] = new SqlParameter("@NTSTestScore", NTSTestScore);
                sqlparams[5] = new SqlParameter("@NTSTestingService", NTSTestingService);
                sqlparams[6] = new SqlParameter("@NTSTestMaxScore", NTSTestMaxScore);    
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "UpdateStudentNTSTestInfo", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion


        #region  Delete Student  NTS Test Information With Transaction
        public bool DeleteStudentNTSTestInformation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "DeleteStudentNTSTestInformation", sqlparams).ToString();
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