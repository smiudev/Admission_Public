using SMIU_Admission.AppClasses.DataAccessLayer;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SMIU_Admission.AppClasses.BusinessLogicLayer
{
    public class FeeVoucherInfo
    {
        #region Fields & Properties
        public int ID { get; set; }
        public string VoucherID { get; set; }
        public int StudentID { get; set; }
        public string FormStatus { get; set; }


        #endregion

        #region  Insert Student Fee Voucher  Information With Transaction
        //public bool InsertStudentFeeVoucherInfo(SqlTransaction sqltrans)
        //{
        //    try
        //    {
        //        SqlParameter[] sqlparams = new SqlParameter[2];
        //        sqlparams[0] = new SqlParameter("@StudentID", StudentID);
        //        sqlparams[1] = new SqlParameter("@FormStatus", FormStatus);
        //        string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
        //        SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertStudentFeeVoucherInfo", sqlparams).ToString();
        //    }
        //    catch
        //    {
        //        return false;
        //    }
        //    return true;
        //}

        public bool InsertStudentFeeVoucherInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@FormStatus", FormStatus);
                sqlparams[2] = new SqlParameter("@VoucherID", VoucherID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertStudentFeeVoucherInfo2", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        public int InsertStudentFeeVoucherInfo()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[3];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@FormStatus", FormStatus);
                sqlparams[2] = new SqlParameter("@VoucherID", VoucherID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "InsertStudentFeeVoucherInfo2", sqlparams).ToString();
                return 1;
            }
            catch
            {
                return -1;
            }
            return 0;
        }
        #endregion

        #region  Delete Student Fee Voucher Information With Transaction
        public bool DeleteStudentFeeVoucherInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "DeleteStudentFeeVoucherInfo", sqlparams).ToString();
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