using Oracle.ManagedDataAccess.Client;
using System;
using System.Configuration;
using System.Data;

namespace QMS.DataAccessLayer
{
    public class Oracle_DB
    {
        readonly string SMIUConnection;
        readonly OracleConnection con;
        readonly OracleCommand cmd;

        public Oracle_DB()
        {
            SMIUConnection = ConfigurationManager.ConnectionStrings["Oracle_DB"].ConnectionString;
            //   SMIUConnection = "Data Source=(DESCRIPTION="
            //+ "(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.0.101.12)(PORT=1521)))"
            //+ "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=PSSMIU)));"
            //+ "User Id=SYSADM;Password=MANJEN;";
            con = new OracleConnection(SMIUConnection);
            cmd = new OracleCommand()
            {
                Connection = con
            };
        }

        public DataTable GetStudentVoucherInfo(string StudentId)
        {
            DataTable dt = new DataTable();

            try
            {
                if (cmd.Connection.State == System.Data.ConnectionState.Closed)
                    cmd.Connection.Open();
                cmd.CommandText = $"Select * From PS_SMIU_FEE_TBL";
                
                dt.Load(cmd.ExecuteReader());

                if (cmd.Connection.State == ConnectionState.Open)
                    cmd.Connection.Close();
            }
            catch { cmd.Dispose(); }
            return dt;
        }
        public DataTable GetStudentSemesterVoucherInfo(string StudentId)
        {
            DataTable dt = new DataTable();

            try
            {
                if (cmd.Connection.State == System.Data.ConnectionState.Closed)
                    cmd.Connection.Open();
                cmd.CommandText = $"Select Count(*) From PS_SMIU_FE_VCHR_TB";
                //cmd.CommandText = $"Select * From PS_SMIU_FE_VCHR_TB Where EMPLID='{StudentId}'";

                dt.Load(cmd.ExecuteReader());

                if (cmd.Connection.State == ConnectionState.Open)
                    cmd.Connection.Close();
            }
            catch { cmd.Dispose(); }
            return dt;
        }
        

        public long GetNextChallanNo()
        {
            long challanNo=-1;
            DataTable dt = new DataTable();

            try
            {
                if (cmd.Connection.State == System.Data.ConnectionState.Closed)
                    cmd.Connection.Open();
                cmd.CommandText = $"Select * From PS_SMIU_FEE_TBL";
                //cmd.CommandText = $"Select Max(SMIU_FEE_CHLN_NO) From PS_SMIU_FEE_TBL";
                dt.Load(cmd.ExecuteReader());
                if(dt.Rows.Count > 0)
                {
                    if (dt.Rows[0][0]!=null && string.IsNullOrEmpty(dt.Rows[0][0].ToString()))
                        challanNo = long.Parse(ConfigurationManager.AppSettings["FirstOnlineVoucherNo"].ToString());
                    else
                        challanNo = long.Parse(dt.Rows[0][0].ToString()) + 1;
                }

                if (cmd.Connection.State == ConnectionState.Open)
                    cmd.Connection.Close();
            }
            catch { cmd.Dispose(); }
            return challanNo;
        }

        public int ChallanExist(long challanNo)
        {
            DataTable dt = new DataTable();

            try
            {
                if (cmd.Connection.State == System.Data.ConnectionState.Closed)
                    cmd.Connection.Open();
                cmd.CommandText = $"Select * From PS_SMIU_FEE_TBL Where SMIU_FEE_CHLN_NO='{challanNo}'";
                dt.Load(cmd.ExecuteReader());
                if (dt.Rows.Count > 0)
                {
                    return 1;
                }

                if (cmd.Connection.State == ConnectionState.Open)
                    cmd.Connection.Close();
            }
            catch { cmd.Dispose(); return -1; }
            return 0;
        }

        public int IsAlreadyPaid(int StudentId)
        {
            DataTable dt = new DataTable();

            try
            {
                if (cmd.Connection.State == System.Data.ConnectionState.Closed)
                    cmd.Connection.Open();
                cmd.CommandText = $"Select * From PS_SMIU_FE_VCHR_TB Where EMPLID='{StudentId}'";
                dt.Load(cmd.ExecuteReader());
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["AlreadyPaid"] != null && dt.Rows[0]["AlreadyPaid"].ToString() == "true")
                    {
                        return 1;
                    }
                    else
                    {
                        return 0;
                    }
                }

