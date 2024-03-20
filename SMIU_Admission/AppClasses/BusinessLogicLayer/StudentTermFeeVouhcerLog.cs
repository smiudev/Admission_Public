using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using SMIU_Admission.AppClasses.DataAccessLayer;
using System.Configuration;
using System.Text;
using System.Data;

namespace SMIU_Admission.AppClasses.BusinessLogicLayer
{
    public class StudentTermFeeVouhcerLog
    {
        #region fields & Properties

        public int FeeVoucherID { get; set; }
        public int StudentID { get; set; }
        public int SemesterID { get; set; }
        public string InsertedBy { get; set; }
        public DateTime InsertedDate { get; set; }

        #endregion
        #region Insert Fee Voucher log
        public bool InsertSemesterFeeVoucherLog()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[4];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@SemesterID", SemesterID);
                sqlparams[2] = new SqlParameter("@InsertedBy", InsertedBy == string.Empty ? Convert.DBNull : InsertedBy);
                sqlparams[3] = new SqlParameter("@InsertedDate", InsertedDate == null ? Convert.DBNull : InsertedDate);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "InsertSemesterFeeVoucherLog", sqlparams);
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