using SMIU_Admission.AppClasses.DataAccessLayer;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SMIU_Admission.AppClasses.BusinessLogicLayer
{
    public class DocumentCheckList
    {
        #region fields & Properties

        public int DocumentChecklistId { get; set; }
        public int SemesterId { get; set; }
        public string DocumentName { get; set; }
        public string Description { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public bool IsActive { get; set; }
        public int StudentID { get; set; }
        public int DegreeProgram { get; set; }

        #endregion

        #region Get All Semester for dropdown List
        public DataTable GetAllSemesterForDropDown()
        {
            DataTable dtAllSemester = new DataTable();
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dtAllSemester = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "GetAllSemesterForDropDown").Tables[0];
            }
            catch
            {
            }
            return dtAllSemester;
        }
        #endregion

        #region Display Document CheckList

        public DataTable DisplayDocumentCheckList()
        {
            DataTable dt = new DataTable();
            try
            {
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "DisplayDocumentCheckList").Tables[0];
            }
            catch { }
            return dt;
        }

        #endregion

        #region Display Document CheckList for Fees Payment

        public DataTable DisplayDocumentCheckListforFeespayment()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@SemesterId", SemesterId);
                sqlparams[1] = new SqlParameter("@DegreeProgram", DegreeProgram);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "DisplayDocumentCheckListforFeespayment", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }


        public DataTable GetDocumentCheckedListByStudentAndSemesterId()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@SemesterId", SemesterId);
                sqlparams[1] = new SqlParameter("@StudentID", StudentID);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                dt = SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "DisplayDocumentCheckListforFeespayment", sqlparams).Tables[0];
            }
            catch (Exception ex)
            {
            }
            return dt;
        }



        #endregion







        #region Update Document CheckList lStatus

        public bool UpdateDocumentCheckListStatus()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[2];
                sqlparams[0] = new SqlParameter("@DocumentChecklistId", DocumentChecklistId);
                sqlparams[1] = new SqlParameter("@IsActive", IsActive);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "UpdateDocumentCheckListStatus", sqlparams);
            }
            catch
            {
                return false;
            }
            return true;

        }
        #endregion

        #region Insert Document CheckList

        public bool InsertDocumentCheckList()
        {

            try
            {
                SqlParameter[] sqlparams = new SqlParameter[6];
                sqlparams[0] = new SqlParameter("@SemesterId", SemesterId);
                sqlparams[1] = new SqlParameter("@DocumentName", string.IsNullOrEmpty(DocumentName) ? Convert.DBNull : DocumentName);
                sqlparams[2] = new SqlParameter("@Description", string.IsNullOrEmpty(Description) ? Convert.DBNull : Description);
                sqlparams[3] = new SqlParameter("@CreatedBy", CreatedBy == 0 ? Convert.DBNull : CreatedBy);
                sqlparams[4] = new SqlParameter("@CreatedDate", CreatedDate == null ? Convert.DBNull : CreatedDate);
                sqlparams[5] = new SqlParameter("@IsActive", IsActive);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "InsertDocumentCheckList", sqlparams);
            }
            catch
            {

                return false;
            }
            return true;
        }

        #endregion

        #region Update Document CheckList

        public bool UpdateDocumentCheckList()
        {

            try
            {
                SqlParameter[] sqlparams = new SqlParameter[7];
                sqlparams[0] = new SqlParameter("@DocumentChecklistId", DocumentChecklistId);
                sqlparams[0] = new SqlParameter("@SemesterId", SemesterId);
                sqlparams[1] = new SqlParameter("@DocumentName", string.IsNullOrEmpty(DocumentName) ? Convert.DBNull : DocumentName);
                sqlparams[2] = new SqlParameter("@Description", string.IsNullOrEmpty(Description) ? Convert.DBNull : Description);
                sqlparams[5] = new SqlParameter("@ModifiedBy", ModifiedBy == 0 ? Convert.DBNull : ModifiedBy);
                sqlparams[6] = new SqlParameter("@ModifiedDate", DateTime.Now);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "UpdateDocumentCheckList", sqlparams);
            }
            catch
            {
                return false;
            }
            return true;

        }
        #endregion

        #region Delete Application Fee

        public bool DeleteDocumentCheckList()
        {
            try
            {
                SqlParameter[] sqlparams = new SqlParameter[1];
                sqlparams[0] = new SqlParameter("@DocumentChecklistId", DocumentChecklistId);
                string conn = ConfigurationManager.ConnectionStrings["SMIUConnection"].ConnectionString;
                SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "DeleteDocumentCheckList", sqlparams);
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