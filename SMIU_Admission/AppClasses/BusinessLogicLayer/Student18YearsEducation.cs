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
    public class Student18YearsEducation
    {

        #region Fields & Properties
        public int Student18YearEduId { get; set; }
        public int StudentId { get; set; }
        public string SeatNumber { get; set; }
        public int? PassingYear { get; set; }
        public string University { get; set; }
        public string Program { get; set; }
        public int? MarksObtained { get; set; }
        public int? TotalMarks { get; set; }
        public decimal? Percentage { get; set; }
        public string GradeOrDivision { get; set; }
        public string CGPA { get; set; }
        public string Institution { get; set; }
        public int? YearFrom { get; set; }
        public int? YearTo { get; set; }
        public string ExamType { get; set; }
        public string MajorSubjects { get; set; }
        public string ResultAwaitingSeatNo { get; set; }
        #endregion

        #region  Insert Student 18 Year Education Information With Transaction
        public bool InsertStudent18YearEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[15];
                sqlparams[0] = new SqlParameter("@StudentID", StudentId);
                sqlparams[1] = new SqlParameter("@SeatNumber", SeatNumber);               
                sqlparams[2] = new SqlParameter("@University", University);
                sqlparams[3] = new SqlParameter("@Program", Program);
                sqlparams[4] = new SqlParameter("@MarksObtained", MarksObtained);
                sqlparams[5] = new SqlParameter("@TotalMarks", TotalMarks);
                sqlparams[6] = new SqlParameter("@Percentage", Percentage);
                sqlparams[7] = new SqlParameter("@GradeOrDivision", GradeOrDivision);
                sqlparams[8] = new SqlParameter("@CGPA", CGPA);
                sqlparams[9] = new SqlParameter("@Institution", Institution);
                sqlparams[10] = new SqlParameter("@YearFrom", YearFrom);
                sqlparams[11] = new SqlParameter("@YearTo", YearTo);
                sqlparams[12] = new SqlParameter("@ExamType", ExamType);
                sqlparams[13] = new SqlParameter("@MajorSubjects", MajorSubjects);
                sqlparams[14] = new SqlParameter("@ResultAwaitingSeatNo", ResultAwaitingSeatNo);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertStudent18YearEducation", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion

        #region  Update Student 18 Year Education Information With Transaction
        public bool UpdateStudent18YearEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[15];
                sqlparams[0] = new SqlParameter("@StudentID", StudentId);
                sqlparams[1] = new SqlParameter("@SeatNumber", SeatNumber);               
                sqlparams[2] = new SqlParameter("@University", University);
                sqlparams[3] = new SqlParameter("@Program", Program);
                sqlparams[4] = new SqlParameter("@MarksObtained", MarksObtained);
                sqlparams[5] = new SqlParameter("@TotalMarks", TotalMarks);
                sqlparams[6] = new SqlParameter("@Percentage", Percentage);
                sqlparams[7] = new SqlParameter("@GradeOrDivision", GradeOrDivision);
                sqlparams[8] = new SqlParameter("@CGPA", CGPA);
                sqlparams[9] = new SqlParameter("@Institution", Institution);
                sqlparams[10] = new SqlParameter("@YearFrom", YearFrom);
                sqlparams[11] = new SqlParameter("@YearTo", YearTo);
                sqlparams[12] = new SqlParameter("@ExamType", ExamType);
                sqlparams[13] = new SqlParameter("@MajorSubjects", MajorSubjects);
                sqlparams[14] = new SqlParameter("@ResultAwaitingSeatNo", ResultAwaitingSeatNo);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "UpdateStudent18YearEducation", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion

        #region  Delete Student18 Year Education Information With Transaction
        public bool DeleteStudent18YearEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "DeleteStudent18YearEducation", sqlparams).ToString();
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