using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMIU_Admission.AppClasses.DataAccessLayer;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace SMIU_Admission.AppClasses.BusinessLogicLayer
{
    public class StudentProgram
    {

        #region fields & Properties

        public int ProgramId { get; set; }
        public string ProgramCode { get; set; }
        public string ProgramName { get; set; }
        public string ShortDescription { get; set; }
        public int DepartmentId { get; set; }
        public string AcademicGroup { get; set; }
        public int DegreeProgram { get; set; }
        public bool IsActive { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string ProgramGroup { get; set; }

        #endregion

        #region Get All Programs  for dropdown List Degree Type


        public DataTable GetAllProgramsForDropDownbyDepartment()
        {
            DataTable dtAllDept = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@DegreeProgram", DegreeProgram);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dtAllDept = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAllProgramsByDepartment", sqlparams).Tables[0];
            }
            catch
            {
            }
            return dtAllDept;
        }

        public DataTable GetOneProgramsForDropDownbyDepartment()
        {
            DataTable dtAllDept = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@DegreeProgram", DegreeProgram);                
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dtAllDept = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetOneProgramByDepartment", sqlparams).Tables[0];
            }
            catch
            {
            }
            return dtAllDept;
        }


        public DataTable GetAllMediaProgramsForDropDownbyDepartment()
        {
            DataTable dtAllDept = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@DegreeProgram", DegreeProgram);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dtAllDept = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAllMediaProgramsByDepartment", sqlparams).Tables[0];
            }
            catch
            {
            }
            return dtAllDept;
        }

        public DataTable GetAllProgramsForDropDownbyFaculty()
        {
            DataTable dtAllDept = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@AcademicGroup", AcademicGroup);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dtAllDept = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAllProgramsForDropDownbyFaculty", sqlparams).Tables[0];
            }
            catch
            {
            }
            return dtAllDept;
        }

        public DataTable GetAllProgramsForDropDownforSearch()
        {
            DataTable dtAllProgram = new DataTable();
            try
            {                
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dtAllProgram = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAllProgramsForDropDownforSearch").Tables[0];
            }
            catch
            {
            }
            return dtAllProgram;
        }

        #endregion

        #region Display Programs

        public DataTable DisplayPrograms()
        {
            DataTable dt = new DataTable();
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "DisplayDepartment").Tables[0];
            }
            catch { }
            return dt;
        }

        #endregion

        #region Update Programs Status

        public bool UpdateProgramsStatus()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@ProgramId", ProgramId);
                sqlparams[1] = new SqlParameter("@IsActive", IsActive);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "UpdateDepartmentStatus", sqlparams);
            }
            catch
            {
                return false;
            }
            return true;

        }
        #endregion

        #region Insert Programs

        public bool InsertPrograms()
        {

            try
            {
                SqlParameter[] sqlparams = new SqlParameter[5];
                sqlparams[0] = new SqlParameter("@ProgramName", ProgramName);
                /* sqlparams[1] = new SqlParameter("@Description", string.IsNullOrEmpty(Description) ? Convert.DBNull : Description);*/
                sqlparams[2] = new SqlParameter("@CreatedBy", CreatedBy == 0 ? Convert.DBNull : CreatedBy);
                sqlparams[3] = new SqlParameter("@CreatedDate", CreatedDate == null ? Convert.DBNull : CreatedDate);
                sqlparams[4] = new SqlParameter("@IsActive", IsActive);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "InsertDepartment", sqlparams);
            }
            catch
            {

                return false;
            }
            return true;
        }

        #endregion

        #region Update Programs

        public bool UpdatePrograms()
        {

            try
            {
                SqlParameter[] sqlparams = new SqlParameter[5];
                sqlparams[0] = new SqlParameter("@ProgramId", ProgramId);
                sqlparams[1] = new SqlParameter("@ProgramName", ProgramName);
                /* sqlparams[2] = new SqlParameter("@Description", Description);*/
                sqlparams[3] = new SqlParameter("@ModifiedBy", ModifiedBy == 0 ? Convert.DBNull : ModifiedBy);
                sqlparams[4] = new SqlParameter("@ModifiedDate", ModifiedDate == null ? Convert.DBNull : ModifiedDate);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "UpdateDepartment", sqlparams);
            }
            catch
            {
                return false;
            }
            return true;

        }
        #endregion

        #region Delete Programs

        public bool DeletePrograms()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@ProgramId", ProgramId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "DeleteDepartment", sqlparams);
            }
            catch
            {
                return false;
            }
            return true;
        }
        #endregion

        public DataTable GetProgramGroup()
        {
            DataTable dt = new DataTable();
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentListforSeatNumberGroupWise").Tables[0];
            }
            catch { }
            return dt;
        }

        public DataTable GetFeesPaymentList()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@ProgramGroupCode", ProgramGroup);            
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetStudentListFeesPayment", sqlparams).Tables[0];
            }
            catch { }
            return dt;
        }

        #region Get All CPE Courses for dropdown List
        public DataTable GetAllCPECoursesForDropDown()
        {
            DataTable dtAllSemester = new DataTable();
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUCPEConnection"].ConnectionString;
                dtAllSemester = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAllCPECoursesForDropDown").Tables[0];
            }
            catch
            {
            }
            return dtAllSemester;
        }
        #endregion


        public DataTable GetAcademicGroupAndshortdescription()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@ProgramCode", ProgramCode);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAcademicGroupAndshortdescription", sqlparams).Tables[0];
            }
            catch { }
            return dt;
        }




    }
}