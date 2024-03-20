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
    public class StudentOtherEducation
    {

        #region Fields & Properties
        public int StudentID { get; set; }
        public string ProgramName { get; set; }
        public string SeatNumber { get; set; }
        public string UniversityOrBoard { get; set; }
        public int? PassingYear { get; set; }
        public int? MarksObtained { get; set; }
        public int? TotalMarks { get; set; }
        public decimal? Percentage { get; set; }
        public string GradeorDivision { get; set; }
        public string Institution { get; set; }
        public int? YearFrom { get; set; }
        public int? YearTo { get; set; }
        public string ExamType { get; set; }

        #endregion

        #region  Insert Student Other Education Information With Transaction
        public bool InsertStudentOtherEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[12];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@ProgramName", ProgramName);
                sqlparams[2] = new SqlParameter("@SeatNumber", SeatNumber);
                sqlparams[3] = new SqlParameter("@UniversityOrBoard", UniversityOrBoard);
               // sqlparams[4] = new SqlParameter("@PassingYear", PassingYear);
                sqlparams[4] = new SqlParameter("@MarksObtained", MarksObtained);
                sqlparams[5] = new SqlParameter("@TotalMarks", TotalMarks);
                sqlparams[6] = new SqlParameter("@Percentage", Percentage);
                sqlparams[7] = new SqlParameter("@GradeorDivision", GradeorDivision);
                sqlparams[8] = new SqlParameter("@Institution", Institution);
                sqlparams[9] = new SqlParameter("@YearFrom", YearFrom);
                sqlparams[10] = new SqlParameter("@YearTo", YearTo);
                sqlparams[11] = new SqlParameter("@ExamType", ExamType);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertStudentOtherEducation", sqlparams).ToString();
                // SqlHelper.ExecuteScalar(sqltrans, CommandType.StoredProcedure, "InsertStudentOtherEducation", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion

        #region  Update Student Other Education Information With Transaction
        public bool UpdateStudentOtherEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[12];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@ProgramName", ProgramName);
                sqlparams[2] = new SqlParameter("@SeatNumber", SeatNumber);
                sqlparams[3] = new SqlParameter("@UniversityOrBoard", UniversityOrBoard);
               // sqlparams[4] = new SqlParameter("@PassingYear", PassingYear);
                sqlparams[4] = new SqlParameter("@MarksObtained", MarksObtained);
                sqlparams[5] = new SqlParameter("@TotalMarks", TotalMarks);
                sqlparams[6] = new SqlParameter("@Percentage", Percentage);
                sqlparams[7] = new SqlParameter("@GradeorDivision", GradeorDivision);
                sqlparams[8] = new SqlParameter("@Institution", Institution);
                sqlparams[9] = new SqlParameter("@YearFrom", YearFrom);
                sqlparams[10] = new SqlParameter("@YearTo", YearTo);
                sqlparams[11] = new SqlParameter("@ExamType", ExamType);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "UpdateStudentOtherEducation", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion

        #region  Delete Student Other Education Information With Transaction
        public bool DeleteStudentOtherEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "DeleteStudentOtherEducation", sqlparams).ToString();
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