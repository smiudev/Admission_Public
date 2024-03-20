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
using SMIU_Admission.AppClasses.UtilityClasses;
using System.Windows.Forms.VisualStyles;

namespace SMIU_Admission.AppClasses.BusinessLogicLayer
{
    public class StudentHSCEducation
    {

        #region Fields & Properties
        public int StudentID { get; set; }
        public string DegreeName { get; set; }
        public string SeatNumber { get; set; }
        public string HSCBoard { get; set; }
        public string HSCGroup { get; set; }
        public int? PassingYear { get; set; }
        public int? MarksObtained { get; set; }
        public int? TotalMarks { get; set; }
        public string Percentage { get; set; }
        public string HSCGrade { get; set; }
        public string HSCInstitution { get; set; }
        public int? HSCYearFrom { get; set; }
        public int? HSCYearTo { get; set; }
        public string HSCExamType { get; set; }

        //

        //public string HSCDegree { get; set; }
        //public string HSCSeatNo { get; set; }
        //public string HSCMarksObtained { get; set; }
        //public string HSCMarksTotal { get; set; }

        #endregion

        public DataTable NEW_GetStudentEducationInfoByStudentId()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "NEW_GetStudentEducationInfoByStudentId", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }

        public bool NEW_InsertStudentEducationInfo(StudentPersonalInfo objStuPer, StudentSSCEducation objStudentSSCEducation, Student14YearsEducation objStudent14YearsEducation, Student16YearsEducation objStudent16YearsEducation, Student18YearsEducation objStudent18YearsEducation, StudentOtherEducation objStudentOtherEducation, StudentNTSTestInfo objStudentNTS, FeeVoucherInfo objVoucher, StudentPhoto objPhoto )
        {
            bool result;
            SqlConnection sqlcon = null;
            SqlTransaction sqltrans = null;
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                sqlcon = new SqlConnection(conn);
                sqlcon.Open();

                sqltrans = sqlcon.BeginTransaction("NEW_InsertStudentEducationInfo");
                objStudentSSCEducation.StudentID = this.StudentID;
                result = objStudentSSCEducation.InsertStudentSSCEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertEducationSSC");

                
                result = InsertStudentHSCEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertEducationHSC");

                objStudent14YearsEducation.StudentId = this.StudentID;
                result = objStudent14YearsEducation.InsertStudent14YearEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertEducation14");


                objStudent16YearsEducation.StudentId = this.StudentID;
                result = objStudent16YearsEducation.InsertStudent16YearEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertEducation16");
                objStudent18YearsEducation.StudentId = this.StudentID;
                result = objStudent18YearsEducation.InsertStudent18YearEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertEducation18");

                objStudentOtherEducation.StudentID = this.StudentID;
                result = objStudentOtherEducation.InsertStudentOtherEducation(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertEducationOther");

                objStudentNTS.StudentID = this.StudentID;
                result = objStudentNTS.InsertStudentNTSTestInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertNTSTest");

                objVoucher.StudentID = this.StudentID;
                objVoucher.FormStatus = "ONLINE NEW";
                result = objVoucher.InsertStudentFeeVoucherInfo(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertVoucher");

                objPhoto.StudentID = this.StudentID;
                result = objPhoto.InsertStudentPhoto(sqltrans);
                if (!result)
                    throw new Exception("Error in InsertVoucher");

                objStuPer.StudentID = this.StudentID;
                result = objStuPer.NEW_UpdateFinalSubmitStatus(sqltrans);
                if (!result)
                    throw new Exception("Error in Final Submission");

                sqltrans.Commit();
                return true;
            }
            catch
            {
                sqltrans.Rollback("NEW_InsertStudentEducationInfo");
                return false;
            }
            finally
            {
                if (sqlcon.State == ConnectionState.Open)
                    sqlcon.Close();
            }
        }

        //public bool NEW_InsertStudentHSCInfo(SqlTransaction sqltrans)
        //{
        //    try
        //    {
        //        SqlParameter[] sqlparams = new SqlParameter[12];
        //        sqlparams[0] = new SqlParameter("@DegreeValue", DegreeName);
        //        sqlparams[1] = new SqlParameter("@SeatNo", SeatNumber);
        //        sqlparams[2] = new SqlParameter("@GroupValue", HSCGroup);
        //        sqlparams[3] = new SqlParameter("@BoardValue", HSCBoard);
        //        sqlparams[4] = new SqlParameter("@Institution", HSCInstitution);
        //        sqlparams[5] = new SqlParameter("@ObtainedMarks", MarksObtained);
        //        sqlparams[6] = new SqlParameter("@TotalMarks", TotalMarks);
        //        sqlparams[7] = new SqlParameter("@GradeValue",HSCGrade);
        //        sqlparams[8] = new SqlParameter("@ExamTypeValue", HSCExamType);
        //        sqlparams[9] = new SqlParameter("@YearFrom", HSCYearFrom);
        //        sqlparams[10] = new SqlParameter("@YearTo", HSCYearTo);
        //        sqlparams[11] = new SqlParameter("@StudentID", StudentID);
        //        string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
        //        SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "NEW_InsertStudentHSCInfo", sqlparams).ToString();
        //    }
        //    catch (Exception ex)
        //    {
        //        return false;
        //    }
        //    return true;
        //}

        #region  Insert Student HSC Education Information With Transaction
        public bool InsertStudentHSCEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[13];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@DegreeName", DegreeName);
                sqlparams[2] = new SqlParameter("@SeatNumber", SeatNumber);
                sqlparams[3] = new SqlParameter("@HSCBoard", HSCBoard);
                sqlparams[4] = new SqlParameter("@HSCGroup", HSCGroup);
                //sqlparams[5] = new SqlParameter("@PassingYear", PassingYear);
                sqlparams[5] = new SqlParameter("@MarksObtained", MarksObtained);
                sqlparams[6] = new SqlParameter("@TotalMarks", TotalMarks);
                sqlparams[7] = new SqlParameter("@Percentage", Percentage);
                sqlparams[8] = new SqlParameter("@HSCGrade", HSCGrade);
                sqlparams[9] = new SqlParameter("@HSCInstitution", HSCInstitution);
                sqlparams[10] = new SqlParameter("@HSCYearFrom", HSCYearFrom);
                sqlparams[11] = new SqlParameter("@HSCYearTo", HSCYearTo);
                sqlparams[12] = new SqlParameter("@HSCExamType", HSCExamType);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertStudentHSCEducation", sqlparams).ToString();
                // SqlHelper.ExecuteScalar(sqltrans, CommandType.StoredProcedure, "InsertStudentHSCEducation", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion


        #region  Update Student HSC Education Information With Transaction
        public bool UpdateStudentHSCEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[13];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@DegreeName", DegreeName);
                sqlparams[2] = new SqlParameter("@SeatNumber", SeatNumber);
                sqlparams[3] = new SqlParameter("@HSCBoard", HSCBoard);
                sqlparams[4] = new SqlParameter("@HSCGroup", HSCGroup);
                //sqlparams[5] = new SqlParameter("@PassingYear", PassingYear);
                sqlparams[5] = new SqlParameter("@MarksObtained", MarksObtained);
                sqlparams[6] = new SqlParameter("@TotalMarks", TotalMarks);
                sqlparams[7] = new SqlParameter("@Percentage", Percentage);
                sqlparams[8] = new SqlParameter("@HSCGrade", HSCGrade);
                sqlparams[9] = new SqlParameter("@HSCInstitution", HSCInstitution);
                sqlparams[10] = new SqlParameter("@HSCYearFrom", HSCYearFrom);
                sqlparams[11] = new SqlParameter("@HSCYearTo", HSCYearTo);
                sqlparams[12] = new SqlParameter("@HSCExamType", HSCExamType);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "UpdateStudentHSCEducation", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion

        #region  Delete Student HSC Education Information With Transaction
        public bool DeleteStudentHSCEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "DeleteStudentHSCEducation", sqlparams).ToString();
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