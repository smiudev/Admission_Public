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
    public class StudentSSCEducation
    {

        #region Fields & Properties
        public int StudentID { get; set; }
        public string DegreeName { get; set; }
        public string SeatNumber { get; set; }
        public string SSCBoard { get; set; }
        public string SSCGroup { get; set; }
        public int? PassingYear { get; set; }
        public int? MarksObtained { get; set; }
        public int? TotalMarks { get; set; }
        public string Percentage { get; set; }
        public string SSCGrade { get; set; }
        public string SSCInstitution { get; set; }
        public int? SSCYearFrom { get; set; }
        public int? SSCYearTo { get; set; }
        public string SSCExamType { get; set; }

        #endregion

        public bool NEW_InsertStudentSSCInfo(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[12];
                sqlparams[0] = new SqlParameter("@DegreeValue", DegreeName);
                sqlparams[1] = new SqlParameter("@SeatNo", SeatNumber);
                sqlparams[2] = new SqlParameter("@GroupValue", SSCGroup);
                sqlparams[3] = new SqlParameter("@BoardValue", SSCBoard);
                sqlparams[4] = new SqlParameter("@Institution", SSCInstitution);
                sqlparams[5] = new SqlParameter("@ObtainedMarks", MarksObtained);
                sqlparams[6] = new SqlParameter("@TotalMarks", TotalMarks);
                sqlparams[7] = new SqlParameter("@GradeValue", SSCGrade);
                sqlparams[8] = new SqlParameter("@ExamTypeValue", SSCExamType);
                sqlparams[9] = new SqlParameter("@YearFrom", SSCYearFrom);
                sqlparams[10] = new SqlParameter("@YearTo", SSCYearTo);
                sqlparams[11] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "NEW_InsertStudentSSCInfo", sqlparams).ToString();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        #region  Insert Student SSC Education Information With Transaction

       
        public bool InsertStudentSSCEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[13];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@DegreeName", DegreeName);
                sqlparams[2] = new SqlParameter("@SeatNumber", SeatNumber);
                sqlparams[3] = new SqlParameter("@SSCBoard", SSCBoard);
                sqlparams[4] = new SqlParameter("@SSCGroup", SSCGroup);
                //sqlparams[5] = new SqlParameter("@PassingYear", PassingYear);
                sqlparams[5] = new SqlParameter("@MarksObtained", MarksObtained);
                sqlparams[6] = new SqlParameter("@TotalMarks", TotalMarks);
                sqlparams[7] = new SqlParameter("@Percentage", Percentage);
                sqlparams[8] = new SqlParameter("@SSCGrade", SSCGrade);
                sqlparams[9] = new SqlParameter("@SSCInstitution", SSCInstitution);
                sqlparams[10] = new SqlParameter("@SSCYearFrom", SSCYearFrom);
                sqlparams[11] = new SqlParameter("@SSCYearTo", SSCYearTo);
                sqlparams[12] = new SqlParameter("@SSCExamType", SSCExamType);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertStudentSSCEducation", sqlparams).ToString();
            }
            catch(Exception ex)
            {
                return false;
            }
            return true;
        }

        public bool InsertMediaStudentSSCEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[5];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@DegreeName", DegreeName);
                sqlparams[2] = new SqlParameter("@BoardName", SSCBoard);
                sqlparams[3] = new SqlParameter("@PassingYear", SSCYearFrom);
                sqlparams[4] = new SqlParameter("@GradeorDivision", SSCGrade);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "InsertMediaStudentSSCEducation", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }

        #endregion

        #region  Update Student SSC Education Information With Transaction
        public bool UpdateStudentSSCEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[13];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                sqlparams[1] = new SqlParameter("@DegreeName", DegreeName);
                sqlparams[2] = new SqlParameter("@SeatNumber", SeatNumber);
                sqlparams[3] = new SqlParameter("@SSCBoard", SSCBoard);
                sqlparams[4] = new SqlParameter("@SSCGroup", SSCGroup);
              //  sqlparams[5] = new SqlParameter("@PassingYear", PassingYear);
                sqlparams[5] = new SqlParameter("@MarksObtained", MarksObtained);
                sqlparams[6] = new SqlParameter("@TotalMarks", TotalMarks);
                sqlparams[7] = new SqlParameter("@Percentage", Percentage);
                sqlparams[8] = new SqlParameter("@SSCGrade", SSCGrade);
                sqlparams[9] = new SqlParameter("@SSCInstitution", SSCInstitution);
                sqlparams[10] = new SqlParameter("@SSCYearFrom", SSCYearFrom);
                sqlparams[11] = new SqlParameter("@SSCYearTo", SSCYearTo);
                sqlparams[12] = new SqlParameter("@SSCExamType", SSCExamType);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "UpdateStudentSSCEducation", sqlparams).ToString();
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion


        #region  Delete Student  SSC Education Information With Transaction
        public bool DeleteStudentSSCEducation(SqlTransaction sqltrans)
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(sqltrans, CommandType.StoredProcedure, "DeleteStudentSSCEducation", sqlparams).ToString();
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