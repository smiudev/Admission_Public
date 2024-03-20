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
    public class StudentProgramInfo
    {


        #region Fields & Properties
        public int StudentID { get; set; }
        public string DegreeProgram { get; set; }
        public int FirstChoiceCode { get; set; }
        public string FirstChoice { get; set; }
        public int? SecondChoiceCode { get; set; }
        public string SecondChoice { get; set; }
        public int? ThirdChoiceCode { get; set; }
        public string ThirdChoice { get; set; }
        public int? FourthChoiceCode { get; set; }
        public string FourthChoice { get; set; }
        public int? FifthChoiceCode { get; set; }
        public string FifthChoice { get; set; }
        public int? SixthChoiceCode { get; set; }
        public string SixthChoice { get; set; }
        public int? SeventhChoiceCode { get; set; }
        public string SeventhChoice { get; set; }
        public int? EighthChoiceCode { get; set; }
        public string EighthChoice { get; set; }
        public int? NinethChoiceCode { get; set; }
        public string NinethChoice { get; set; }
        public int? TenthChoiceCode { get; set; }
        public string TenthChoice { get; set; }

        public int? EleventhChoiceCode { get; set; }
        public string EleventhChoice { get; set; }
        public int? TwelfthChoiceCode { get; set; }
        public string TwelfthChoice { get; set; }
        public int? ThirteenthChoiceCode { get; set; }
        public string ThirteenthChoice { get; set; }
        public int? FourteenthChoiceCode { get; set; }
        public string FourteenthChoice { get; set; }
        public int? FifteenthChoiceCode { get; set; }
        public string FifteenthChoice { get; set; }
        public int? SixteenthChoiceCode { get; set; }
        public string SixteenthChoice { get; set; }
        public int? SeventeenthChoiceCode { get; set; }
        public string SeventeenthChoice { get; set; }
        public int? EighteenthChoiceCode { get; set; }
        public string EighteenthChoice { get; set; }
        public int? NineteenthChoiceCode { get; set; }
        public string NineteenthChoice { get; set; }
        public int? TwentiethChoiceCode { get; set; }
        public string TwentiethChoice { get; set; }

        public bool SelfFinance { get; set; }
        public bool Transport { get; set; }
        public string PickupLocation { get; set; }
        public string MediaFirstChoiceCode { get; set; }

        #endregion

        public DataTable NEW_GetDegreeProgramInfoDataByStudentId()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentId", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "NEW_GetDegreeProgramInfoDataByStudentId", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public bool NEW_InsertDegreeSelfAndTransportInfo(StudentProgramInfo progInfo)
        {
            bool result;
            SqlConnection sqlcon = null;
            SqlTransaction sqltrans = null;
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                sqlcon = new SqlConnection(conn);
                sqlcon.Open();

                sqltrans = sqlcon.BeginTransaction("NEW_InsertDegreeTransportInfo");
                result = progInfo.NEW_InsertStudentDegreeProgramInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertDegreeInfo");

                if (progInfo.Transport)
                {
                    StudentPersonalInfo objStuPer = new StudentPersonalInfo();
                    objStuPer.StudentID = this.StudentID;
                    objStuPer.TransportDesc = progInfo.PickupLocation;
                    result = objStuPer.NEW_UpdateTransportStatus(sqltrans);
                    if (!result)
                        throw new Exception("Error in Update and Transport Submission");
                }

                sqltrans.Commit();
                return true;
            }
            catch
            {
                sqltrans.Rollback("NEW_InsertDegreeTransportInfo");
                return false;
            }
            finally
            {
                if (sqlcon.State == ConnectionState.Open)
                    sqlcon.Close();
            }
        }


        public bool NEW_InsertStudentDegreeProgramInfo(SqlTransaction sqltrans)
        {   
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[23];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@DegreeProgram", DegreeProgram);
                sqlparams[2] = new SqlParameter("@FirstChoiceCode", FirstChoiceCode);
                sqlparams[3] = new SqlParameter("@FirstChoice", FirstChoice);
                sqlparams[4] = new SqlParameter("@SecondChoiceCode", SecondChoiceCode);
                sqlparams[5] = new SqlParameter("@SecondChoice", SecondChoice);
                sqlparams[6] = new SqlParameter("@ThirdChoiceCode", ThirdChoiceCode);
                sqlparams[7] = new SqlParameter("@ThirdChoice", ThirdChoice);
                sqlparams[8] = new SqlParameter("@FourthChoiceCode", FourthChoiceCode);
                sqlparams[9] = new SqlParameter("@FourthChoice", FourthChoice);
                sqlparams[10] = new SqlParameter("@FifthChoiceCode", FifthChoiceCode);
                sqlparams[11] = new SqlParameter("@FifthChoice", FifthChoice);
                sqlparams[12] = new SqlParameter("@SixthChoiceCode", SixthChoiceCode);
                sqlparams[13] = new SqlParameter("@SixthChoice", SixthChoice);
                sqlparams[14] = new SqlParameter("@SeventhChoiceCode", SeventhChoiceCode);
                sqlparams[15] = new SqlParameter("@SeventhChoice", SeventhChoice);
                sqlparams[16] = new SqlParameter("@EighthChoiceCode", EighthChoiceCode);
                sqlparams[17] = new SqlParameter("@EighthChoice", EighthChoice);
                sqlparams[18] = new SqlParameter("@NinethChoiceCode", NinethChoiceCode);
                sqlparams[19] = new SqlParameter("@NinethChoice", NinethChoice);
                sqlparams[20] = new SqlParameter("@TenthChoiceCode", TenthChoiceCode);
                sqlparams[21] = new SqlParameter("@TenthChoice", TenthChoice);
                sqlparams[22] = new SqlParameter("@SelfFinance", SelfFinance);

                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "NEW_InsertStudentDegreeprogramInfo", sqlparams).ToString();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        #region  Insert Student Choice Information With Transaction
        public bool InsertStudentProgramChoicInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[43];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@DegreeProgram", DegreeProgram);
                sqlparams[2] = new SqlParameter("@FirstChoiceCode", FirstChoiceCode);
                sqlparams[3] = new SqlParameter("@FirstChoice", FirstChoice);
                sqlparams[4] = new SqlParameter("@SecondChoiceCode", SecondChoiceCode);
                sqlparams[5] = new SqlParameter("@SecondChoice", SecondChoice);
                sqlparams[6] = new SqlParameter("@ThirdChoiceCode", ThirdChoiceCode);
                sqlparams[7] = new SqlParameter("@ThirdChoice", ThirdChoice);
                sqlparams[8] = new SqlParameter("@FourthChoiceCode", FourthChoiceCode);
                sqlparams[9] = new SqlParameter("@FourthChoice", FourthChoice);
                sqlparams[10] = new SqlParameter("@FifthChoiceCode", FifthChoiceCode);
                sqlparams[11] = new SqlParameter("@FifthChoice", FifthChoice);
                sqlparams[12] = new SqlParameter("@SixthChoiceCode", SixthChoiceCode);
                sqlparams[13] = new SqlParameter("@SixthChoice", SixthChoice);
                sqlparams[14] = new SqlParameter("@SeventhChoiceCode", SeventhChoiceCode);
                sqlparams[15] = new SqlParameter("@SeventhChoice", SeventhChoice);
                sqlparams[16] = new SqlParameter("@EighthChoiceCode", EighthChoiceCode);
                sqlparams[17] = new SqlParameter("@EighthChoice", EighthChoice);
                sqlparams[18] = new SqlParameter("@NinethChoiceCode", NinethChoiceCode);
                sqlparams[19] = new SqlParameter("@NinethChoice", NinethChoice);
                sqlparams[20] = new SqlParameter("@TenthChoiceCode", TenthChoiceCode);
                sqlparams[21] = new SqlParameter("@TenthChoice", TenthChoice);
                //
                sqlparams[22] = new SqlParameter("@EleventhChoiceCode", EleventhChoiceCode);
                sqlparams[23] = new SqlParameter("@EleventhChoice", EleventhChoice);
                sqlparams[24] = new SqlParameter("@TwelfthChoiceCode", TwelfthChoiceCode);
                sqlparams[25] = new SqlParameter("@TwelfthChoice", TwelfthChoice);
                sqlparams[26] = new SqlParameter("@ThirteenthChoiceCode", ThirteenthChoiceCode);
                sqlparams[27] = new SqlParameter("@ThirteenthChoice", ThirteenthChoice);
                sqlparams[28] = new SqlParameter("@FourteenthChoiceCode", FourteenthChoiceCode);
                sqlparams[29] = new SqlParameter("@FourteenthChoice", FourteenthChoice);
                sqlparams[30] = new SqlParameter("@FifteenthChoiceCode", FifteenthChoiceCode);
                sqlparams[31] = new SqlParameter("@FifteenthChoice", FifteenthChoice);
                sqlparams[32] = new SqlParameter("@SixteenthChoiceCode", SixteenthChoiceCode);
                sqlparams[33] = new SqlParameter("@SixteenthChoice", SixteenthChoice);
                sqlparams[34] = new SqlParameter("@SeventeenthChoiceCode", SeventeenthChoiceCode);
                sqlparams[35] = new SqlParameter("@SeventeenthChoice", SeventeenthChoice);
                sqlparams[36] = new SqlParameter("@EighteenthChoiceCode", EighteenthChoiceCode);
                sqlparams[37] = new SqlParameter("@EighteenthChoice", EighteenthChoice);
                sqlparams[38] = new SqlParameter("@NineteenthChoiceCode", NineteenthChoiceCode);
                sqlparams[39] = new SqlParameter("@NineteenthChoice", NineteenthChoice);
                sqlparams[40] = new SqlParameter("@TwentiethChoiceCode", TwentiethChoiceCode);
                sqlparams[41] = new SqlParameter("@TwentiethChoice", TwentiethChoice);
                sqlparams[42] = new SqlParameter("@SelfFinance", SelfFinance);   


                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertStudentProgramChoicInfo", sqlparams).ToString();
            }
            catch(Exception ex)
            {
                return false;
            }
            return true;
        }

        public bool InsertMediaStudentProgramChoicInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[4];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@CourseType", DegreeProgram);
                sqlparams[2] = new SqlParameter("@CourseCode", FirstChoiceCode);
                sqlparams[3] = new SqlParameter("@CourseName", FirstChoice);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertMediaStudentProgramChoicInfo", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }


        #endregion


        #region  Update Student Choice Information With Transaction
        public bool UpdateStudentProgramChoicInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[43];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@DegreeProgram", DegreeProgram);
                sqlparams[2] = new SqlParameter("@FirstChoiceCode", FirstChoiceCode);
                sqlparams[3] = new SqlParameter("@FirstChoice", FirstChoice);
                sqlparams[4] = new SqlParameter("@SecondChoiceCode", SecondChoiceCode);
                sqlparams[5] = new SqlParameter("@SecondChoice", SecondChoice);
                sqlparams[6] = new SqlParameter("@ThirdChoiceCode", ThirdChoiceCode);
                sqlparams[7] = new SqlParameter("@ThirdChoice", ThirdChoice);
                sqlparams[8] = new SqlParameter("@FourthChoiceCode", FourthChoiceCode);
                sqlparams[9] = new SqlParameter("@FourthChoice", FourthChoice);
                sqlparams[10] = new SqlParameter("@FifthChoiceCode", FifthChoiceCode);
                sqlparams[11] = new SqlParameter("@FifthChoice", FifthChoice);
                sqlparams[12] = new SqlParameter("@SixthChoiceCode", SixthChoiceCode);
                sqlparams[13] = new SqlParameter("@SixthChoice", SixthChoice);
                sqlparams[14] = new SqlParameter("@SeventhChoiceCode", SeventhChoiceCode);
                sqlparams[15] = new SqlParameter("@SeventhChoice", SeventhChoice);
                sqlparams[16] = new SqlParameter("@EighthChoiceCode", EighthChoiceCode);
                sqlparams[17] = new SqlParameter("@EighthChoice", EighthChoice);
                sqlparams[18] = new SqlParameter("@NinethChoiceCode", NinethChoiceCode);
                sqlparams[19] = new SqlParameter("@NinethChoice", NinethChoice);
                sqlparams[20] = new SqlParameter("@TenthChoiceCode", TenthChoiceCode);
                sqlparams[21] = new SqlParameter("@TenthChoice", TenthChoice);
                //
                sqlparams[22] = new SqlParameter("@EleventhChoiceCode", EleventhChoiceCode);
                sqlparams[23] = new SqlParameter("@EleventhChoice", EleventhChoice);
                sqlparams[24] = new SqlParameter("@TwelfthChoiceCode", TwelfthChoiceCode);
                sqlparams[25] = new SqlParameter("@TwelfthChoice", TwelfthChoice);
                sqlparams[26] = new SqlParameter("@ThirteenthChoiceCode", ThirteenthChoiceCode);
                sqlparams[27] = new SqlParameter("@ThirteenthChoice", ThirteenthChoice);
                sqlparams[28] = new SqlParameter("@FourteenthChoiceCode", FourteenthChoiceCode);
                sqlparams[29] = new SqlParameter("@FourteenthChoice", FourteenthChoice);
                sqlparams[30] = new SqlParameter("@FifteenthChoiceCode", FifteenthChoiceCode);
                sqlparams[31] = new SqlParameter("@FifteenthChoice", FifteenthChoice);
                sqlparams[32] = new SqlParameter("@SixteenthChoiceCode", SixteenthChoiceCode);
                sqlparams[33] = new SqlParameter("@SixteenthChoice", SixteenthChoice);
                sqlparams[34] = new SqlParameter("@SeventeenthChoiceCode", SeventeenthChoiceCode);
                sqlparams[35] = new SqlParameter("@SeventeenthChoice", SeventeenthChoice);
                sqlparams[36] = new SqlParameter("@EighteenthChoiceCode", EighteenthChoiceCode);
                sqlparams[37] = new SqlParameter("@EighteenthChoice", EighteenthChoice);
                sqlparams[38] = new SqlParameter("@NineteenthChoiceCode", NineteenthChoiceCode);
                sqlparams[39] = new SqlParameter("@NineteenthChoice", NineteenthChoice);
                sqlparams[40] = new SqlParameter("@TwentiethChoiceCode", TwentiethChoiceCode);
                sqlparams[41] = new SqlParameter("@TwentiethChoice", TwentiethChoice);
                sqlparams[42] = new SqlParameter("@SelfFinance", SelfFinance);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "UpdateStudentProgramChoicInfo", sqlparams).ToString();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }
        #endregion


        #region  Delete Student Program Choice Info Information With Transaction
        public bool DeleteStudentProgramChoicInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "DeleteStudentProgramChoicInfo", sqlparams).ToString();
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