                if (cmd.Connection.State == ConnectionState.Open)
                    cmd.Connection.Close();
            }
            catch { cmd.Dispose(); }
            return -1;
        }

        public DataTable GetVoucherInfoCMS(string SemesterId)
        {
            DataTable dt = new DataTable();
            
            try
            {
                if (cmd.Connection.State == System.Data.ConnectionState.Closed)
                    cmd.Connection.Open();
                cmd.CommandText = $"Select * From TABLE Where SemesterId='{SemesterId}'";
                var data = cmd.ExecuteReader();
                while (data.Read())
                {

                }
                if (cmd.Connection.State == ConnectionState.Open)
                    cmd.Connection.Close();
            }
            catch { cmd.Dispose(); }
            return dt;
        }
        public int InsertVoucherInfoCMS(string StudentId, long Challan)
        {
            int result = -1;
            
            try
            {
                if (cmd.Connection.State == System.Data.ConnectionState.Closed)
                    cmd.Connection.Open();
                //cmd.CommandText = $"Delete From PS_SMIU_FEE_TBL";
                //cmd.CommandText = $"Update PS_SMIU_FEE_TBL Set SMIU_Amount=1";
                //cmd.CommandText = $"Insert into PS_SMIU_FEE_TBL" +
                //$"(SMIU_VLD_TIL,SMIU_STDNT_ID,SMIU_STDNT_NAME,SMIU_FEE_PROG, SMIU_FEE_CHLN_NO,SMIU_AMOUNT,SMIU_FEE_TYPE,SMIU_STRM,SMIU_CREATED_BY,SMIU_CREATED_DT,SMIU_FE_REMARKS,ALREADYPAID,TRANSCATIONID)" +
                //$"VALUES" +
                //$"('05/Dec/2023','" + StudentId + "','Razzaq','BBA','" + Challan + @"','1','Application Processing Fee','2401','Test','22/Dec/2023','Test','False','Test123')";

                result = cmd.ExecuteNonQuery();

                if (cmd.Connection.State == ConnectionState.Open)
                    cmd.Connection.Close();
            }
            catch { cmd.Dispose(); }
            return result;
        }
        public int InsertVoucherInfoCMS(DataTable dtApplicant, long Challan)
        {
            int Fee = int.Parse(dtApplicant.Rows[0]["FeeAmount"].ToString());
            int TransactionFee = int.Parse(ConfigurationManager.AppSettings["TransactionFee"].ToString());
            int TotalFee = Fee + TransactionFee;
            int result = -1;
            try
            {
                if (cmd.Connection.State == System.Data.ConnectionState.Closed)
                    cmd.Connection.Open();
                //cmd.CommandText = $"Delete From PS_SMIU_FEE_TBL Where SMIU_STDNT_NAME='Test'";
                cmd.CommandText = $"INSERT INTO PS_SMIU_FEE_TBL" +
                $"(SMIU_VLD_TIL,SMIU_STDNT_ID,SMIU_STDNT_NAME,SMIU_FEE_PROG,SMIU_FEE_CHLN_NO,SMIU_AMOUNT,SMIU_FEE_TYPE,SMIU_STRM,SMIU_CREATED_BY,SMIU_CREATED_DT,ALREADYPAID)" +
                $"VALUES" +
                $"('{DateTime.Parse(dtApplicant.Rows[0]["ValidDate"].ToString()).ToString("dd-MMM-yyyy")}','" + dtApplicant.Rows[0]["StudentID"].ToString() + $"','{dtApplicant.Rows[0]["StudentName"]}','{dtApplicant.Rows[0]["FirstChoice"]}','{Challan}','{TotalFee}','{dtApplicant.Rows[0]["FeeType"]}','{dtApplicant.Rows[0]["SemesterTerm"]}','Admission','{DateTime.Now.ToString("dd-MMM-yyyy")}','false')";

                result = cmd.ExecuteNonQuery();

                if (cmd.Connection.State == ConnectionState.Open)
                    cmd.Connection.Close();
            }
            catch { cmd.Dispose(); }

            return result;
        }

        public int ApplyInstallmentCMS(int StudentId, int TutionFee)
        {
            int result = -1;
            try
            {
                if (cmd.Connection.State == System.Data.ConnectionState.Closed)
                    cmd.Connection.Open();
                cmd.CommandText = $"Update PS_SMIU_FE_VCHR_TB SET SMIU_TUTN_FEE = " + TutionFee + ", SMIU_FE_REMARKS ='Installement' WHERE EMPLID ='" + StudentId + "'";
                result = cmd.ExecuteNonQuery();

                if (cmd.Connection.State == ConnectionState.Open)
                    cmd.Connection.Close();
            }
            catch { cmd.Dispose(); }

            return result;
        }
        public int DeleteVoucherInfoCMS(string StudentId, long Challan)
        {
            int result = -1;

            try
            {
                if (cmd.Connection.State == System.Data.ConnectionState.Closed)
                    cmd.Connection.Open();
                cmd.CommandText = $"Delete From PS_SMIU_FEE_TBL Where SMIU_FEE_CHLN_NO='{Challan}' AND SMIU_STDNT_ID='{StudentId}'";
                result = cmd.ExecuteNonQuery();

                if (cmd.Connection.State == ConnectionState.Open)
                    cmd.Connection.Close();
            }
            catch { cmd.Dispose(); }
            return result;
        }
    }
}
